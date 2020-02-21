note
	description: "Summary description for {SCORE}."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	SCORE

inherit
	ANY
		redefine
			out
		end

create
	make

feature -- Consturctor
	make
		do
			value := 0
			max:= 0
		end

feature -- Attributes

	value: INTEGER

	max: INTEGER

feature -- Setter

	reset_value
		do
			value := 0
		ensure
			value = 0
		end

	increment_value (inc: INTEGER)
		require
			inc > 0
		do
			value := value + inc
		ensure
			value = old value + inc
		end

	increment_max (inc: INTEGER)
		require
			inc > 0
		do
			max := max + inc
		ensure
			max = old max + inc
		end

feature -- Output
	out: STRING
		do
			create Result.make_from_string("  ")
			Result.append("Score: ")
			Result.append(value.out)
			Result.append(" / ")
			Result.append(max.out)
		end

end
