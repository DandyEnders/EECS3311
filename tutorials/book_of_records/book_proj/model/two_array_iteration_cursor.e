note
	description: "Summary description for {TWO_ARRAY_ITERATION_CURSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TWO_ARRAY_ITERATION_CURSOR[G]

inherit
	ITERATION_CURSOR[TUPLE[STRING, G]]

create
	make

feature -- Constructor
	make (sa: ARRAY[STRING]; ra: ARRAY[G])
		-- Initialize cursor from two arrays.
		do
			strings := sa
			records := ra
			cursor_pos := strings.lower
		end

feature -- Cursor Operator
	item: TUPLE[STRING, G]
		local
			string: STRING
			record: G
		do
			string := strings[cursor_pos]
			record := records[cursor_pos]
			create Result
			Result := [string, record]
		end


	after: BOOLEAN
			-- Is there no more items to be iterated through?
		do
			Result := (cursor_pos > strings.upper)
		end

	forth
			-- Move cursor position one to the right.
		do
			cursor_pos := cursor_pos + 1
		end


feature {NONE} -- Underlying arrays.
	strings: ARRAY[STRING]
	records: ARRAY[G]

	cursor_pos: INTEGER

invariant
	consistent_arrays:
			strings.lower = records.lower
		and	strings.upper = records.upper

end
