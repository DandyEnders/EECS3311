note
	description: "Summary description for {BIRTHDAY_BOOK_ITERATION_CURSOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BIRTHDAY_BOOK_ITERATION_CURSOR

inherit
	ITERATION_CURSOR[TUPLE[NAME, BIRTHDAY]]

create
	make

feature -- Constructor
	make (a_names: ARRAY[NAME]; a_birthdays: LINKED_LIST[BIRTHDAY])
		do
			names := a_names
			birthdays := a_birthdays

			cursor_pos := 1
			last_index := names.count
		ensure
			same_cardinality:
				a_names.count = a_birthdays.count
		end

feature -- Attribute
	names: ARRAY[NAME]
	birthdays: LINKED_LIST[BIRTHDAY]

	cursor_pos: INTEGER

	last_index: INTEGER

feature -- Access

	item: TUPLE[NAME, BIRTHDAY]
			-- Item at current cursor position.
		do
			Result := [names[cursor_pos], birthdays[cursor_pos]]
		end

feature -- Status report	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		do
			Result := cursor_pos > last_index
		end

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			cursor_pos := cursor_pos + 1
		end

end
