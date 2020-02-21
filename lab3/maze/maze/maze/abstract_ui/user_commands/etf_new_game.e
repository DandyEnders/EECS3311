note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW_GAME
inherit
	ETF_NEW_GAME_INTERFACE
create
	make
feature -- command
	new_game(a_level: INTEGER_32)
		require else
			new_game_precond(a_level)
		local
			model_level : like {GAME_LEVEL}.easy
    	do
			-- perform some update on the model state
			model.default_update

			inspect a_level
			when {ETF_TYPE_CONSTRAINTS}.easy then
				model_level := {GAME_LEVEL}.easy
			when {ETF_TYPE_CONSTRAINTS}.medium then
				model_level := {GAME_LEVEL}.medium
			else -- ETF_TYPE_CONSTRAINTS.hard
				model_level := {GAME_LEVEL}.hard
			end

			model.new_game(model_level)

			etf_cmd_container.on_change.notify ([Current])
    	end

end
