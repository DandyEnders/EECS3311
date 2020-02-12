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
		end

feature -- tests

	t0: BOOLEAN
		local
			book: BOOK
			bd: DATE
			address : STRING
		do
			comment ("t0: test basic functions of a book")

			-- initialize an empty book
			create book.make
			Result := book.count = 0
			check Result end

			create bd.make (1970, 3, 21)
			book.add ("Jim", bd)
			Result :=
					book.count = 1
				and	book.has_name ("Jim")
--				and	book.get ("Jim") ~ bd
				and book.find (bd).count = 1
--				and book.find (bd).has ("Jim")
			check Result end

			-- This compiles, which allows records to be of types
			-- DATE and STRING, why? -> We declared record as ANY
			create address.make_from_string ("York University")
			book.add ("Jackie", address)
			Result :=
					book.count = 2
				and	book.has_name ("Jackie")
				and	book.find (address).count = 1
				and book.find (address).has ("Jackie")

			-- Up to now, we illustrated that storage is flexible!

			-- casting
			-- book.get ("Jim").make_now
			-- Equivalent to
			-- if book.get("Jim") instance of DATE then
			--		bd_of_jim = (DATE) book.get ("Jim");
			--		bd_of_im.make_now
			-- end
--			if attached {DATE} book.get ("Jim") as bd_of_jim then
--				bd_of_jim.make_now
--			end

			-- Up to now, we illustrated that retrieval is
			-- error-prone, because manual, unsystematic casts are needed.

		end

	t1: BOOLEAN
		local
			book: GENERIC_BOOK[DATE] -- instantiate 'G' by DATE
			bd: DATE
		do
			comment ("t1: test basic functions of gneric book")

			-- initialize an empty book
			create book.make
			Result := book.count = 0
			check Result end

			create bd.make (1970, 3, 21)
			book.add ("Jim", bd)
			Result :=
					book.count = 1
				and	book.has_name ("Jim")
--				and	book.get ("Jim") ~ bd
				and book.find (bd).count = 1
--				and book.find (bd).has ("Jim")
			check Result end

			-- The following 'add' does not compile.
			-- why? -> We have committed to date as generic parameter.
--			create address.make_from_string ("York University")
--			book.add ("Jackie", address)
--			Result :=
--					book.count = 2
--				and	book.has_name ("Jackie")
--				and	book.find (address).count = 1
--				and book.find (address).has ("Jackie")

			-- Up to now, we illustrated that storage is controlled,
			-- in that only one consistent kind fo records can be stored
			-- in the book. The kind is committed when the client
			-- delcreas the local variable 'book'.
			book.get ("Jim").make_now

		end

		t2: BOOLEAN
			-- Test the declartion and use of a tuple.
		local
			book: GENERIC_BOOK[DATE]
			d: DATE
		do
			comment ("t2: Test iteration of generic book")
			create book.make

			create d.make_now
			book.add ("Jim", d)
			book.add ("Jeremy", d)

			Result :=
				across
					book as cursor
				all
					cursor.item[2] ~ d
				end
			check Result end
		end

--	t3: BOOLEAN
--			-- Test feature 'compile'.
--		local
--			book: GENERIC_BOOK[DATE]
--		do
--			comment ("t3: test regular expression groups ((.)\2) repeated letters")

--		end

end
