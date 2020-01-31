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
		do
			comment("t1: testing1")
			Result := True and True or True and True
		end

	t2: BOOLEAN
		do
			comment("t2: testing2")
			Result := True or True and True
		end

	t3: BOOLEAN
		do
			comment("t3: testing3")
			Result := True and True or True
		end

	t4: BOOLEAN
		do
			comment("t4: testing4")
			Result := True or True
		end

	t5: BOOLEAN
		do
			comment("t5: testing5")
			Result := True and True and True
		end
end
