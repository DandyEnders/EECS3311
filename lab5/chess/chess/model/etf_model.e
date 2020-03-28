note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL

inherit
	ANY
		redefine
			out
		end

create {ETF_MODEL_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do

			create board.make(8)
			message := msg.initial

		end

feature {NONE} -- Private attribute

	msg: MESSAGE

feature -- model operations
	reset
			-- Reset model state.
		do
			make
		end

feature -- Attributes

	board: BOARD

	message: STRING

feature -- Commands

	set_message(a_msg: STRING)
		do
			message := a_msg
		end

feature -- ETF Commands

	move_king(row, col: INTEGER)
		do
			if board.valid_king_move ([row, col]) then
				board.history.extend_history(create {MOVE_KING}.make([row, col]))
				board.move_king ([row, col])
				set_message(msg.ok)
			else
				set_message(msg.move_error_invalid_move)
			end
		end

	move_knight(row, col: INTEGER)
		do
			if board.valid_knight_move ([row, col]) then
				board.history.extend_history(create {MOVE_KNIGHT}.make([row,col]))
				board.move_knight ([row, col])
				set_message(msg.ok)
			else
				set_message(msg.move_error_invalid_move)
			end
		end

	play(size:INTEGER)
		require
			board.valid_size (size)
		do
			create board.make (size)
			board.set_started
			set_message(msg.ok)
		end

	redo
		do
			if board.valid_redo then
				board.redo
				set_message(msg.ok)
			else
				set_message(msg.redo_error_no_more)
			end
		end

	undo
		do
			if board.valid_undo then
				board.undo
				set_message(msg.ok)
			else
				set_message(msg.undo_error_no_more)
			end
		end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  " + message + ":")
			if message ~ "ok" and board.started then
				Result.append("%N")
				Result.append(board.out)
			end
		end

end




