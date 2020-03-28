note
	description: "Summary description for {MOVE_KING}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_KING

inherit

	MOVE

create
	make

feature {NONE} -- Constructor

	make (a_new_coordinate: COORDINATE)
		do
			old_coordinate := board.c_king.deep_twin
			coordinate := a_new_coordinate.deep_twin
		end

feature -- Attributes

	coordinate, old_coordinate: COORDINATE

feature -- Deferred queries

	directions: ARRAY [TUPLE[x: INTEGER; y: INTEGER]]
		do
			Result := <<[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]>>
		end

feature -- Deferred commands

	execute
		do
			board.move_king (coordinate)
		end

	undo
		do
			board.move_king (old_coordinate)
		end

	redo
		do
			execute
		end

end
