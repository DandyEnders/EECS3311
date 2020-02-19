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
			imp:= a_imp.twin
			imp.start
		end

feature -- Attribute
	imp: HASH_TABLE[BIRTHDAY, NAME]

feature -- Access

	item: TUPLE[NAME, BIRTHDAY]
			-- Item at current cursor position.
		local
			l_name: NAME
			l_birthday: BIRTHDAY
		do
			l_name := imp.key_for_iteration
			l_birthday := imp.item_for_iteration

			Result := [l_name, l_birthday]
		end

feature -- Status report	

	after: BOOLEAN
			-- Are there no more items to iterate over?
		do
			Result := imp.after
		end

feature -- Cursor movement

	forth
			-- Move to next position.
		do
			imp.forth
		end


end
