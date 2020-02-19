note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_NEW
inherit 
	ETF_NEW_INTERFACE
create
	make
feature -- command 
	new(a_id: STRING)
		require else 
			new_precond(a_id)
    	do
			-- perform some update on the model state
			model.default_update
			etf_cmd_container.on_change.notify ([Current])
    	end

end
