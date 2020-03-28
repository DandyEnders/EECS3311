note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit
	ANY
		redefine out end

create
	make

feature {NONE} -- Constructor

	make(a_size: INTEGER)
		require
			valid_size(a_size)
		do
			size := a_size
			started := false
			create imp.make_filled (char_void, size, size)

			create c_king.make (1, 1)
			imp.put (char_king, 1, 1)

			create c_knight.make (size, size)
			imp.put (char_knight, size, size)

			create history.make
		end

feature {NONE} -- Implementation

	imp: ARRAY2[CHARACTER]

	put(start, destination: COORDINATE; c: CHARACTER)
		require
			valid_non_stacking_pos(destination)
		do
			imp.put (char_void, start.x, start.y)
			imp.put (c, destination.x, destination.y)
		end

feature -- Game Attributes

	size: INTEGER

	started: BOOLEAN

	history: HISTORY

feature -- Entity Attributes

	c_knight, c_king: COORDINATE

	char_knight: CHARACTER = 'N'

	char_king: CHARACTER = 'K'

	char_void: CHARACTER = '_'

feature -- Commands

	set_started
		do
			started := true
		end

	move_king(a_coordinate: COORDINATE)
		require
			valid_king_move(a_coordinate)
		do
			put(c_king, a_coordinate, char_king)
			c_king := a_coordinate
		end

	move_knight(a_coordinate: COORDINATE)
		require
			valid_knight_move(a_coordinate)
		do
			put(c_knight, a_coordinate, char_knight)
			c_knight := a_coordinate
		end

	undo
		require
			valid_undo
		do
			history.item.undo
			history.back
		end

	redo
		require
			valid_redo
		do
			history.forth
			history.item.redo
		end

feature -- Queries

	valid_size(a_size: INTEGER): BOOLEAN
		do
			Result := 5 <= a_size and a_size <= 8
		end

	valid_non_stacking_pos(a_move: COORDINATE): BOOLEAN
		do
			Result := a_move /~ c_king and a_move /~ c_knight
		end

	valid_undo: BOOLEAN
		do
			Result := not history.before
		end

	valid_redo: BOOLEAN
		do
			if history.after then
				Result := false
			else
				history.forth
				if history.after then
					Result := false
				else
					Result := true
				end
				history.back
			end
		end

	valid_king_move(a_move: COORDINATE): BOOLEAN
		local
			m: MOVE
		do
			create {MOVE_KING} m.make(a_move)
			Result := m.valid_moves (c_king).has (a_move)
		end

	valid_knight_move(a_move: COORDINATE): BOOLEAN
		local
			m: MOVE
		do
			create {MOVE_KNIGHT} m.make(a_move)
			Result := m.valid_moves (c_knight).has (a_move)
		end

feature -- Out

	board_repr: STRING
		local
			msg: MESSAGE
		do
			Result := msg.indent
			across
				1 |..| size is r
			loop
				across
					1 |..| size is c
				loop
					Result := Result + imp[r,c].out
				end
				Result := Result + "%N" + msg.indent
			end
			Result := Result.substring (1, Result.count-3)
		end

	out: STRING
		do
			Result := ""
			if started then
				Result := board_repr
			end
		end

invariant
	c_king /~ c_knight

end
