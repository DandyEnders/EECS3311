note
	description: "[
		A vertex has an item in the generic parameter, 
		as well as incoming and outgoing edges:
			item: G
			outgoing: LIST[EDGE[G]]
			incoming: LIST[EDGE[G]]
			outgoing_sorted: ARRAY[EDGE[G]]
		outgoing_sorted is an array of edges
		sorted based on comparable items in destination vertices. This allows
		for a unique ordering as in breadth first searches etc.
			]"
	note_to_student: "[
		Only modify features that have a `Todo` comment inside of them.
		You must also write the postcondition for command `remove_edge`.
		]"
	ca_ignore: "CA085"
	author: "JSO and JW and Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	VERTEX[G -> COMPARABLE]
inherit
	ANY
		redefine is_equal, out end

	DEBUG_OUTPUT
		redefine is_equal, out end

	COMPARABLE
		redefine is_equal, out end
create
	make

feature {NONE} -- Initialization

	make(a_item: G)
			-- Initialization for `Current'.
		do
			create {LINKED_LIST[EDGE[G]]}outgoing.make
			outgoing.compare_objects
			create {LINKED_LIST[EDGE[G]]}incoming.make
			incoming.compare_objects
			item := a_item
		ensure
			item_set:
				item ~ a_item
			empty_edges:
				outgoing.is_empty and incoming.is_empty
		end

feature -- Comparable

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		do
			Result := item < other.item
		end

	is_equal(other: like Current): BOOLEAN
		do
			Result := item ~ other.item
		end


feature -- basic queries
	item: G

	outgoing: LIST[EDGE[G]]
		-- outging edges

	incoming: LIST[EDGE[G]]
		-- incoming edges

feature -- derived queries

	outgoing_sorted: ARRAY[EDGE[G]]
			-- Return outgoing edges as a sorted array
			-- (based on destination vertices of edges).
		local
			e_comparator: EDGE_COMPARATOR [G]
			e_sorter: DS_ARRAY_QUICK_SORTER [EDGE[G]]
		do
			create Result.make_empty

			-- Make it compare values
			Result.compare_objects

			-- I don't have to make e_outgoing a new edge, since edge is immutable.
			across outgoing is e_outgoing loop
				Result.force(e_outgoing, Result.upper + 1)
			end

			create e_comparator
			create e_sorter.make(e_comparator)
			e_sorter.sort (Result)
		ensure
			-- ∀ i ∈ 1 .. (Result.count - 1) : Result[i].destination ≤ Result[i + 1].destination
			sorted:
				across 1 |..| (Result.count - 1) as l_i all
					Result[l_i.item].destination <= Result[l_i.item + 1].destination
				end
		end

	outgoing_edge_count: INTEGER
		-- number of outgoing edges
		do
			Result := outgoing.count
		ensure
			outgoing_edge_count:
				Result = outgoing.count
		end

	incoming_edge_count: INTEGER
		-- number of incoming edges
		do
			Result := incoming.count
		ensure
			incoming_edge_count:
				Result = incoming.count
		end

	edge_count: INTEGER
			-- number of incoming and outgoing edges
		do
			Result := incoming_edge_count + outgoing_edge_count
		ensure
			correct_count:
				Result = incoming_edge_count + outgoing_edge_count
		end


	has_outgoing_edge(a_edge: EDGE[G]): BOOLEAN
			-- `Current` has `a_edge` as an outgoing edge
		do
			Result := outgoing.has (a_edge)
		ensure
			Result = outgoing.has (a_edge)
		end

	has_incoming_edge(a_edge: EDGE[G]): BOOLEAN
			-- `Current` has `a_edge` as an incoming edge
		do
			Result := incoming.has (a_edge)
		ensure
			Result = incoming.has (a_edge)
		end

feature -- commands

	add_edge(a_edge: EDGE[G])
			-- Adds the given edge to this vertex.
		require
			edge_contains_current: a_edge.source ~ Current or a_edge.destination ~ Current
			new_edge: not (has_incoming_edge (a_edge) or has_outgoing_edge (a_edge))
		do
			-- Add an edge depending on what's dangling on the a_edge.
			-- Edge is immutable so there is no need to make a new edge.

			-- If a_edge has Current vertex as a source, force a_edge in outgoing.
			if a_edge.source ~ Current then 		-- Current vertex is a source
				outgoing.force (a_edge)
			end

			-- If a_edge has Current vertex as a destination, force a_edge in ingoing.
			if a_edge.destination ~ Current then	-- Current vertex is a desination
				incoming.force (a_edge)
			end

			-- If a_edge.is_self_loop case is dealt by each of if statements.
		ensure
			incoming_count_add: a_edge.destination ~ Current implies incoming.count = old incoming.count + 1
			outgoing_count_add: a_edge.source ~ Current implies outgoing.count = old outgoing.count + 1
			destination_implies_incoming: a_edge.destination ~ Current implies has_incoming_edge (a_edge)
			source_implies_outgoing: a_edge.source ~ Current implies has_outgoing_edge (a_edge)

			old_outgoing_dont_change: a_edge.source ~ Current implies
				across outgoing is out_edge
				all
					out_edge /~ a_edge implies (old outgoing).has (out_edge)
				end
			old_incoming_dont_change: a_edge.destination ~ Current implies
				across incoming is in_edge
				all
					in_edge /~ a_edge implies (old incoming).has (in_edge)
				end
			-- done.
		end

	remove_edge(a_edge: EDGE[G])
			-- Removes the given edge related to this vertex.
		require
			edge_contains_current: a_edge.source ~ Current or a_edge.destination ~ Current
			existing_edge: has_incoming_edge (a_edge) or has_outgoing_edge (a_edge)
		do
			-- Edge exists as incoming edge and outgoing edge.
			-- We have to check both incoming and outgoing edge and see if a_edge is in there.
			-- We will remove the edge in incoming and outgoing once we found edges in either one.
			-- Prune all is same as just pruning once since every edge has unique G.

			if a_edge.source ~ Current then
				outgoing.prune_all (a_edge)
			end

			if a_edge.destination ~ Current then
				incoming.prune_all (a_edge)
			end
		ensure
			incoming_count_subtract: a_edge.destination ~ Current implies incoming.count = old incoming.count - 1
			outgoing_count_subtract: a_edge.source ~ Current implies outgoing.count = old outgoing.count - 1
			destination_implies_not_incoming: a_edge.destination ~ Current implies not incoming.has (a_edge)
			source_implies_not_outgoing: a_edge.source ~ Current implies not outgoing.has (a_edge)

			old_outgoing_dont_change: a_edge.source ~ Current implies
				across (old outgoing) is out_edge
				all
					out_edge /~ a_edge implies outgoing.has (out_edge)
				end
			old_incoming_dont_change: a_edge.destination ~ Current implies
				across (old incoming) is in_edge
				all
					in_edge /~ a_edge implies incoming.has (in_edge)
				end
			-- done.
		end

feature -- out

	out: STRING
			-- Return string representation of current vertex
		do
			Result := item.out + ":"
			across outgoing_sorted as l_edge loop
				Result := Result + l_edge.item.debug_output +","
			end
			Result.remove (Result.count)
		end

	debug_output: STRING
			-- Return string representation of current vertex in debugger
		do
			Result := item.out + ":"
			across outgoing_sorted as l_edge loop
				Result := Result + l_edge.item.destination.item.out +","
			end
			Result.remove (Result.count)
		end

invariant
	outgoing_edges_start_with_current:
		across outgoing as l_edge all
			l_edge.item.source ~ Current
		end

	incoming_edges_end_with_current:
		across incoming as l_edge all
			l_edge.item.destination ~ Current
		end

	object_comparison:
		outgoing.object_comparison and incoming.object_comparison
end
