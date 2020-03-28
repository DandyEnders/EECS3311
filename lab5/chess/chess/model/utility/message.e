note
	description: "Summary description for {MESSAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	MESSAGE

feature -- Common

	indent: STRING = "  "

	ok: STRING = "ok"

feature -- Initial

	initial: STRING
		do
			Result := "ok, K = King and N = Knight"
		end

Feature -- Error

	redo_error_no_more: STRING
		do
			Result := "nothing to redo"
		end

	undo_error_no_more: STRING
		do
			Result := "no more to undo"
		end

	move_error_invalid_move: STRING
		do
			Result := "invalid move"
		end

	play_error_already_started: STRING
		do
			Result := "game already started"
		end

end
