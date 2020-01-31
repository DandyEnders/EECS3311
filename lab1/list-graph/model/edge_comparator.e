note
	description: "A comparator to compare two edges."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	EDGE_COMPARATOR[G -> COMPARABLE]

inherit
	KL_COMPARATOR[EDGE[G]]

feature
	attached_less_than (u, v: EDGE[G]): BOOLEAN
		do
			Result := u.destination < v.destination
		end

end
