note
	description: "Summary description for {PERSON}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PERSON

create
	make

feature
	make(a_age: INTEGER)
		do
			age := a_age
		ensure
			age = a_age
		end

feature
	age: INTEGER assign set_age

	set_age( new_age : INTEGER )
		do
			age := new_age
		ensure
			age = new_age
		end

end
