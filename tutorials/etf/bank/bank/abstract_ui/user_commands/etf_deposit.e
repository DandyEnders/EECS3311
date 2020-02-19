note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_DEPOSIT
inherit
	ETF_DEPOSIT_INTERFACE
create
	make
feature -- command
	deposit(a_id: STRING ; a_value: VALUE)
		require else
			deposit_precond(a_id, a_value)
		local
			id: ID
    	do
			-- perform some update on the model state
			model.default_update
			create id.make (a_id)
			if model.has (id: ID) then
				model.deposit(id, a_value)
			else

			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
