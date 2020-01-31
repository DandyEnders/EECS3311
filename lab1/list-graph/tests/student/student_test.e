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
feature {NONE}-- Initialization

	make
		do
			add_boolean_case(agent t1)
			add_boolean_case(agent t2)
			add_boolean_case(agent t3)
			add_boolean_case(agent t4)
			add_boolean_case(agent t5)
		end

feature -- Tests

	t1: BOOLEAN -- add/remove vertex
		local
			my_g: LIST_GRAPH [INTEGER]
			my_v: VERTEX [INTEGER]
			my_e: EDGE [INTEGER]
		do
			comment ("t1: Add/remove vertex to my graph")
			create my_g.make_empty
			across
				1 |..| 6 as i
			loop
				create my_v.make (i.item)
				my_g.add_vertex (my_v)
			end
			Result := my_g.vertex_count ~ 6
			check
				Result
			end

			across
				1 |..| 6 as i
			loop
				create my_v.make (i.item)
				my_g.remove_vertex (my_v)
			end

			Result := my_g.vertex_count ~ 0
			check
				Result
			end

		end

	t2: BOOLEAN
		local
			my_g: LIST_GRAPH [INTEGER]
			my_v: VERTEX [INTEGER]
			my_e: EDGE [INTEGER]
		do
			comment("t2: Add/remove edges to my graph")
			create my_g.make_empty
			across
				1 |..| 6 as i
			loop
				create my_v.make (i.item)
				my_g.add_vertex (my_v)
			end
			Result := my_g.vertex_count ~ 6
			check
				Result
			end

			create my_e.make (my_g.vertices[1], my_g.vertices[2]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[1]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[3]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[2]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[4]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[4], my_g.vertices[3]); my_g.add_edge (my_e)

			Result := my_g.edge_count ~ 6
			check
				Result
			end

			create my_e.make (my_g.vertices[1], my_g.vertices[2]); my_g.remove_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[1]); my_g.remove_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[3]); my_g.remove_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[2]); my_g.remove_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[4]); my_g.remove_edge (my_e)
			create my_e.make (my_g.vertices[4], my_g.vertices[3]); my_g.remove_edge (my_e)

			Result := my_g.edge_count ~ 0
			check
				Result
			end
		end

	t3: BOOLEAN
		local
			my_g: LIST_GRAPH [INTEGER]
			my_v: VERTEX [INTEGER]
			my_e: EDGE [INTEGER]
			my_reachable: ARRAY[VERTEX[INTEGER]]
		do
			comment("t3: Reachable test")
			create my_g.make_empty
			across
				1 |..| 6 as i
			loop
				create my_v.make (i.item)
				my_g.add_vertex (my_v)
			end
			Result := my_g.vertex_count ~ 6
			check
				Result
			end

			create my_e.make (my_g.vertices[1], my_g.vertices[2]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[1]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[2], my_g.vertices[3]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[2]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[3], my_g.vertices[4]); my_g.add_edge (my_e)
			create my_e.make (my_g.vertices[4], my_g.vertices[3]); my_g.add_edge (my_e)

			Result := my_g.edge_count ~ 6
			check
				Result
			end

			my_reachable := my_g.reachable (my_g.vertices[1])
			Result := my_reachable.has (my_g.vertices[4])
			check
				Result
			end
			Result := not my_reachable.has (my_g.vertices[5])
			check
				Result
			end
		end

	t4: BOOLEAN
		local
			v1, v2, v3, v4: VERTEX [INTEGER]
			e: EDGE [INTEGER]
		do
			comment ("t4: Add/remove edges VERTEX")
			create v1.make (1)
			create v2.make (2)
			create v3.make (3)
			create v4.make (4)

			create e.make (v1, v2)
			v1.add_edge (e)
			v2.add_edge (e)

			Result := v1.edge_count ~ 1
			check
				Result
			end

			create e.make (v1, v4)
			v1.add_edge (e)
			v4.add_edge (e)
			create e.make (v1, v3)
			v1.add_edge (e)
			v3.add_edge (e)

			Result := v1.edge_count ~ 3
			check
				Result
			end

			create e.make (v1, v2)
			v1.remove_edge (e)

			Result := v1.edge_count ~ 2
			check
				Result
			end

			create e.make (v1, v4)
			v1.remove_edge (e)
			create e.make (v1, v3)
			v1.remove_edge (e)

			Result := v1.edge_count ~ 0
			check
				Result
			end

		end

	t5: BOOLEAN
		local
			v1, v2, v3, v5: VERTEX [INTEGER]
			e: EDGE [INTEGER]
			sorted_edges: ARRAY [EDGE [INTEGER]]
			sorted_out: STRING
		do
			comment ("t5: Sorted edges VERTEX")
			create v1.make (1)
			create v2.make (2)
			create v3.make (3)
			create v5.make (5)

			create e.make (v1, v2)
			v1.add_edge (e)
			v2.add_edge (e)

			Result := v1.edge_count ~ 1
			check
				Result
			end

			create e.make (v1, v5)
			v1.add_edge (e)
			v5.add_edge (e)
			create e.make (v1, v3)
			v1.add_edge (e)
			v3.add_edge (e)

			Result := v1.edge_count ~ 3
			check
				Result
			end

			sorted_edges := v1.outgoing_sorted
			Result := sorted_edges.count ~ 3
			create sorted_out.make_empty

			across
				sorted_edges is curr_edge
			loop
				sorted_out.append (curr_edge.destination.out)
				sorted_out.append (" ")
			end
			assert_equal ("sorted_edges_test", "1:2,3,5", v1.out)
		end
end
