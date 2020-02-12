note
	description: "Summary description for {BOOK}."
	author: "Jinho Hwang"
	date: "$Date$"
	revision: "$Revision$"

class
	BOOK

create
	make

feature -- Costructor
	make
			-- Initialize an empty book.
		do
			create names.make_empty
			create records.make_empty
		ensure
			empty_name_list:
				names.is_empty
			empty_record_list:
				records.is_empty
		end

feature -- Commands
	add (n : STRING; r: ANY)
		-- Add a pair of name 'n' associated with record 'r'.
		require
			not_existing_name:
				not current.has_name(n)
		do

		ensure
			existing_name:
				current.has_name(n)
			associated_record:
				current.get(n) = r
			book_size_incremented:
				current.count = current.count + 1
			names_added:
				names.count = old names.count + 1
			records_added:
				records.count = old records.count + 1

		end

	remove (n : STRING)
		-- Remove a pair of name 'n' and their associated record 'r'.
		do

		end

feature -- Queries
	count: INTEGER
			-- Return the number of name-record paris in current book.
		do

		end

	has_name (n: STRING): BOOLEAN
			-- Does name 'n' exist in current book?
		do

		end

	has_record (r: ANY): BOOLEAN
			-- Does name 'n' exist in current book?
		do

		end

	find (r: ANY): ARRAY[STRING]
			-- Return names of the list of people who have equal records.
		do
			create Result.make_empty
		end

	get (n: STRING): ANY
		-- Return the associated record for name 'n'.
		do
			Result := records[records.lower]
		end

feature {NONE} -- Secret Implementation (Information Hiding)
	names :	ARRAY[STRING]
	records : ARRAY[ANY]


invariant
	consistent_sizes:
			count = names.count
		and count = records.count

end
