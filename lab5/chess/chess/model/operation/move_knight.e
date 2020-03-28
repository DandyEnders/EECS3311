note
	description: "Summary description for {MOVE_KNIGHT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_KNIGHT

inherit
	MOVE

create
	make

feature {NONE} -- Constructor

	make (a_new_coordinate: COORDINATE)
		do
			old_coordinate := board.c_knight.deep_twin
			coordinate := a_new_coordinate.deep_twin
		end

feature -- Attributes

	coordinate, old_coordinate: COORDINATE

feature -- Deferred queries

	directions: ARRAY [TUPLE[x: INTEGER; y: INTEGER]]
		do
			Result := <<[1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2]>>
		end

feature -- Deferred commands

	execute
		do
			board.move_knight (coordinate)
		end

	undo
		do
			board.move_knight (old_coordinate)
		end

	redo
		do
			execute
		end

end
