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
	deposit(id: STRING ; amount: INTEGER_32)
		local
			a: INTEGER
    	do
    		a := amount.to_integer_32
			-- perform some update on the model state
			model.deposit (id, a)
			etf_cmd_container.on_change.notify ([Current])
    	end

end
