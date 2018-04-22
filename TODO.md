

process_info(whereis(code_server), backtrace)





	-> will list all running processes in IEX
		:shell_default.i.


	show information for a PID
		:shell_default.i(0, 6, 0)



	show the PID for a running module
		:erlang.whereis(:code_server)

	show information for a PID
		:erlang.process_info(PID).


