#define DEBUG

area
	tree


mob/proc/LogIn()
	for(var/mob/Monsters/M in world)
		if(M.Owner == src)
			M.LoggedOut = 0
mob
	Logout()
		Players -= usr
		usr.Save()
		usr.Up = 0
		if(LoginTimer == 0)
			world << "<b><font color=purple>[usr] has logged out."
		usr.Restart = 0
		usr.LoggedOut = 1
		for(var/obj/DigAt/D in world)
			if(D.Owner == usr)
				del(D)
		for(var/mob/Monsters/M in usr.UnitList)
			M.LoggedOut = 1
			M.DigTarget = null
			M.destination = null
			if(M.OnGuard == 0)
				M.HomeLoc = M.loc
				M.OnGuard = 1
				M.MobAttack()
				M.MobReturnHome()
		for(var/mob/Monsters/M in usr.Selected)
			usr.Selected.Remove(M)
			M.destination = null

// darkkuta - Cold Claws (UnicornDustSniffer, Demonote)
// masternaruto5 - Axis of Terror (masterdk,firesho,kinglordz,meanmelter,zomadan and netman)


	Login()
		usr.Load()
		usr.IsWood = 0
		usr.Up = 0
		usr.DMID = usr.client.address
		usr.verbs+=typesof(/Targeting/verb/)
		usr.Content = "CantBeCaged"
		for(var/mob/KL in Players)
			if(KL.client.computer_id == usr.client.computer_id)
				usr << "You can't connect 2 times on the same computer at the same time."
				world << "[KL.key] is [usr.key], booting [usr.key]."
				for(var/mob/Monsters/M in usr.UnitList)
					del M
				del usr
		if(usr in Players2)
			..()
		else
			Players2 += usr
		if(copytext(src.ckey, 1, 4) == "guest")
			usr << "Guest Accounts are not allowed on."
			del usr
		if(usr.client.address in banlist)
			usr << "You have been banned."
			del usr
		if(usr.client.address in councillist)
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs+=typesof(/TurfCreate/verb)
			usr.verbs+=typesof(/mob/Spawn/verb)
			usr.verbs+=typesof(/MiscCreate/verb)
			usr.name = "(Admin) [usr.key]"
			usr.GM = 1
		if(usr.client.address in adminlist)
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs+=typesof(/TurfCreate/verb)
			usr.verbs+=typesof(/mob/Spawn/verb)
			usr.verbs+=typesof(/MiscCreate/verb)
			usr.verbs+=typesof(/GiveAdmin/verb)
			usr.verbs+=typesof(/mob/Developer/verb)
			usr.GM = 1
			usr.DE = 1
			usr.sight = 30
		if(usr.ListOn == 0)
			usr.Selected = list()
			usr.IgnoreList = list()
			usr.Rares = list()
			usr.UnitList = list()
			usr.AllyList = list()
			usr.ListOn = 1
		if(usr.key == "Jazora")
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs+=typesof(/TurfCreate/verb)
			usr.verbs+=typesof(/mob/Spawn/verb)
			usr.verbs+=typesof(/MiscCreate/verb)
			usr.verbs+=typesof(/GiveAdmin/verb)
			usr.verbs+=typesof(/mob/Developer/verb)
			usr.GM = 1
			usr.DE = 1
			usr.sight = 30
			adminlist += usr.client.address
		if(usr.key == "Morikai")
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs+=typesof(/TurfCreate/verb)
			usr.verbs+=typesof(/mob/Spawn/verb)
			usr.verbs+=typesof(/MiscCreate/verb)
			usr.verbs+=typesof(/mob/Developer/verb)
			usr.GM = 1
			usr.DE = 1
			usr.sight = 30
			adminlist += usr.client.address
		if(LoginTimer == 0)
			if(usr.GM == 1)
				world << "<b><font color =blue><font size=3>ADMIN:[usr] has logged in."
			else
				world << "<b><font color =purple><font size=3>[usr] has logged in."
			usr << "<b><font color=lime><font size=3>Autosaves happen every 15 minutes, if the server crashes you will be rolled back by at most 15 minutes."
			usr << "<b><font color=lime><font size=3>Copyright © 2006-2009 By Aaron Davey"
			usr << "<b><font color=lime><font size=3>Currently being developed by Frostguarde"
			usr << "<b><font color=lime><font size=3>If you would like to contribute go to our github at: https://github.com/Jazora/DungeonMaster-MerthEdition"
			usr << "Read Your Browser, It Will Provide Help"
			LoginTimer = 1
			LoginTimerReset()
		usr.sight = 30
		usr.Intro()
		usr << sound('Misty Mountain Cold.mid')
		usr.LoggedOut = 0
		usr.UserID = 1
		usr.Address = usr.client.address
		if(night == 0)
			for(var/obj/Hud/Day/D in usr.client.screen)
				D.icon_state = "Sun"
				D.name = "Day"
				D.text = "<font color=yellow>¤"
		else
			for(var/obj/Hud/Day/D in usr.client.screen)
				D.icon_state = "Moon"
				D.name = "Night"
				D.text = "<font color=blue>°"
		if(usr.Loaded == 0)
			if(fexists("units/[usr.ckey]_save.sav"))
				var/sav = "units/[usr.ckey]_save.sav"
				var/savefile/S = new(sav)
				usr.Read(S)
				usr.x = usr.savedx
				usr.y = usr.savedy
				usr.z = usr.savedz
				usr.Done = 1
				usr.User = 1
				usr.Loaded = 1
				usr.density = 0
				usr.AltarCount = 0
				usr.ListOn = 1
				usr.CanSpeak = 1
				usr.Selected = null
				usr.Selected = list()
				usr.client.images = null
				usr.SavedUnitStat = 1
				if(usr.IsGoodGod == 1)
					usr.verbs+=typesof(/GoodGod/verb/)
				if(usr.IsEvilGod == 1)
					usr.verbs+=typesof(/EvilGod/verb/)
				if(usr.IsNeutralGod == 1)
					usr.verbs+=typesof(/NeutralGod/verb/)
				if(usr.IsClanLeader == 1)
					usr.verbs+=typesof(/Clan/verb)
				var/In = 0
				if(usr in PlayerList)
					In = 1
				if(In == 0)
					PlayerList += usr
				for(var/mob/Monsters/K in usr.UnitList)
					for(var/mob/CK in K)
						CK.Owner = usr
					K.x = K.savedx
					K.y = K.savedy
					K.z = K.savedz
					K.overlays -= K.overlays
					if(K.Illithid == 1 && K.Race == "Illithid")
						K.overlays += /obj/IllithidTentacles/
					K.Owner = usr
					K.Gender = K.Gender
					if(K.Meditating == 1)
						K.Meditating = 0
						K.CanWalk = 1
					K.LoggedOut = 0
					K.CoolDown = 0
					K.Sleeping = 0
					K.Stunned = 0
					K.Fainted = 0
					K.OnGuard = 0
					K.HomeLoc = null
					K.Target = null
					K.AttackTarget = null
					if(K.HasRightLeg == 1 && K.HasLeftLeg == 1)
						K.CanWalk = 1
					for(var/obj/Items/Armours/ChestPlates/A1 in K)
						if(A1.suffix == "(Equiped)")
							K.overlays += A1.type
					for(var/obj/Items/Armours/Legs/A2 in K)
						if(A2.suffix == "(Equiped)")
							K.overlays += A2.type
					for(var/obj/Items/Armours/LeftArms/A3 in K)
						if(A3.suffix == "(Equiped)")
							K.overlays += A3.type
					for(var/obj/Items/Armours/RightArms/A4 in K)
						if(A4.suffix == "(Equiped)")
							K.overlays += A4.type
					for(var/obj/Items/Armours/Helmets/A5 in K)
						if(A5.suffix == "(Equiped)")
							K.overlays += A5.type
					for(var/obj/Items/Weapons/W1 in K)
						if(W1.suffix == "(Equiped)")
							K.overlays += W1.type
					if(K.Vampire == 1)
						if(K.y == 1 || K.y == 3)
							K.y = 2
					var/image/I = new('mob.dmi',K)
					K.Star = I
					for(var/obj/Items/Shafts/Standard/S2 in K)
						K.weight -= S2.weight
						del S2
					K.LimbLoss()
				return
		if(usr.AMMode == 1)
			usr.Done = 1
			usr.User = 1
			return
		for(var/mob/Monsters/M in usr.UnitList)
			M.OnGuard = 0
			M.HomeLoc = null
			M.Target = null
			M.AttackTarget = null
		for(var/mob/Monsters/M in usr.UnitList)
			if(M.Owner == usr)
				usr.loc = M.loc
				usr.User = 1
				usr.LogIn()
				usr.Done = 1
				return
		if(usr.IsGoodGod == 1 || usr.IsEvilGod == 1 || usr.IsNeutralGod == 1)
			var/X7 = rand(350,700)
			var/Y7 = rand(400,750)
			usr.loc = locate(X7,Y7,1)
			usr.User = 1
			usr.LogIn()
			usr.Done = 1
			return
		usr.Loaded = 1
		usr.User = 0
		var/X1 = rand(350,700)
		var/Y1 = rand(400,750)
		usr.loc = locate(X1,Y1,1)
		usr.density = 0
		if(usr.LoggedIn == 0)
			if(usr.LoggedIn == 0)
				usr.LoggedIn = 1
				var/Garg = prob(4)
				var/Plant = prob(4)
				for(var/mob/LLL in PlayerList)
					if(LLL.DMID == usr.DMID)
						if(LLL.key != usr.key)
							Garg = 0
							Plant = 0
				if(Garg)
					usr.Rares += "Gargoyle"
				if(Plant)
					usr.Rares += "Plantmen"
		var/In = 0
		if(usr in PlayerList)
			In = 1
		if(In == 0)
			PlayerList += usr
		usr.AdventureMode = 0
		usr.Done = 1
		usr.User = 1
		usr.Restart = 0
		usr << "<b>Press R to choose a race to play."
obj/Hud/Left
	icon = 'HUD.dmi'
	icon_state = "Left"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,2 to 1,18"
		c.screen += src
obj/Hud/Right
	icon = 'HUD.dmi'
	icon_state = "Right"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,2 to 19,18"
		c.screen += src
obj/Hud/Top
	icon = 'HUD.dmi'
	icon_state = "Top"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,19 to 18,19"
		c.screen += src
obj/Hud/Top2
	icon = 'HUD.dmi'
	icon_state = "Top2"
	layer = 12
	name = ""
	New(client/c)
		screen_loc = "10,19"
		c.screen += src
obj/Hud/Day
	icon = 'HUD.dmi'
	icon_state = "Moon"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "10,19"
		c.screen += src
obj/Hud/Bottom
	icon = 'HUD.dmi'
	icon_state = "Bottom"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,1 to 18,1"
		c.screen += src
obj/Hud/BottomLeft
	icon = 'HUD.dmi'
	icon_state = "BottomRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,1"
		c.screen += src
obj/Hud/TopLeft
	icon = 'HUD.dmi'
	icon_state = "TopLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,19"
		c.screen += src
obj/Hud/TopRight
	icon = 'HUD.dmi'
	icon_state = "TopRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,19"
		c.screen += src
obj/Hud/BottomRight
	icon = 'HUD.dmi'
	icon_state = "BottomLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,1"
		c.screen += src
obj/Hud/Warp
	icon = 'HUD.dmi'
	icon_state = "Warp"
	layer = 10
	name = "Warp to a set of X,Y,Z cords. Hot Key - (G)"
	New(client/c)
		screen_loc = "1,3"
		c.screen += src
	DblClick()
		if(usr)
			if(usr.Done == 1)
				if(usr.User == 1)
					var/varX = input("X")as num
					var/varY = input("Y")as num
					var/varZ = input("Z")as num
					usr.loc = locate(varX,varY,varZ)
obj/Hud/Interact
	icon = 'HUD.dmi'
	icon_state = "Interact"
	layer = 10
	name = "Interact with an object or mob near by.Hot Key - (i)"
	New(client/c)
		screen_loc = "1,2"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			var/list/menu = new()
			menu += "Closest Creature"
			menu += "This Creature"

			menu += "Cancel"
			var/Result = input("Interact With What Object", "Choose", null) in menu
			if (Result != "Cancel")
				..()


			if (Result == "This Creature")
				var/list/menu2 = new()
				menu2 += "Rename"
				menu2 += "Run"
				menu2 += "Dig On/Off"
				if(M.Kobold == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Goblin == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Spider == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Vampire == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				for(var/obj/Items/Arrows/A in M)
					if(A.suffix == "(Stuck In)")
						menu2 += "Pull Out Arrow"
				if(M.AM == 1)
					if(M.density == 1)
						if(M.Vampire)
							menu2 += "Rest"
						if(M.Svartalfar)
							menu2 += "Rest"
					if(M.Level >= 15)
						if(M.Vampire)
							menu2 += "Turn Into Mist"
					if(M.Level >= 10)
						if(M.Vampire)
							menu2 += "Morph"
					if(M.Spider == 1)
						menu2 += "Rest"
						if(M.Queen == 1)
							menu2 += "Lay Egg"
							menu2 += "Create Lair"
					if(M.Level >= 50)
						if(M.Svartalfar == 1)
							menu2 += "Daywalk"
					if(M.Kobo == 1 && M.Gender == "Male")
						menu2 += "Sneak"


				menu2 += "Cancel"
				var/Result2 = input("Do What?", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "ClimbCliff")
					M.loc = locate(M.x,M.y,3)
				if (Result2 == "ClimbDownCliff")
					M.loc = locate(M.x,M.y,1)
				if (Result2 == "Run")
					if(M.Running == 0)
						view() << "[M] starts to run!"
						M.Running = 1
						M.Delay -= 1
						M.Tiredness -= 25
						M.Running()
				if(Result2 == "Pull Out Arrow")
					for(var/obj/Items/Arrows/A in M)
						if(A.suffix == "(Stuck In)")
							A.loc = M.loc
							M.weight -= A.weight
							A.suffix = null
							M.Owner << "[M] pulls out [A]"
							M.BloodContent -= rand(5,15)
							M.BloodLoss()
							break
							return
				if (Result2 == "Create Lair")
					if(M.CanBreed == 1)
						if(M.Spider == 0)
							return
						if(M.WebContent >= 200)
							M.WebContent -= 200
							M.LaysAdvancedEggs = 1
							for(var/turf/T in view(2,M))
								T.icon = 'Cave.dmi'
								T.icon_state = "SilkWall"
								T.Detailed = 1



				if (Result2 == "Lay Egg")
					if(M.CanLayEggs == 1)
						if(M.Spider == 0)
							return

						if(M.WebContent >= 50)
							var/list/menus = new()
							menus += "Worker Spider"
							menus += "Hunter Spider"
							if(M.LaysAdvancedEggs == 1)
								menus += "Warrior Spider"
							menus += "Cancel"
							var/Results = input("Do What?", "Choose", null) in menus
							if (Results != "Cancel")
								..()
							if (Results == "Hunter Spider")
								var/mob/Monsters/SpiderEgg/S = new
								S.loc = M.loc
								S.IsHunter = 1
								S.Owner = M.Owner
								M.WebContent -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
							if (Results == "Worker Spider")
								var/mob/Monsters/SpiderEgg/S = new
								S.loc = M.loc
								S.IsWorker = 1
								S.Owner = M.Owner
								M.WebContent -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
							if (Results == "Warrior Spider")
								if(M.LaysAdvancedEggs == 1)
									var/mob/Monsters/SpiderEgg/S = new
									S.loc = M.loc
									S.IsWarrior = 1
									S.Owner = M.Owner
									M.WebContent -= 50
									var/mob/m = M.Owner
									m.UnitList += S
									return
				if (Result2 == "Dig On/Off")

					if(M.Dig == 0)
						M.Dig = 1
						M.Dig()
						usr << "[M]'s Auto Dig is On!"
						return
					if(M.Dig == 1)
						M.Dig = 0
						M.destination = null
						M.DigTarget = null
						usr << "[M]'s Auto Dig is off!"
						for(var/obj/DigAt/DD in world)
							if(DD.Owner == M)
								del(DD)

				if (Result2 == "Daywalk")
					if(M.DayWalker == 0)
						M.Tiredness = M.Tiredness/3
						M.DayWalker = 1
						M.MagicalAptitude = 0
						usr << "[M] is now daywalking at the cost of your tiredness being divided by three.. You are also not allowed to meditate while this is active."
						return
					if(M.DayWalker == 1)
						M.DayWalker = 0
						M.MagicalAptitude = 1
						usr << "[M] is no longer daywalking, and you can now meditate."

				if (Result2 == "Sneak")
					if(M.Sneak == 0)
						M.Tiredness = M.Hunger/2
						M.Sneak = 1
						M.icon_state = "Sneak"
						usr << "[M] is now sneaking, it's tiredness has been divided by three.."
						return
					if(M.Sneak == 1)
						M.Sneak = 0
						M.icon_state = "Normal"
						M.LimbLoss()
						usr << "[M] is no longer sneaking."

				if (Result2 == "Morph")
					if(M.IsMist == 0)
						if(M.Morphed == 0)
							var/list/menu5 = new()
							menu5 += "Human"
							menu5 += "Goblin"
							menu5 += "Devourer"
							menu5 += "Kobold"
							menu5 += "Dwarf"
							menu5 += "LizardMan"
							menu5 += "Orc"
							menu5 += "SpiderQueen"
							menu5 += "SpiderWarrior"
							menu5 += "Ghost"
							menu5 += "Demon"
							menu5 += "FrogMan"
							menu5 += "Wolf"
							menu5 += "Skeleton"
							menu5 += "Cancel"
							var/Result5 = input("Morph to what race?", "Choose", null) in menu5
							if (Result5 != "Cancel")
								..()
							if (Result5 == "Human")
								M.icon = 'Human.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Goblin")
								M.icon = 'Goblins.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "SpiderQueen")
								M.icon = 'SpiderQueenMature.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "SpiderWarrior")
								M.icon = 'SpiderWarriorOlder.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Black Widow")
								M.icon = 'SpiderQueen.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Kobold")
								M.icon = 'Kobold.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Skeleton")
								M.icon = 'Skeleton.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Wolf")
								M.icon = 'Wolf.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "LizardMan")
								M.icon = 'LizardMan.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Ghost")
								M.icon = 'Ghost.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Orc")
								M.icon = 'OrcMale.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Demon")
								M.icon = 'Demon.dmi'
								M.LimbLoss()
								M.Morphed = 1
								M.overlays += /obj/wing2/
								return
							if (Result5 == "FrogMan")
								M.icon = 'FrogMan.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Dwarf")
								M.icon = 'Human.dmi'
								M.LimbLoss()
								M.Morphed = 1
								M.overlays += 'Beards.dmi'
								return
						if(M.Morphed == 1)
							M.icon = 'Vampire.dmi'
							M.LimbLoss()
							M.Morphed = 0
							M.density = 1
							M.overlays -= 'Beards.dmi'
							M.overlays -= /obj/wing2/
							return

				if (Result2 == "Turn Into Mist")
					if(M.density == 1)
						if(M.IsMist == 0)
							M.icon = 'Mist.dmi'
							M.density = 0
							M.Tiredness = M.Tiredness/2
							M.Owner << "[M] turns into mist, their tiredness is halved"
							M.IsMist = 1
							M.Old = M.weightmax
							M.weightmax = -10
							M.Morphed = 0
							M.CanBuild = 0
							for(var/obj/N in M)
								if(N.suffix == "(Equiped)")
									N.suffix = "(Mist Form)"
									M.overlays = null
									M.Defence -= N.Defence
							if(M.HasWings == 1)
								M.overlays = null
							return
					if(M.density == 0)
						if(M.IsMist == 1)
							for(var/turf/T in view(0,M))
								if(T.density)
									M.Owner << "Can not materialize in solid objects!"
									return
							M.icon = 'Vampire.dmi'
							M.density = 1
							M.WearingHelmet = 0
							M.WearingLegs = 0
							M.WearingChest = 0
							M.HoldingWeapon = 0
							M.WearingShield = 0
							M.WearingLeftArm = 0
							M.WearingRightArm = 0
							M.WearingFullPlateHelm = 0
							M.IsMist = 0
							M.weightmax = M.Old
							M.Owner << "[M] turns solid again."
							M.Old = null
							M.CanBuild = 1
							M.LimbLoss()
							for(var/obj/N in M)
								if(N.suffix == "(Mist Form)")
									N.suffix = "(Carrying)"
									M.overlays = null
							if(M.HasWings == 1)
								M.overlays += /obj/
								M.WingsOut = 1
							return
				if (Result2 == "Fly")
					if(M.HasLeftLeg == 1)
						if(M.HasRightLeg == 1)
							if(M.HasLeftArm == 1)
								if(M.HasRightArm == 1)
									if(M.density == 1)
										if(M.IsMist == 0)
											if(M.Vampire)
												M.icon = 'Fly.dmi'
												M.overlays -= /obj/wing1/
											if(M.Demon == 1)
												M.icon = 'Fly2.dmi'
												M.overlays -= /obj/wing2/
											if(M.Race == "Gargoyle")
												M.icon = 'Fly3.dmi'
												M.overlays -= /obj/wing3/
											M.Tiredness = M.Tiredness/2
											M.density = 0
											M.Old2 = M.weightmax
											M.weightmax = -10
											M.Owner << "[M] starts to fly, their triedness is halved!"
											M.Morphed = 0
											return
									if(M.density == 0)
										if(M.IsMist == 0)
											if(M.Demon == 1)
												M.icon = 'Demon.dmi'
												M.overlays += /obj/wing2/
											if(M.Vampire)
												M.icon = 'Vampire.dmi'
												M.overlays += /obj/wing1/
											if(M.Race == "Gargoyle")
												M.icon = 'Gargoyle.dmi'
												M.overlays += /obj/wing3/
											M.density = 1
											M.WingsOut = 1
											M.weightmax = M.Old2
											M.Old2 = null
											M.Owner << "[M] lands."
											M.LimbLoss()
											return
								else
									M.Owner << "[M] is in too much pain to fly!"
							else
								M.Owner << "[M] is in too much pain to fly!"
						else
							M.Owner << "[M] is in too much pain to fly!"
					else
						M.Owner << "[M] is in too much pain to fly!"
				if (Result2 == "Retract Wings")
					if(M.density == 1)
						if(M.WingsOut == 1)
							M.overlays -= /obj/wing1/
							M.overlays -= /obj/wing2/
							M.overlays -= /obj/wing3/
							M.WingsOut = 0
							return
						else
							if(M.Vampire)
								M.overlays += /obj/wing1/
							M.WingsOut = 1
							return
				if (Result2 == "Rest")
					if(M.IsMist == 0)
						M.density = 1
						M.AMBed()
				if (Result2 == "Rename")
					var/T = input("What Name Will You Give Your [M.Gender] Creature?")as null|text
					if(!T)
						if(M)
							M.name = "{[Safe_Guard(M.Owner)]"
					else
						if(M)
							M.name = "{[M.Owner]} [T]"
			if (Result == "Closest Creature")
				for(var/mob/Monsters/C in oview(1,M))
					if(M)
						if(C)
							var/list/menu2 = new()
							if(M.AM == 1)
								if(M.Vampire == 1)
									if(M.density)
										menu2 += "Feed From [C]"
							menu2 += "Rescue [C]"

							if(C.IsTrader == 1)
								menu2 += "Trade With [C]"
							if(M.Vampire == 0)
								if(M.Using == null)
									menu2 += "Breed With [C]"
							menu2 += "Cancel"
							var/Result2 = input("Interact With What Object", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()

							if (Result2 == "Trade With [C]")
								if(C.Goblin == 1)
									if(C.SellsPotion == 1)
										alert("[C] : Whats yous want?")
										var/choice = alert(usr, "What can I do for you?", "Choose", "Trade", "Nothing", null)
										if (choice == "Nothing")
											alert("[C] : See yous!")
											return
										if (choice == "Trade")
											for(var/obj/Items/Potions/HealPotion/P in view(C))
												if(P.BelongsToGoblin == 1)
													alert("[C] : Wants to trades hey? well me got a good deals for you! 200 gold shiny coins for a potion of heal, it give you limbs if they gone!")
													var/choice2 = alert(usr, "Is it a deal?", "Choose", "Yes", "No", null)
													if (choice2 == "No")
														alert("[C] :see you")
														return
													if (choice2 == "Yes")
														for(var/obj/Items/Coins/GoldCoin/GC in M)
															if(GC.CoinContent >= 200)
																var/obj/Items/Coins/GoldCoin/Coin = new
																Coin.loc = C.loc
																Coin.BelongsToGoblin = 1
																Coin.suffix = null
																Coin.CoinContent = 200
																Coin.name = "Gold Coins {[Coin.CoinContent]}"
																GC.CoinContent -= 200
																GC.name = "Gold Coins {[GC.CoinContent]}"
																if(GC.CoinContent <= 0)
																	del(GC)
																for(var/obj/Items/Potions/HealPotion/HP in view(C))
																	if(HP.BelongsToGoblin == 1)
																		HP.BelongsToGoblin = 0
																		HP.loc = M.loc
																		alert("[C] : Here you are, thanks for your buisness")
																	break
															break
															return
														return
								if(C.Human == 1)
									if(C.SellsPotion == 1)
										alert("[C] : Hello there")
										var/choice = alert(usr, "What can I do for you?", "Choose", "Trade", "Nothing", null)
										if (choice == "Nothing")
											alert("[C] : Be seeing you")
											return
										if (choice == "Trade")
											for(var/obj/Items/Potions/HealPotion/P in view(C))
												if(P.BelongsToHumans == 1)
													alert("[C] : Ah, you wish to trade, good good, I have many special potions, these potions will restore any lost limbs. For a price of say, 200 gold coins, I can supply you a potion.")
													var/choice2 = alert(usr, "Is it a deal?", "Choose", "Yes", "No", null)
													if (choice2 == "No")
														alert("[C] : Ok be seeing you")
														return
													if (choice2 == "Yes")
														for(var/obj/Items/Coins/GoldCoin/GC in M)
															if(GC.CoinContent >= 200)
																var/obj/Items/Coins/GoldCoin/Coin = new
																Coin.loc = C.loc
																Coin.BelongsToHumans = 1
																Coin.suffix = null
																Coin.CoinContent = 200
																Coin.name = "Gold Coins {[Coin.CoinContent]}"
																GC.CoinContent -= 200
																GC.name = "Gold Coins {[GC.CoinContent]}"
																if(GC.CoinContent <= 0)
																	del(GC)
																for(var/obj/Items/Potions/HealPotion/HP in view(C))
																	if(HP.BelongsToHumans == 1)
																		HP.BelongsToHumans = 0
																		HP.loc = M.loc
																		alert("[C] : Here you are, thanks for your buisness")
																	break
															break
															return
														return
							if (Result2 == "Pick Up [C]")
								if(C.Owner == M.Owner)
									if(M.weight <= M.weightmax)
										C.suffix = "(Carrying)"
										C.destination = null
										C.loc = M
										M.weight += C.weight
										C.BloodContent = 100
										C.BleedType = null
									else
										usr << "[src] : Cant carry too much!"
							if (Result2 == "Feed From [C]")
								var/Bite = null
								if(M.Strength >= C.Strength)
									Bite = prob(85)
								else
									Bite = prob(35)
								var/Infect = prob(15)
								if(Bite == null)
									Bite = 0
								if(M in view(1,C))
									if(Bite)
										if(M.density == 1)
											if(M.CoolDown == 0)
												if(M.HasTeeth == 1)
													if(C.WearingFullPlateHelm == 0)
														if(C.Vampire == 0)
															if(C.Wagon == 0)
																if(C.IsTree == 0)
																	if(M.IsMist == 0)
																		if(Infect == 1)
																			view() << "<b><font color=red>[C] is infected by a vampire!"
																			view() << "<b><font color=red>[M] feeds on [C]!"
																			C.BloodContent -= 15
																			C.BloodLoss()
																			M.Hunger = 100
																			M.EXP += 25
																			C.InfectedBy = M
																			C.FutureOwner = M.Owner
																			C.TurnVamp()
																			C.Death()
																			M.CoolDown = 1
																			spawn(300)
																				if(M)
																					M.CoolDown = 0
																			return
																		else
																			view() << "<b><font color=red>[M] feeds on [C]!"
																			C.BloodContent -= 15
																			C.BloodLoss()
																			M.Hunger = 100
																			M.EXP += 25
																			C.Death()
																			M.CoolDown = 1
																			spawn(300)
																				if(M)
																					M.CoolDown = 0
																			return

													else
														view() << "<b><font color=red>[M] teeth shatter!!!"
														M.TeethHP = 0
														M.Teeth = "Destroyed"
														M.BloodContent -= 10
														M.BloodLoss()
														for(var/obj/Items/Armours/NeckGuards/G in C)
															if(G.suffix == "(Equiped)")
																C.weight -= G.weight
																C << "[G] shatters!"
																C.WearingFullPlateHelm = 0
																del(G)
									else
										view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
										return



							if (Result2 == "Breed With [C]")
								if(M.Vampire == 1)
									return
								if(M.Race == "Svartalfar")
									return
								if(C.Gender == M.Gender)
									return
								else
									if(C.Gender == "Male")
										return
									if(M.Gender == "Male")
										if(C.IsTree == 0)
											if(C.Vampire == 0)
												if(M.Vampire == 0)
													if(C.Spider == 0)
														if(C.Wolf == 0)
															if(M.Wolf == 0)
																if(C.Owner == M.Owner)
																	if(C.Gender == "Female")
																		if(C.Age <= 100)
																			if(C.Age >= 5)
																				if(M.Age <= 100)
																					if(M.Age >= 5)
																						if(M.Spider == 0)
																							if(M in view(1,C))
																								if(C.Preg == 0)
																									view() << "[C] is due to have a baby!"
																									C.Preg = 1
																									C.overlays += /obj/preg/
																									C.TheDad = M
																									if(C.FrogMan == 1)
																										return
																									if(C.LizardMan)
																										var/mob/Monsters/LizardEgg/G = new
																										G.loc = C.loc
																										G.Owner = C.Owner
																										G.Mum = C
																										C.TheDad = M
																										C.overlays -= /obj/preg/
																									return
																			else
																				usr << "[C] is far too young!"
																		else
																			usr << "[C] is far too old!"
																else
																	var/choice = alert(C.Owner, "[usr] is asking to breed [M] with [C]", "Choose", "Yes", "No", null)
																	if (choice == "Yes")
																		if(M in view(1,C))
																			if(C.Gender == "Female")
																				if(C.Preg == 0)
																					if(C.Age >= 5)
																						if(M.Age <= 100)
																							if(M.Age >= 5)
																								if(M.Spider == 0)
																									if(C.Preg == 0)
																										view() << "[C] is due to have a baby!"
																										C.Preg = 1
																										C.overlays += /obj/preg/
																										C.TheDad = M
																										return
																	if (choice == "No")
																		return
													else
														if(C.Queen == 1)
															if(C.IsMatureQueen == 1)
																if(C.CanBreed == 0)
																	if(C.Level >= 5)
																		C.Ready()
																	else
																		usr << "Need Level 5!"

							if (Result2 == "Rescue [C]")
								if(M in view(1,C))
									if(C.InHole == 1)
										view() << "<b><font color=red>[M] Rescues [C] from a trap"
										C.InHole = 0
										C.SneakingSkill +=1
										C.HasPersonIn = 0
										for(var/obj/Items/Traps/PitTrap/P in view(0,C))
											del(P)


obj/Hud/Build
	icon = 'HUD.dmi'
	icon_state = "Build"
	layer = 10
	name = "Displays the build menu.Hot Key - (B)"
	New(client/c)
		screen_loc = "1,6"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.CanBuild  == 0)
				return
		if(usr.CanBuild == 1)
			if(usr.Up == 0)
				usr.Up = 1
				usr.Building()
				return
			else
				usr.Up = 0
				for(var/obj/HUD/H in usr.client.screen)
					del(H)
obj/Hud/Area
	icon = 'HUD.dmi'
	icon_state = "Area"
	layer = 10
	name = "Selects all of your units in the area.Hot Key - (A)"
	New(client/c)
		screen_loc = "1,7"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in orange(usr))
				if(c.Escort == 0)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(usr.Selected.Find(c))
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

obj/Hud/Pointer
	icon = 'HUD.dmi'
	icon_state = "Pointer"
	layer = 10
	name = "Materialize your self into the physical plain. Hot Key - (None)"
	New(client/c)
		screen_loc = "1,16"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			if(usr.Using)
				return
			if(usr.icon == 'Player.dmi' || usr.icon == 'UnholyShield.dmi' || usr.icon == 'HolyShield.dmi')
				usr.icon = null
				return
			else
				if(usr.IsGoodGod == 1)
					usr.icon = 'HolyShield.dmi'
					return
				if(usr.IsEvilGod == 1)
					usr.icon = 'UnholyShield.dmi'
					return
				if(usr.IsNeutralGod == 1)
					usr.icon = 'NeutralGod.dmi'
					return
				if(usr.IsEvilGod == 0 && usr.IsGoodGod == 0 && usr.IsNeutralGod == 0)
					usr.icon = 'Player.dmi'
					return

obj/Hud/All
	icon = 'HUD.dmi'
	icon_state = "All"
	layer = 10
	name = "Selects all your units in the world. Hot Key - (E)"
	New(client/c)
		screen_loc = "1,8"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in world)
				if(c.Escort == 0)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(usr.Selected.Find(c))
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star
obj/Hud/DigOnUnit
	icon = 'HUD.dmi'
	icon_state = "DigOnUnit"
	layer = 10
	name = "Turns autodig on/off on selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "18,19"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				if(c.Dig == 0)
					c.Dig = 1
					c.Dig()
					usr << "[c]'s Auto Dig is On!"
				else if(c.Dig == 1)
					c.Dig = 0
					c.destination = null
					c.DigTarget = null
					usr << "[c]'s Auto Dig is off!"
					for(var/obj/DigAt/DD in world)
						if(DD.Owner == c)
							del(DD)
obj/Hud/EquipArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorE"
	layer = 10
	name = "Equips all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,19"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				if(c.Gremlin == 0)
					for(var/obj/Items/Armours/ChestPlates/A in c)
						if(c.WearingChest == 0)
							if(A.suffix == "(Carrying)" && A.Content2 != "SmallArmor")
								c.Defence += A.Defence
								A.suffix = "(Equiped)"
								c.WearingChest = 1
								c.overlays += A.type
					for(var/obj/Items/Armours/Legs/A2 in c)
						if(c.WearingLegs == 0)
							if(A2.suffix == "(Carrying)" && A2.Content2 != "SmallArmor")
								c.Defence += A2.Defence
								A2.suffix = "(Equiped)"
								c.WearingLegs = 1
								c.overlays += A2.type
					for(var/obj/Items/Armours/LeftArms/A3 in c)
						if(c.WearingLeftArm == 0)
							if(A3.suffix == "(Carrying)" && A3.Content2 != "SmallArmor")
								c.Defence += A3.Defence
								A3.suffix = "(Equiped)"
								c.WearingLeftArm = 1
								c.overlays += A3.type
					for(var/obj/Items/Armours/RightArms/A4 in c)
						if(c.WearingRightArm == 0)
							if(A4.suffix == "(Carrying)" && A4.Content2 != "SmallArmor")
								c.Defence += A4.Defence
								A4.suffix = "(Equiped)"
								c.WearingRightArm = 1
								c.overlays += A4.type
					for(var/obj/Items/Armours/Helmets/A5 in c)
						if(c.WearingHelmet == 0)
							if(A5.Content2 != "Crown")
								if(A5.suffix == "(Carrying)" && A5.Content2 != "SmallArmor")
									c.Defence += A5.Defence
									A5.suffix = "(Equiped)"
									c.WearingHelmet = 1
									c.overlays += A5.type
					for(var/obj/Items/Armours/Shields/A6 in c)
						if(c.WearingShield == 0)
							if(A6.suffix == "(Carrying)" && A6.Content2 != "SmallArmor")
								c.Defence += A6.Defence
								A6.suffix = "(Equiped)"
								c.WearingShield = 1
								c.overlays += A6.type
					for(var/obj/Items/Armours/NeckGuards/A7 in c)
						if(c.WearingFullPlateHelm == 0)
							if(A7.suffix == "(Carrying)")
								if(A7.IsCape == 0)
									c.Defence += A7.Defence
									A7.suffix = "(Equiped)"
									c.WearingFullPlateHelm = 1
					c.EquipWeapons()
				else
					for(var/obj/Items/Armours/ChestPlates/GremlinChestplate/A in c)
						if(c.WearingChest == 0)
							if(A.suffix == "(Carrying)")
								c.Defence += A.Defence
								A.suffix = "(Equiped)"
								c.WearingChest = 1
								c.overlays += A.type
					for(var/obj/Items/Armours/Legs/GremlinLeggings/A2 in c)
						if(c.WearingLegs == 0)
							if(A2.suffix == "(Carrying)")
								c.Defence += A2.Defence
								A2.suffix = "(Equiped)"
								c.WearingLegs = 1
								c.overlays += A2.type
					for(var/obj/Items/Armours/LeftArms/GremlinLeftGauntlet/A3 in c)
						if(c.WearingLeftArm == 0)
							if(A3.suffix == "(Carrying)")
								c.Defence += A3.Defence
								A3.suffix = "(Equiped)"
								c.WearingLeftArm = 1
								c.overlays += A3.type
					for(var/obj/Items/Armours/RightArms/GremlinRightGauntlet/A4 in c)
						if(c.WearingRightArm == 0)
							if(A4.suffix == "(Carrying)")
								c.Defence += A4.Defence
								A4.suffix = "(Equiped)"
								c.WearingRightArm = 1
								c.overlays += A4.type
					for(var/obj/Items/Armours/Helmets/GremlinHelmet/A5 in c)
						if(c.WearingHelmet == 0)
							if(A5.suffix == "(Carrying)")
								c.Defence += A5.Defence
								A5.suffix = "(Equiped)"
								c.WearingHelmet = 1
								c.overlays += A5.type
					for(var/obj/Items/Armours/Shields/GremlinBuckler/A6 in c)
						if(c.WearingShield == 0)
							if(A6.suffix == "(Carrying)")
								c.Defence += A6.Defence
								A6.suffix = "(Equiped)"
								c.WearingShield = 1
								c.overlays += A6.type
obj/Hud/RemoveArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorUnE"
	layer = 10
	name = "Unequips all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,18"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				if(c.Gremlin == 0)
					for(var/obj/Items/Armours/ChestPlates/A in c)
						if(c.WearingChest == 1)
							if(A.suffix == "(Equiped)" && A.Content2 != "SmallArmor")
								c.Defence -= A.Defence
								A.suffix = "(Carrying)"
								c.WearingChest = 0
								c.overlays -= A.type
					for(var/obj/Items/Armours/Legs/A2 in c)
						if(c.WearingLegs == 1)
							if(A2.suffix == "(Equiped)" && A2.Content2 != "SmallArmor")
								c.Defence -= A2.Defence
								A2.suffix = "(Carrying)"
								c.WearingLegs = 0
								c.overlays -= A2.type
					for(var/obj/Items/Armours/LeftArms/A3 in c)
						if(c.WearingLeftArm == 1)
							if(A3.suffix == "(Equiped)" && A3.Content2 != "SmallArmor")
								c.Defence -= A3.Defence
								A3.suffix = "(Carrying)"
								c.WearingLeftArm = 0
								c.overlays -= A3.type
					for(var/obj/Items/Armours/RightArms/A4 in c)
						if(c.WearingRightArm == 1)
							if(A4.suffix == "(Equiped)" && A4.Content2 != "SmallArmor")
								c.Defence -= A4.Defence
								A4.suffix = "(Carrying)"
								c.WearingRightArm = 0
								c.overlays -= A4.type
					for(var/obj/Items/Armours/Helmets/A5 in c)
						if(c.WearingHelmet == 1)
							if(A5.Content2 != "Crown")
								if(A5.suffix == "(Equiped)" && A5.Content2 != "SmallArmor")
									c.Defence -= A5.Defence
									A5.suffix = "(Carrying)"
									c.WearingHelmet = 0
									c.overlays -= A5.type
					for(var/obj/Items/Armours/Shields/A6 in c)
						if(c.WearingShield == 1)
							if(A6.suffix == "(Equiped)" && A6.Content2 != "SmallArmor")
								c.Defence -= A6.Defence
								A6.suffix = "(Carrying)"
								c.WearingShield = 0
								c.overlays -= A6.type
					for(var/obj/Items/Armours/NeckGuards/A7 in c)
						if(c.WearingFullPlateHelm == 1)
							if(A7.suffix == "(Equiped)")
								if(A7.IsCape == 0)
									c.Defence -= A7.Defence
									A7.suffix = "(Carrying)"
									c.WearingFullPlateHelm = 0
					for(var/obj/Items/Weapons/W in c)
						if(W.suffix == "(Equiped)")
							c.WeaponDamageMin -= W.WeaponDamageMin
							c.WeaponDamageMax -= W.WeaponDamageMax
							c.HoldingWeapon = 0
							W.suffix = "(Carrying)"
							c.overlays -= W.type
				else
					for(var/obj/Items/Armours/ChestPlates/A in c)
						if(c.WearingChest == 1)
							if(A.suffix == "(Equiped)")
								c.Defence -= A.Defence
								A.suffix = "(Carrying)"
								c.WearingChest = 0
								c.overlays -= A.type
					for(var/obj/Items/Armours/Legs/A2 in c)
						if(c.WearingLegs == 1)
							if(A2.suffix == "(Equiped)")
								c.Defence -= A2.Defence
								A2.suffix = "(Carrying)"
								c.WearingLegs = 0
								c.overlays -= A2.type
					for(var/obj/Items/Armours/LeftArms/A3 in c)
						if(c.WearingLeftArm == 1)
							if(A3.suffix == "(Equiped)")
								c.Defence -= A3.Defence
								A3.suffix = "(Carrying)"
								c.WearingLeftArm = 0
								c.overlays -= A3.type
					for(var/obj/Items/Armours/RightArms/A4 in c)
						if(c.WearingRightArm == 1)
							if(A4.suffix == "(Equiped)")
								c.Defence -= A4.Defence
								A4.suffix = "(Carrying)"
								c.WearingRightArm = 0
								c.overlays -= A4.type
					for(var/obj/Items/Armours/Helmets/A5 in c)
						if(c.WearingHelmet == 1)
							if(A5.Content2 != "Crown")
								if(A5.suffix == "(Equiped)")
									c.Defence -= A5.Defence
									A5.suffix = "(Carrying)"
									c.WearingHelmet = 0
									c.overlays -= A5.type
					for(var/obj/Items/Armours/Shields/A6 in c)
						if(c.WearingShield == 1)
							if(A6.suffix == "(Equiped)")
								c.Defence -= A6.Defence
								A6.suffix = "(Carrying)"
								c.WearingShield = 0
								c.overlays -= A6.type
					for(var/obj/Items/Armours/NeckGuards/A7 in c)
						if(c.WearingFullPlateHelm == 0)
							if(A7.suffix == "(Equiped)")
								if(A7.IsCape == 1)
									c.Defence -= A7.Defence
									A7.suffix = "(Carrying)"
									c.WearingFullPlateHelm = 0
					for(var/obj/Items/Weapons/W in c)
						if(W.suffix == "(Equiped)")
							c.WeaponDamageMin -= W.WeaponDamageMin
							c.WeaponDamageMax -= W.WeaponDamageMax
							c.HoldingWeapon = 0
							W.suffix = "(Carrying)"
							c.overlays -= W.type

obj/Hud/ZDown
	icon = 'HUD.dmi'
	icon_state = "ZDown"
	text = "<font color=cyan>v"
	layer = 10
	name = "Moves Camera 1 Z Level Down. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,12"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			if(usr.z == 1)
				usr.z = 2
				return
			if(usr.z == 2)
				usr.z = 4
				return
			if(usr.z == 3)
				usr.z = 1
				return
obj/Hud/ZUp
	icon = 'HUD.dmi'
	icon_state = "ZUp"
	text = "<font color=cyan>^"
	layer = 10
	name = "Moves Camera 1 Z Level Up. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,13"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			if(usr.z == 4)
				usr.z = 2
				return
			if(usr.z == 1)
				usr.z = 3
				return
			if(usr.z == 2)
				usr.z = 1
				return
obj/Hud/DropGems
	icon = 'HUD.dmi'
	icon_state = "DropGems"
	layer = 10
	name = "Drops all gems in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,10"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/gems/A in c)
					if(A.suffix == "(Carrying)")
						A.loc = c.loc
						c.weight -= A.weight
						A.suffix = null
obj/Hud/DropBones
	icon = 'HUD.dmi'
	icon_state = "DropBones"
	layer = 10
	name = "Drops all bones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,9"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Bones/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null

obj/Hud/DropWood
	icon = 'HUD.dmi'
	icon_state = "DropWood"
	layer = 10
	name = "Drops all wood in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,8"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/woods/wood/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
obj/Hud/DropEdibles
	icon = 'HUD.dmi'
	icon_state = "DropEdibles"
	text = "<font color=red>%"
	layer = 10
	name = "Drops all edibles in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,7"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Food/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
				for(var/mob/Body/B in c)
					B.loc = c.loc
					c.weight -= B.weight
					B.suffix = null
obj/Hud/DropOres
	icon = 'HUD.dmi'
	icon_state = "DropOres"
	text = "<font color=yellow>*"
	layer = 10
	name = "Drops all ores in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,6"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/ores/GoldNugget/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
				for(var/obj/Items/ores/silver/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
				for(var/obj/Items/ores/metal/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
obj/Hud/DropStone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	text = "#"
	layer = 10
	name = "Drops all stones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,5"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/ores/stone/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
obj/Hud/DropIngots
	icon = 'HUD.dmi'
	icon_state = "DropIngots"
	text = "="
	layer = 10
	name = "Drops all ingots in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,4"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Ingots/A in c)
					A.loc = c.loc
					c.weight -= A.weight
					A.suffix = null
obj/Hud/DropArmor
	icon = 'HUD.dmi'
	icon_state = "DropArmor"
	text = "<b>æ"
	layer = 10
	name = "Drops up all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,11"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Armours/A in c)
					if(A.suffix == "(Carrying)")
						A.loc = c.loc
						c.weight -= A.weight
						A.suffix = null
				for(var/obj/Items/Weapons/W in c)
					if(W.suffix == "(Carrying)")
						W.loc = c.loc
						c.weight -= W.weight
						W.suffix = null
obj/Hud/Armor
	icon = 'HUD.dmi'
	icon_state = "Armor"
	layer = 10
	name = "Picks up all armor near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "13,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Armours/ChestPlates/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
						break
				for(var/obj/Items/Armours/Legs/A2 in oview(1,c))
					if(c.weight <= c.weightmax)
						A2.loc = c
						c.weight += A2.weight
						A2.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A2.loc = c.loc
							c.weight -= A2.weight
							A2.suffix = null
							return
						break
				for(var/obj/Items/Armours/LeftArms/A3 in oview(1,c))
					if(c.weight <= c.weightmax)
						A3.loc = c
						c.weight += A3.weight
						A3.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A3.loc = c.loc
							c.weight -= A3.weight
							A3.suffix = null
							return
						break
				for(var/obj/Items/Armours/RightArms/A4 in oview(1,c))
					if(c.weight <= c.weightmax)
						A4.loc = c
						c.weight += A4.weight
						A4.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A4.loc = c.loc
							c.weight -= A4.weight
							A4.suffix = null
							return
						break
				for(var/obj/Items/Armours/Helmets/A5 in oview(1,c))
					if(c.weight <= c.weightmax)
						A5.loc = c
						c.weight += A5.weight
						A5.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A5.loc = c.loc
							c.weight -= A5.weight
							A5.suffix = null
							return
						break
				for(var/obj/Items/Armours/Shields/A6 in oview(1,c))
					if(c.weight <= c.weightmax)
						A6.loc = c
						c.weight += A6.weight
						A6.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A6.loc = c.loc
							c.weight -= A6.weight
							A6.suffix = null
							return
						break
				for(var/obj/Items/Weapons/A7 in oview(1,c))
					if(c.weight <= c.weightmax)
						A7.loc = c
						c.weight += A7.weight
						A7.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A7.loc = c.loc
							c.weight -= A7.weight
							A7.suffix = null
							return
						break
obj/Hud/Skin
	icon = 'HUD.dmi'
	icon_state = "Skin"
	layer = 10
	text = "<font color=red><b>@"
	name = "Picks up all skin near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "14,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Skins/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Seeds
	icon = 'HUD.dmi'
	icon_state = "Seeds"
	layer = 10
	name = "Picks up all seeds near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "4,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Seeds/A in oview(1,c))
					if(c.weight <= c.weightmax && A.suffix == null)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Ores
	icon = 'HUD.dmi'
	icon_state = "Ores"
	text = "<font color=yellow>*"
	layer = 10
	name = "Picks up all ores near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "12,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/ores/metal/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
				for(var/obj/Items/ores/GoldNugget/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
				for(var/obj/Items/ores/silver/A in oview(1,c))
					if(c.weight <= c.weightmax && c.Werewolf == 0 && c.Vampire == 0)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
				for(var/obj/Items/ores/Adamantium/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Edibles
	icon = 'HUD.dmi'
	icon_state = "Edibles"
	text = "<font color=red>%"
	layer = 10
	name = "Picks up all edibles near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "11,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Plants/GrapeVine/G in view(1,c))
					if(G.Content >= 2)
						G.Content -= 1
						var/obj/Items/Food/CookedMeats/Grape/T = new
						T.loc = c.loc
					if(G.Content >= 1)
						G.icon_state = "PPlant5"
					if(G.Content >= 2)
						G.icon_state = "PPlant4"
					if(G.Content >= 3)
						G.icon_state = "PPlant3"
					if(G.Content >= 4)
						G.icon_state = "PPlant2"
					if(G.Content <= 0)
						for(var/turf/e in view(0,G))
							e.HasPlantIn = 0
						del(G)
				for(var/obj/Items/Plants/TomatoPlant/F in view(1,c))
					if(F.Content >= 2)
						F.Content -= 1
						var/obj/Items/Food/CookedMeats/Tomato/T = new
						T.loc = c.loc
					if(F.Content >= 1)
						F.icon_state = "Plant5"
					if(F.Content >= 2)
						F.icon_state = "Plant4"
					if(F.Content >= 3)
						F.icon_state = "Plant3"
					if(F.Content >= 4)
						F.icon_state = "Plant2"
					if(F.Content <= 0)
						for(var/turf/e in view(0,F))
							e.HasPlantIn = 0
						del(F)
				for(var/obj/Items/Food/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
				for(var/mob/Body/B in oview(1,c))
					if(c.weight <= c.weightmax)
						B.loc = c
						c.weight += B.weight
						B.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							B.loc = c.loc
							c.weight -= B.weight
							B.suffix = null
							return
obj/Hud/TearMeat
	icon = 'HUD.dmi'
	icon_state = "TearMeat"
	layer = 10
	name = "Tears all meat from corpses inside your selected units(Most races need a campfire near them). Hot Key - (none)"
	New(client/c)
		screen_loc = "19,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Spider == 1 || M.Race == "Dragon" || M.SandWorker == 1 || M.Werepowers == 1 || M.Vampire == 1)
					if(M)
						for(var/mob/Body/m in M)
							if(m in M)
								m.TearMeats()
				for(var/mob/WorkShops/CampFires/Fire/F in range(1,M))
					for(var/mob/Body/m in M)
						if(m in M)
							m.TearMeats()
				for(var/mob/WorkShops/Kitchen/K in range(1,M))
					for(var/mob/Body/m in M)
						if(m in M)
							m.TearMeats()

obj/Hud/TearSkin
	icon = 'HUD.dmi'
	icon_state = "TearSkin"
	layer = 10
	name = "Tears all skin from corpses inside your selected units(Most races need a campfire near them). Hot Key - (none)"
	New(client/c)
		screen_loc = "19,2"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Spider == 1 || M.Race == "Dragon" || M.SandWorker == 1 || M.Werepowers == 1 || M.Vampire == 1)
					if(M)
						if(M)
							for(var/mob/Body/m in M)
								m.TearSkins()
				for(var/mob/WorkShops/LeatherWorks/L in range(1,M))
					for(var/mob/Body/m in M)
						m.TearSkins()

obj/Hud/Bones
	icon = 'HUD.dmi'
	icon_state = "Bones"
	layer = 10
	text = "<b>&"
	name = "Picks up all bones near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "10,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Bones/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Wood
	icon = 'HUD.dmi'
	icon_state = "Wood"
	layer = 10
	name = "Picks up all wood near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "9,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/woods/wood/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Stone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	layer = 10
	name = "Picks up all Stone near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "8,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/ores/stone/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Gem
	icon = 'HUD.dmi'
	icon_state = "Gems"
	layer = 10
	name = "Picks up all gems near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "7,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/gems/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Ingots
	icon = 'HUD.dmi'
	icon_state = "Ingots"
	layer = 10
	text = "="
	name = "Picks up all ingots near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "6,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Ingots/A in oview(1,c))
					if(c.weight <= c.weightmax)
						A.loc = c
						c.weight += A.weight
						A.suffix = "(Carrying)"
						if(c.weight >= c.weightmax)
							A.loc = c.loc
							c.weight -= A.weight
							A.suffix = null
							return
obj/Hud/Arrows
	icon = 'HUD.dmi'
	icon_state = "Arrows"
	layer = 10
	name = "Picks up all arrows near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "5,1"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in usr.Selected)
				for(var/obj/Items/Arrows/A in view(1,c))
					if(c.WearingBack == 1)
						for(var/obj/Items/Armours/Back/LeatherQuiver/L in c)
							if(L.suffix == "(Equiped)")
								if(L.Content <= 250)
									A.loc = L
									A.Owner = c.Owner
									L.Content += 1
					else
						c.Owner << "[c] : I have no quiver to put arrows in"
						return
obj/Hud/Cords
	icon = 'HUD.dmi'
	icon_state = "Cords"
	layer = 10
	name = "Displays your current X,Y,Z cords.Hot Key - (C)"
	New(client/c)
		screen_loc = "1,4"
		c.screen += src
	DblClick()
		usr << "[usr.x],[usr.y],[usr.z]<br>"
obj/Hud/MSG
	icon = 'HUD.dmi'
	icon_state = "MSG"
	layer = 10
	name = "Send a msg to a single player.Hot Key - (W)"
	New(client/c)
		screen_loc = "1,11"
		c.screen += src
	DblClick()
		var/T = input("Whisper to who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					var/reason
					reason = input("Send Message To?","Message",reason)
					if(usr.ckey in S.IgnoreList)
						usr << "You are on [S]'s ignore list<br>"
						return
					S << "[usr] : [Safe_Guard(reason)]"
					usr << "[usr] : [Safe_Guard(reason)]"
					for(var/mob/V in Players2)
						if(V.GM == 1 && V.DE == 1 && V != usr && V != S)
							V << "[usr] sent to [S] : [Safe_Guard(reason)]"
obj/Hud/Say
	icon = 'HUD.dmi'
	icon_state = "Say"
	layer = 10
	name = "Send a msg to the world.Hot Key - (S)"
	New(client/c)
		screen_loc = "1,10"
		c.screen += src
	DblClick()
		var/T = input("Shout")as null|text
		if(oocon == 0)
			usr << "OOC is currently off. This could be due to the status being RP or an admin has turned it off."
			return
		if(!T)
			return
		if(usr.CanSpeak == 0)
			usr << "Must Wait before speaking again!"
			return
		if(usr.Muted == 1)
			usr << "You are Muted"
			return
		else
			for(var/mob/M in world)
				if(usr.WC == 0)
					if(M.WC == 0)
						if(usr in M.IgnoreList)
							..()
						else
							M << "<font color=green><strong>OOC: [usr]</strong>: [Safe_Guard(T)]</html> <br>"
			usr.CanSpeak = 0
			usr.Speak()
			Log_chat("<font color = green>[usr] says: [T]<br>")
			return
obj/Hud/Way
	icon = 'HUD.dmi'
	icon_state = "Way"
	layer = 10
	name = "Create or goto waypoint. Hot Key - (Q)"
	New(client/c)
		screen_loc = "1,9"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			var/list/menu = new()
			menu += "Goto WayPoint"
			menu += "Set WayPoint"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Goto WayPoint")
				if(usr.Restart == 0)
					usr.loc = usr.Waypoint
			if (Result == "Set WayPoint")
				usr.Waypoint = usr.loc
				usr << "Way Point Set!"
obj/Hud/Who
	icon = 'HUD.dmi'
	icon_state = "Who"
	layer = 10
	name = "Displays who is currently online. Hot Key - (H)"
	New(client/c)
		screen_loc = "1,5"
		c.screen += src
	DblClick()
		var/PlayerCount
		usr << "<font color = red size = 4>((-Players Online-))"
		for (var/mob/M in world)
			if (M.client)
				if(M.Content2 != "Invisible")
					PlayerCount ++
					usr << "--<font color = purple>[M]"
				else if(usr.key == "Jazora")
					PlayerCount ++
					usr << "--<font color = red>[M.key] - Invisible"
		usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"
obj/Hud/Restart
	icon = 'HUD.dmi'
	icon_state = "Restart"
	layer = 10
	name = "Restart and begin again somewhere else.Hot Key - (R)"
	New(client/c)
		screen_loc = "1,12"
		c.screen += src
	DblClick()
		usr.Restarts()
obj/Hud/Updates
	icon = 'HUD.dmi'
	icon_state = "Updates"
	layer = 10
	name = "Shows current updates.Hot Key - (T)"
	New(client/c)
		screen_loc = "1,14"
		c.screen += src
	DblClick()
		usr.Updates()
obj/Hud/Find
	icon = 'HUD.dmi'
	icon_state = "Find"
	layer = 10
	name = "Locate a lost unit..Hot Key - (N)"
	New(client/c)
		screen_loc = "1,15"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			var/T = input("Find Who?")as null|text
			if(!T)
				..()
			else
				for(var/mob/S in world)
					if(T == S.name)
						if(S.Owner == usr)
							usr.loc = S.loc
							return
obj/Hud/Stop
	icon = 'HUD.dmi'
	icon_state = "Stop"
	layer = 10
	name = "Stops all your units and removes all targets.Hot Key - (P)"
	New(client/c)
		screen_loc = "1,13"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			M.destination = null
			M.Target = null
client
	macro_mode=1
	Southeast()
		if(mob.User == 0)
			return
		else
			..()
	Southwest()
		if(mob.User == 0)
			return
		else
			..()
	Northeast()
		if(mob.User == 0)
			return
		else
			..()
	Northwest()
		if(mob.User == 0)
			return
		else
			..()
	North()
		if(mob.User == 0)
			return
		else
			..()
	South()
		if(mob.User == 0)
			return
		else
			..()
	East()
		if(mob.User == 0)
			return
		else
			..()
	West()
		if(mob.User == 0)
			return
		else
			..()
	New()
		new/obj/Hud/Left(src)
		new/obj/Hud/Right(src)
		new/obj/Hud/Top(src)
		new/obj/Hud/Top2(src)
		new/obj/Hud/Bottom(src)
		new/obj/Hud/BottomLeft(src)
		new/obj/Hud/TopLeft(src)
		new/obj/Hud/TopRight(src)
		new/obj/Hud/BottomRight(src)
		new/obj/Hud/Interact(src)
		new/obj/Hud/Warp(src)
		new/obj/Hud/Cords(src)
		new/obj/Hud/Who(src)
		new/obj/Hud/Build(src)
		new/obj/Hud/Area(src)
		new/obj/Hud/All(src)
		new/obj/Hud/Way(src)
		new/obj/Hud/Day(src)
		new/obj/Hud/Say(src)
		new/obj/Hud/Stop(src)
		new/obj/Hud/MSG(src)
		new/obj/Hud/Restart(src)
		new/obj/Hud/Updates(src)
		new/obj/Hud/Find(src)
		new/obj/Hud/Pointer(src)
		new/obj/Hud/EquipArmor(src)
		new/obj/Hud/RemoveArmor(src)
		new/obj/Hud/Armor(src)
		new/obj/Hud/Ores(src)
		new/obj/Hud/Gem(src)
		new/obj/Hud/Edibles(src)
		new/obj/Hud/Stone(src)
		new/obj/Hud/Wood(src)
		new/obj/Hud/Bones(src)
		new/obj/Hud/Ingots(src)
		new/obj/Hud/Arrows(src)
		new/obj/Hud/DropWood(src)
		new/obj/Hud/DropEdibles(src)
		new/obj/Hud/DropStone(src)
		new/obj/Hud/DropOres(src)
		new/obj/Hud/DropArmor(src)
		new/obj/Hud/DropBones(src)
		new/obj/Hud/DropGems(src)
		new/obj/Hud/DropIngots(src)
		new/obj/Hud/TearSkin(src)
		new/obj/Hud/TearMeat(src)
		new/obj/Hud/Skin(src)
		new/obj/Hud/Seeds(src)
		new/obj/Hud/ZUp(src)
		new/obj/Hud/ZDown(src)
		new/obj/Hud/DigOnUnit(src)
		..()


	Click(atom/m)
		if(usr.Function == "Tapestry")
			for(var/mob/Monsters/M in usr.Selected)
				if(M in range(1,m))
					if(m.icon == 'Tapestries.dmi')
						M.Owner << "Removing Tapestry."
						del m
						return
					if(m.IsWall == 1)
						if(m.density == 1)
							for(var/obj/Tapestry/K in m)
								usr << "[m] already has a tapestry on it, removing tapestry."
								m.overlays -= K
								del K
								return
							if(usr.Faction != "Player" && usr.Faction != "Allure of the Pandora")
								var/obj/Tapestry/T = new()
								T.loc = m
								T.icon_state = usr.Faction
								T.name = "Tapestry of [usr.Faction]"
								M.Owner << "Tapestry Placed."
								usr.Function = "Tapestry"
								return
							if(usr.Faction == "Allure of the Pandora")
								var/obj/Tapestry/T = new()
								T.loc = m
								T.icon = 'Pandora Tapestry.dmi'
								T.name = "Tapestry of [usr.Faction]"
								M.Owner << "Tapestry Placed."
								usr.Function = "Tapestry"
								return
		if(usr.Function == "PlaceArrowSlit")
			for(var/mob/Monsters/M in usr.Selected)
				if(M in range(1,m))
					if(m.icon_state == "ArrowSlit")
						M.Owner << "Removing arrow slit."
						for(var/turf/T in range(0,m))
							if(T.density == 1)
								T.opacity = 1
						del m
						return
					if(m.IsWall == 1)
						if(m.density == 1)
							for(var/obj/ArrowSlit/K in m)
								usr << "[m] already has an arrow slit on it, removing."
								m.overlays -= K
								m.opacity = 1
								del K
								return
							if(M.Human == 1)
								var/obj/ArrowSlit/T = new()
								T.loc = m
								m.opacity = 0
								M.Owner << "Arrow Slit Placed."
								usr.Function = "PlaceArrowSlit"
								return
		if(usr.Function == "PatrolPoint1")
			for(var/mob/Monsters/M in usr.Selected)
				M.PatrolPoint1 = m
				M.Owner << "Starting point selected, click a seperate tile to finish creating a patrol route.<br>"
				usr.Function = "PatrolPoint2"
				return
		if(usr.Function == "PatrolPoint2")
			for(var/mob/Monsters/M in usr.Selected)
				M.PatrolPoint2 = m
				M.Owner << "Patrol route created.<br>"
				usr.Function = null
				return
		if(usr.Function == "AdminFireball")
			for(var/mob/Monsters/M in usr.Selected)
				if(m in range(10,M))
					var/obj/Items/Arrows/Fireball/F = new(M.loc)
					F.destination = m
					F.FireballPathfinder()
					view(M) << "<font color=red>[M] throws a fireball!"
					return
		if(ismob(m))
			var/mob/mb = m
			if(mb.client)
				return
		for(var/mob/Monsters/M in usr.Selected)
			if(M.CanSee == 0)
				M.Owner << "[M] cant see!!"
				return
			if(m.NPC == 1)
				if(M in view(1,m))
					return
			if(m.BelongsToHumans == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Human == 1)
							if(G.Owner == "{NPC Humans}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromHumans = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
									return
			if(m.BelongsToSkorn == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Human == 1)
							if(G.Owner == "{NPC Skorn}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromSkorn = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
									return
			if(m.BelongsToKobold == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Kobold == 1)
							if(G.Owner == "{NPC Kobold}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromKobolds = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
									return
			if(m.BelongsToDwarf == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Dwarf == 1)
							if(G.Owner == "{NPC Dwarf}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromDwarfs = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
									return
			if(m.BelongsToGoblin == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Goblin == 1)
							if(G.Owner == "{NPC Goblin}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromGoblins = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
									return

			if(M.Wagon == 1)
				if(M.Wolf == 1)
					if(m.suffix == "(Carrying)")
						return
					if(m.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
						return
					else
						M.destination = m
			if(M.Wagon == 0)
				if(M.Wagon == 0)
					M.destination = m
				if(isobj(m))
					M.destination = null
				if(m.Owner == M.Owner)
					M.destination = null
				if(M.Crippled == 1)
					if(M.Told == 0)
						M.Told = 1
						usr << "[M] has a crippled arm!"
					return

				if(M.HoldingWeapon == "Bow" || M.HoldingWeapon == "Hellbow")
					if(M.Target == null)
						if(isobj(m))
							if(m.TP == 1)
								if(m == M)
									continue
								else
									M.Target = m
									M.destination = null
									usr << "[M] targets [m] - press P to stop targetting."
									if(M.BowOn == 0)
										M.BowOn = 1
										M.BowTarget()
						if(ismob(m))
							if(m.Wagon == 0)
								if(m.Dead == 0)
									if(m.WS == 0)
										if(m == M)
											continue
										if(m.Owner == M.Owner)
											continue
										else
											M.Target = m
											M.destination = null
											usr << "[M] targets [m] - press P to stop targetting."
											if(M.BowOn == 0)
												M.BowOn = 1
												M.BowTarget()
				if(m.icon_state == "Silver Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "PickUp")
								if(M.weight <= M.weightmax)
									if(m.suffix == null)
										if(usr.Selected.Find(m))
											usr.Selected.Remove(m)
											usr.client.images -= m.Star
										var/mob/A1 = m
										A1.destination = null
										A1.loc = M
										M.weight += A1.weight
										A1.suffix = "(Carrying)"
										A1.Owner = M.Owner
							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
									M.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
									M.weight -= A2.weight
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Gold Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "PickUp")
								if(M.weight <= M.weightmax)
									if(m.suffix == null)
										if(usr.Selected.Find(m))
											usr.Selected.Remove(m)
											usr.client.images -= m.Star
										var/mob/A1 = m
										A1.destination = null
										A1.loc = M
										M.weight += A1.weight
										A1.suffix = "(Carrying)"
										A1.Owner = M.Owner
							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
									M.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
									M.weight -= A2.weight
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Metal Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "PickUp")
								if(M.weight <= M.weightmax)
									if(m.suffix == null)
										if(usr.Selected.Find(m))
											usr.Selected.Remove(m)
											usr.client.images -= m.Star
										var/mob/A1 = m
										A1.destination = null
										A1.loc = M
										M.weight += A1.weight
										A1.suffix = "(Carrying)"
										A1.Owner = M.Owner
							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
									M.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
									M.weight -= A2.weight
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Wooden Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "PickUp")
								if(M.weight <= M.weightmax)
									if(m.suffix == null)
										if(usr.Selected.Find(m))
											usr.Selected.Remove(m)
											usr.client.images -= m.Star
										var/mob/A1 = m
										A1.destination = null
										A1.loc = M
										M.weight += A1.weight
										A1.suffix = "(Carrying)"
										A1.Owner = M.Owner
							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
									M.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
									M.weight -= A2.weight
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Drill")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drill"
							menu += "Drop Drill"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc


							if (Result == "PickUp")
								if(M.Tame == 1)
									return
								if(m.suffix == null)
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
							if (Result == "Drop Drill")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Drill")
								if(m)
									if(m.suffix == null)
										if(m in view(1,M))
											for(var/turf/grounds/GB in view(0,m))
												var/Break = prob(10)
												if(Break == 1)
													del(m)
													return
												var/E
												var/D
												var/EM
												var/R
												var/S
												E = prob(35)
												D = prob(1)
												EM = prob(0.5)
												R = prob(0.5)
												S = prob(70)
												var/G
												G = prob(5)
												var/SIL
												SIL = prob(5)
												if(SIL == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/silver/SS = new
																SS.loc = WA
																WA.weight += SS.weight
																SS.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/silver/SS = new
													SS.loc = M.loc
												if(G == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/GoldNugget/GN = new
																GN.loc = WA
																WA.weight += GN.weight
																GN.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/GoldNugget/GN = new
													GN.loc = M.loc

												if(E == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/metal/MET = new
																MET.loc = WA
																WA.weight += MET.weight
																MET.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/metal/MET = new
													MET.loc = M.loc
												if(S == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/stone/ST = new
																ST.loc = WA
																WA.weight += ST.weight
																ST.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/stone/ST = new
													ST.loc = M.loc
												if(D == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutDiamond/DI = new
																DI.loc = WA
																WA.weight += DI.weight
																DI.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutDiamond/DI = new
													DI.loc = M.loc
												if(EM == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutEmerald/UD = new
																UD.loc = WA
																WA.weight += UD.weight
																UD.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutEmerald/UD = new
													UD.loc = M.loc
												if(R == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutRuby/RE = new
																RE.loc = WA
																WA.weight += RE.weight
																RE.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutRuby/RE = new
													RE.loc = M.loc

				if(m)
					if(m.icon_state == "Wagon")
						if(M.Wagon == 0)
							M.destination = null
						if(m in view(1,M))
							if(M.Wagon == 0)

								var/list/menu = new()
								menu += "Drop Contents"
								menu += "Pull"
								menu += "Stop Pulling"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc

								if (Result == "Pull")
									if(m.suffix == null)
										var/mob/A1 = m
										A1.destination = M
										A1.Owner = M.Owner
								if (Result == "Stop Pulling")
									if(m.suffix == null)
										var/mob/A1 = m
										A1.destination = null


								if (Result == "Drop Contents")
									for(var/obj/A1 in m)
										A1.loc = M.loc
										A1.suffix = null
										m.weight -= A1.weight
									for(var/mob/A2 in m)
										A2.loc = M.loc
										A2.suffix = null
										m.weight -= A2.weight


				if(m)
					if(m.Tame == 1)
						M.destination = null
						if(m in view(1,M))
							if(M.Wagon == 0)
								if(m.Owner == M.Owner)
									var/list/menu = new()
									menu += "[m.Gender]"
									menu += "Tell Pet To Stop"
									menu += "Tell Pet To Follow"
									menu += "Tell Pet To Breed"
									menu += "Kill"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									var/mob/G = m
									if (Result == "Tell Pet To Breed")
										if(G)
											if(G.Wolf == 1)
												for(var/mob/Monsters/Wolf/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											if(G.Deer == 1)
												for(var/mob/Monsters/Deer/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											if(G.Mole == 1)
												for(var/mob/Monsters/Mole/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											for(var/mob/Monsters/CaveSpider/D in view(1,G))
												if(D.Gender == G.Gender)
													..()
												if(D.Gender == "Female")
													if(G.Gender == "Male")
														if(D.Preg == 0)
															view() << "[D] is due to have a baby!"
															D.Preg = 1
															D.overlays += /obj/preg/
															return
											for(var/mob/Monsters/DeathBeatle/D in view(1,G))
												if(D.Gender == G.Gender)
													..()
												if(D.Gender == "Female")
													if(G.Gender == "Male")
														if(D.Preg == 0)
															view() << "[D] is due to have a baby!"
															D.Preg = 1
															D.overlays += /obj/preg/
															return
									if (Result == "Kill")
										G.HP = 0
										G.GoingToDie = 1
										G.Death()
										return
									if (Result == "Tell Pet To Stop")
										G.destination = null
									if (Result == "Tell Pet To Follow")
										if(M in usr.Selected)
											G.destination = M
											G.PetFollow()
									if (Result == "Inspect")
										usr << m.desc
									if (Result == "Drop")
										if(m.suffix == "(Carrying)")
											var/obj/A1 = m
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

				if(m.icon_state == "GoldDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									if(m in M)
										M.weight -= m.weight
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.LockVar = rand(1,10000)
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "MetalDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.LockVar = rand(1,10000)
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "StoneDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.LockVar = rand(1,10000)
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "BoneDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.LockVar = rand(1,10000)
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "ClosedTrapDoor")
					M.destination = null
					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)
									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									for(var/turf/T in range(1,M))
										if(T.icon_state == "GoblinStairs" || T.icon_state == "BambooStairs" || T.icon_state == "Stairs")
											A3.x = T.x
											A3.y = T.y
											A3.z = T.z
											M.weight -= A3.weight
											A3.Placed = 1
											A3.Door = 1
											A3.Locked = 0
											A3.LockVar = rand(1,10000)
											A3.Owner = M.Owner
											A3.Death()
											return
									M.Owner << "You can only put this at the top of a staircase."
				if(m.icon_state == "WoodenDoor")
					M.destination = null
					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.LockVar = rand(1,10000)
									A3.Owner = M.Owner
									A3.Death()
									return

				if(m.IsPotion == 1)
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drink")
								if(m.suffix == "(Carrying)")
									if(M.Spider == 0)
										if(M.HasStomach == 1 && M.Undead == 0 && M.Infects == 0)
											if(m.name == "Vampirism Cure")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/Work = prob(60)
												if(Work == 1)
													if(M.InfectedBy)
														view() << "[M] is no longer sick!"
														M.InfectedBy = null
												else
													view() << "[src] had no effect!"
												return
											if(m.name == "Potion of Vampirism" && M.Race != "Dragon")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/Work = prob(60)
												if(M.MagicalAptitude == 1)
													Work = 1
												if(M.Werewolf == 1)
													Work = 0
												if(Work == 1)
													view() << "[M] is struck with extreme chest pain as its heart fails...... after a few moments it rises up and views the world with the new eyes of an undead monster!"
													M.Goblin = 0
													M.Human = 0
													M.Kobold = 0
													M.LizardMan = 0
													M.Dwarf = 0
													M.Svartalfar = 0
													M.Ratmen = 0
													M.SandWorker = 0
													M.Race = null
													M.Vampire = 1
													M.UsesPoison = 1
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'BlackBeard.dmi'
													M.overlays -= 'BrownBeard.dmi'
													M.overlays += 'RedEye.dmi'
													M.AM = 1
													M.VampPick = 1
													M.DieAge += 2000
												else
													view() << "[M] is struck with extreme chest pain as its heart fails...!"
													M.DeathType = "Massive Heart Attack"
													M.GoingToDie = 1
													view() << "<b><font color=red>[src] has died!!"
													M.Death()
												return
											if(m.name == "Potion of Poison Immunity")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/work = prob(70)
												if(M.ImmunePoison == 0)
													if(work == 1)
														usr << "[M] becomes immune to poison!"
														M.ImmunePoison = 1
													else
														usr << "The potion has no effect, try another."
												else
													usr << "The potion has no affect! [M] is already immune to poison!"
												return
											if(m.name == "Potion of LongLife")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/A
												A = rand(5,15)
												M.DieAge += A
												usr << "[M]'s life is extended for another [A] years!"
												if(M.Pale == 0)
													M.icon += rgb(25,25,25)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(M.Pale == 1)
													M.icon += rgb(50,50,50)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(M.Pale == 2)
													M.icon += rgb(75,75,75)
													view() << "[M]'s soul darkens!"
													M.Pale += 1
													return
											if(m.name == "Potion of Eternal Life")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												M.DieAge += 70000
												usr << "[M]'s life is extended forever!"
												M.icon += rgb(95,95,95)
												view() << "[M]'s soul darkens!"
												return
											if(m.name == "Immunity To Devourer Potion")
												if(M.ImmuneToDevourer == 0)
													usr << "[M] drinks [m]"
													m.icon_state = "Empty"
													m.IsEmpty = 1
													m.name = "Empty Bottle"
													M.ImmuneToDevourer = 1
													usr << "[M] becomes immune to the dread disease of the devourer!"
													M.icon -= rgb(25,25,25)
													view() << "[M]'s skin darkens a bit from the effects of the potion.!"
													return
											if(m.name == "Potion of Internal Restoration")
												usr << "[M] drinks [m]"
												M.HasNose = 1
												M.NoseHP = M.OrganMaxHP
												M.Nose = "Good"
												M.HasLeftEar = 1
												M.LeftEarHP = M.OrganMaxHP
												M.LeftEar = "Good"
												M.HasRightEar = 1
												M.RightEarHP = M.OrganMaxHP
												M.RightEar = "Good"
												M.HasTeeth = 1
												M.TeethHP = M.OrganMaxHP
												M.Teeth = "Good"
												M.HasRightEye = 1
												M.RightEyeHP = M.OrganMaxHP
												M.RightEye = "Good"
												M.HasLeftEye = 1
												M.LeftEyeHP = M.OrganMaxHP
												M.LeftEye = "Good"
												M.RightLungHP = M.OrganMaxHP
												M.RightLung = "Good"
												M.LeftLungHP = M.OrganMaxHP
												M.LeftLung = "Good"
												M.SpleenHP = M.OrganMaxHP
												M.Spleen = "Good"
												M.HeadHP = M.OrganMaxHP
												M.Head = "Good"
												M.GutsHP = M.OrganMaxHP
												M.Guts = "Good"
												M.StomachHP = M.OrganMaxHP
												M.Stomach = "Good"
												M.LeftKidneyHP = M.OrganMaxHP
												M.LeftKidney = "Good"
												M.RightKidneyHP = M.OrganMaxHP
												M.RightKidney = "Good"
												M.LiverHP = M.OrganMaxHP
												M.Liver = "Good"
												M.BrainHP = M.OrganMaxHP
												M.Brain = "Good"
												M.HeartHP = M.OrganMaxHP
												M.Heart = "Good"
												M.ThroatHP = M.OrganMaxHP
												M.Throat = "Good"
												M.WingHP = M.OrganMaxHP
												M.Wings = "Good"
												M.CanSee = 1
												M.LimbLoss()
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
											if(m.name == "Potion of Restoration")
												usr << "[M] drinks [m]"
												M.HasLeftLeg = 1
												M.HasRightLeg = 1
												M.HasLeftArm = 1
												M.HasRightArm = 1
												M.HasTeeth = 1
												M.Teeth = "Good"
												M.TeethHP = M.TeethHPMax
												m.icon_state = "Empty"
												m.IsEmpty = 1
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
												m.name = "Empty Bottle"
												M.LimbLoss()
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Coin")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Split"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Split")
								if(m.suffix == "(Carrying)")
									if(m)
										if(M.weight <= M.weightmax)
											if(m.Gold == 1)
												if(m.suffix == "(Carrying)")
													var/N = input("Ammount")as null|num
													if(!N)
														return
													if(N >= m.CoinContent)
														return
													if(N <= 0)
														return
													var/obj/Items/Coins/GoldCoin/B = new
													B.CoinContent = N
													m.CoinContent -= N
													B.loc = M
													M.weight += B.weight
													B.suffix = "(Carrying)"
													B.name = "Gold Coins {[B.CoinContent]}"
													m.name = "Gold Coins {[m.CoinContent]}"
													return
											if(m.Silver == 1)
												if(m.suffix == "(Carrying)")
													var/N = input("Ammount")as null|num
													if(!N)
														return
													if(N >= m.CoinContent)
														return
													if(N <= 0)
														return
													var/obj/Items/Coins/SilverCoin/B = new
													B.CoinContent = N
													m.CoinContent -= N
													B.loc = M
													M.weight += B.weight
													B.suffix = "(Carrying)"
													B.name = "Silver Coins {[B.CoinContent]}"
													m.name = "Silver Coins {[m.CoinContent]}"
													return
							if (Result == "Combine")
								if(m.suffix == "(Carrying)")
									if(m)
										if(m.Gold == 1)
											for(var/obj/Items/Coins/GoldCoin/C in M)
												if(C.suffix == "(Carrying)")
													if(C == m)
														return
													m.CoinContent += C.CoinContent
													m.name = "Gold Coins {[m.CoinContent]}"
													M.weight -= C.weight
													del(C)
													return
									if(m)
										if(m.Silver == 1)
											for(var/obj/Items/Coins/SilverCoin/C in M)
												if(C.suffix == "(Carrying)")
													if(C == m)
														return
													m.CoinContent += C.CoinContent
													m.name = "Silver Coins {[m.CoinContent]}"
													M.weight -= C.weight
													del(C)
													return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon == 'Statue.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Name"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Name")
								var/T = input("Write On Statue")as null|text
								if(!T)
									return
								else
									m.name = T
									return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Sand")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "SpearHead")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A6 = m
							A6.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/obj/A = m
								A.loc = M
								M.weight += A.weight
								A.suffix = "(Carrying)"
								for(var/obj/Items/Shafts/SpearShaft/SS in M)
									for(var/obj/Items/Shafts/SpearHead/SH in M)
										var/obj/Items/Weapons/Spears/Spear/S = new
										S.loc = M.loc
										S.M = "Metal"
										if(M.MetalCraftingSkill <= 100)
											S.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											S.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											S.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											S.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											S.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											S.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											S.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											S.CraftRank = "Poor Quality"
										S.MetalWeaponCraft()
										M.MetalCraftingSkill += 0.1
										M.weight -= S.weight
										del(SS)
										del(SH)
										break
										return

				if(m.icon_state == "Shaft")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A7 = m
							A7.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/obj/A = m
								A.loc = M
								M.weight += A.weight
								A.suffix = "(Carrying)"
								for(var/obj/Items/Shafts/SpearShaft/SS in M)
									for(var/obj/Items/Shafts/SpearHead/SH in M)
										var/obj/Items/Weapons/Spears/Spear/S = new
										S.loc = M.loc
										S.M = "Metal"
										if(M.MetalCraftingSkill <= 100)
											S.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											S.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											S.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											S.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											S.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											S.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											S.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											S.CraftRank = "Poor Quality"
										S.MetalWeaponCraft()
										M.MetalCraftingSkill += 0.1
										M.weight -= S.weight
										del(SS)
										del(SH)
										break
										return
				if(m.IsSkin == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A8 = m
							A8.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Fungas")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A = m
							A.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							if(M.Vampire == 0)
								if(M.Gargoyle == 0)
									menu += "Eat"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Eat")
								if(m in M)
									if(M.Carn == 0 && M.Dwarf == 0)
										var/die = prob(33)
										if(die == 1)
											view() << "<b><font color=red>[M] tryed to eat fungas but it killed [M]"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Food Poisoning"
											M.Death()
											return
										else
											view() << "<b><font color=blue>[M] eats [m]"
											if(m.Poisoned == 1 && M.SandKing == 0)
												view() << "<b><font color=red>[M] was posioned!"
												M.HP = 0
												M.GoingToDie = 1
												M.Killer = "[m]"
												M.DeathType = "Poison"
												M.Death()
												return
											M.Hunger += 100
											M.said = 0
											M.weight -= m.weight
											if(M.Hunger >= 100)
												M.Hunger = 100
											del(m)
											return
									else
										view() << "<b><font color=blue>[M] eats [m]"
										if(m.Poisoned == 1)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Poison"
											M.Death()
											return
										M.Hunger += 100
										M.said = 0
										M.weight -= m.weight
										if(M.Hunger >= 100)
											M.Hunger = 100
										del(m)
										return


				if(m)
					if(m.icon_state == "SleepingBag")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A10 = m
								A10.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				if(m)
					if(m.icon_state == "LeatherBed")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A10 = m
								A10.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				if(m.icon_state == "Toxic")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)
							var/obj/A11 = m
							A11.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Drink")
								M.HP = 0
								M.GoingToDie = 1
								M.Killer = "[M]"
								M.DeathType = "Poison"
								M.Death()
								del(m)
								return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Weapon"
								menu2 += "Food"
								menu2 += "Trap"
								menu2 += "Arrows"
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										menu2 += "Poison In Sleep"

								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Arrows")
									for(var/obj/Items/Armours/Back/LeatherQuiver/V in M)
										for(var/obj/Items/Arrows/A in V)
											if(A.Poisoned == 0)
												if(m.Content >= 10)
													M.weight -= m.weight
													del(m)
													break
													return
												A.Poisoned = 1
												A.name = "[A] - Toxic Tipped"
												if(m.PoisonContent >= 45)
													m.PoisonContent = 45
												A.PoisonContent = m.PoisonContent
												m.Content += 1
												M.Owner << "Arrow Poisoned!"
								if (Result2 == "Weapon")
									for(var/obj/Items/Poisons/Toxic/P in M)
										for(var/obj/Items/Weapons/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												var/Min = rand(2,4)
												var/Max = rand(2,4)
												W.WeaponDamageMin += Min
												W.WeaponDamageMax += Max
												W.name = "[W] - Toxic Tipped"
												if(m.PoisonContent >= 45)
													m.PoisonContent = 45
												W.PoisonContent = m.PoisonContent
												if(W.suffix == "(Equiped)")
													M.WeaponDamageMin += Min
													M.WeaponDamageMax += Max
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Trap")
									for(var/obj/Items/Poisons/Toxic/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(1,M))
											if(W.IsSpiked == 1)
												if(W.Poisoned == 0)
													usr << "[M] tips toxic over spiked pit trap"
													W.Poisoned = 1
													if(m.PoisonContent >= 45)
														m.PoisonContent = 45
													W.PoisonContent = m.PoisonContent
													M.weight -= P.weight
													del(P)
													break
													return
								if (Result2 == "Food")

									for(var/obj/Items/Poisons/Toxic/P in M)
										for(var/obj/Items/Food/Meats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
									for(var/obj/Items/Poisons/Toxic/P in M)
										for(var/obj/Items/Food/CookedMeats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Poison In Sleep")
									for(var/mob/Monsters/S in view(1,M))
										if(S.Sleeping == 1)
											for(var/obj/Items/Poisons/Toxic/P in M)
												if(S.Poisoned == 0)
													S.Poisoned = 1
													S.HP = 0
													S.Death()
													S.GoingToDie = 1
													S.Killer = "[M]"
													S.DeathType = "Poison"
													view() << "<b><font color=red>[S] is posioned!"
													S.Death()
													M.weight -= P.weight
													del(P)
													break
													return
								return
				if(m.icon_state == "StrongPoison")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)
							var/obj/A11 = m
							A11.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Drink")
								M.HP = 0
								M.GoingToDie = 1
								M.Killer = "[M]"
								M.DeathType = "Poison"
								M.Death()
								del(m)
								return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Weapon"
								menu2 += "Food"
								menu2 += "Trap"
								menu2 += "Arrows"
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										menu2 += "Poison In Sleep"
								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Arrows")
									for(var/obj/Items/Armours/Back/LeatherQuiver/V in M)
										for(var/obj/Items/Arrows/A in V)
											if(A.Poisoned == 0)
												if(m.Content >= 10)
													M.weight -= m.weight
													del(m)
													break
													return
												A.Poisoned = 1
												A.name = "[A] - Poison++ Tipped"
												if(m.PoisonContent >= 65)
													m.PoisonContent = 65
												A.PoisonContent = m.PoisonContent
												m.Content += 1
												M.Owner << "Arrow Poisoned!"
								if (Result2 == "Weapon")
									for(var/obj/Items/Poisons/StrongPoison/P in M)
										for(var/obj/Items/Weapons/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												var/Min = rand(3,5)
												var/Max = rand(3,5)
												W.WeaponDamageMin += Min
												W.WeaponDamageMax += Max
												W.name = "[W] - Poison++ Tipped"
												if(m.PoisonContent >= 65)
													m.PoisonContent = 65
												W.PoisonContent = m.PoisonContent
												if(W.suffix == "(Equiped)")
													M.WeaponDamageMin += Min
													M.WeaponDamageMax += Max
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Trap")
									for(var/obj/Items/Poisons/StrongPoison/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(1,M))
											if(W.IsSpiked == 1)
												if(W.Poisoned == 0)
													usr << "[M] tips strong poison over spiked pit trap"
													W.Poisoned = 1
													if(m.PoisonContent >= 55)
														m.PoisonContent = 55
													W.PoisonContent = m.PoisonContent
													M.weight -= P.weight
													del(P)
													break
													return
								if (Result2 == "Food")
									for(var/obj/Items/Poisons/StrongPoison/P in M)
										for(var/obj/Items/Food/Meats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
									for(var/obj/Items/Poisons/StrongPoison/P in M)
										for(var/obj/Items/Food/CookedMeats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Poison In Sleep")
									for(var/mob/Monsters/S in view(1,M))
										if(S.Sleeping == 1)
											for(var/obj/Items/Poisons/StrongPoison/P in M)
												if(S.Poisoned == 0)
													S.Poisoned = 1
													S.HP = 0
													S.Death()
													S.GoingToDie = 1
													S.Killer = "[M]"
													S.DeathType = "Poison"
													view() << "<b><font color=red>[S] is poisoned!"
													S.Death()
													M.weight -= P.weight
													del(P)
													break
													return
								return
				if(m.icon_state == "Poison")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)
							var/obj/A11 = m
							A11.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Drink")
								M.HP = 0
								M.GoingToDie = 1
								M.Killer = "[M]"
								M.DeathType = "Poison"
								M.Death()
								del(m)
								return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Weapon"
								menu2 += "Food"
								menu2 += "Trap"
								menu2 += "Arrows"
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										menu2 += "Poison In Sleep"
								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Arrows")
									for(var/obj/Items/Armours/Back/LeatherQuiver/V in M)
										for(var/obj/Items/Arrows/A in V)
											if(A.Poisoned == 0)
												if(m.Content >= 10)
													M.weight -= m.weight
													del(m)
													break
													return
												A.Poisoned = 1
												A.name = "[A] - Poison Tipped"
												if(m.PoisonContent >= 40)
													m.PoisonContent = 40
												A.PoisonContent = m.PoisonContent
												m.Content += 1
												M.Owner << "Arrow Poisoned!"
								if (Result2 == "Weapon")
									for(var/obj/Items/Poisons/Poison/P in M)
										for(var/obj/Items/Weapons/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												var/Min = rand(1,2)
												var/Max = rand(1,2)
												W.WeaponDamageMin += Min
												W.WeaponDamageMax += Max
												W.name = "[W] - Poison Tipped"
												if(m.PoisonContent >= 40)
													m.PoisonContent = 40
												W.PoisonContent = m.PoisonContent
												if(W.suffix == "(Equiped)")
													M.WeaponDamageMin += Min
													M.WeaponDamageMax += Max
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Trap")
									for(var/obj/Items/Poisons/Poison/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(1,M))
											if(W.IsSpiked == 1)
												if(W.Poisoned == 0)
													usr << "[M] tips posion over spiked pit trap"
													W.Poisoned = 1
													if(m.PoisonContent >= 40)
														m.PoisonContent = 40
													W.PoisonContent = m.PoisonContent
													M.weight -= P.weight
													del(P)
													break
													return
								if (Result2 == "Food")
									for(var/obj/Items/Poisons/Poison/P in M)
										for(var/obj/Items/Food/Meats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
									for(var/obj/Items/Poisons/Poison/P in M)
										for(var/obj/Items/Food/CookedMeats/W in M)
											if(W.Poisoned == 0)
												W.Poisoned = 1
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Poison In Sleep")
									for(var/mob/Monsters/S in view(1,M))
										if(S.Sleeping == 1)
											for(var/obj/Items/Poisons/Poison/P in M)
												if(S.Poisoned == 0)
													S.Poisoned = 1
													S.HP = 0
													S.Death()
													S.GoingToDie = 1
													S.Killer = "[M]"
													S.DeathType = "Poison"
													view() << "<b><font color=red>[S] is posioned!"
													M.weight -= P.weight
													S.Death()
													del(P)
													break
													return
								return



				if(m.IsHead == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A12 = m
							A12.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Make Into Skull"
							if(M.Race == "Illithid" || M.Race == "Elder Brain" || M.Race == "Ullitharid")
								menu += "Eat Brain"
							for(var/obj/Items/Traps/Spikes/S in M)
								menu += "Put On Spike"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Eat Brain")
								if(m in M)
									M.Hunger = 100
									M.Intelligence += m.Intelligence / 25
									M.EXP += m.Intelligence
									view(M) << "[M] sucks the brain out of [m] with their tentacles..."
									M.Owner << "[M] has gained [m.Intelligence / 25] intelligence."
									M.weight -= m.weight
									del m
							if (Result == "Put On Spike")
								if(m.weight == 25)
									usr << "Un-able to put on spike!<br>"
									return
								for(var/obj/Items/Traps/Spikes/S in M)
									if(S.icon_state == "Spike")
										if(S.HasHeadOn == 0)
											S.name = m.name
											S.overlays += m
											S.HasHeadOn = 1
											M.weight -= m.weight
											del(m)
											return
							if (Result == "Make Into Skull")
								if(m.weight == 25)
									usr << "Un-able to create skull!<br>"
									return
								var/obj/Items/Bones/Skull/B2 = new
								B2.loc = M.loc
								M.ButcherySkill += 1
								M.weight -= m.weight
								B2.name = m.name
								del(m)
								return
				if(m)
					if(m.icon_state == "Gland")
						M.destination = null
						if(m in M)

							if(M.Wagon == 0)


								var/obj/A12 = m
								A12.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

				if(m.icon_state == "Spike")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A13 = m
							A13.loc = M
							var/list/menu = new()
							menu += "Drop"
							for(var/mob/Monsters/Vampire/V in view(1,M))
								menu += "Stab Heart"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Stab Heart")
								if(M.CoolDown == 0)
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										if(V.Sleeping == 1)
											view() << "[M] stabs a Vampire in the heart killing it!"
											V.GoingToDie = 1
											V.Killer = "[M]"
											V.DeathType = "Punctured Heart"
											V.Death()

							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Trap"
								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Trap")
									for(var/obj/Items/Traps/Spikes/WoodenSpike/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(0,M))
											if(W.Hole == 0)
												if(W.IsSpiked == 0)
													W.IsSpiked = 1
													M.weight -= P.weight
													del(P)
													break
									return


				if(m.icon_state == "sign")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)
							var/list/menu = new()
							menu += "Drop"
							menu += "Write"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Write")
								var/T = input("Write On Sign")as null|text
								if(!T)
									return
								else
									m.name = T
									return
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									A1.dir = M.dir
									return
				if(m.TS == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A16 = m
							A16.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inscribe"
							menu += "Inspect"

							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Inscribe")
								var/T = input("Inscribe Tomb Stone")as null|text
								if(!T)
									return
								else
									m.name = T
									m.icon_state = "TombStone2"
									return
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.TP == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A16 = m
							A16.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"

							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
					else
						if(M.HoldingWeapon != "Bow" && M.HoldingWeapon != "Hellbow")
							M.destination = m

				if(m.icon_state == "Grave")
					M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)
							var/list/menu = new()
							menu += "Rob Grave"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Rob Grave")
								for(var/obj/Q in m)
									Q.loc = M.loc
									Q.suffix = null
								for(var/mob/Z in m)
									Z.loc = M.loc
									Z.suffix = null
								del(m)
								return
							if (Result == "Inspect")
								for(var/atom/F in m)
									usr << F
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Shell")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A23 = m
							A23.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/Spade/S in M)
								menu += "Bury"
							for(var/obj/Items/Shafts/WoodenSpade/S in M)
								menu += "Bury"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Bury")
								if(m in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = m
									A2.loc = G
									M.weight -= m.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return




