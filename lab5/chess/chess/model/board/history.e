note
	description: "Summary description for {HISTORY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HISTORY

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization for `Current'.
		do
			create {ARRAYED_LIST[MOVE]} imp.make (10)
		end

feature {NONE} -- Implementation

	imp: LIST[MOVE]

feature -- Queries

	after: BOOLEAN
		do
			Result := imp.after -- maybe TODO?
		end

	before: BOOLEAN
		do
			Result := imp.before
		end

	on_item: BOOLEAN
		do
			Result := not before and not after
		end

	item: MOVE
		require
			on_item
		do
			Result := imp.item
		end

feature -- Commnds

	forth
		require
			not after
		do
			imp.forth
		end

	back
		require
			not before
		do
			imp.back
		end

	remove_right
		do
			if not imp.islast and not after then
				from
					forth
				until
					after
				loop
					imp.remove
				end
			end
		end

	extend_history(a_move: MOVE)
		do
			remove_right
			imp.extend (a_move)
			imp.finish
		end

end
