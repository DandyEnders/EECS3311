note
	description: "A transaction encapsulates a pair of deposit/withdraw cvalue with its time stamp."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	TRANSACTION

create
	make

feature -- Constructor
	make (v: INTEGER; d: DATE)
			-- Initialize a transcation with value 'v' and date 'd'.
		do
			value := v
			date := d
		ensure
			value_set: value = v
			date_set: date = d
		end

feature -- Attribute
	value: INTEGER
	date: DATE

invariant
	valid_value:
		value > 0
end
