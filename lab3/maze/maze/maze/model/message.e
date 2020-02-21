note
	description: "Summary description for {MESSAGE}."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

expanded class
	MESSAGE

feature -- general

	ok: STRING = "ok"
	empty: STRING = ""

feature -- move

	not_in_a_game: STRING = "Error! Not in a game."

	not_a_valid_move: STRING = "Error! Not a valid move."

	escaped: STRING = "Congratulations! You escaped the maze!"

feature -- new_game

	in_game_already: STRING = "Error! In game already."

feature -- abort

--	not_in_a_game: STRING 		= "Not in a game."

feature -- solve

--	not_in_a_game: STRING 		= "Not in a game."

	not_solvable: STRING = "Error! Maze is not solvable, you may abort with no penalty."

	solved_no_points: STRING = "Since you used the solution, no points are awarded."
end
