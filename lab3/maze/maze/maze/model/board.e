note
	description: "Summary description for {BOARD}."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit

	ANY
		redefine
			out
		end

create
	make

feature -- Constructor

	make
		local
			-- We need dummy gen to initilize maze_drawer to something.
			-- Otherwise we have to risk detached drawer.
			dummy_gen: MAZE_GENERATOR
		do
			create dummy_gen.make
			maze_graph := dummy_gen.generate_new_maze (1)
			create maze_drawer.make(maze_graph)

			level := 1

			edges := maze_graph.edges
			edges.compare_objects
			create primary_gen.make

			size := maze_graph.vertices[maze_graph.vertices.count].item.row

			create player_coord.make ([1,1])
			create victory_coord.make ([size, size])

		end

feature -- Attribute

	maze_graph: LIST_GRAPH [COORDINATE]

	maze_drawer: MAZE_DRAWER

	primary_gen: MAZE_GENERATOR

	edges: ARRAY [EDGE [COORDINATE]]

	size: INTEGER -- size x size

	du: DIRECTION_UTILITY

	player_coord: COORDINATE

	victory_coord: COORDINATE

	level: like {GAME_LEVEL}.easy

feature -- Commands

	new_game (a_level: like {GAME_LEVEL}.easy)
		do
			maze_graph := primary_gen.generate_new_maze(a_level)
			create maze_drawer.make(maze_graph)
			edges := maze_graph.edges

			size := maze_graph.vertices[maze_graph.vertices.count].item.row
			create player_coord.make ([1,1])
			create victory_coord.make ([size, size])

			level := a_level
		end

	solve
		require
			is_solveable
		local
			player_vertex: VERTEX[COORDINATE]
			victory_vertex: VERTEX[COORDINATE]
			shortest_path_vertices: ARRAY[VERTEX[COORDINATE]]
			i: INTEGER

		do
			create player_vertex.make (player_coord)
			create victory_vertex.make (victory_coord)

			shortest_path_vertices := maze_graph.shortest_path(player_vertex, victory_vertex)

			from
				i := 2
			until
				i > shortest_path_vertices.count
			loop
				maze_drawer.place_solution_on(shortest_path_vertices[i].item)
				i := i + 1
			end
		end

	move(a_direction: like du.N)
		require
			is_moveable(a_direction)
		do
			player_coord := create {COORDINATE}.make (player_coord.row + a_direction.row_mod, player_coord.col + a_direction.col_mod)
			maze_drawer.move_player (a_direction)

			if player_coord ~ victory_coord then
				maze_drawer.check_win
			end
		end

feature -- Queries

	is_solveable: BOOLEAN
		local
			reachable_vertex: ARRAY[VERTEX[COORDINATE]]
		do
			reachable_vertex := maze_graph.reachable (create {VERTEX[COORDINATE]}.make (player_coord))
			reachable_vertex.compare_objects
			Result := reachable_vertex.has (create {VERTEX[COORDINATE]}.make(victory_coord))
		end

	is_moveable(a_direction: like du.N): BOOLEAN
		local
			future_coordinate: COORDINATE
			future_verex:VERTEX[COORDINATE]
			player_vertex:VERTEX[COORDINATE]
		do
			create future_coordinate.make (player_coord.row + a_direction.row_mod, player_coord.col + a_direction.col_mod)
			--create future_vertex.make(future_coordinate)
			future_verex := maze_graph.get_vertex(future_coordinate)
			player_vertex := maze_graph.get_vertex(player_coord)

			-- if there is vertex after move,
			if attached future_verex as att_future_vertex and then attached player_vertex as att_player_vertex then
				-- if tere is path between after move and where player is,
				if edges.has (create {EDGE[COORDINATE]}.make (att_player_vertex, att_future_vertex)) then
					Result := True
				else
					-- there are no direct path after move
					Result := False
				end
			else
				-- There are no vertex after move
				Result := False
			end
		end

	is_victory: BOOLEAN
		do
			Result := player_coord ~ victory_coord
		end


feature -- out

	out: STRING
			-- Return a string representation of the board
		do
			Result := maze_drawer.out
		end

end
