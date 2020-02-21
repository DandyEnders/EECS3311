note
	description: "A maze model."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	MAZE

inherit

	ANY
		redefine
			out
		end

create {MAZE_ACCESS}
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create board.make
			create status.make
			create score.make
			create game_number.make
			create score.make
			i := 0
			end_msg := msg.ok
			maze_msg := msg.empty
			used_solution_msg := msg.empty
		end

feature -- model attributes

	i: INTEGER

	end_msg: STRING

	maze_msg: STRING

	used_solution_msg: STRING

feature -- game attributes

	board: BOARD

	status: GAME_STATUS

	game_number: GAME_NUMBER

	score: SCORE

	victory_flag: BOOLEAN

feature -- utility

	msg: MESSAGE

	du: DIRECTION_UTILITY

feature -- model operations

	default_update
			-- Perform update to the model state.
		do
			i := i + 1
		end

	reset
			-- Reset model state.
		do
			make
		end

feature {NONE} -- private maze features

feature -- user_commands

	abort
		do
			if not status.is_main_menu then
				status.set_main_menu
				end_msg := msg.ok
				maze_msg := msg.empty
			else
				end_msg := msg.not_in_a_game
				maze_msg := msg.empty
			end
		ensure
			in_game: not (old status.is_main_menu) implies status.is_main_menu and end_msg ~ msg.ok and maze_msg ~ msg.empty
			main_menu: (old status.is_main_menu) implies end_msg ~ msg.not_in_a_game and maze_msg ~ msg.empty
		end

	move (a_direction: like du.N)
		do
			if not status.is_main_menu then
				if board.is_moveable (a_direction) then
					board.move (a_direction)
					if board.is_victory then
						victory_flag := True
						status.set_main_menu
						inspect board.level
						when {GAME_LEVEL}.easy then
							score.increment_value (1)
						when {GAME_LEVEL}.medium then
							score.increment_value (2)
						else -- hard
							score.increment_value (3)
						end
						end_msg := msg.ok
						maze_msg := board.out
					else
						end_msg := msg.ok
						maze_msg := board.out
					end
				else
					end_msg := msg.not_a_valid_move
					maze_msg := msg.empty
				end
			else
				end_msg := msg.not_in_a_game
				maze_msg := msg.empty
			end
		ensure
			main_menu: (old status.is_main_menu) implies end_msg ~ msg.not_in_a_game and maze_msg ~ msg.empty
			in_game_not_moveable: not (old status.is_main_menu) and not (old board.deep_twin).is_moveable (a_direction) implies end_msg ~ msg.not_a_valid_move and maze_msg ~ msg.empty
			in_game_movable: not (old status.is_main_menu) and (old board.deep_twin).is_moveable (a_direction) implies end_msg ~ msg.not_a_valid_move and maze_msg ~ msg.empty
		end

	solve
		do
			if not status.is_main_menu then
				if board.is_solveable then
					status.set_solving_maze_used_solve
					board.solve
					end_msg := msg.ok
					maze_msg := board.out
					used_solution_msg := msg.solved_no_points
				else
					end_msg := msg.not_solvable
					maze_msg := msg.empty
				end
			else
				end_msg := msg.not_in_a_game
				maze_msg := msg.empty
			end
		ensure
			main_menu: (old status.is_main_menu) implies end_msg ~ msg.not_in_a_game and maze_msg ~ msg.empty
		end

	new_game (a_level: like {GAME_LEVEL}.easy)
		do
			if status.is_main_menu then
				status.set_solving_maze
				board.new_game (a_level)
				game_number.add_one_more
				inspect a_level
				when {GAME_LEVEL}.easy then
					score.increment_max (1)
				when {GAME_LEVEL}.medium then
					score.increment_max (2)
				else -- hard
					score.increment_max (3)
				end
				end_msg := msg.ok
				maze_msg := board.out
			else
				end_msg := msg.in_game_already
				maze_msg := msg.empty
			end
		ensure
			in_game: not (old status.is_main_menu) implies end_msg ~ msg.in_game_already and maze_msg ~ msg.empty
		end

feature -- queries

	out: STRING
		do
			create Result.make_from_string ("  ")
			Result.append ("State: ")
			Result.append (i.out)
			Result.append (" -> ")
			Result.append (end_msg)
			Result.append (maze_msg)
			if victory_flag then
				Result.append ("%N")
				Result.append ("  ")
				Result.append (msg.escaped)
			end
			if status.is_solving_maze_used_solve or victory_flag then
				if not (used_solution_msg ~ msg.empty) then
					Result.append ("%N")
					Result.append ("  ")
					Result.append (used_solution_msg)
				end
			end
			if not status.is_main_menu or victory_flag then
				Result.append ("%N")
				Result.append (game_number.out)
				Result.append ("%N")
				Result.append (score.out)
				Result.append ("%N")
			end
			victory_flag := False
		end

end
