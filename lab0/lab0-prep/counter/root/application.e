note
	description: "Summary description for {APPLICATION}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} --Initialization
	-- Task 1: Study this tutorial series on DbC (Design by Contract) and TDD (Test Driven Development).
	-- Task 2: Can you explain why a violation of class invariant occurs in the above APPLICATION class?
	-- 			Answer:	The client's input for MY_COUNTER constructor passed -10, however, MY_COUNTER has
	--					class invariant saying that value must be one value from 0 to 10.
	-- Task 3: There are two ways to fixing this class invariant violation (try both and verify that
	--			it does get rid of the contract violation):
	-- Task 4: Switch the root of project back to ROOT.make. Then, based on what you learned about TDD in the
	-- 			above tutorial series, add 3 different, but meaninful tests to the TEST EXAMPLE class and make sure they all pass (i.e., a green bar).

	make
		-- Run application
	local
		c: MY_COUNTER
	do
		-- initial contract violoation
		-- create {MY_COUNTER} c.make (-10)
		-- print(c.value)

		-- fix Precondition violoation
		create {MY_COUNTER} c.make (0)
		print(c.value)
	end

end
