note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	BANK

inherit
	ANY
		redefine
			out
		end

create {BANK_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create s.make_empty
			i := 0

			create accounts.make
			create error.make_empty
		end

feature -- model attributes
	s : STRING
	i : INTEGER
	error: STRING

feature -- Implementation
	accounts: LINKED_LIST[ACCOUNT]

feature -- model operations
--	default_update
--			-- Perform update to the model state.
--		do
--			i := i + 1
--		end

	set_error (msg: STRING)
		do
			error := msg
		end

	new(id: STRING)
		require
			non_existing_id:
				not (across
						accounts as cursor
					some
						cursor.item.id ~ id
					end)
		do
			s := "new"
			i := i + 2

			accounts.extend (create {ACCOUNT}.make (id))
		end

	deposit(id: STRING; amount: INTEGER)
		do
--			s := "deposit"
--			i := i + 2

			across
				accounts as cursor
			loop
				if cursor.item.id ~ id then
					cursor.item.deposit (amount)
				end
			end
		end

	withdraw
		do
			s := "withdraw"
			i := i + 2
		end

	transfer
		do
			s := "transfer"
			i := i + 2
		end

	reset
			-- Reset model state.
		do
			make
		end

feature -- queries
	out : STRING
		local
			j: INTEGER
		do
--			create Result.make_from_string ("  ")
--			Result.append ("State of bank ")
--			Result.append ("[")
--			Result.append (i.out)
--			Result.append ("]")
--			Result.append (" after ")
--			Result.append (s)

			create Result.make_empty

			if error.is_empty then
				Result.append ("{")

				j := 1
				across
					accounts as cursor
				loop
					Result.append (cursor.item.out)
					if j < accounts.count then
						if j < accounts.count then
							Result.append(", ")
						end
						j := j + 1
					end
				end

				Result.append ("}")
			else
				Result.append (" Error: ")
				Result.append (error)
			end


		end

end




