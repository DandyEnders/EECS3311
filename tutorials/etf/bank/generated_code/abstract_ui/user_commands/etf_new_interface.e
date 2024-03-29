note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ETF_NEW_INTERFACE
inherit
	ETF_COMMAND
		redefine 
			make 
		end

feature {NONE} -- Initialization

	make(an_etf_cmd_name: STRING; etf_cmd_args: TUPLE; an_etf_cmd_container: ETF_ABSTRACT_UI_INTERFACE)
		do
			Precursor(an_etf_cmd_name,etf_cmd_args,an_etf_cmd_container)
			etf_cmd_routine := agent new(?)
			etf_cmd_routine.set_operands (etf_cmd_args)
			if
				attached {STRING} etf_cmd_args[1] as a_id
			then
				out := "new(" + etf_event_argument_out("new", "a_id", a_id) + ")"
			else
				etf_cmd_error := True
			end
		end

feature -- command precondition 
	new_precond(a_id: STRING): BOOLEAN
		do  
			Result := 
				comment ("ID = STRING")
		ensure then  
			Result = 
				comment ("ID = STRING")
		end 
feature -- command 
	new(a_id: STRING)
		require 
			new_precond(a_id)
    	deferred
    	end
end
