/*===========================================================================================
Version 1.4 of Murrawhip's Murra-Admin library. Use what you wish, change what you
  wish. This is only very standard at the moment, send suggestions/bug reports to
  info@murrawhip.net if you wish. Enjoy!
---------------------------------------------------------------------------------------------
To install, merely include this library in your program, then add something similar
to this in your mob's Login() proc.
if(usr.key=="insertkeyhere")
	usr.verbs+=typesof(/Admin/verb/)//Gives all verbs under the mob/Admin mob.
The above shall grant the user specified, all adminstrative powers. If you wish to
only give select admin powers, then there are several ways you could go about it.

	if(usr.key=="insertkeyhere")
		usr.verbs+=typesof(/Admin/verb/)
		usr.verbs-=/Admin/verb/Delete
		usr.verbs-=/Admin/verb/Density_change
^Adding all powers of the Admin type, then subtracting
those powers you do not wish to give.

	if(usr.key=="insertkeyhere")
		usr.verbs+=/Admin/verb/Delete
		usr.verbs+=/Admin/verb/Density_change
^Adding those powers that you DO want to give.
---------------------------------------------------------------------------------------------
For banning/unbanning to work, include this in your mob's Login() proc also.
	if(usr.client.address in banlist)
			usr<<"You have been banned."
			del usr

===========================================================================================*/
proc
	Log_admin(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Adminlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"
	Log_chat(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Chatlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"
	Log_unitsay(adminaction) //Define adminaction as a string then call this proc
		file("Logs/UnitChatlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"
	Log_emote(adminaction) //Define adminaction as a string then call this proc
		file("Logs/EmoteChatlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"
	Log_developer(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Developerlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"


mob/var{Mcloaked=0;Mprevicon}
var/banlist=list()
var/moblist=list()
var/adminlist=list()
var/councillist=list()
var/modlist=list()
var/Players=list()
var/Players2=list()


world
	New()
		var/savefile/F=new("Bans.ban")
		var/tempban
		F["IP"] >> tempban
		for(var/A in tempban)
			banlist+=A

mob

	Topic(href,href_list[])
		switch(href_list["action"])
			if("PM")//action, if its PM it goes on, if its not it just does nothing

				var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
				if(!msg) return
				//sends the message and tells the user the message they sent
				if(usr.ckey in src.IgnoreList)
					usr << "You are on [src]'s ignore list<br>"
					return
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PM>[src]</a>:</font color> [html_encode(msg)]"
				src<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
				for(var/mob/D in Players2)
					if(D.GM == 1 && D.DE == 1 && D != src && D != usr)
						D<<"<b><font color=silver>[usr] sent to [src]:</font color> [msg]"
			if("PPM")//action, if its PM it goes on, if its not it just does nothing
				var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
				if(!msg) return
				//sends the message and tells the user the message they sent
				if(usr.ckey in src.IgnoreList)
					usr << "You are on [src]'s ignore list<br>"
					return
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PPM>[src]</a>:</font color> [html_encode(msg)]"
				src<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"

mob
	verb
		Adminhelp(msg as text)
			if(!msg) return
			for(var/mob/M in world)
				if(M.GM)
					M << "<font color=blue>Admin-help from: <a href=?src=\ref[usr];action=PM>[usr]</a>([usr.Race]):</font color> [html_encode(msg)]"

		PickUp(obj/C as obj in view())
			set category="Commands"
			set name="Pick Up"
			for(var/mob/Monsters/M in usr.Selected)
				if(C in view(1,M))
					M.destination = null
					if(C.suffix == null)
						if(M.weight <= M.weightmax)
							C.loc = M
							C.suffix = "(Carrying)"
							M.weight += C.weight
							return
						else
							if(M.Wagon == 0)
								usr << "[M] : I cant Carry Too Much!"
							return


Admin/verb
	UnitChatLog(var/mob/M in Players)
		set category = "Admin"
		var/html_doc="<head><title>Unit Chat</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Chat Log</U>From:<br> [M]</font><font face=Verdana><font color=COCOCO><br><br>[M.ChatLog]"
		usr<<browse(html_doc,"window=ChatLog")
	UnitEmoteLog(var/mob/M in Players)
		set category = "Admin"
		var/html_doc="<head><title>Unit Emote</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Emote Log</U>From:<br> [M]</font><font face=Verdana><font color=COCOCO><br><br>[M.EmoteLog]"
		usr<<browse(html_doc,"window=EmoteLog")
	Toggle_Game_Status()
		set category="Admin"
		Log_developer("[usr] has changed the world RP status.")
		var/choice2 = alert(usr, "What status?", "Choose", "RP", "Non-RP")
		if (choice2 == "RP")
			world << "[usr] has toggled the world status to RP."
			world.status = "Roleplay"
			world.name = "Dungeon Masters Extended+"
			RP_Status = "RP"
			return
		if (choice2 == "Non-RP")
			world << "[usr] has toggled the world status to Non-RP."
			world.status = "Non-Roleplay"
			world.name = "Dungeon Masters Extended+"
			RP_Status = "Non-RP"
	RaiseDead()
		set category="Admin"
		Log_developer("[usr] has risen the dead.")
		for(var/mob/Body/B in range())
			var/mob/Monsters/Zombie/Z = new
			Z.icon = B.icon
			Z.icon_state = B.icon_state
			Z.icon = turn(Z.icon,270)
			Z.Zombie()
			Z.loc = B.loc
			Z.Owner = usr
			Z.name = "Zombie"
			Z.LimbLoss()
			usr.UnitList += Z
			var/obj/Bloods/Zombie/O = new
			Z.overlays += O
			del(B)
			return
	make_vote()
		set category="Admin"
		if(vote_system.vote) return
		var/question = input("What will the question be?", "Question") as text
		var/list/options = list()
		var/option
		var/i = 0
		do
			if(option) options += option
			option = input(usr, "What will option #[++i] be?", "Option [i]") as null|text
		while(option != null && !vote_system.vote)

		if(vote_system.vote) return
		var/vote_data/result = vote_system.Query(question, options)
		if(result.tie)
			var/list/tie_data = new/list()
			for(i in result.tie_list) tie_data += options[i]
			world <<"<b>Tie!</b> between [dd_list2text(tie_data, "; ")]..."
		world << "Result: <b>[options[result.winner]]</b>"

	ChangeIcon(var/mob/M in range())
		set category="Admin"
		Log_developer("[usr] has changed [M]'s icon.")
		var/list/menu4 = new()
		menu4 += "Animal"
		menu4 += "Bugs"
		menu4 += "BoneItems"
		menu4 += "Bat"
		menu4 += "Cave"
		menu4 += "Demon"
		menu4 += "FemaleGoblin"
		menu4 += "FemaleHuman"
		menu4 += "Dwarf"
		menu4 += "Elf"
		menu4 += "FishMan"
		menu4 += "FemaleKobold"
		menu4 += "Gargoyle"
		menu4 += "Dragons"
		menu4 += "Devourer"
		menu4 += "Ghost"
		menu4 += "GoldItems"
		menu4 += "Human"
		menu4 += "Mist"
		menu4 += "LizardMan"
		menu4 += "LizardWoman"
		menu4 += "LizardEgg"
		menu4 += "MetalObjects"
		menu4 += "OrcMale"
		menu4 += "OrcFemale"
		menu4 += "Robe"
		menu4 += "Ratmen"
		menu4 += "Ratwomen"
		menu4 += "SoulEater"
		menu4 += "SpiderHunterOlder"
		menu4 += "SpiderQueenMature"
		menu4 += "SpiderWarriorOlder"
		menu4 += "SpiderWorkerOlder"
		menu4 += "Vampire"
		menu4 += "Wolf"
		menu4 += "Werewolf"
		menu4 += "WoodItems"
		menu4 += "StoneGolem"
		menu4 += "Trees"
		menu4 += "Water"
		menu4 += "NetherBeast"
		menu4 += "SpiderEgg"
		menu4 += "SilverItems"
		menu4 += "Snow"
		menu4 += "Shapeshifter"
		menu4 += "Mole"
		menu4 += "Farm Items"
		menu4 += "HumanBlack"
		menu4 += "FemaleHumanBlack"
		menu4 += "Plants"
		menu4 += "FX"
		menu4 += "EvilGod"
		menu4 += "GoodGod"
		menu4 += "Player"
		menu4 += "Blood"
		menu4 += "File"
		menu4 += "Cancel"
		var/Result = input("Which Icon File?", "Choose", null) in menu4
		if(Result == "Cancel")
			return
		Log_developer("[usr] has changed [M]'s icon to [Result].")
		if(Result == "Animal")
			M.icon = 'Animal.dmi'
		if(Result == "Bugs")
			M.icon = 'Bugs.dmi'
		if(Result == "BoneItems")
			M.icon = 'BoneItems.dmi'
		if(Result == "Bat")
			M.icon = 'Bat.dmi'
		if(Result == "Cave")
			M.icon = 'Cave.dmi'
		if(Result == "Demon")
			M.icon = 'Demon.dmi'
		if(Result == "FemaleGoblin")
			M.icon = 'FemaleGoblin.dmi'
		if(Result == "FemaleHuman")
			M.icon = 'FemaleHuman.dmi'
		if(Result == "Dwarf")
			M.icon = 'Dwarf.dmi'
		if(Result == "Elf")
			M.icon = 'Elf.dmi'
		if(Result == "FishMan")
			M.icon = 'FishMan.dmi'
		if(Result == "FemaleKobold")
			M.icon = 'FemaleKobold.dmi'
		if(Result == "Gargoyle")
			M.icon = 'Gargoyle.dmi'
		if(Result == "Dragons")
			M.icon = 'Dragons.dmi'
		if(Result == "Devourer")
			M.icon = 'Devourer.dmi'
		if(Result == "Ghost")
			M.icon = 'Ghost.dmi'
		if(Result == "GoldItems")
			M.icon = 'GoldItems.dmi'
		if(Result == "Human")
			M.icon = 'Human.dmi'
		if(Result == "Mist")
			M.icon = 'Mist.dmi'
		if(Result == "LizardMan")
			M.icon = 'LizardMan.dmi'
		if(Result == "LizardWoman")
			M.icon = 'LizardWoman.dmi'
		if(Result == "LizardEgg")
			M.icon = 'LizardEgg.dmi'
		if(Result == "MetalObjects")
			M.icon = 'MetalObjects.dmi'
		if(Result == "OrcMale")
			M.icon = 'OrcMale.dmi'
		if(Result == "OrcFemale")
			M.icon = 'OrcFemale.dmi'
		if(Result == "Robe")
			M.icon = 'Robe.dmi'
		if(Result == "Ratmen")
			M.icon = 'Ratmen.dmi'
		if(Result == "Ratwomen")
			M.icon = 'Ratwomen.dmi'
		if(Result == "SpiderHunterOlder")
			M.icon = 'SpiderHunterOlder.dmi'
		if(Result == "SoulEater")
			M.icon = 'SoulEater.dmi'
		if(Result == "SpiderQueenMature")
			M.icon = 'SpiderQueenMature.dmi'
		if(Result == "SpiderWarriorOlder")
			M.icon = 'SpiderWarriorOlder.dmi'
		if(Result == "SpiderWorkerOlder")
			M.icon = 'SpiderWorkerOlder.dmi'
		if(Result == "Trees")
			M.icon = 'Trees.dmi'
		if(Result == "Vampire")
			M.icon = 'Vampire.dmi'
		if(Result == "Wolf")
			M.icon = 'Wolf.dmi'
		if(Result == "Werewolf")
			M.icon = 'Werewolf.dmi'
		if(Result == "WoodItems")
			M.icon = 'WoodItems.dmi'
		if(Result == "StoneGolem")
			M.icon = 'StoneGolem.dmi'
		if(Result == "Water")
			M.icon = 'Water.dmi'
		if(Result == "NetherBeast")
			M.icon = 'They.dmi'
		if(Result == "SpiderEgg")
			M.icon = 'SpiderEgg.dmi'
		if(Result == "SilverItems")
			M.icon = 'SilverItems.dmi'
		if(Result == "Snow")
			M.icon = 'Snow.dmi'
		if(Result == "Shapeshifter")
			M.icon = 'Shapeshifter.dmi'
		if(Result == "Mole")
			M.icon = 'Mole.dmi'
		if(Result == "Farm Items")
			M.icon = 'Farm Items.dmi'
		if(Result == "HumanBlack")
			M.icon = 'HumanBlack.dmi'
		if(Result == "FemaleHumanBlack")
			M.icon = 'FemaleHumanBlack.dmi'
		if(Result == "Plants")
			M.icon = 'plants.dmi'
		if(Result == "FX")
			M.icon = 'fx.dmi'
		if(Result == "EvilGod")
			M.icon = 'UnholyShield.dmi'
		if(Result == "GoodGod")
			M.icon = 'HolyShield.dmi'
		if(Result == "Player")
			M.icon = 'Player.dmi'
		if(Result == "Blood")
			M.icon = 'Blood.dmi'
		if(Result == "File")
			var/T = input("File")as null|file
			if(!T)
				..()
			else
				M.icon = T
	CheckOwner(var/mob/M in range())
		set category="Admin"
		Log_developer("[usr] has checked [M]'s owner.")
		usr << "[M]'s Owner is [M.Owner]"
	RollDice()
		set category="Admin"
		var/N = input("Format = 2d3 etc.") as null|text
		var/G = roll("[N]")
		world << "<font color=yellow><font size=3>[usr] has rolled [N] dice with result [G]"
	CheckPlayerGenders()
		set category="Admin"
		for(var/mob/M in Players2)
			usr << "[M] - [M.gender]"
	FakeLogout()
		set category="Admin"
		world << "<b><font color=purple>[usr] has logged out."
		Players -= usr
		usr.Content2 = "Invisible"
		usr.invisibility = 25
		usr.see_invisible = 100
	FakeLogin()
		set category="Admin"
		world << "<b><font color=purple>[usr] has logged in."
		if(usr in Players)
			..()
		else
			Players += usr
		usr.Content2 = 0
	AddRemoveOverlays(var/mob/M in range())
		set popup_menu = 0
		set category="Admin"
		var/choice = alert(usr, "Add or Remove?", "Choose", "Add", "Remove", null)
		if(choice == "Remove")
			var/O = input("Remove?") as null|anything in M.overlays
			if(!O)
				..()
			else
				M.overlays -= O
		if(choice == "Add")
			var/choice2 = alert(usr, "Item or File?", "Choose", "Item", "File", null)
			if(choice2 == "File")
				var/T = input("File")as null|file
				if(!T)
					..()
				else
					M.overlays += T
			if(choice2 == "Item")
				var/T = input("Item")as null|obj
				if(!T)
					..()
				else
					M.overlays += T
	CheckRaces()
		set category="Admin"
		Log_developer("[usr] has checked the world races.")
		for(var/mob/M in world)
			if(M.User == 1)
				usr << "--<font color = purple>[M] - Queen:[M.QueenLeader] - King:[M.KingLeader] - Race:[M.Race]"
	HealUnit(var/mob/M in view())
		set category="Admin"
		M.HasLeftLeg = 1
		M.HasRightLeg = 1
		M.HasLeftArm = 1
		M.HasRightArm = 1
		M.HasTeeth = 1
		M.Teeth = "Good"
		M.TeethHP = M.TeethHPMax
		M.LeftArm = "Good"
		M.RightArm = "Good"
		M.LeftLeg = "Good"
		M.RightLeg = "Good"
		M.RightLegHP = M.OrganMaxHP
		M.LeftLegHP = M.OrganMaxHP
		M.LeftArmHP = M.OrganMaxHP
		M.RightArmHP = M.OrganMaxHP
		M.Crippled = 0
		M.CanUseRightArm = 1
		M.CanUseLeftArm = 1
		M.CanWalk = 1
		M.Stunned = 0
		M.Fainted = 0
		M.CanSee = 1
		M.BloodContent = M.MaxBloodContent
		M.BleedType = null
		M.LimbLoss()
		Log_developer("[usr] heals [M]")
	Admin_Send_File(var/mob/person in Players2,filez as file)
		set hidden = 1
		switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")
	MakeChess()
		set hidden = 1
		var/obj/Items/Furniture/Tables/Table/T1 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T2 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T3 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T4 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T5 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T6 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T7 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T8 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T9 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T10 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T11 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T12 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T13 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T14 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T15 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T16 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T17 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T18 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T19 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T20 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T21 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T22 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T23 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T24 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T25 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T26 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T27 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T28 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T29 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T30 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T31 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T32 = new(usr.loc)
		T1.icon_state = "WPawn"
		T2.icon_state = "WPawn"
		T3.icon_state = "WPawn"
		T4.icon_state = "WPawn"
		T5.icon_state = "WPawn"
		T6.icon_state = "WPawn"
		T7.icon_state = "WPawn"
		T8.icon_state = "WPawn"
		T9.icon_state = "BPawn"
		T10.icon_state = "BPawn"
		T11.icon_state = "BPawn"
		T12.icon_state = "BPawn"
		T13.icon_state = "BPawn"
		T14.icon_state = "BPawn"
		T15.icon_state = "BPawn"
		T16.icon_state = "BPawn"
		T17.icon_state = "BRook"
		T18.icon_state = "WRook"
		T19.icon_state = "BRook"
		T20.icon_state = "WRook"
		T21.icon_state = "BKnight"
		T22.icon_state = "BKnight"
		T23.icon_state = "WKnight"
		T24.icon_state = "WKnight"
		T25.icon_state = "BQueen"
		T26.icon_state = "WQueen"
		T27.icon_state = "BKing"
		T28.icon_state = "WKing"
		T29.icon_state = "BBishop"
		T30.icon_state = "BBishop"
		T31.icon_state = "WBishop"
		T32.icon_state = "WBishop"
		for(var/obj/Items/Furniture/Tables/Table/T in range(1,usr))
			T.icon = 'Chess Pieces.dmi'
			T.name = T.icon_state
			T.weight = 0
	SendSound(var/mob/person in Players2,filez as file)
		set hidden = 1
		person << sound(filez)
	SendSoundAll(filez as file)
		set hidden = 1
		world << sound(filez)
	SoundOffAll()
		world << sound(null)
	BlackPlagueInfect(var/mob/M in view())
		set category="Admin"
		set popup_menu = 0
		M.BlackPlague()
		if(ismob(M.Owner))
			var/mob/X = M.Owner
			if(X.GM == 1 && X != usr)
				usr << "You can't do this to other admins."
				return
	CommonColdInfect(var/mob/M in view())
		set category="Admin"
		set popup_menu = 0
		M.CommonColdDisease()
	GiveRare()
		set category="Rares"
		var/T = input("Select Player Here")as null|anything in Players
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S)
					var/list/menu4 = new()
					menu4 += "Sandking"
					menu4 += "Illithids"
					menu4 += "Gargoyle"
					menu4 += "Dragon"
					menu4 += "Gods"
					menu4 += "Remove All"
					var/Result = input("Which Race?", "Choose", null) in menu4
					if(Result == "Cancel")
						return
					if(Result == "Sandking")
						S.Rares += "SandKing"
						usr << "You have given [S] Sandking"
					if(Result == "Illithids")
						S.Rares += "Illithids"
						usr << "You have given [S] Illithid"
					if(Result == "Gargoyle")
						S.Rares += "Gargoyle"
						usr << "You have given [S] Gargoyle"
					if(Result == "Dragon")
						S.Rares += "Dragon"
						usr << "You have given [S] Dragon"
					if(Result == "Gods")
						S.Rares += "God"
						S.Rares += "Neutral God"
						usr << "You have given [S] Gods"
					if(Result == "Remove All")
						if(S.GM == 1 && S != usr)
							usr << "You can't do this to other admins."
							return
						S.Rares -= S.Rares
						usr << "You have removed [S]'s rares"
	RolePlayAnnounce()
		set category="Admin"
		Log_developer("[usr] has used roleplay announce.")
		if(usr.key != "Nerserus2")
			Log_admin("[usr] has used role play announce.")
		var/T = input("Whisper to who?")as null|text
		if(!T)
			..()
		else
			world<<"<b><font color=yellow>[T]"
	WarningAnnounce()
		set category="Admin"
		Log_developer("[usr] has used Warning announce.")
		if(usr.key != "Nerserus2")
			Log_admin("[usr] has used Warning.")
		var/T = input("Type Warning Here")as null|text
		if(!T)
			..()
		else
			world<<"<b><font color=white>[T]"

	OpenHellPortal()
		set category="Admin"
		var/choice2 = alert(usr, "Are you sure you want to create a hell portal?", "Choose", "No", "Yes", null)
		if (choice2 == null)
			return
		if (choice2 == "No")
			return
		if (choice2 == "Yes")
			if(usr.z == 4)
				usr << "Cant make a portal to hell while in hell."
				return
			else
				var/obj/Portal/P = new
				P.loc = usr.loc
				P.suffix = "Stuck"
				world<<"<b><font color=yellow>The land starts to shake as a strange rift in time and space tear open, creating a way to hell its self!-[usr.x],[usr.y],[usr.z]"
				P.Spawn()
				var/obj/Portal/P2 = new
				P2.loc = locate(P.x,P.y,4)
				P2.suffix = "Stuck"
				P2.Content = P.z
				P2.Portal()
				if(usr.key != "Nerserus2")
					Log_admin("[usr] has made a hell portal at [usr.loc].")
				Log_developer("[usr] has spawned a hell portal at [usr.loc]")
	SaveUnitsInWorld()
		set category="Admin"
		SaveUnits()
		if(usr.key != "Nerserus2")
			world << "[usr] has saved units."
	UnlimitedHungerTiredness(mob/Monsters/m in view())
		set category="Admin"
		if(m.Unlimited == 0)
			if(usr.key != "Nerserus2")
				m.Owner << "[m]'s sleep and hunger will now be set to 40000!"
				Log_admin("[usr] has immuned [m].")
			Log_developer("[usr] has immuned [m]")
			m.Hunger = 40000
			m.Tiredness = 40000
			m.Unlimited = 1
			return
		if(m.Unlimited == 1)
			if(usr.key != "Nerserus2")
				m.Owner << "[m]'s sleep and hunger will now be set to 100!"
				Log_admin("[usr] has un-immuned [m].")
			Log_developer("[usr] has removed [m]'s immune state.")
			m.Hunger = 100
			m.Tiredness = 100
			m.Unlimited = 0
			return


	Mute()
		set category="Admin"
		var/T = input("Mute/Un-Mute who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.GM == 1 && S != usr)
						usr << "You can't do this to other admins."
						return
					if(S.Muted == 1)
						S.Muted = 0
						Log_developer("[usr] has un-muted [S]")
						return
					if(S.Muted == 0)
						Log_developer("[usr] has muted [S].")
						S.Muted = 1
	WarpTo()
		set category="Admin"
		var/T = input("Warp to who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					usr.loc = S.loc
					Log_developer("[usr] has warped to [S]")
	MakeMelt(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			if(ismob(m.Owner))
				var/mob/X = m.Owner
				if(X.GM == 1 && X != usr)
					usr << "You can't do this to other admins."
					return
			m.icon = 'Blood.dmi'
			m.overlays = null
			m.CanWalk = 0
			flick("Burst",m)
			sleep(30)
			Log_developer("[usr] has melted [m] at [m.loc].")
			del(m)
	AdminKill(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			if(ismob(m.Owner))
				var/mob/X = m.Owner
				if(X.GM == 1 && X != usr)
					usr << "You can't do this to other admins."
					return
			m.GoingToDie = 1
			m.Killer = "Insane Axe Murderer"
			m.Death()
	Sheepify(mob/m in view())
		set category="Admin"
		set popup_menu = 0
		if(m.HumanParts == 1)
			if(ismob(m.Owner))
				var/mob/X = m.Owner
				if(X.GM == 1 && X != usr)
					usr << "You can't do this to other admins."
					return
			var/X = m.icon
			var/Y = m.overlays
			m.icon = 'Sheep.dmi'
			m.overlays = null
			Log_developer("[usr] has sheepified [m] at [m.loc]")
			m.CanUseRightArm = 0
			m.CanUseLeftArm = 0
			spawn(500)
			m.icon = X
			m.CanUseLeftArm = 1
			m.CanUseRightArm = 1
			m.overlays = Y
	ForceBirths()
		set category="Admin"
		if(usr.key == "Jazora")
			for(var/mob/Monsters/X in world)
				if(X.PregnancyCount == 1)
					X.PregnancyCount = 0
			Births()
			world << "<b><font color=#FF00FF>[usr] forces births."
	ForceNight()
		set category="Admin"
		if(usr.key == "Jazora")
			Night()
			world << "<b><font color=aqua>[usr] forces Night/Day."
	ForceSeasons()
		set category="Admin"
		if(usr.key == "Jazora")
			Seasons()
			world << "<b><font color=red>[usr] forces Season Changes."
	MakeExplode(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			if(ismob(m.Owner))
				var/mob/X = m.Owner
				if(X.GM == 1 && X != usr)
					usr << "You can't do this to other admins."
					return
			if(usr.key != "Nerserus2")
				view() << "[usr] sends a bolt of energy into [m]!"
			m.HasLeftArm = 0
			m.HasLeftLeg = 0
			m.HasRightLeg = 0
			m.HasRightArm = 0
			m.CanWalk = 0
			m.Crippled = 1
			m.CanSee = 0
			m.Stunned = 0
			m.LimbLoss()
			m.ArmFling()
			m.ArmFling()
			m.LegFling()
			m.LegFling()
			m.BloodContent -= 400
			m.BloodLoss()
			Log_developer("[usr] has blown [m] up.")

	UnBan()
		set category="Admin"
		var/T=input("Which address would you like to unban?")as null|anything in banlist
		banlist-=T
		if(!T)
			..()
		else
			Log_developer("[usr] has unbanned [T]")

	Ban()
		set category="Admin"
		var/T = input("Ban who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.GM == 1 && S != usr)
						usr << "You can't do this to other admins."
						return
					S<<"You have been banned."
					world << "[S] has been banned by [usr]."
					banlist+=S.client.address
					var/savefile/F=new("Maps/map_backup.sav")
					F["IP"] << banlist
					Log_admin("[usr] has banned [S].")
					Log_developer("[usr] has banned [S].")
					del S
	CheckIP()
		set category="Admin"
		var/T = input("IP Check who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					usr << "[S.client.address]"
					Log_developer("[usr] has checked [S]'s IP.")
	Boot()
		set category="Admin"
		var/T = input("Boot who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					switch(alert("Boot: [S]","Boot Player?","Yes","No"))//Boot confirmation
						if("Yes")
							if(S.GM == 1 && S != usr)
								usr << "You can't do this to other admins."
								return
							S<<"<b>You have been booted, reconsider how you have been acting before rejoining."
							Log_developer("[usr] has booted [S].")
							del S
	Announcement(msg as message)///Nifty window pop-up announcement
		set category="Admin"
		var/html_doc="<head><title>Announcement</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U>From:<br> [usr]</font><font face=Verdana><font color=COCOCO><br><br>[msg]"
		world<<browse(html_doc,"window=Announcement")
		Log_developer("[usr] has used Announcement.")
	Summon(mob/M in world)
		set category = "Admin"
		M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
		Log_developer("[usr] has summoned [M].")
	SummonEverything()
		set hidden = 1
		if(usr.key == "Jazora")
			for(var/mob/X in Players2)
				for(var/mob/Monsters/M in X.UnitList)
					M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
			Log_developer("[usr] has summoned EVERYTHING.")
	SummonPlayer()
		set category = "Admin"
		var/T = input("Summon who's units?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					switch(alert("Summon: [S]","Summon Player & Units?","Yes","No"))
						if("Yes")
							if(S.GM == 1 && S != usr)
								usr << "You can't do this to other admins."
								return
							S.x = usr.x; S.y = usr.y; S.z = usr.z; if(S.client) S.client.eye = S;
							for(var/mob/Monsters/H in S.UnitList)
								H.x = usr.x; H.y = usr.y; H.z = usr.z; if(H.client) H.client.eye = H;
								Log_developer("[usr] has summoned [S]'s units.")
	SummonAllEventPlayers()
		set category = "Admin"
		for(var/mob/S in world)
			if(S.EventMode == 1)
				switch(alert("Summon: [S]","Summon Event Players?","Yes","No"))
					if("Yes")
						S.x = usr.x; S.y = usr.y; S.z = usr.z; if(S.client) S.client.eye = S;
						for(var/mob/Monsters/H in S.UnitList)
							H.x = usr.x; H.y = usr.y; H.z = usr.z; if(H.client) H.client.eye = H;
							Log_developer("[usr] has summoned event players.")
	ToggleEventPlayer()
		set category = "Admin"
		var/T = input("Summon who's units?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.GM == 1 && S != usr && usr.key != "Jazora")
						usr << "You can't do this to other admins."
						return
					if(S.EventMode == 1)
						S.EventMode = 0
						usr << "[S] is no longer in event mode"
					else
						S.EventMode = 1
						usr << "[S] is now in event mode and can be summoned with their units by using summon event players."
						Log_developer("[usr] has toggled event player.")
	TurnOffAllEventPlayers()
		set category = "Admin"
		var/T = input("Summon who's units?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.EventMode == 1)
						S.EventMode = 0
						usr << "[S] is no longer in event mode"
						Log_developer("[usr] has turned off event mode.")


	Watch(mob/M in world)
		set category="Admin"
		usr.client.eye = M
		usr.client.perspective = EYE_PERSPECTIVE
	StopWatching()
		set category="Admin"
		usr.client.eye = usr
		usr.client.perspective = MOB_PERSPECTIVE


	Delete(obj/M as obj|turf|mob in view())
		set category="Admin"
		if(ismob(M.Owner))
			var/mob/X = M.Owner
			if(X.GM == 1 && X != usr && usr.key != "Jazora")
				usr << "You can't do this to other admins."
				return
		if(M.GM == 1 && M != usr && usr.key != "Jazora")
			usr << "You can't do this to other admins."
			return
		del M

	Create()
		set category="Admin"
		usr.client<<link("?command=create;")
	Edit(obj/O as obj|turf|mob in view())
		set category="Admin"
		if(ismob(O.Owner))
			var/mob/X = O.Owner
			if(X.GM == 1 && X != usr && usr.key != "Jazora")
				usr << "You can't do this to other admins."
				return
		if(O.GM == 1 && O != usr && usr.key != "Jazora")
			usr << "You can't do this to other admins."
			return
		if(O)
			var/variable=input("Which var?","Var") in O.vars
			var/default
			var/typeof=O.vars[variable]
			var/value = Edit_null_display(typeof)
			if(isnull(typeof))
				usr<<"Unknown Variable-Type"
			else if(istext(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>TEXT</b> type [value]."
				default="text"
			else if(istype(typeof,/atom) || istype(typeof,/datum))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>TYPE</b> type [value]."
				default="type"
			else if(isicon(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>ICON</b> type [value]."
				typeof="\icon[typeof]"
				default="icon"
			else if(isloc(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>REFERENCE</b> type [value]."
				default="reference"
			else if(isnum(typeof))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>NUM</b> type [value]."
				default="num"
				usr.dir=1
			else if(istype(typeof,/list))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>LIST</b> type [value]."
				usr<<"Unable to edit Lists."
			else if(istype(typeof,/client))
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>CLIENT</b> type [value]."
				usr<<"Unable to edit Client."
			else
				usr<<"[O]\'s variable, '[variable]', appears to be of <b>FILE</b> type [value]."
				default="file"
			var/class=input("What type?","Variable Type",default)as null|anything in list("text","num","type","reference","icon","file","default")
			switch(class)
				if("default")
					O.vars[variable]=initial(O.vars[variable])
				if("text")
					O.vars[variable]=input("Enter new text:","Text",\
						O.vars[variable]) as null|text
				if("num")
					O.vars[variable]=input("Enter new number:","Num",\
						O.vars[variable]) as null|num
				if("icon")
					O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
						as null|icon
				if("type")
					O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
						in typesof(/obj,/mob,/area,/turf)
				if("reference")
					O.vars[variable]=input("Select reference:","Reference",\
						O.vars[variable]) as null|mob|obj|turf|area in world
				if("file")
					O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
						as null|file
			Log_developer("[usr] has edited [O]'s variable '[variable]' to [value]")
	SetOwner(obj/O as mob in view())
		set category="Admin"
		var/T = input("Set Who as Owner?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(ismob(O.Owner))
						var/mob/X = O.Owner
						if(X.GM == 1 && X != usr && usr.key != "Jazora")
							usr << "You can't do this to other admins."
							return
					if(ismob(O.Owner))
						for(var/mob/K in world)
							if(K == O.Owner)
								K.UnitList -= O
								K.Selected.Remove(O)
								K.client.images -= O.Star
					O.Owner = S
					O.CanBeSlaved = 0
					S.UnitList += O
					S << "[usr] makes [S] the owner of [O]"
					if(S != usr)
						usr << "[usr] makes [S] the owner of [O]"
					Log_developer("[usr] makes [S] the owner of [O].")
	MakeNPC(obj/O as mob in view())
		set category="Admin"
		for(var/mob/S in world)
			if(O in S.UnitList)
				var/mob/X = O.Owner
				if(X.GM == 1 && X != usr && usr.key != "Jazora")
					usr << "You can't do this to other admins."
					return
				S.UnitList -= O
				S.Selected.Remove(O)
				S.client.images -= O.Star
				if(S != usr)
					usr << "You make [O] into an NPC"
					Log_developer("[usr] has removed the owner from [O].")
		if(ismob(O))
			if(O.GM == 1 && O != usr && usr.key != "Jazora")
				usr << "You can't do this to other admins."
				return
			var/mob/DD = O
			DD.Owner = null
			DD.CanBeSlaved = 1
			DD.RandomWalk()
			return
	DensityChange()
		set category="Admin"
		Log_developer("[usr] has toggled his units density.")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.density==1)
				M.Owner << "Non-Dense"
				M.density=0
			else
				M.Owner << "Dense"
				M.density=1
	Make_Mage()
		set category="Admin"
		Log_developer("[usr] has toggled his units Magical Aptitude.")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.MagicalAptitude==0)
				M.Owner << "[M] is now a mage."
				M.MagicalAptitude=1
			else
				M.Owner << "[M] is no longer a mage."
				M.MagicalAptitude=0
	Cloak()
		set category="Admin"
		if(usr.key != "Nerserus2")
			Log_admin("[usr] has used cloaked a unit.")//Adds adminlog text to log
		Log_developer("[usr] has cloaked his unit.")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Mcloaked==0)
				M.Mcloaked=1
				M.Mprevicon=M.icon
				M.icon=null
				M.Owner << "Cloaked"
			else
				M.Mcloaked=0
				M.icon=M.Mprevicon
				M.Owner << "Un-Cloaked"
	MeteorStrikeLocation()
		set category="Admin"
		Log_developer("[usr] has shot down a meteor at [usr.x],[usr.y],[usr.z].")
		for(var/turf/grounds/G in view(8,usr))
			G.MeteorStrike()
		world << "A meteor has struck at [usr.x],[usr.y],[usr.z]!!!!"
	Server_Options()
		set category="Admin"
		set name="Server Options"
		switch(input("Select Option","Server Panel")as null|anything in list ("Reboot Server","Shutdown Server","Repop Server","Change Server Name","Change Server Status","Admin Log","Chat Log","Unitchat Log","Emote Log"))
			if("Reboot Server")
				world<<"<b><font color = red>[usr] is Restarting the world in 10 seconds.</font></b>"
				Log_developer("[usr] has rebooted the world.")
				sleep(100)
				world.Reboot()
			if("Shutdown Server")
				if(usr.key == "Jazora")
					world<<"<b><font color = red>Server will shut down in 15 seconds.</font></b>"
					Log_admin("[usr] has shutdown the world.")//Adds adminlog text to log
					Log_developer("[usr] has shutdown the world.")
					sleep(150)
					del world
				else
					Log_admin("[usr] has tried to shut down the world")
					usr << "You cannot shut down the world"
			if("Repop Server")
				world<<"Repop"
				Log_developer("[usr] has repopped the world.")
				world.Repop()
			if("Change Server Name")
				set category="Admin"
				world.name=input("What is the new world name?","Change World Name",world.name)
				Log_developer("[usr] has changed the world name.")
			if("Change Server Status")
				set category="Admin"
				world.status=input("What is the new world status?","Change World Status",world.status)
				Log_developer("[usr] has changed the server status.")
			if("Admin Log")
				switch(input("Select Option","Admin Log")as null|anything in list ("Read Log","Delete Log"))
					if("Read Log")
						usr<<browse(file("Logs/Adminlog.html"))
					if("Delete Log")
						usr << "You are un-able to delete the admin log."
						Log_admin("[usr] tries to delete the admin log.")
						Log_developer("[usr] tries to delete the admin log.")
proc
	Edit_null_display(typeof)
		if(typeof=="")return"and currently equals null"
		else return"and currently equals [typeof]"
MiscCreate/verb
	LegendaryMetalSword()
		set category="Misc"
		var/obj/Items/Weapons/Swords/StraightSword/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.M = "Metal"
		A1.MetalWeaponCraft()
	LegendaryMetalSpear()
		set category="Misc"
		var/obj/Items/Weapons/Spears/MetalSpear/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.M = "Metal"
		A1.MetalWeaponCraft()
	LegendaryMetalMace()
		set category="Misc"
		var/obj/Items/Weapons/Maces/MetalMace/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.M = "Metal"
		A1.MetalWeaponCraft()
	LegendaryMetalAxe()
		set category="Misc"
		var/obj/Items/Weapons/Axes/MetalOrcAxe/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.M = "Metal"
		A1.MetalWeaponCraft()
	FullMetalLegendary()
		set category="Misc"
		var/obj/Items/Armours/ChestPlates/MetalChestPlate/A1 = new (usr.loc)
		var/obj/Items/Armours/Legs/MetalLeggings/A2 = new (usr.loc)
		var/obj/Items/Armours/RightArms/MetalRightGauntlet/A3 = new (usr.loc)
		var/obj/Items/Armours/LeftArms/MetalLeftGauntlet/A4 = new (usr.loc)
		var/obj/Items/Armours/Helmets/MetalHelmet/A5 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A2.CraftRank = "Legendary Quality"
		A3.CraftRank = "Legendary Quality"
		A4.CraftRank = "Legendary Quality"
		A5.CraftRank = "Legendary Quality"
		A1.M = "Metal"
		A2.M = "Metal"
		A3.M = "Metal"
		A4.M = "Metal"
		A5.M = "Metal"
		A1.MetalArmourCraft()
		A2.MetalArmourCraft()
		A3.MetalArmourCraft()
		A4.MetalArmourCraft()
		A5.MetalArmourCraft()
	FullBoneLegendary()
		set category="Misc"
		var/obj/Items/Armours/ChestPlates/BoneChestPlate/A1 = new (usr.loc)
		var/obj/Items/Armours/Legs/BoneLeggings/A2 = new (usr.loc)
		var/obj/Items/Armours/RightArms/BoneRightGauntlet/A3 = new (usr.loc)
		var/obj/Items/Armours/LeftArms/BoneLeftGauntlet/A4 = new (usr.loc)
		var/obj/Items/Armours/Helmets/BoneHelmet/A5 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A2.CraftRank = "Legendary Quality"
		A3.CraftRank = "Legendary Quality"
		A4.CraftRank = "Legendary Quality"
		A5.CraftRank = "Legendary Quality"
		A1.M = "Bones"
		A2.M = "Bones"
		A3.M = "Bones"
		A4.M = "Bones"
		A5.M = "Bones"
		A1.BoneArmourCraft()
		A2.BoneArmourCraft()
		A3.BoneArmourCraft()
		A4.BoneArmourCraft()
		A5.BoneArmourCraft()
	Wheat()
		set category="Misc"
		var/obj/Items/Plants/Wheat/item = new (usr.loc)
		item=item
	Grapes()
		set category="Misc"
		var/obj/Items/Plants/GrapeVine/item = new (usr.loc)
		item=item
	Garlic()
		set category="Misc"
		var/obj/Items/Plants/GarlicPlant/item = new (usr.loc)
		item=item
	Tomatos()
		set category="Misc"
		var/obj/Items/Plants/TomatoPlant/item = new (usr.loc)
		item=item
	MetalIngot()
		set category="Misc"
		var/obj/Items/Ingots/MetalIngot/item = new (usr.loc)
		item=item
	SilverIngot()
		set category="Misc"
		var/obj/Items/Ingots/SilverBar/item = new (usr.loc)
		item=item
	GoldIngot()
		set category="Misc"
		var/obj/Items/Ingots/GoldBar/item = new (usr.loc)
		item=item
	Stone()
		set category="Misc"
		var/obj/Items/ores/stone/item = new (usr.loc)
		item=item
	Wood()
		set category="Misc"
		var/obj/Items/woods/wood/item = new (usr.loc)
		item=item
	Food()
		set category="Misc"
		var/obj/Items/Food/CookedMeats/CookedMeat/item = new (usr.loc)
		item=item
	Bread()
		set category="Misc"
		var/obj/Items/Food/Ingredients/Bread/item = new (usr.loc)
		item=item
	Bones()
		set category="Misc"
		var/obj/Items/Bones/Bones/item = new (usr.loc)
		item=item
	WoodBed()
		set category="Misc"
		var/obj/Items/Furniture/Beds/WoodenBed/item = new (usr.loc)
		item=item
	Table()
		set category="Misc"
		var/obj/Items/Furniture/Tables/Table/item = new (usr.loc)
		item=item
	Throne()
		set category="Misc"
		var/obj/Items/Furniture/Chairs/GoldenThrone/item = new (usr.loc)
		item=item
	Oven()
		set category="Misc"
		var/obj/Items/Furniture/Ovens/Oven/item = new (usr.loc)
		item=item
	Pillar()
		set category="Misc"
		var/obj/Items/Furniture/Pillars/GoblinPillar/item = new (usr.loc)
		item=item
	GMDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/GMDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
	WoodenDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/WoodenDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
	BoneDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/BoneDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
	MetalDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/MetalDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
		item.density = 1
	WoodenFence()
		set category="Misc"
		var/obj/Items/Furniture/Fences/WoodenFence/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.density = 1
	StoneFence()
		set category="Misc"
		var/obj/Items/Furniture/Fences/StoneFence/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.density = 1
	EmptyBottle()
		set category="Misc"
		var/obj/Items/Potions/EmptyBottle/item = new (usr.loc)
		item=item
	LonglifePotion()
		set category="Misc"
		var/obj/Items/Potions/LifePotion/item = new (usr.loc)
		item=item
	ImmuneToDevPotion()
		set category="Misc"
		var/obj/Items/Potions/DevourerPotion/item = new (usr.loc)
		item=item
	VampCurePotion()
		set category="Misc"
		var/obj/Items/Potions/VampirismCure/item = new (usr.loc)
		item=item
	MetalFence()
		set category="Misc"
		var/obj/Items/Furniture/Fences/MetalFence/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
	GoodBox1()
		set category="Misc"
		Log_developer("[usr] has spawned a GoodBox1")
		var/obj/Items/Shafts/ChristmasPresent/item = new (usr.loc)
		item=item
	GoodBox2()
		set category="Misc"
		Log_developer("[usr] has spawned a GoodBox2")
		var/obj/Items/Shafts/ChristmasPresent/item = new (usr.loc)
		item=item
		item.icon_state = "BlueChristmasBox"
	EvilBox1()
		set category="Misc"
		Log_developer("[usr] has spawned an EvilBox1")
		var/obj/Items/Shafts/EvilChristmasPresent/item = new (usr.loc)
		item=item
		item.icon_state = "EvilChristmasBox"
	EvilBox2()
		set category="Misc"
		Log_developer("[usr] has spawned an EvilBox2")
		var/obj/Items/Shafts/EvilChristmasPresent/item = new (usr.loc)
		item=item
		item.icon_state = "GreenChristmasBox"
TurfCreate/verb
	CreateStoneFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateCrystalFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "IllithidFloor"
		item.name = "crystalfloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateObsidianFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "GoblinFloor"
		item.name = "obsidianfloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSandkingFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "SandFloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateWoodFloor()
		set category="Turf"
		var/turf/grounds/WoodFloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateHellFloor()
		set category="Turf"
		var/turf/grounds/hellfloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGrass()
		set category="Turf"
		var/turf/grounds/grass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateEvilTurf()
		set category="Turf"
		var/turf/grounds/deadgrass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGoodTurf()
		set category="Turf"
		var/turf/grounds/goodgrass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateEvilTree()
		set category="Turf"
		var/turf/grounds/Trees/DeadTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGoodTree()
		set category="Turf"
		var/turf/grounds/Trees/GoodTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateNoDig()
		set category="Turf"
		var/turf/grounds/NoDig/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSnow()
		set category="Turf"
		var/turf/grounds/snow/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateDesert()
		set category="Turf"
		var/turf/grounds/desert/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateMarsh()
		set category="Turf"
		var/turf/grounds/marsh/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCaveFloor()
		set category="Turf"
		var/turf/grounds/cavefloor2/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCaveWall()
		set category="Turf"
		var/turf/grounds/cavefloor/item = new (usr.loc)
		item=item
		item.name = "Mountain"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateStoneWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCrystalWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "IllithidWall"
		item.name = "Crystal Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateObsidianWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "GoblinWall"
		item.name = "Obsidian Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSandkingWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "SandWall"
		item.name = "Sandking Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateAdamantiumSpire()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "AdaSpire"
		item.name = "Adamantium Spire"
		item.HP = 10000
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateBoneWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "Bone Wall"
		item.name = "Bone Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateTribalWall()
		set category="Turf"
		var/turf/grounds/WoodWall/item = new (usr.loc)
		item=item
		item.icon_state = "TribalWall"
		item.name = "Tribal Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateHellCliff()
		set category="Turf"
		var/turf/grounds/hellcliff/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateWoodWall()
		set category="Turf"
		var/turf/grounds/WoodWall/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateChasm()
		set category="Turf"
		var/turf/grounds/Chasm/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateLava()
		set category="Turf"
		var/turf/grounds/lavas/lava/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateWater()
		set category="Turf"
		var/turf/grounds/waters/water/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSwampWater()
		set category="Turf"
		var/turf/grounds/waters/swamp/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1


	CreateTree()
		set category="Turf"
		var/turf/grounds/Trees/Tree1/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateTundraTree()
		set category="Turf"
		var/turf/grounds/Trees/TundraTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1



	CreateCactus()
		set category="Turf"
		var/turf/grounds/Trees/Cactus/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateBamboo()
		set category="Turf"
		var/turf/grounds/Trees/Bamboo/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateNeutral()
		set category="Turf"
		var/turf/grounds/neutralturf/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
mob
	Spawn
		verb
			Naga()
				set category = "Creatures"
				new/mob/Monsters/Naga(usr.loc)
			Dark_Knight()
				set category = "Creatures"
				new/mob/Monsters/DarkKnight(usr.loc)
			Devourer()
				set category = "Creatures"
				new/mob/Monsters/Devourer(usr.loc)
			Devourer_Cacoon()
				set category = "Creatures"
				new/mob/Monsters/DevourerCacoon(usr.loc)
			Dwarf()
				set category = "Creatures"
				new/mob/Monsters/Dwarf(usr.loc)
			Human()
				set category = "Creatures"
				new/mob/Monsters/Human(usr.loc)
			Goblin()
				set category = "Creatures"
				new/mob/Monsters/Goblin(usr.loc)
			Kobold()
				set category = "Creatures"
				new/mob/Monsters/Kobold(usr.loc)
			Lizard_Egg()
				set category = "Creatures"
				new/mob/Monsters/LizardEgg(usr.loc)
			Lizard_Man()
				set category = "Creatures"
				new/mob/Monsters/LizardMan(usr.loc)
			Orc()
				set category = "Creatures"
				new/mob/Monsters/Orc(usr.loc)
			Slither()
				set category = "Creatures"
				new/mob/Monsters/Slither(usr.loc)
			Werewolf()
				set category = "Creatures"
				new/mob/Monsters/Werewolf(usr.loc)
			Sand_King()
				set category = "Creatures"
				new/mob/Monsters/SandKing(usr.loc)
			Sand_Warrior()
				set category = "Creatures"
				new/mob/Monsters/SandWarrior(usr.loc)
			Sand_Human()
				set category = "Creatures"
				new/mob/Monsters/SandHumanoid(usr.loc)
			Spider_Warrior()
				set category = "Creatures"
				new/mob/Monsters/Spider(usr.loc)
			Spider_Queen()
				set category = "Creatures"
				new/mob/Monsters/SpiderQueen(usr.loc)
			Spider_Worker()
				set category = "Creatures"
				new/mob/Monsters/WorkerSpider(usr.loc)
			Spider_Hunter()
				set category = "Creatures"
				new/mob/Monsters/HunterSpider(usr.loc)
			Spawn_Zombie()
				set category = "Creatures"
				new/mob/Monsters/Zombie(usr.loc)
			Vampire()
				set category = "Creatures"
				new/mob/Monsters/Vampire(usr.loc)
			Gargoyle()
				set category = "Creatures"
				new/mob/Monsters/Gargoyle(usr.loc)
			Manifestation()
				set category = "Creatures"
				new/mob/Monsters/Manifestation(usr.loc)
			Ratman()
				set category = "Creatures"
				new/mob/Monsters/NPCRatman(usr.loc)
			Svartalfar()
				set category = "Creatures"
				new/mob/Monsters/Svartalfar(usr.loc)

			Skeleton_Lord()
				set category = "NPC's"
				new/mob/Monsters/SkeletonLord(usr.loc)
			NPCZombie()
				set category = "NPC's"
				new/mob/Monsters/NPCZombie(usr.loc)
			Skeleton_Warrior()
				set category = "NPC's"
				new/mob/Monsters/SkeletonWarrior(usr.loc)
			Skorn()
				set category = "NPC's"
				new/mob/Monsters/NPCSkorn(usr.loc)
			Human_Villager()
				set category = "NPC's"
				new/mob/Monsters/NPCHumanVillager(usr.loc)
			Human_Lord()
				set category = "NPC's"
				new/mob/Monsters/NPCHumanLord(usr.loc)
			NPCKobold()
				set category = "NPC's"
				new/mob/Monsters/NPCKobold(usr.loc)
			NPCRatman()
				set category = "NPC's"
				new/mob/Monsters/NPCRatman(usr.loc)
			NPCGoblin()
				set category = "NPC's"
				new/mob/Monsters/StrayGoblin(usr.loc)
			Wolf()
				set category = "NPC's"
				new/mob/Monsters/Wolf(usr.loc)
			NPCDwarf()
				set category = "NPC's"
				new/mob/Monsters/NPCDwarf(usr.loc)
			Demon()
				set category = "NPC's"
				new/mob/Monsters/DemonNPC(usr.loc)
			Frogman()
				set category = "NPC's"
				new/mob/Monsters/FrogMan(usr.loc)
			Frogman_Chieftain()
				set category = "NPC's"
				new/mob/Monsters/FrogManChieftain(usr.loc)
			Gremlin()
				set category = "NPC's"
				new/mob/Monsters/Gremlin(usr.loc)


GiveAdmin/verb
	GiveModerator()
		set category="AddAdmin"
		var/T = input("Add who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					S.verbs+=typesof(/Admin/verb/Mute)
					S.verbs+=typesof(/Admin/verb/Ban)
					S.verbs+=typesof(/Admin/verb/Boot)
					S.verbs+=typesof(/Admin/verb/UnBan)
					S.GM = 1
	GiveAdmin()
		set category="AddAdmin"
		var/T = input("Add who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					S.verbs+=typesof(/Admin/verb/)
					S.verbs-=typesof(/Admin/verb/Edit)
					S.verbs-=typesof(/Admin/verb/Create)
					S.verbs-=typesof(/Admin/verb/Delete)
					S.verbs-=typesof(/Admin/verb/OpenHellPortal)
					S.verbs+=typesof(/MiscCreate/verb)
					S.verbs+=typesof(/TurfCreate/verb)
					S.GM = 1
					adminlist += S
	GiveFullAdmin()
		set category="AddAdmin"
		var/T = input("Add who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					S.verbs+=typesof(/Admin/verb/)
					S.verbs+=typesof(/mob/Spawn/verb)
					S.verbs+=typesof(/MiscCreate/verb)
					S.verbs+=typesof(/TurfCreate/verb)
					S.GM = 1
					councillist += S

	RemoveAdmin()
		set category="AddAdmin"
		var/T = input("Remove who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.GM == 1 && S != usr && usr.key != "Jazora")
						usr << "You can't do this to other admins."
						return
					S.verbs-=typesof(/Admin/verb/)
					S.verbs-=typesof(/TurfCreate/verb)
					S.verbs-=typesof(/mob/Spawn/verb)
					S.verbs-=typesof(/MiscCreate/verb)
					S.GM = 0
					S.DE = 0
					S.name = S.key
					councillist -= S
					modlist -= S
					adminlist -= S

Targeting/verb
	SetTarget(var/mob/Monsters/M in view())
		for(var/mob/Monsters/X in usr.Selected)
			if(M.User == 0)
				X.MagicTarget = M
				usr << "[X] is now targeting [M]"

EvilGod/verb
	Earthquake()
		set category="God"
		if(usr.WorshipPoints >= 200)
			usr.WorshipPoints -= 200
			world << "[usr] uses their unholy powers to cause an earthquake at [usr.x],[usr.y],[usr.z], collapsing the mountains in that area!"
			for(var/turf/grounds/G in range(50,usr))
				G.MountainDecay()
		else
			usr << "You need 200 worship points to do this."
	EvilPossession(var/mob/M in view())
		set category="God"
		var/LevelM = 500
		LevelM += M.Level
		LevelM += M.Level
		LevelM += M.Level
		LevelM += M.Strength
		LevelM += M.Agility
		LevelM += M.Age / 2
		if(M.Owner != usr)
			if(usr.WorshipPoints >= LevelM && M.Infects == 0 && M.SandKing == 0 && M.Spider == 0)
				for(var/obj/Items/Shafts/HolySymbol/H in M)
					var/G = prob(1)
					if(G == 0)
						usr << "[M] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 400
						return
					else
						usr << "[M] is holding a holy symbol, but you overcome it's power."
				for(var/mob/S in Players)
					if(M.Owner == S)
						var/D = 10
						D += M.Level / 2
						if(M.MagicalAptitude == 1)
							D += 5
						var/resist = prob(D)
						if(M.Shielded == 1 || M.Unholy == 1)
							resist = 1
						if(resist == 0)
							S.UnitList -= M
							S.Selected.Remove(M)
							S.client.images -= M.Star
							M.Owner = usr
							M.CanBeSlaved = 0
							usr.UnitList += M
							S << "[usr] possesses [M] with their unholy spirit!"
							usr.WorshipPoints -= LevelM
							M.overlays += /obj/redeye/
							usr << "You possesses [M] with your unholy spirit!"
							return
						if(resist == 1)
							usr.WorshipPoints -= LevelM
							usr << "[M] resists your evil spirit!"
							S << "[M] resists the evil spirit of [usr]"
							return
			else
				usr << "You need [LevelM] worship points to do this and you can't possess devourers, sandkings, NPCs, or spiders."
		else
			usr << "What kind of idiot are you anyway? Possessing your own units... pftt."
	Flood()
		set category="God"
		if(usr.WorshipPoints >= 750)
			world << "[usr] has caused a cataclysmic flood to strike the area[usr.x],[usr.y],[usr.z]."
			usr.WorshipPoints -= 750
			for(var/turf/grounds/G in range(100,usr))
				if(G.Content3 == "Liquid")
					var/FloodChance = prob(50)
					if(FloodChance == 1)
						G.WaterFlood()
	Drought()
		set category="God"
		if(usr.WorshipPoints >= 500)
			usr.WorshipPoints -= 500
			world << "[usr] has caused the lakes and rivers of the area[usr.x],[usr.y],[usr.z] to slowly dry and shrink away!!"
			for(var/turf/grounds/G in range(100,usr))
				if(G.Content3 == "Liquid")
					G.WaterDrought()

	MeteorStrike()
		set category="God"
		if(usr.WorshipPoints >= 325 && usr.z == 1)
			for(var/mob/Monsters/M in view(5,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 150
						return
					else
						usr << "[M] is holding a holy symbol, but you overcome it's power."
			usr.WorshipPoints -= 325
			for(var/turf/grounds/G in range(5,usr))
				G.MeteorStrike()
			for(var/mob/Monsters/KK in range(5,usr))
				var/DeathChanceK = prob(75)
				if(DeathChanceK == 1)
					if(KK.WearingChest == 0)
						KK.BloodContent -= 150
					else
						KK.BloodContent -= 100
					KK.BloodLoss()
					KK.Owner << "[KK] has been struck by flying debris from the meteor!!"
					KK.Owner << "[KK] is bleeding!"
			world << "[usr] calls down a fiery meteor from the sky at [usr.x],[usr.y],[usr.z] to decimate the land!"
		else
			usr << "You can only strike the SURFACE with a meteor, or you don't have 325 worship."
	CreateEvilAltar()
		set category="God"
		if(usr.WorshipPoints >= 50 && usr.AltarCount <= 5)
			for(var/mob/WorkShops/CampFires/GoodAltar/G in view(1,usr))
				usr << "You cannot make your altar too close to a good altar"
				return
			for(var/mob/WorkShops/CampFires/EvilAltar/E in view(1,usr))
				usr << "You cannot make your altar this close to another evil altar"
				return
			var/mob/WorkShops/CampFires/EvilAltar/item = new (usr.loc)
			item=item
			item.Owner = usr
			item.Placed = 1
			item.name = "Altar of [usr]"
			usr.UnitList += item
			usr.WorshipPoints -= 50
			usr.AltarCount += 1
			if(usr.RPGodName != null)
				item.name = "Altar of [usr.RPGodName]"
		else
			usr << "You either have less than 50 worship, or you already have 5 altars."
	EvilSpeech(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<font color = red>[usr.RPGodName] says :[Safe_Guard(T)]"
								Log_unitsay("<font color = red>[usr] says :[T]<br>")
							else if(usr == g)
								g << "<font color = red>[usr.RPGodName] says :[Safe_Guard(T)]"
								Log_unitsay("<font color = red>[usr] says :[T]<br>")
							else
								g << "<font color = red>([usr.x],[usr.y],[usr.z])   [usr.RPGodName] says :[Safe_Guard(T)]"
								Log_unitsay("<font color = red>[usr] says :[T]<br>")
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<font color = red>[usr.RPGodName] says: [Safe_Guard(T)]"
	RPNameChangeE(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				usr.RPGodName = "[Safe_Guard(T)]"
				for(var/mob/WorkShops/CampFires/G in world)
					if(G.Owner == usr)
						G.name = "Altar of [usr.RPGodName]"
	EvilEmote(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<font color = red>[usr.RPGodName] [Safe_Guard(T)]"
							else if(usr == g)
								g << "<font color = red>[usr.RPGodName] [Safe_Guard(T)]"
							else
								g << "<font color = red>([usr.x],[usr.y],[usr.z])   [usr] [Safe_Guard(T)]"
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<font color = red>[usr.RPGodName] [Safe_Guard(T)]"
	UnholyVigor(var/mob/Monsters/M in view())
		set category="God"
		if(usr.WorshipPoints >= 150 && M.Shielded == 0 && M.Unholy == 0)
			for(var/mob/Monsters/X in view(4,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in X)
					var/G = prob(15)
					if(G == 0)
						usr << "[X] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[X] is holding a holy symbol, but you overcome it's power."
			view(usr) << "[usr] fills [M] with unholy vigor making their attacks much more damaging!"
			M.WeaponDamageMin += rand(5,10)
			M.WeaponDamageMax += rand(10,11)
			M.Unholy = 1
			usr.WorshipPoints -= 150
		else
			usr << "You either don't have 150 worship points or that creature has been blessed by a good god, or you have already given it unholy vigor."
	CommonCold(var/mob/Monsters/M in view())
		set category="God"
		if(M.CommonCold == 0 && usr.WorshipPoints >= 150)
			for(var/mob/Monsters/X in view(4,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in X)
					var/G = prob(15)
					if(G == 0)
						usr << "[X] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[X] is holding a holy symbol, but you overcome it's power."
			M.CommonColdDisease()
			usr.WorshipPoints -= 150
			view(usr) << "[usr] infects [M] with the cold!!!"
		else
			usr << "[M] is either immune to the cold or you do not have 150 worship."
	BlackPlague(var/mob/Monsters/M in view())
		set category="God"
		if(M.BlackPlague == 0 && M.BlackDeath == 0 && usr.WorshipPoints >= 1000)
			for(var/mob/Monsters/X in view(4,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in X)
					var/G = prob(15)
					if(G == 0)
						usr << "[X] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[X] is holding a holy symbol, but you overcome it's power."
			M.CommonColdDisease()
			usr.WorshipPoints -= 1000
			view(usr) << "[usr] infects [M] with the BLACK PLAGUE!!!"
			world << "<b><font color=lime>An outbreak of the black plague has started at [M.x],[M.y],[M.z] caused by the unholy powers of [usr]!!!"
		else
			usr << "[M] is either immune to the plague or you do not have 1000 worship."

	UnholyTransportation()
		set category="God"
		for(var/turf/T in view(1,usr))
			if(T.Content3 == "Lava" || T.Content == "Chasm")
				usr << "You cannot teleport units into [T.name], it's quite unhealthy."
				return
		if(usr.WorshipPoints >= 500)
			if(usr.loc != locate(0,0,0) && usr.x != 0)
				var/T = input("Transport who?")as null|text
				if(!T)
					..()
				else
					for(var/mob/S in world)
						if(T == S.name && S.CantBeSummoned == 0)
							for(var/obj/Items/Shafts/HolySymbol/H in S)
								var/G = prob(1)
								if(G == 0)
									usr << "[S] is holding a holy symbol, you are nullified!"
									usr.WorshipPoints -= 25
									return
								else
									usr << "[S] is holding a holy symbol, but you overcome it's power."
							S.loc = usr.loc
							usr.WorshipPoints -= 500
							S.Owner << "Your creature has been transported to [S.x],[S.y],[S.z] by [usr]."
							return
			else
				usr << "You cannot summon creatures to the void."
		else
			usr << "You need 500 worship points to use this, If you want to transport a unit make sure you type in the full name."
	CorruptedTree()
		set category="God"
		if(usr.WorshipPoints >= 10)
			for(var/mob/Monsters/M in view(4,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 10
						return
					else
						usr << "[M] is holding a holy symbol, but you overcome it's power."
			var/turf/grounds/Trees/DeadTree/item = new (usr.loc)
			item=item
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			if(usr.z == 3)
				item.Content3 = "Peak"
			usr.WorshipPoints -= 10
		else
			usr << "You need 10 worship to grow an evil tree."
	CorruptedGround()
		set category="God"
		if(usr.WorshipPoints >= 3)
			for(var/mob/Monsters/M in view(4,usr))
				for(var/obj/Items/Shafts/HolySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a holy symbol, you are nullified!"
						usr.WorshipPoints -= 1.5
						return
					else
						usr << "[M] is holding a holy symbol, but you overcome it's power."
			var/turf/grounds/deadgrass/item = new (usr.loc)
			item=item
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			if(usr.z == 3)
				item.Content3 = "Peak"
			if(usr.z == 4)
				item.Cant = 1
			usr.WorshipPoints -= 3
		else
			usr << "You need 3 worship to corrupt land."
	FindEvilAltars()
		set category="God"
		var/AltarCount
		usr << "<font color = red size = 4>((-Your Altars-))"
		for(var/mob/WorkShops/CampFires/EvilAltar/M in world)
			if(M.Owner == usr)
				AltarCount ++
				usr << "--<font color = red>[M.x],[M.y],[M.z]"
		usr << "<font color = red size = 3> ((-[AltarCount] Altars-))"
	OpenPortal()
		set category="God"
		var/choice2 = alert(usr, "Are you sure you want to create a hell portal?", "Choose", "No", "Yes", null)
		if (choice2 == null)
			return
		if (choice2 == "No")
			return
		if (choice2 == "Yes")
			if(usr.WorshipPoints >= 10000)
				if(usr.z == 4)
					usr << "Cant make a portal to hell while in hell."
					return
				else
					for(var/obj/Portal/P1 in view(1,usr))
						usr << "You cannot make 2 portals right next to each other."
						return
					var/obj/Portal/P = new
					P.loc = usr.loc
					P.suffix = "Stuck"
					P.Owner = "EvilGod"
					world<<"<b><font color=red>The land starts to shake as a strange rift in time and space tears open, creating a way to hell itself!-[usr.x],[usr.y],[usr.z]"
					P.Portal()
					var/obj/Portal/P2 = new
					P2.loc = locate(P.x,P.y,4)
					P2.suffix = "Stuck"
					P2.Content = P.z
					P2.Owner = "EvilGod"
					P2.Portal()
					usr.WorshipPoints -= 10000
					Log_admin("[usr] has made a portal with god powers.")
					return
			else
				usr << "You need 10,000 worship points to do this."
				return
NeutralGod/verb
	ChangeAltarIconsToNeutral()
		set category="God"
		for(var/mob/WorkShops/CampFires/M in world)
			if(M.NeutralGodOwner == usr)
				M.icon_state = "NeutralAltar"
		usr << "<font color = lime size = 3>Altars changed to Neutral Icon"
	ChangeAltarIconsToEvil()
		set category="God"
		for(var/mob/WorkShops/CampFires/M in world)
			if(M.NeutralGodOwner == usr)
				M.icon_state = "EvilAltar"
		usr << "<font color = red size = 3>Altars changed to Evil Icon"
	ChangeAltarIconsToGood()
		set category="God"
		for(var/mob/WorkShops/CampFires/M in world)
			if(M.NeutralGodOwner == usr)
				M.icon_state = "GoodAltar"
		usr << "<font color = white size = 3>Altars changed to Good Icon"
	NeutralizeTurfs()
		set category="God"
		if(usr.WorshipPoints >= 10)
			for(var/turf/grounds/Y in range(10,usr))
				if(Y.icon_state == "DeadGrass" || Y.icon_state == "GoodGrass")
					Y.name = "grass"
					Y.icon = 'Cave.dmi'
					Y.icon_state = "Grass"
					Y.Sky = 1
					Y.Content3 = "CanClimb"
					Y.OIcon = "Grass"
					Y.density = 0
					Y.CanDigAt = 0
					Y.opacity = 0
			usr.ActivityCounter = 10
			usr.WorshipPoints -= 10
		else
			usr << "You need 10 worship points to neutralize turfs."
			return
	SapPower(var/mob/WorkShops/CampFires/C in view())
		set category="God"
		var/T = input("Amount?")as null|num
		if(!T)
			return
		else
			for(var/mob/F in world)
				if(C.Owner == F)
					if(F.IsGoodGod == 1 || F.IsEvilGod == 1)
						if(T >= 0)
							if(usr.WorshipPoints >= T)
								if(F.WorshipPoints >= T)
									F.WorshipPoints -= T
									usr.WorshipPoints -= T
									usr.ActivityCounter = 10
									F << "[usr] has drained [T] of your worship points!"
									usr << "You have drained [T] of [F]'s worship points!"
									return
								else
									usr.WorshipPoints -= F.WorshipPoints
									usr.ActivityCounter = 10
									F.WorshipPoints = 0
									F << "[usr] has drained all of your worship points!"
									usr << "You have drained all of [F]'s worship points!"
									return
							else
								usr << "You don't have [T] worship points."
								return
						else
							usr << "You have to enter a number larger than 0."
							return
	CreateLodestone()
		set category="God"
		for(var/turf/grounds/neutralturf/N in view(1,usr))
			if(N.NeutralGodOwner == usr)
				if(usr.WorshipPoints >= 100)
					var/obj/Items/Shafts/Lodestone/item = new (usr.loc)
					item=item
					item.LodestoneX = usr.x
					item.LodestoneY = usr.y
					item.LodestoneZ = usr.z
					usr.WorshipPoints -= 100
					usr.ActivityCounter = 10
					return
				else
					usr << "You need 100 worship points to create a lodestone."
	CreateViralCrystal()
		set category="God"
		for(var/turf/grounds/neutralturf/N in view(1,usr))
			if(N.NeutralGodOwner == usr)
				if(usr.WorshipPoints >= 500)
					var/obj/Items/Shafts/ViralCrystal/item = new (usr.loc)
					item=item
					item.NeutralGodOwner = usr
					usr.WorshipPoints -= 500
					usr.ActivityCounter = 10
					return
				else
					usr << "You need 500 worship points to create a crystal."
					return
	CreateSpireCrystal()
		set category="God"
		for(var/turf/grounds/neutralturf/N in view(1,usr))
			if(N.NeutralGodOwner == usr)
				if(usr.WorshipPoints >= 2000)
					var/obj/Items/Shafts/SpireCrystal/item = new (usr.loc)
					item=item
					item.NeutralGodOwner = usr
					usr.WorshipPoints -= 2000
					usr.ActivityCounter = 10
					return
				else
					usr << "You need 2000 worship points to create a crystal."
					return
	CreateTeleportationScroll()
		set category="God"
		for(var/turf/grounds/neutralturf/N in view(1,usr))
			if(N.NeutralGodOwner == usr)
				if(usr.WorshipPoints >= 2000)
					var/obj/Items/Shafts/TeleportationScroll/item = new (usr.loc)
					item=item
					item.NeutralGodOwner = usr
					usr.WorshipPoints -= 500
					usr.ActivityCounter = 10
					return
				else
					usr << "You need 2000 worship points to create a scroll."
					return
	CreateGuardstone()
		set category="God"
		if(usr.WorshipPoints >= 300)
			for(var/mob/Monsters/Guardstone/G in view(0,usr))
				usr << "You can't put two guardstones at the same spot."
				return
			for(var/turf/grounds/neutralturf/N in view(1,usr))
				if(N.NeutralGodOwner == usr)
					var/mob/Monsters/Guardstone/item = new (usr.loc)
					item=item
					item.Owner = usr
					usr.UnitList += item
					usr.WorshipPoints -= 300
					usr.ActivityCounter = 10
					return
		else
			usr << "You need 300 worship points to create a guardstone."
	CreateNeutralAltar()
		set category="God"
		for(var/turf/grounds/neutralturf/N in view(1,usr))
			usr << "Can't make this on someone else's turf."
			return
		if(usr.AltarCount == 0)
			for(var/mob/WorkShops/CampFires/GoodAltar/G in view(1,usr))
				usr << "You cannot make your altar too close to a good altar"
				return
			for(var/mob/WorkShops/CampFires/EvilAltar/E in view(1,usr))
				usr << "You cannot make your altar this close to another evil altar"
				return
			var/mob/WorkShops/CampFires/NeutralAltar/N = new (usr.loc)
			N.Owner = usr
			N.name = "Vessel of [usr]"
			usr.AltarCount += 1
			usr.UnitList += N
			if(usr.RPGodName != null)
				N.name = "Vessel of [usr.RPGodName]"
			var/turf/grounds/neutralturf/item = new (usr.loc)
			item=item
			item.NeutralGodOwner = usr
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			if(usr.z == 3)
				item.Content3 = "Peak"
			usr.ActivityCounter = 10
			usr.NeutralPointGeneration()
			return
	CreateNeutralGround()
		set category="God"
		if(usr.WorshipPoints >= 5)
			for(var/turf/grounds/neutralturf/N in view(1,usr))
				if(N.NeutralGodOwner == usr)
					if(N.x == usr.x && N.y == usr.y)
						return
					else
						var/turf/grounds/neutralturf/item = new (usr.loc)
						item=item
						item.NeutralGodOwner = usr
						usr.WorshipPoints -= 5
						usr.ActivityCounter = 10
						if(usr.z == 1)
							item.Sky = 1
						if(usr.z == 2)
							item.Sky = 1
						if(usr.z == 3)
							item.Content3 = "Peak"
						if(usr.z == 4)
							item.Cant = 1
						return
		else
			usr << "You need 5 worship points to do this."
			return
	DestroyBlessingsAndCurses(var/mob/Monsters/M in view())
		set category="God"
		if(M.Shielded == 1)
			usr.WorshipPoints -= 50
			M.Defence -= 50
			M.Shielded = 0
			M.overlays -= 'HolyShield.dmi'
			view(usr) << "[usr] destroys the shield of holy light covering [M]!"
		if(M.Unholy == 1)
			view(usr) << "[usr] wipes the unholy taint from [M]'s body!"
			M.WeaponDamageMin += rand(5,10)
			M.WeaponDamageMax += rand(10,11)
			M.Shielded = 1
			M.Unholy = 1
			usr.ActivityCounter = 10
			usr.WorshipPoints -= 150
	CreateGolem(var/mob/Monsters/M in view())
		set category="God"
		if(M.Guardstone == 1)
			if(M.Owner == usr)
				if(usr.WorshipPoints >= 2000)
					if(M.icon_state != "Guardstone")
						var/mob/Monsters/StoneGolem/G = new(M.loc)
						G.Owner = M.Owner
						usr.UnitList += G
						G.name = "{[usr]} Golem"
						usr.WorshipPoints -= 2000
						del M
						return
				else
					usr << "You need 2000 worship points to use this."
					return
			else
				usr << "You have to use this on your own guardstones."
				return
		else
			usr << "You have to use this on a guardstone"
			return
	NeutralSpeech(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<b><font color=green>[usr.RPGodName] says :[Safe_Guard(T)]"
							else if(usr == g)
								g << "<b><font color=green>[usr.RPGodName] says :[Safe_Guard(T)]"
							else
								g << "<b><font color=green>([usr.x],[usr.y],[usr.z])   [usr.RPGodName] says :[Safe_Guard(T)]"
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<b><font color=green>[usr.RPGodName] says: [Safe_Guard(T)]"
				return
	NeutralEmote(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<b><font color=green>[usr.RPGodName] [Safe_Guard(T)]"
							else if(usr == g)
								g << "<b><font color=green>[usr.RPGodName] [Safe_Guard(T)]"
							else
								g << "<b><font color=green>([usr.x],[usr.y],[usr.z])   [usr.RPGodName] [Safe_Guard(T)]"
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<b><font color=green>[usr.RPGodName] [Safe_Guard(T)]"
				return
	RPNameChangeN(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				usr.RPGodName = "[Safe_Guard(T)]"
				for(var/mob/WorkShops/CampFires/G in world)
					if(G.Owner == usr)
						G.name = "Vessel of [usr.RPGodName]"
				return
	FindYourAltar()
		set category="God"
		for(var/mob/WorkShops/CampFires/NeutralAltar/M in world)
			if(M.Owner == usr)
				usr << "<b><font color = green>[M.x],[M.y],[M.z]"
GoodGod/verb
	GoodPossession(var/mob/M in view())
		set category="God"
		if(M.Owner != usr)
			if(usr.WorshipPoints >= 250 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0 && M.Unholy == 0)
				for(var/mob/S in Players)
					if(M.Owner == S)
						if(usr.ckey in S.IgnoreList)
							usr << "[S] is ignoring you."
							return
						else
							var/choice = alert(S, "[usr] is asking to possess [M]", "Choose", "Yes", "No", null)
							if(choice == "Yes")
								S.UnitList -= M
								S.Selected.Remove(M)
								S.client.images -= M.Star
								M.Owner = usr
								M.CanBeSlaved = 0
								usr.UnitList += M
								S << "[usr] possesses [M] with their holy spirit!"
								usr.WorshipPoints -= 250
								M.overlays += /obj/yelloweye/
								usr << "You possesses [M] with your holy spirit!"
								return
							else
								usr << "[S] has refused."
								return

			else
				usr << "You need 250 worship points to do this and you can't possess undead."
				return
		else
			usr << "What kind of idiot are you anyway? Possessing your own units... pftt."
			return
	Heal(var/mob/M in view())
		set category="God"
		if(usr.WorshipPoints >= 100 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0)
			usr.WorshipPoints -= 100
			view() << "[usr] heals [M]"
			M.HasLeftLeg = 1
			M.HasRightLeg = 1
			M.HasLeftArm = 1
			M.HasRightArm = 1
			M.HasTeeth = 1
			M.Teeth = "Good"
			M.TeethHP = M.TeethHPMax
			M.LeftArm = "Good"
			M.RightArm = "Good"
			M.LeftLeg = "Good"
			M.RightLeg = "Good"
			M.RightLegHP = M.OrganMaxHP
			M.LeftLegHP = M.OrganMaxHP
			M.LeftArmHP = M.OrganMaxHP
			M.RightArmHP = M.OrganMaxHP
			M.Crippled = 0
			M.CanUseRightArm = 1
			M.CanUseLeftArm = 1
			M.CanWalk = 1
			M.Stunned = 0
			M.Fainted = 0
			M.CanSee = 1
			M.BloodContent = M.MaxBloodContent
			M.BleedType = null
			M.LimbLoss()
			return
		else
			usr << "You either don't have 100 prayer points OR you are trying to cast on an unholy creature."
			return
	Immunize(var/mob/Monsters/M in view())
		set category="God"
		if(usr.WorshipPoints >= 50 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0)
			usr.WorshipPoints -= 50
			M.BlackDeath = 1
			M.BlackPlague = 1
			M.CommonCold = 1
			M.ImmuneToDevourer = 1
			M.ImmuneToVampire = 1
			view(usr) << "[usr] has used their holy powers to make [M] immune to disease(Vampirism, Common Cold, Black Death, Devourer Infection)!!"
			return
		else
			usr << "You either don't have 50 prayer points OR you are trying to cast on an unholy creature."
			return
	HolyShield(var/mob/Monsters/M in view())
		set category="God"
		if(usr.WorshipPoints >= 150 && M.Shielded == 0 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0 && M.Unholy == 0)
			usr.WorshipPoints -= 150
			M.Defence += 50
			M.Shielded = 1
			M.overlays += 'HolyShield.dmi'
			view(usr) << "[usr] covers [M] in a holy shield of light!"
			return
		else
			usr << "You either don't have 150 prayer points OR you are trying to cast on an unholy/shielded creature."
			return
	CreateGoodAltar()
		set category="God"
		if(usr.WorshipPoints >= 50 && usr.AltarCount <= 5)
			for(var/mob/WorkShops/CampFires/GoodAltar/G in view(1,usr))
				usr << "You cannot make your altar too close to a good altar"
				return
			for(var/mob/WorkShops/CampFires/EvilAltar/E in view(1,usr))
				usr << "You cannot make your altar this close to another evil altar"
				return
			var/mob/WorkShops/CampFires/GoodAltar/item = new (usr.loc)
			item=item
			item.Owner = usr
			item.name = "Altar of [usr]"
			usr.UnitList += item
			usr.WorshipPoints -= 50
			usr.AltarCount += 1
			if(usr.RPGodName != null)
				item.name = "Altar of [usr.RPGodName]"
			return
	GoodSpeech(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<strong>[usr.RPGodName] says :[Safe_Guard(T)]"
							else if(usr == g)
								g << "<strong>[usr.RPGodName] says :[Safe_Guard(T)]"
							else
								g << "<strong>([usr.x],[usr.y],[usr.z])   [usr.RPGodName] says :[Safe_Guard(T)]"
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<strong>[usr.RPGodName] says: [Safe_Guard(T)]"
				return
	RPNameChangeG(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				usr.RPGodName = "[Safe_Guard(T)]"
				for(var/mob/WorkShops/CampFires/G in world)
					if(G.Owner == usr)
						G.name = "Altar of [usr.RPGodName]"
				return
	GoodEmote(T as text)
		set category="God"
		if(usr.WorshipPoints >= 0)
			if(!T)
				return
			if(usr.Muted == 1)
				src << "You are Muted"
				return
			else
				if(usr.Tame == 0)
					if(usr.Wagon == 0)
						var/list/viewmob = list()
						for(var/mob/m in view(usr))
							viewmob += m.Owner
						for(var/mob/g in viewmob)
							var/mob/replace = g
							for(var/mob/g2 in viewmob)
								if(g2 == g)
									viewmob.Remove(g)
							viewmob += replace
						for(var/mob/g in viewmob)
							if(g in view(usr))
								g << "<strong>[usr.RPGodName] [Safe_Guard(T)]"
							else if(usr == g)
								g << "<strong>[usr.RPGodName] [Safe_Guard(T)]"
							else
								g << "<strong>([usr.x],[usr.y],[usr.z])   [usr.RPGodName] [Safe_Guard(T)]"
				for(var/mob/KM in view(usr))
					if(KM.Owner == usr)
						return
				usr << "<strong>[usr.RPGodName] [Safe_Guard(T)]"
				return
	CreateHolyWater()
		set category="God"
		if(usr.WorshipPoints >= 100)
			var/obj/Items/Shafts/HolyWater/item = new (usr.loc)
			item=item
			usr.WorshipPoints -= 100
			view(usr) << "[usr] creates a vial of divine holy water!"
			return
		else
			usr << "You need 100 worship for this."
			return
	DivineLocation()
		set category="God"
		if(usr.WorshipPoints >= 200)
			var/T = input("Find who?")as null|text
			if(!T)
				..()
			else
				for(var/mob/S in world)
					if(T == S.name)
						for(var/mob/Monsters/M in range(15,S))
							for(var/obj/Items/Shafts/UnholySymbol/H in M)
								var/G = prob(15)
								if(G == 0)
									usr << "[M] is holding a unholy symbol, you are nullified!"
									usr.WorshipPoints -= 100
									return
								else
									usr << "[M] is holding an unholy symbol, but you overcome it's foul power."
						usr << "[S.x],[S.y],[S.z]"
						usr.WorshipPoints -= 200
						view(S) << "You feel like you're being watched."
						return
		else
			usr << "You need 200 worship to use this, if you want to find a unit type in the full name, if you want to find a person type in their userkey."
			return
	DivineGrowth()
		set category="God"
		if(usr.WorshipPoints >= 10)
			for(var/mob/Monsters/M in view(4,usr))
				for(var/obj/Items/Shafts/UnholySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a unholy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[M] is holding an unholy symbol, but you overcome it's foul power."
			var/turf/grounds/Trees/GoodTree/item = new (usr.loc)
			item=item
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			if(usr.z == 3)
				item.Content3 = "Peak"
			usr.WorshipPoints -= 10
			return
		else
			usr << "You need 10 worship to grow a tree."
			return
	DivineLandscape()
		set category="God"
		if(usr.WorshipPoints >= 3)
			for(var/mob/Monsters/M in view(4,usr))
				for(var/obj/Items/Shafts/UnholySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a unholy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[M] is holding an unholy symbol, but you overcome it's foul power."
			var/turf/grounds/goodgrass/item = new (usr.loc)
			item=item
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			if(usr.z == 3)
				item.Content3 = "Peak"
			if(usr.z == 4)
				item.Cant = 1
			usr.WorshipPoints -= 3
		else
			usr << "You need 3 worship to grow holy grass."
	DivinePool()
		set category="God"
		if(usr.WorshipPoints >= 30)
			for(var/mob/Monsters/M in view(4,usr))
				for(var/obj/Items/Shafts/UnholySymbol/H in M)
					var/G = prob(15)
					if(G == 0)
						usr << "[M] is holding a unholy symbol, you are nullified!"
						usr.WorshipPoints -= 3
						return
					else
						usr << "[M] is holding an unholy symbol, but you overcome it's foul power."
			var/turf/grounds/waters/water/item = new (usr.loc)
			item=item
			if(usr.z == 1)
				item.Sky = 1
			if(usr.z == 2)
				item.Sky = 1
			usr.WorshipPoints -= 30
		else
			usr << "You need 30 worship to create water."
	FindGoodAltars()
		set category="God"
		var/AltarCount
		usr << "<font color = white size = 4>((-Your Altars-))"
		for(var/mob/WorkShops/CampFires/GoodAltar/M in world)
			if(M.Owner == usr)
				AltarCount ++
				usr << "--<font color = white>[M.x],[M.y],[M.z]"
		usr << "<font color = white size = 3> ((-[AltarCount] Altars-))"
	ImmunityToMagic(var/mob/Monsters/M in view())
		set category="God"
		if(usr.WorshipPoints >= 25 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0 && M.ImmuneToMagic == 0)
			usr.WorshipPoints -= 25
			M.ImmuneToMagic = 1
			view(usr) << "[usr] has used their holy powers to make [M] immune to magic (All types, god powers are not considered magic)!!"
		else
			usr << "You either don't have 25 prayer points or that unit is already immune to magic/undead"
	ImmunityToTemperature(var/mob/Monsters/M in view())
		set category="God"
		if(usr.WorshipPoints >= 50 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0 && M.ImmuneToTemperature == 0)
			usr.WorshipPoints -= 50
			M.ImmuneToTemperature = 1
			view(usr) << "[usr] has used their holy powers to make [M] immune to temperature (All types of turf)!!"
		else
			usr << "You either don't have 50 prayer points or that unit is already immune to temperature/undead"
	ClosePortal()
		set category="God"
		var/choice2 = alert(usr, "Are you sure you want to destroy a hell portal?", "Choose", "No", "Yes", null)
		if (choice2 == null)
			return
		if (choice2 == "No")
			return
		if (choice2 == "Yes")
			if(usr.WorshipPoints >= 5000)
				if(usr.z == 4)
					usr << "Can't destroy a portal to hell while in hell."
					return
				else
					for(var/obj/Portal/P in view(5,usr))
						if(P.Owner == "EvilGod")
							world<<"<strong>The land starts to shake as the strange rift in time and space implodes upon itself, destroying the foul way to hell itself!-[usr.x],[usr.y],[usr.z]"
							var/mob/Monsters/Avatar/A1 = new
							A1.loc = locate(P.x,P.y,4)
							for(var/obj/Portal/P2 in range(0,A1))
								if(P2.Owner == "EvilGod")
									del P2
							del A1
							usr.WorshipPoints -= 5000
							Log_admin("[usr] has destroyed a portal with god powers.")
							del P
							return
			else
				usr << "You need 5,000 worship points to do this."
				return
Clan/verb
	Invite_To_Clan()
		set category="Clan"
		if(usr.IsClanLeader == 1)
			var/T = input("Pick Someone")as null|anything in Players
			if(!T)
				return
			else
				for(var/mob/M in Players)
					if(T == M)
						var/choice = alert(M, "[usr] has invited you to their clan, [usr.Faction], Do you accept?", "Choose", "No","Yes",null)
						if (choice == "No")
							usr << "[M] has refused."
							return
						if (choice == "Yes")
							usr << "[M] has accepted."
							M << "You have accepted, - for clanchat, = for clan tapestries."
							M.Faction = usr.Faction
							M.IsClanLeader = 0
	Boot_From_Clan()
		set category="Clan"
		if(usr.IsClanLeader == 1)
			var/T = input("Kick Someone.") as null|text
			if(!T)
				return
			else
				for(var/mob/M in world)
					if(T == M.key)
						if(M.Faction == usr.Faction)
							M << "You have been booted from your clan!"
							M.Faction = "Player"
							return
mob
	Developer
		verb
			DChat()
				set hidden = 1
				set category = "Developer"
				var/T = input("Developer Chat")as null|text
				if(!T)
					return
				else
					for(var/mob/M in world)
						if(usr.key == "Jazora")
							if(M.key == "Jazora")
								M << "<font color = purple><strong>[usr] says: </strong>[Safe_Guard(T)]<br>"
					return
			RealPrivateMessage(var/mob/M in Players, msg as text)
				set hidden=1
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PPM>[M]</a>:</font color> [html_encode(msg)]"
				M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"
				for(var/mob/D in Players2)
					if(D != M && D != usr)
						if(D.key == "Jazora")
							D<<"<b><font color=silver>(Priv)[usr] sent to [M]:</font color> [msg]"
			Developer_Logs()
				set hidden = 1
				set category = "Developer"
				var/list/menu6 = new()
				menu6 += "Read Log"
				menu6 += "Delete Log"
				var/Result = input("Choose", "Choose", null) in menu6
				if(Result == "Read Log")
					if(usr.key == "Jazora")
						usr<<browse(file("Logs/Developerlog.html"))
				if(Result == "Delete Log")
					if(usr.key == "Jazora")
						fdel("Logs/Developerlog.html")
			Change_Login_Message(msg as message)
				set category="Admin"
				usr << "<b><font color=red>The login message is currently: '[LoginMessage]'"
				LoginMessage=msg
			Change_Admin_MOTD(msg as message)
				set category="Admin"
				usr << "<b><font color=red>The login message is currently: '[AdminMOTD]'"
				AdminMOTD=msg
			DevEdit(A in world)
				set category="Admin"
				var/mob/X = A
				if(X.GM == 1 && X != usr && usr.key != "Jazora")
					usr << "You can't do this to other admins."
					return
				usr.client<<link("?command=edit;target=\ref[A];type=view;")
			DevCreate()
				set category = "Admin"
				var
					maxlen = 0
					list/List2 = list()
					list/List3 = list()
					i = 0
					a
				for(a in typesof(/mob,/obj,/turf))
					List2.Add(a)
				maxlen = 200

				var/list/list= input("Make what?","List 1")in List2
				if(list)
					var/item = new list(usr.loc)
					item=item

				for(a in typesof(/mob,/obj,/turf))
					i ++
					if(i > maxlen)
						List3.Add(a)

var/oocon = 1