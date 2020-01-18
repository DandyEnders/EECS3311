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
		do
			add_test (create {TEST_ACCOUNT}.make)
			show_browser
			run_espec
		end

end
