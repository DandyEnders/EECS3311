note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	MAZE

inherit
	ANY
		redefine
			out
		end

create {MAZE_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create s.make_empty
			i := 0
		end

feature -- model attributes
	s : STRING
	i : INTEGER

feature -- model operations
	default_update
			-- Perform update to the model state.
		do
			i := i + 1
		end

	reset
			-- Reset model state.
		do
			make
		end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")
			Result.append ("State: ")
			Result.append (i.out)
			Result.append (" -> ok")
		end

end




