note
	description: "Summary description for {BIRTHDAY_BOOK_ITERATION_CURSOR_NEW}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIRTHDAY_BOOK_ITERATION_CURSOR_NEW

inherit
	ITERATION_CURSOR[TUPLE[NAME, BIRTHDAY]]

create
	make

feature -- Constructor
	make (a_imp: HASH_TABLE[BIRTHDAY, NAME])
		do
			imp:= a_imp
			cursor := imp.new_cursor
		end

feature -- Attribute
	imp: HASH_TABLE[BIRTHDAY, NAME]
	cursor: HASH_TABLE_ITERATION_CURSOR[BIRTHDAY, NAME]

feature -- Access

	item: TUPLE[NAME, BIRTHDAY]
			-- Item at current cursor position.
		local
			l_name: NAME
			l_birthday: BIRTHDAY
		do
			l_name := cursor.key
			l_birthday := cursor.item

			Result := [l_name, l_birthday]
		end

feature -- Status report	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		do
			Result := cursor.after
		end

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			cursor.forth
		end


end
