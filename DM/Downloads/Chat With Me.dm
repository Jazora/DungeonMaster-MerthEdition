mob
	Login()
		world() << "<font color=blue>[usr] logs in"
		return

	Logout()
		world() << "<font color=red>[usr] logs out"
		return

mob
	verb
		Chat(msg as text)
			world << "[usr]: [msg]"
