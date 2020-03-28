note
	description: "Summary description for {COORDINATE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	COORDINATE

inherit
	ANY
		redefine
			out,
			is_equal
		end

create
	make, make_from_tuple

convert
	make_from_tuple ({TUPLE[INTEGER, INTEGER]})

feature {NONE} -- Constructor

	make(a_x, a_y: INTEGER)
		require
			valid_within_board_size(a_x, a_y)
		do
			x := a_x
			y := a_y
		end

	make_from_tuple(c: TUPLE [a_x: INTEGER; a_y: INTEGER])
		require
			valid_within_board_size(c.a_x, c.a_y)
		do
			x := c.a_x
			y := c.a_y
		end

feature {NONE} -- Private attributes

	board: BOARD
		local
			access: ETF_MODEL_ACCESS
		once
			Result := access.m.board
		end

feature -- Attributes

	x, y: INTEGER

feature -- Queries

	valid_within_board_size(a_x, a_y: INTEGER): BOOLEAN
		do
			Result := (1 <= a_x and a_x <= board.size) and (1 <= a_y and a_y <= board.size)
		end

	valid_add(other: like current): BOOLEAN
		do
			Result := valid_within_board_size(x + other.x , y + other.y)
		end

	valid_direction_add(a_x, a_y:INTEGER): BOOLEAN
		do
			Result := valid_within_board_size(x + a_x , y + a_y)
		end

	out: STRING
		do
			create Result.make_from_string ("[")
			Result.append("[")
			Result.append(x.out)
			Result.append(",")
			Result.append(y.out)
			Result.append("[")
		end

	is_equal(other: like current): BOOLEAN
		do
			Result := x ~ other.x and y ~ other.y
		end

	added (a_x, a_y: INTEGER): like current
		require
			valid_direction_add(a_x, a_y)
		do
			create Result.make_from_tuple([x + a_x, y + a_y])
		end

invariant
	valid_within_board_size(x,y)
end
