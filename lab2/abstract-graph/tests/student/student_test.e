note
	description: "Summary description for {STUDENT_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	STUDENT_TEST

inherit
	ES_TEST

create
	make
feature {NONE} -- Initialization

	make
		do
			add_boolean_case(agent t1)
			add_boolean_case(agent t2)
			add_boolean_case(agent t3)
			add_boolean_case(agent t4)
			add_boolean_case(agent t5)
		end

feature -- Tests

	t1: BOOLEAN
		local
			l_graph: LIST_GRAPH[STRING]
			l_edge: ARRAY[TUPLE[STRING, STRING]]
		do
			comment ("t1: make empty test")
			create l_graph.make_empty
			Result := l_graph.vertex_count ~ 0 and l_graph.edge_count ~ 0
			check Result end

			-- make_from_array

			l_edge := << ["a", "b"], ["a", "c"], ["c", "d"], ["e", "f"] >>
			l_edge.compare_objects
			create l_graph.make_from_array (l_edge)

			assert_equal ("correct vertices & edges", "[a:b,c][b][c:d][d][e:f][f]", l_graph.out)
			Result := l_graph.edge_count ~ 4 and l_graph.vertex_count ~ 6
		end

	t2: BOOLEAN
		local
			l_graph: LIST_GRAPH[INTEGER]
			l_vertex: VERTEX[INTEGER]
			l_edge: EDGE[INTEGER]
		do
			comment ("t2: add_vertex, add_edge")
			create l_graph.make_empty
			across 1 |..| 6 as i loop
				create l_vertex.make (i.item)
				l_graph.add_vertex (l_vertex)
			end
			create l_edge.make (l_graph.vertices[1], l_graph.vertices[2]) -- (1, 2)
			l_graph.add_edge (l_edge)
			create l_edge.make (l_graph.vertices[4], l_graph.vertices[3])
			l_graph.add_edge (l_edge)
			create l_edge.make (l_graph.vertices[1], l_graph.vertices[5])
			l_graph.add_edge (l_edge)

			assert_equal ("", "[1:2,5][2][3][4:3][5][6]", l_graph.out)
			Result := l_graph.edge_count ~ 3 and l_graph.vertex_count ~ 6
		end

	t3: BOOLEAN
		local
			l_graph: LIST_GRAPH[INTEGER]
			l_edges: ARRAY[TUPLE[INTEGER, INTEGER]]
		do
			comment ("t3: add & remove Commands, remove_vertex, remove last vertex")
			l_edges := << [1, 2], [1, 3], [1, 1], [3, 4], [3, 5], [5, 6], [6, 5] >>
			l_edges.compare_objects
			create l_graph.make_from_array (l_edges)
			assert_equal ("", "[1:1,2,3][2][3:4,5][4][5:6][6:5]", l_graph.out)
			Result := l_graph.edge_count ~ 7 and l_graph.vertex_count ~ 6
			check Result end

			l_graph.remove_vertex (l_graph.vertices[1])
			l_graph.remove_vertex (l_graph.vertices[1])
			l_graph.remove_vertex (l_graph.vertices[1])
			l_graph.remove_vertex (l_graph.vertices[1])
			l_graph.remove_vertex (l_graph.vertices[1])
			l_graph.remove_vertex (l_graph.vertices[1])
			assert_equal ("correct vertices & edges", "", l_graph.out)
			Result := l_graph.edge_count ~ 0 and l_graph.vertex_count ~ 0
			check Result end
		end

	t4: BOOLEAN
		local
			l_graph: LIST_GRAPH[COURSE]
			l_edges: ARRAY[TUPLE[COURSE, COURSE]]
			l_vertex: VERTEX[COURSE]
			c1, c2, c3, c4, c5, c6: COURSE
		do
			comment ("t4: course test")

			create c1.make (2011, "Data Structures", "F")
			create c2.make (2030, "Advanced Object Oriented Programming", "F")
			create c3.make (2031, "Software Tools", "W")
			create c4.make (2200, "Electrical Circuits", "F")
			create c5.make (3311, "Software Design", "F")
			create c6.make (3101, "Design and Analysis of Algorthms", "W")

			l_edges := << [c1, c2], [c1, c3], [c1, c1], [c3, c4], [c3, c5], [c5, c6], [c6, c5] >>
			l_edges.compare_objects
			create l_graph.make_from_array (l_edges)
			assert_equal ("correct vertices & edges", "[2011:2011,2030,2031][2030][2031:2200,3311][2200][3311:3101][3101:3311]", l_graph.out)
			Result := l_graph.edge_count ~ 7 and l_graph.vertex_count ~ 6
			check Result end

			create l_vertex.make (c1)

			Result := l_graph.has_vertex (l_vertex) -- the has_vertex query should return true because the graph has a matching vertex with the same item.
			check Result end
		end

	t5: BOOLEAN
		local
				l_graph: LIST_GRAPH[INTEGER]
				l_edges: ARRAY[TUPLE[INTEGER, INTEGER]]
				reachable: ARRAY[VERTEX[INTEGER]]
			do
				comment ("t5: reachable")
				l_edges := << [1, 2], [3, 4], [3, 5], [4, 5], [4, 6], [6, 1], [6, 2] >>
				l_edges.compare_objects
				create l_graph.make_from_array (l_edges)
				assert_equal ("correct vertices & edges", "[1:2][2][3:4,5][4:5,6][5][6:1,2]", l_graph.out)
				Result := l_graph.edge_count ~ 7 and l_graph.vertex_count ~ 6
				check Result end

				reachable := l_graph.reachable (l_graph.vertices[1])
				Result := reachable.count ~ 2 and reachable[2].item ~ 2
				check Result end

				reachable := l_graph.reachable (l_graph.vertices[3])
				Result := reachable.count ~ 6
				check Result end

			end

end
