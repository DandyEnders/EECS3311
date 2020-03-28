note
	description: "Summary description for {MOVE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	MOVE

feature {NONE} -- Private attributes

	board: BOARD
		local
			access: ETF_MODEL_ACCESS
		once
			Result := access.m.board
		end

feature -- Deferred queries

	directions: ARRAY [TUPLE[x: INTEGER; y: INTEGER]]
		deferred
		end

feature -- Deferred commands

	execute
		deferred
		end

	undo
		deferred
		end

	redo
		deferred
		end

feature -- Queries

	valid_within_board_size(a_x, a_y: INTEGER): BOOLEAN
		do
			Result := (1 <= a_x and a_x <= board.size) and (1 <= a_y and a_y <= board.size)
		end

	valid_moves (a_c: COORDINATE): ARRAY [COORDINATE]
		do
			create Result.make_empty
			Result.compare_objects

			across

				directions is d
			loop
				if a_c.valid_direction_add (d.x, d.y) then
					if board.valid_non_stacking_pos (a_c.added (d.x, d.y)) then
						Result.force(a_c.added (d.x, d.y), Result.upper + 1)
					end
				end
			end
		end

	is_valid_move (a_start_c, a_move_c: COORDINATE): BOOLEAN
		do
			Result := valid_moves (a_start_c).has (a_move_c)
		end

end
