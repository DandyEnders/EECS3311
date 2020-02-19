note
	description: "Summary description for {ACCOUNT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCOUNT

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Commands
	make (new_id: STRING)
		do
			id := new_id
			
		end

	deposit (amount: INTEGER)
		do
			balance := balance + amount
		end

feature -- Attributes
	id: STRING
	balance: INTEGER


feature -- Output
	out: STRING
		do
			Result := "Account with id " + id + " has balance " + balance.out
		end

invariant
	balance >= 0

end
