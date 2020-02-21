note
	description: "Summary description for {GAME_STATUS}."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_STATUS

create
	make

feature {NONE} -- Constructor

	make
		do
			status := main_menu
		ensure
			status = main_menu
		end

feature -- Static

	main_menu: STRING = "MAIN_MENU"

	solving_maze: STRING = "SOLVING_MAZE"

	solving_maze_used_solve: STRING = "SOLVING_MAZE_USED_SOLVE"

feature -- Attributes

	status: STRING

	allowed: ARRAY [STRING]
		do
			Result := <<main_menu, solving_maze, solving_maze_used_solve>>
		end

feature -- Commands

	set_main_menu
		do
			status := main_menu
		ensure
			status ~ main_menu
		end

	set_solving_maze
		require
			not_going_back: not is_solving_maze_used_solve
		do
			status := solving_maze
		ensure
			status ~ solving_maze
		end

	set_solving_maze_used_solve
		require
			was_solving: is_solving_maze
			not_solve_main_menu: not is_main_menu
		do
			status := solving_maze_used_solve
		ensure
			status ~ solving_maze_used_solve
		end

feature -- Queires

	is_main_menu: BOOLEAN
		do
			Result := status ~ main_menu
		ensure
			Result = status ~ main_menu
		end

	is_solving_maze: BOOLEAN
		do
			Result := status ~ solving_maze
		ensure
			Result = status ~ solving_maze
		end

	is_solving_maze_used_solve: BOOLEAN
		do
			Result := status ~ solving_maze_used_solve
		ensure
			Result = status ~ solving_maze_used_solve
		end

invariant
	status_is_in_allowed: allowed.has (status)

end
