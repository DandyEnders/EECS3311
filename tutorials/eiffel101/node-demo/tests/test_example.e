note
	description: "[
		Test examples with arrays and regular expressions.
		First test fails as Result is False by default.
		Write your own tests.
		Included libraries:
			base and extension
			Espec unit testing
			Mathmodels
			Gobo structures
			Gobo regular expressions
		]"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision 19.05$"

class
	TEST_EXAMPLE

inherit

	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- initialize tests
		do
			add_boolean_case (agent t0)
			add_boolean_case (agent t1)
			add_boolean_case (agent t2)
			add_boolean_case (agent t3)
			add_boolean_case (agent t4)
			add_boolean_case (agent t5)
		end

feature -- tests

	t0: BOOLEAN
		local
			a: ARRAY[STRING]
		do
			comment("t0: Test how array works.")
			a := <<"red", "green", "yellow">>
			Result := a.count = 3 and a[2] ~ "green"
			check Result end

			a.force ("yellow", 4)

			Result := a[4] ~ "yellow"
			check Result end
		end

	t1: BOOLEAN
		local
			person: PERSON
		do
			comment ("t1: testing person")
			create person.make(21)
			Result := person.age = 21
			check Result end

			person.set_age(22)
			Result := person.age = 22
			check Result end
		end

	t2: BOOLEAN
		local
			array: ARRAY[PERSON]
		do
			comment ("t2: testing Array of people")

			create array.make_empty
			array.force(create {PERSON}.make(21), 1)
			Result := array[1].age ~ 21
			check Result end

			array.force(create {PERSON}.make(22), 2)
			Result := array[2].age ~ 22
			check Result end

		end

	t3: BOOLEAN
		local
			linked_list: LINKED_LIST[PERSON]
		do
			comment ("t3: linked list test")

			create linked_list.make

			--v
			--?  21
			linked_list.put_front (create {PERSON}.make(21))

			--v
			--21
			linked_list.start

			Result := linked_list.item.age ~ 21
			check Result end

			--		v
			-- 20 = 21
			linked_list.put_left (create {PERSON}.make(20))
			--		v
			-- 20 = 21 = 22
			linked_list.put_right (create {PERSON}.make(22))

			-- v	
			-- 20 = 21 = 22
			linked_list.back
			Result := linked_list.item.age ~ 20
			check Result end

			--			 v
			-- 20 = 21 = 22
			linked_list.forth
			linked_list.forth
			Result := linked_list.item.age ~ 22
			check Result end


		end

	t4: BOOLEAN
		local
			arrayed_list: ARRAYED_LIST[PERSON]
		do
			comment ("t4: arrayed list test")

			create arrayed_list.make(0)

			-- ?	21	?
			arrayed_list.force (create {PERSON}.make(21))
			arrayed_list.start

			-- ?  	21	?
			Result := arrayed_list[1].age ~ 21
			check Result end

			-- 20	21	?
			arrayed_list.put_left (create {PERSON}.make(20))
			Result := arrayed_list[1].age ~ 20
			check Result end

			-- 20	21	22
			arrayed_list.put_right (create {PERSON}.make(22))
			Result := arrayed_list[3].age ~ 22
			check Result end
	end

	t5: BOOLEAN
		local
			table: HASH_TABLE[PERSON, INTEGER]
		do
			comment ("t5: hash table")

			create array.make_empty
			array.force(create {PERSON}.make(21), 1)
			Result := array[1].age ~ 21
			check Result end

			array.force(create {PERSON}.make(22), 2)
			Result := array[2].age ~ 22
			check Result end

		end


--feature -- Regular Expression tests

--	t2: BOOLEAN
--			-- Test feature 'compile'.
--		local
--			a_regexp: RX_PCRE_REGULAR_EXPRESSION
--			-- Perl Compatible regular expressions, using gobo
--			-- https://www.debuggex.com/cheatsheet/regex/pcre
--			-- [abc]: one character of a or b or c
--			-- [abc]*: zero or more repititions of [abc]
--			-- ^: start of string
--			-- $: end of string
--		do
--			comment ("t2: test regular expression ^[abc]*$")
--			create a_regexp.make
--			a_regexp.compile ("^[abc]*$")
--			Result := a_regexp.is_compiled and a_regexp.recognizes ("aaabbbccc")
--			check
--				Result
--			end
--			Result := a_regexp.captured_substring (0) ~ "aaabbbccc"
--			check
--				Result
--			end
--			Result := not a_regexp.recognizes ("aaabbbcccddd")
--		end

--	t3: BOOLEAN
--			-- Test feature 'compile'.
--		local
--			a_regexp: RX_PCRE_REGULAR_EXPRESSION
--			match, replace: STRING
--			-- he(ll)o eiffelians; hello ei[ff]elians
--		do
--			comment ("t3: test regular expression groups ((.)\2) repeated letters")
--			create a_regexp.make
--			a_regexp.compile ("((.)\2)") -- group with two repeated letters
--			a_regexp.match ("hello eiffelians")
--			match := a_regexp.captured_substring (0)
--			Result := a_regexp.is_compiled and match ~ "ll"
--			check
--				Result
--			end
--			a_regexp.next_match
--			match := a_regexp.captured_substring (0)
--			Result := a_regexp.is_compiled and match ~ "ff"
--			check
--				Result
--			end
--				-- Put the captured substring \1 between brackets <>
--			replace := a_regexp.replace ("<\1\>")
--			Result := replace ~ "hello ei<ff>elians"
--		end

end
