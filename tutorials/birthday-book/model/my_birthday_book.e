note
	description: "[
		Keep track of birthdays for friends.
		Model is FUN[NAME,BIRTHDAY]
		Efficient implementation with hash table
	]"
	author: "JSO and Jackie and Jinho"
	date: "$Date$"
	revision: "$Revision$"

class
	MY_BIRTHDAY_BOOK

inherit

	ANY
		redefine
			out
		end

	ITERABLE[TUPLE[NAME, BIRTHDAY]]
		undefine
			out
		end

create
	make

feature {NONE, ES_TEST} -- implementation

			-- implementation as an efficient hash table
			-- Exercise:
			-- change `imp` to:
			-- names: ARRAY[NAME]
			-- birthdays: LINKED_LIST[BIRTHDAY]
			-- What should change?
			-- 1. imp's key(names) are now Array of names.
			-- 2. imp's value(birthdays) are now Linked list of birthdays.
			-- 3. "count" now counts names.count (invariant gurentees names.count = birthday.count)
			-- 4. "put" now has to search for correct name on array before given
			-- 	  birthday can be substituted.
			-- 5. "remind" now just have to iterate through birthdays and if
			-- 	  it is same, we can put it in result array.
			-- 6. model's post condition had to change.

	names: ARRAY[NAME]
	birthdays: LINKED_LIST[BIRTHDAY]

	make
			-- create a birthday book
		do
			create names.make_empty
			names.compare_objects
			create birthdays.make
			birthdays.compare_objects
		ensure
			model.is_empty
		end

feature -- model

	model: FUN [NAME, BIRTHDAY]
			-- model is a function from NAME --> BIRTHDAY
			-- abstraction function
			-- Abstraction Function from an object's concrete implementation
			-- to the abstract value it represent
		do
			create Result.make_empty
			across
				1 |..| count is i
			loop
				Result.extend ([names[i], birthdays[i]])
			end
		ensure
			same_count:
				model.count = count
			same_elements:
				across
					model as cursor
				all
					names.has (cursor.item.first)
					and
					birthdays.has (cursor.item.second)
				end
			consistent_mapping:
					-- if model's domain(names) have names[i],
					-- it implies that the model's birthday is birthday at
					-- same index.
				across
					1 |..| model.count is j
				all
					model.domain.has (names[j])
					implies
					model[names[j]] ~ birthdays[j]
				end

		end

feature -- command

	put (a_name: NAME; d: BIRTHDAY)
			-- add birthday for `a_name' at date `d'
			-- or overrride current birthday with new
		do
			if not names.has (a_name) then
				names.force (a_name, names.count + 1)
				birthdays.force (d)
			else
				across
					1 |..| count is i
				loop
					if names[i] ~ a_name then
						birthdays[i] := d
					end
				end
			end

		ensure
			model_override:
				model ~ (old model.deep_twin).overriden_by ([a_name, d])
		end

feature -- query

	remind (d: BIRTHDAY): ARRAY [NAME]
			-- returns an array of names with birthday `d'
		do
			create Result.make_empty
			Result.compare_objects
			across
				1 |..| count is i
			loop
				if birthdays[i] ~ d then
					Result.force(names[i], Result.count + 1)
				end
			end
		ensure
--			remind_count:
--				Result.count = (old model @> (d)).count
--			remind_model_range_restiction:
--				across (model @> (d)).domain as cr all
--					Result.has (cr.item)
--				end
			remind_count:
				Result.count = (old model.deep_twin).range_restricted_by (d).count
			remind_model_range_restriction:
				across (old model.deep_twin).range_restricted_by (d).domain as cr all
					Result.has (cr.item)
				end

		end

	count: INTEGER
			-- returns the number of entries in current birthday book
		do
			Result := names.count
		ensure
			Result = model.count
		end

feature -- access

	new_cursor: ITERATION_CURSOR [TUPLE[NAME, BIRTHDAY]]
			-- Fresh cursor associated with current structure
		local
			cursor: MY_BIRTHDAY_BOOK_ITERATION_CURSOR
		do
			create cursor.make (names, birthdays)
			Result := cursor
		end

feature

	out: STRING
		do
			Result := model.out
		end

invariant
	count =  model.count
	names.count = birthdays.count
end
