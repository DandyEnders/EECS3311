note
	description: "Summary description for {APPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ES_SUITE

create
	make

feature {NONE}

	make
			-- Run application
		local
			my_string: STRING
		do
			io.read_line
			my_string := io.last_string.twin
			print(my_string)
--			add_test (create {TEST_ACCOUNT}.make)
--			show_browser
--			run_espec
		end

end
