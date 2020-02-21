note
	description: "Summary description for {GAME_NUMBER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME_NUMBER

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Constructor
	make
		do
			value := 0
		ensure
			value = 0
		end

feature -- Attribute
	value: INTEGER

feature -- Setter
	add_one_more
		do
			value := value + 1
		ensure
			value = old value + 1
		end

feature -- out
	out: STRING
		do
			create Result.make_from_string("  ")
			Result.append("Game Number: ")
			Result.append(value.out)
		end
end
