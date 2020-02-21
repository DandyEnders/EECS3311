note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE
inherit
	ETF_MOVE_INTERFACE
create
	make

feature {NONE} -- utility

	du: DIRECTION_UTILITY

feature -- command
	move(a_direction: INTEGER_32)
		require else
			move_precond(a_direction)
		local
			model_direction : like du.N
    	do
			-- perform some update on the model state
			model.default_update

			inspect a_direction
			when {ETF_TYPE_CONSTRAINTS}.N then
				model_direction := du.N
			when {ETF_TYPE_CONSTRAINTS}.E then
				model_direction := du.E
			when {ETF_TYPE_CONSTRAINTS}.S then
				model_direction := du.S
			else -- ETF_TYPE_CONSTRAINTS.W
				model_direction := du.W
			end
			
			model.move(model_direction)

			--model.
			etf_cmd_container.on_change.notify ([Current])
    	end

end
