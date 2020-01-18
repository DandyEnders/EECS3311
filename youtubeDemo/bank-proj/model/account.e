note
	description: "[
		A class that represents a bank account that allows customers to deposit and withdraw.
		R1: Account balances never exceed the credit limit
		R2: Clients can deposit and withdraw dollars
		R3: Tellers (but not clients) can date a dollar deposit or withdrawal differently than today
		R4: Tellers (but not clients) can access withdrawals on a given date
		R5: Maximum total withdrawal per day is $5000
		R6: Clients can access the total amount of dollars deposited and dollars withdrawn from their account
	]"
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ACCOUNT

create -- Delcare the list of possible features that can be used as constructors
	make

feature -- Attributes

	balance	: INTEGER
	credit 	: INTEGER

	deposits: LIST[TRANSACTION]
		-- history of deposits
	withdrawals: LIST[TRANSACTION]
		-- history of withdrawals

feature -- Constructor

	make (a_credit: INTEGER)
			-- Initialize an account with 'a_credit' for credit and zero balance.

		do
			balance := 0
			credit := a_credit
			create {LINKED_LIST[TRANSACTION]} deposits.make
			create {LINKED_LIST[TRANSACTION]} withdrawals.make
		ensure
			zero_balance:
				balance = 0
			credit_properly_set:
				credit = a_credit
			empty_deposits:
				deposits.is_empty
			empty_withdrawals:
				withdrawals.count = 0
		end

feature -- Commands, changes state of program

	withdraw (a: INTEGER)
		-- Withdraw an amount 'a' from current account.
		require
			not_too_small:
				a > 0
--			not_too_big:	-- This is too strong!
--				a < balance + credit
			not_too_big:
				a <= balance + credit
		local
			t: TRANSACTION
			d: DATE
		do
			balance := balance - a

			create d.make_now
			create t.make (a, d)
			withdrawals.extend (t)
			-- e.g., say balance = 0, credit = 5
			-- a = 3, then credit will become 3
--			if balance < 0 then
--				credit := -balance
--			end
		ensure
			balance_set:
				balance = old balance - a
			credit_set:
				credit = old credit
			withdrawals_extended:
				withdrawals.count = old withdrawals.count + 1
		end


invariant
	-- credit is always non-negative
	credit_non_negative :
		credit >= 0
	balance_not_exceeding_credit :
		balance + credit >= 0
end
