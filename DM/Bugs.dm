

proc
	Log_bug(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Bugs.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"


mob/proc/ReportDate(time)
	var/format = "<b>hh:mm:ss</b>" //MM/DD/YYYY
	return time2text(time, format)

var
	Bugs = null//The var for the logging

mob
	verb
		Reportabug(msg as message)
			set hidden = 1
			set desc = "If this is spam, you will be Murdered"
			Bugs+="([ReportDate(world.realtime)]) [src] Reported: [html_encode(msg)]<br>"//THIS IS WHERE THE BUG LOGS TO THE HTML
			Log_bug("[src] reported: [msg]")

		ViewBug()
			set hidden = 1
			usr<<browse("<b><body bgcolor=black><font color=white><center><u>Bug Reports For [world.name]</u></center></b><br><br>Time at view [ReportDate(world.realtime)]<br><br><font color=white>[(Bugs)]<br>")//HERES WHERE THE BUGS RECORED WILL SHOW
