note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_WITHDRAW_INTERFACE
inherit
	ETF_COMMAND
		redefine 
			make 
		end

feature {NONE} -- Initialization

	make(an_etf_cmd_name: STRING; etf_cmd_args: TUPLE; an_etf_cmd_container: ETF_ABSTRACT_UI_INTERFACE)
		do
			Precursor(an_etf_cmd_name,etf_cmd_args,an_etf_cmd_container)
			etf_cmd_routine := agent withdraw(? , ?)
			etf_cmd_routine.set_operands (etf_cmd_args)
			if
				attached {STRING} etf_cmd_args[1] as a_id and then attached {VALUE} etf_cmd_args[2] as a_value
			then
				out := "withdraw(" + etf_event_argument_out("withdraw", "a_id", a_id) + "," + etf_event_argument_out("withdraw", "a_value", a_value) + ")"
			else
				etf_cmd_error := True
			end
		end

feature -- command precondition 
	withdraw_precond(a_id: STRING ; a_value: VALUE): BOOLEAN
		do  
			Result := 
				comment ("ID = STRING")
		ensure then  
			Result = 
				comment ("ID = STRING")
		end 
feature -- command 
	withdraw(a_id: STRING ; a_value: VALUE)
		require 
			withdraw_precond(a_id, a_value)
    	deferred
    	end
end
