atom/proc/Safe()
	spawn(400)
		src.IsWood = 1



turf/proc/SparkleGlow()
	src.overlays += /obj/sparkle/
	spawn(15)
		src.overlays -= /obj/sparkle/
turf/proc/Firestorm()
	src.overlays += /obj/firestorm/
	spawn(30)
		src.overlays -= /obj/firestorm/
turf/proc/Darkshadow()
	src.overlays += /obj/darkshadow/
	spawn(30)
		src.overlays -= /obj/darkshadow/
turf/proc/ForceField()
	if(src.density == 0)
		for(var/mob/Monsters/M in src)
			return
		src.overlays += /obj/forcefield/
		src.density = 1
		spawn(300)
			src.overlays -= /obj/forcefield/
			src.density = 0
turf/proc/LavaFlood()
	spawn(10)
	for(var/turf/T in view(1,src))
		if(T.density == 0)
			if(T.name != "Magma")
				if(T.isbridge == 0)
					var/S = prob(20)
					if(S)
						T.name = "Magma"
						T.icon = 'Lava.dmi'
						T.icon_state = "Lava"
						T.density = 1
						T.Content3 = "Lava"
						T.LavaFlood()
						T.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
						if(T.GoesTo)
							var/obj/Smoke/E = new
							E.loc = T.GoesTo
							if(E.z == 1)
								for(var/turf/T2 in view(0,E))
									T2.LavaFlood()
							if(E.z == 2)
								for(var/turf/T2 in view(0,E))
									T2.LavaFlood()
							del(E)
turf/proc/WaterFlood()
	spawn(10)
		for(var/turf/T in view(1,src))
			if(T.density == 0)
				if(T.CanFish == 0)
					if(T.isbridge == 0)
						var/S = prob(20)
						if(S)
							T.icon = 'water.dmi'
							T.icon_state = "water"
							T.CanFish = 1
							T.Detailed = 1
							T.Content3 = "Liquid"
							T.OIcon = "water"
							T.density = 1
							T.WaterFlood()
							T.text = "<font color=#0000FF>WWWWW<font color=#0000CC>WWWWW"
							if(T.GoesTo)
								var/obj/Smoke/E = new
								E.loc = T.GoesTo
								if(E.z == 1)
									for(var/turf/T2 in view(0,E))
										T2.WaterFlood()
								if(E.z == 2)
									for(var/turf/T2 in view(0,E))
										T2.WaterFlood()
								del(E)
turf/proc/WaterDrought()
	spawn(10)
		for(var/turf/T in view(1,src))
			if(T.density == 0)
				if(T.CanFish == 0)
					var/S = prob(20)
					if(S)
						src.icon = T.icon
						src.icon_state = T.icon_state
						src.CanFish = T.CanFish
						src.Detailed = T.Detailed
						src.Content3 = T.Content3
						src.OIcon = T.OIcon
						src.density = T.density
					src.name = T.name
					src.text = T.text
turf/proc/ForestGrowth()
	var/GrowGrow = prob(4)
	if(GrowGrow)
		for(var/turf/T in range(5,src))
			var/GrowProb = prob(4)
			if(GrowProb == 1)
				if(T.icon_state == "Desert" || T.icon_state == "Grass" || T.Content == "Marsh")
					for(var/obj/Items/Seeds/S in view(0,T))
						return
					var/obj/Items/Seeds/TreeSeed/A1 = new()
					A1.loc = T
					if(T.icon_state == "Grass")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.icon_state == "Desert")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.Content == "Marsh")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
	else
		return
turf/proc/MeteorStrike()
	var/Strike = rand(1,8)
	if(Strike == 1)
		src.icon = 'Lava.dmi'
		src.icon_state = "Lava"
		src.CanFish = 0
		src.Detailed = 0
		src.Content3 = "Lava"
		src.Content3 = "Lava"
		src.OIcon = "Lava"
		src.Cant = 1
		src.density = 1
		src.opacity = 0
		src.name = "Lava"
		src.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
	if(Strike == 2)
		src.name = "cavefloor"
		src.icon = 'Cave.dmi'
		src.icon_state = "CaveFloor"
		src.CanDigAt = 0
		src.density = 0
		src.CanFish = 0
		src.Detailed = 0
		src.Content3 = null
		src.opacity = 0
		src.Sky = 1
	if(Strike == 3)
		src.CanFish = 0
		src.Content3 = null
		src.name = "Mountain"
		src.icon = 'Cave.dmi'
		src.icon_state = "CaveWall"
		src.density = 1
		src.CanDigAt = 1
		src.HP = 100
		src.opacity = 1
		src.Cant = 0
		src.Sky = 1
		src.IsCave = 1
		src.OIcon = "CaveFloor"
	if(Strike == 4)
		var/GemProb = prob(10)
		if(GemProb == 1)
			var/obj/Items/gems/UnCutDiamond/D1 = new()
			D1.loc = src
	if(Strike == 5)
		return
	if(Strike == 6)
		var/GemProb = prob(10)
		if(GemProb == 1)
			var/obj/Items/gems/UnCutRuby/D1 = new()
			D1.loc = src
	if(Strike == 7)
		var/GemProb = prob(10)
		if(GemProb == 1)
			var/obj/Items/gems/UnCutEmerald/D1 = new()
			D1.loc = src
	if(Strike == 8)
		for(var/mob/Monsters/MM in view(0,src))
			if(MM.User == 0)
				MM.Fire()
		for(var/turf/grounds/GG in view(0,src))
			if(GG.IsWood)
				GG.Fire()
turf/proc/MountainErosion()
	var/Erode = prob(45)
	spawn(5)
		var/obj/CliffChecker/Q = new()
		Q.loc = locate(src.x,src.y,3)
		for(var/turf/T in range(0,Q))
			T.icon_state = "Peak"
			T.Content3 = "Peak"
			T.OIcon = "Peak"
			T.text = "<font color=#CC9900>×"
			T.Sky = 1
			T.Detailed = 1
			T.density = 0
			T.CanDigAt = 0
			T.opacity = 0
		if(Erode == 0)
			for(var/turf/Y in range(1,src))
				if(Y.icon_state != "CaveWall")
					if(Y != src)
						var/YErode = prob(40)
						if(YErode == 1)
							Y.name = "Mountain"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "CaveWall"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "CaveFloor"
							Y.density = 1
							Y.CanDigAt = 1
							Y.opacity = 1
							Y.text = "<font color=#999933>#"
							Y.overlays -= Y.overlays
							Y.HP = rand(95,105)
							Y.Tree = 0
							Y.MountainErosion()
		else
			var/SrcErode = prob(30)
			if(SrcErode == 1)
				for(var/turf/T in range(1,src))
					if(T.density == 0)
						if(T != src)
							src.icon = T.icon
							src.icon_state = T.icon_state
							src.CanFish = T.CanFish
							src.Detailed = T.Detailed
							src.Content3 = T.Content3
							src.OIcon = T.OIcon
							src.density = T.density
							src.name = T.name
							src.text = T.text
							src.Tree = T.Tree
							src.overlays -= src.overlays
							for(var/turf/G in range(1,src))
								if(G.density == 1)
									G.MountainErosion()
								break
							for(var/turf/G in range(0,Q))
								G.icon = 'Cave.dmi'
								G.icon_state = "Sky"
								G.name = "Sky"
								G.density = 0
								G.Detailed = 0
								G.text = "<font color=#66FFFF>×"
		del Q
turf/proc/MountainDecay()
	if(src.icon_state == "CaveFloor")
		var/DecayProb = prob(50)
		if(DecayProb == 1)
			for(var/obj/Items/Furniture/Pillars/P in range(5,src))
				return
			src.CanFish = 0
			src.Content3 = null
			src.name = "Mountain"
			src.icon = 'Cave.dmi'
			src.icon_state = "CaveWall"
			src.density = 1
			src.CanDigAt = 1
			src.HP = 100
			src.opacity = 1
			src.Cant = 0
			src.Sky = 1
			src.IsCave = 1
			src.OIcon = "CaveFloor"
			for(var/mob/Monsters/M in range(0,src))
				if(M.Gargoyle == 0)
					M.BloodContent -= 25
					M.BloodLoss()
					M.RightArmHP -= 10
					M.LeftArmHP -= 10
					M.LeftLegHP -= 10
					M.RightLegHP -= 10
					M.Owner << "[M] is hit by falling debris and buried alive!"
			return
		else
			return
mob/proc/FlameAttack()
	if(src.destination in view(1,src))
		view() << "[src] breathes fire over [src.destination]"
		var/obj/Fire/F = new
		F.loc = src.loc
		F.dir = src.dir
	spawn(750) FlameAttack()
mob/proc/TurnDemon()
	spawn(500)
		src.overlays += 'RedEye.dmi'
		spawn(500)
			src.icon += rgb(150,0,0)
			src.overlays -= 'RedEye.dmi'
			src.Strength += rand(3,5)
			spawn(500)
				src.icon = 'Demon.dmi'
				src.Strength += rand(3,5)
				src.LimbLoss()
				src.HalfDemon = 1
obj/proc/Flame()
	if(src.User == 1)
		return
	if(src.Race == "Gremlin")
		return
	if(ismob(src))
		return
	for(var/atom/T in view(2,src))
		if(T.OnFire == 0)
			if(T.IsWood)
				if(T.Tree)
					T.overlays -= /obj/Trees/leaves3x2
					T.overlays -= /obj/Trees/leaves2x2
					T.overlays -= /obj/Trees/leaves1x2
					T.overlays -= /obj/Trees/leaves1x1
					T.overlays -= /obj/Trees/leaves2x1
					T.overlays -= /obj/Trees/leaves3x1

				T.Fire()
				del(src)
				return
	spawn(20) Flame()

obj/proc/DeleteSmoke()
	spawn(30)
		del(src)

obj/proc/SmokeMove()
	step_rand(src)
	spawn(10) SmokeMove()

atom/proc/Smoke()
	if(src.OnFire)
		var/obj/Smoke/S = new
		S.loc = locate(src.x,src.y,src.z)
		S.dir = NORTH
	else
		return
	spawn(50) Smoke()
atom/proc/Fire()
	var/FireResist = 0
	if(src.User == 1)
		return
	if(src.Race == "Gremlin")
		return
	if(src.Race == "Dragon")
		return
	if(src.Gargoyle == 1)
		return
	if(src.Race == "Guardstone")
		return
	for(var/obj/Items/Armours/A in src)
		if(A.suffix == "(Equiped)")
			if(A.Content2 == "Demon")
				FireResist += 20
	var/FireResistCalc = prob(FireResist)
	if(FireResistCalc)
		return
	if(src.OnFire == 0)
		if(src.IsWood)
			if(src.User == 0)
				src.overlays += 'Fire.dmi'
				src.OnFire = 1
		else
			return
	else
		if(src.IsWood)
			if(src.icon_state == "WoodenDoor")
				del src
				return
			if(src.icon_state == "Open")
				del src
				return
			if(src.icon_state == "Wooden Chest")
				for(var/obj/Items/I in src)
					I.suffix = null
					I.loc = src.loc
				del src
				return
			if(src.Wagon == 1)
				for(var/obj/Items/I in src)
					I.suffix = null
					I.loc = src.loc
				del src
				return
			src.Fuel -= 10
			if(ismob(src))
				var/mob/M = src
				M.LeftLegHP -= 18
				M.RightLegHP -= 18
				M.RightArmHP -= 18
				M.LeftArmHP -= 18
				M.BloodContent -= 50
				M.LeftLeg = "Burned"
				M.RightLeg = "Burned"
				M.RightArm = "Burned"
				M.LeftArm = "Burned"
				M.BloodLoss()
				spawn(150)
					for(var/turf/grounds/W in view(1,src))
						if(W.icon_state == "water")
							src.OnFire = 0
							src.overlays -= 'Fire.dmi'
							src.Fuel = 100
							src.IsWood = 0
							src.Safe()
					if(src.OnFire == 1)
						src.Fuel = 100
						src.OnFire = 0
						src.overlays -= 'Fire.dmi'
						src.IsWood = 0
						for(var/mob/Monsters/MKM in view(0,src))
							if(MKM == src)
								view(MKM) << "[MKM] burns to death!"
								MKM.GoingToDie = 1
								MKM.Killer = "Fire"
								MKM.DeathType = "Burned To Death"
								MKM.Death()
								return
	spawn(200)
		for(var/atom/T in view(2,src))
			if(T.OnFire == 0)
				if(T.IsWood)
					if(ismob(src))
						..()
					else
						if(T.Tree)
							T.overlays -= /obj/Trees/leaves3x2
							T.overlays -= /obj/Trees/leaves2x2
							T.overlays -= /obj/Trees/leaves1x2
							T.overlays -= /obj/Trees/leaves1x1
							T.overlays -= /obj/Trees/leaves2x1
							T.overlays -= /obj/Trees/leaves3x1
						var/catchchance = prob(50)
						if(catchchance)
							T.Fire()
	if(src.Fuel <= 0)
		if(isturf(src))
			src.overlays = null
			src.OnFire = 0
			src.IsWood = 0
			src.Fuel = 100
			src.opacity = 0
			src.density = 0
			src.CanDigAt = 0
			src.Detailed = 0
			src.icon = 'Cave.dmi'
			src.Tree = 0
			src.icon_state = src.OIcon
			src.GoesTo = null
			if(src.z == 1)
				var/obj/Support/Q = new
				Q.loc = locate(src.x,src.y,3)
				for(var/turf/TE in view(0,Q))
					if(TE.Supported == 1)
						TE.Supported = 0
						TE.icon_state = "DFloor"
						TE.name = "Floor"
						TE.density = 0
						TE.Detailed = 0
						if(TE.Content3 == "Peak")
							TE.icon = 'Cave.dmi'
							TE.icon_state = "Peak"
							TE.name = "MountainPeak"
						if(TE.Content == "Sky")
							TE.icon = 'Cave.dmi'
							TE.icon_state = "Sky"
							TE.name = "Sky"
				del(Q)
			return
		else
			src.Fuel = 100
			src.OnFire = 0
			src.overlays -= 'Fire.dmi'
			src.IsWood = 0
			src.Safe()
			return
	spawn(200)
		Fire()
		return
mob/proc/Regen()
	if(src.HasLeftEye == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their left eye back!"
			src.HasLeftEye = 1
			src.LeftEyeHP = 10
			src.CanSee = 1
			src.LeftEye = "Mangled"
			src.LimbLoss()
	if(src.HasRightEye == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their right eye back!"
			src.HasRightEye = 1
			src.RightEyeHP = 10
			src.CanSee = 1
			src.RightEye = "Mangled"
			src.LimbLoss()
	if(src.HasLeftArm == 0)
		var/LA = prob(20)
		if(LA == 1)
			if(src.Crippled == 1)
				src.Crippled = 0
			if(src.CanUseLeftArm == 0)
				src.CanUseLeftArm = 1
			src.Owner << "[src] grows their left arm back!"
			src.HasLeftArm = 1
			src.LeftArmHP = 10
			src.LeftArm = "Mangled"
			src.LimbLoss()
	if(src.HasRightArm == 0)
		var/LA = prob(20)
		if(LA == 1)
			if(src.Crippled == 1)
				src.Crippled = 0
			if(src.CanUseRightArm == 0)
				src.CanUseRightArm = 1
			src.Owner << "[src] grows their right arm back!"
			src.HasRightArm = 1
			src.RightArmHP = 10
			src.RightArm = "Mangled"
			src.LimbLoss()
	if(src.HasLeftLeg == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their left leg back!"
			src.HasLeftLeg = 1
			src.LeftLegHP = 10
			src.LeftLeg = "Mangled"
			src.LimbLoss()
	if(src.HasRightLeg == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their right leg back!"
			src.HasRightLeg = 1
			src.RightLegHP = 10
			src.RightLeg = "Mangled"
			src.LimbLoss()
	spawn(600) Regen()
mob/proc/Pregnancy()
	if(src.Spider == 0)
		src.PregnancyCount = 1
		spawn(3600)
			src.PregnancyCount = 0
			return
	if(src.Spider == 1)
		src.PregnancyCount = 1
		spawn(1800)
			src.PregnancyCount = 0
			return
mob/verb/MusicOff()
	usr << sound(null)
mob/verb/StopAll()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		M.Target = null
		if(M.BowOn == 1 && M.PracticeSkill == 0)
			M.PracticeSkill = 1
			spawn(50)
				M.BowOn = 0
				M.PracticeSkill = 0
mob/proc/Close()
	if(src.Up == 0)
		src.Up = 1
		Building(src)
		return
	else
		src.Up = 0
		for(var/obj/HUD/H in src.client.screen)
			del(H)
mob/verb/Ignore()
	var/T = input("Ignore/Un-Ignore who?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.key)
				if(S.ckey in usr.IgnoreList)
					S << "[usr] has removed you from their ignore list!<br>"
					usr << "You remove [S] from your ignore list<br>"
					usr.IgnoreList -= S.ckey
				else
					S << "[usr] has put you on their ignore list!<br>"
					usr << "You put [S] on your ignore list<br>"
					usr.IgnoreList += S.ckey
mob/verb/Test()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.CanBuild  == 0)
			usr << "One or more of the units you have selected can not build."
			return
		if(M.IsMist  == 1)
			usr << "Cant build while misted!"
			return
	if(usr.CanBuild == 1)
		if(usr.Up == 0)
			usr.Up = 1
			Building(usr)
			return
		else
			usr.Up = 0
			for(var/obj/HUD/H in usr.client.screen)
				del(H)
mob/verb/MindFlayer()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Illithid  == 0)
			usr << "One or more of the units you have selected can not use mental abilities."
			return
		if(M.IsMist  == 1)
			usr << "Cant use while misted!"
			return
	if(usr.Up == 0)
		usr.Up = 1
		MindPower(usr)
		return
	else
		usr.Up = 0
		for(var/obj/HUD/H in usr.client.screen)
			del(H)

mob
	proc
		Stations()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.StationMenu()//Creates the OSI Background







		StationMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/Smelt = new/obj/HUD/ClickSmelt(usr.client)
				var/obj/Forge = new/obj/HUD/ClickForge(usr.client)
				var/obj/Carp = new/obj/HUD/ClickCarp(usr.client)
				var/obj/Potion = new/obj/HUD/ClickPotion(usr.client)
				var/obj/Pos = new/obj/HUD/ClickPos(usr.client)
				var/obj/Mas = new/obj/HUD/ClickMas(usr.client)
				var/obj/Glass = new/obj/HUD/ClickGlass(usr.client)
				var/obj/Kit = new/obj/HUD/ClickKit(usr.client)
				var/obj/Let = new/obj/HUD/ClickLet(usr.client)
				var/obj/Gem = new/obj/HUD/ClickGem(usr.client)
				var/obj/Bone = new/obj/HUD/ClickBone(usr.client)
				var/obj/Melt = new/obj/HUD/ClickMelt(usr.client)
				H.screen_loc = "3,17 to 17,4"
				usr.Text(usr,3,17,4,13,"--Work Stations Menu--")
				if(M.LizardMan == 1 || M.Race == "Elf")
					if(M.Race == "Elf")
						Potion.screen_loc = "4,14"
						usr.Text(usr,6,14,4,10,"PotionStation - Wood")
						Smelt.screen_loc = "11,16"
						usr.Text(usr,13,16,4,10,"Smelter - Stone")
						Forge.screen_loc = "11,14"
						usr.Text(usr,13,14,4,10,"Forge - Stone")
						Glass.screen_loc = "11,12"
						usr.Text(usr,13,12,4,10,"GlassForge - Stone")
					else
						Bone.screen_loc = "4,14"
						usr.Text(usr,6,14,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"PoisonCraft - Wood")
					Let.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Leather - Wood")
					Carp.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Carpentry - Wood")
					Melt.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Melter - Stone")
				if(M.Gremlin == 1)
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Melt.screen_loc = "11,10"
					usr.Text(usr,13,10,4,10,"Melter - Stone")
				if(M.Goblin == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Potion.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"PotionStation - Wood")
					Glass.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"GlassForge - Stone")
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Let.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"Leather - Wood")
					Gem.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"GemCraft - Stone")
					Pos.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"PoisonCraft - Wood")
					Bone.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"BoneCraft - Wood")
					Melt.screen_loc = "11,10"
					usr.Text(usr,13,10,4,10,"Melter - Stone")
				if(M.Dwarf == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Kit.screen_loc = "4,8"
					usr.Text(usr,6,8,8,10,"Kitchen - Wood")
					Let.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Leather - Wood")
					Gem.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"GemCraft - Stone")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Vampire == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Gem.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"GemCraft - Stone")
					Pos.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"PoisonCraft - Wood")
					Bone.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"BoneCraft - Wood")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Gargoyle == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Gem.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"GemCraft - Stone")
					Pos.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"PoisonCraft - Wood")
					Bone.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"BoneCraft - Wood")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Human == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Potion.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"PotionStation - Wood")
					Glass.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"GlassForge - Stone")
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Kit.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"Kitchen - Wood")
					Let.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Leather - Wood")
					Gem.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"GemCraft - Stone")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Svartalfar == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Potion.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"PotionStation - Wood")
					Glass.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"GlassForge - Stone")
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Kit.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"Kitchen - Wood")
					Let.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Leather - Wood")
					Gem.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"GemCraft - Stone")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Kobold == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Bone.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Ratmen == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Bone.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Race == "Orc")
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Bone.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Race == "Naga")
					Smelt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"Forge - Stone")
					Bone.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"PoisonCraft - Wood")
					Let.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Leather - Wood")
					Carp.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Carpentry - Wood")
					Melt.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Melter - Stone")




mob
	proc
		FarmLand()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.FarmMenu()//Creates the OSI Background







		FarmMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Farm = new/obj/HUD/ClickFarm(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Farm Menu--")
				if(M.Human == 1)
					Farm.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"FarmLand - Humans")

mob
	proc
		Stairs()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.StairMenu()//Creates the OSI Background







		StairMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Stair = new/obj/HUD/ClickStair(usr.client)
				var/obj/Stair2 = new/obj/HUD/ClickStair2(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Stair Menu--")
				if(M.LizardMan == 0)
					Stair.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"Stairs")
				if(M.LizardMan == 1)
					Stair2.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BambooStairs")

mob
	proc
		Traps()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.TrapMenu()//Creates the OSI Background







		TrapMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Trap = new/obj/HUD/ClickTraps(usr.client)
				var/obj/StoneTrap = new/obj/HUD/ClickStoneFall(usr.client)
				var/obj/RibTrap = new/obj/HUD/ClickRibTrap(usr.client)
				var/obj/BST = new/obj/HUD/ClickBSTTrap(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Trap Menu--")
				Trap.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"Pit Trap")
				StoneTrap.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneFall Trap")
				if(M.Kobold == 1)
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
				if(M.Ratmen == 1)
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
				if(M.Goblin == 1)
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")

mob
	proc
		Floors()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.FloorMenu()//Creates the OSI Background







		FloorMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/WoodFloor = new/obj/HUD/ClickWoodFloor(usr.client)
				var/obj/OrcFloor = new/obj/HUD/ClickOrcFloor(usr.client)
				var/obj/TribalFloor = new/obj/HUD/ClickTribalFloor(usr.client)
				var/obj/StoneFloor = new/obj/HUD/ClickStoneFloor(usr.client)
				var/obj/BoneFloor = new/obj/HUD/ClickBoneFloor(usr.client)
				var/obj/DigChannel = new/obj/HUD/ClickDigChannel(usr.client)
				var/obj/Dest = new/obj/HUD/ClickDestroy(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Floor Menu--")
				if(usr.CanBuild == 1)
					if(M.LizardMan == 1)
						TribalFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"TribalFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
						BoneFloor.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneFloor")
					if(M.Race == "Orc")
						OrcFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodenFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Goblin == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						BoneFloor.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneFloor")
						Dest.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"DestroyFloor")
					if(M.Dwarf == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
						DigChannel.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"DigChannel")
					if(M.Human == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Gargoyle == 1)
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Illithid == 1)
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.SandWorker == 1)
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Gremlin == 1)
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Kobold == 1)
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Ratmen == 1)
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Vampire == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Svartalfar == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")

mob
	proc
		Bridge()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.BridgeMenu()//Creates the OSI Background







		BridgeMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/TribalBridge = new/obj/HUD/ClickTribalBridge(usr.client)
				var/obj/StoneBridge = new/obj/HUD/ClickStoneBridge(usr.client)
				var/obj/WoodBridge = new/obj/HUD/ClickWoodBridge(usr.client)
				var/obj/WoodOrcBridge = new/obj/HUD/ClickWoodOrcBridge(usr.client)
				var/obj/BoneBridge = new/obj/HUD/ClickBoneBridge(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Bridge Menu--")
				if(M.Vampire == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
					BoneBridge.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"BoneBridge")
				if(M.Svartalfar == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
					BoneBridge.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"BoneBridge")
				if(M.LizardMan == 1)
					TribalBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"TribalBridge")
				if(M.Goblin == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
					BoneBridge.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"BoneBridge")
				if(M.Dwarf == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
				if(M.Human == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
				if(M.Kobold == 1)
					BoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneBridge")
				if(M.Ratmen == 1)
					BoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneBridge")
				if(M.Race == "Orc")
					WoodOrcBridge.screen_loc = "5,13"
					usr.Text(usr,7,11,4,10,"WoodBridge")
				if(M.Race == "Elf")
					WoodBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodBridge")
mob
	proc
		Walls()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.WallMenu()//Creates the OSI Background







		WallMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/WoodWall = new/obj/HUD/ClickWoodWall(usr.client)
				var/obj/ElfWall = new/obj/HUD/ClickElfWall(usr.client)
				var/obj/OrcWall = new/obj/HUD/ClickOrcWall(usr.client)
				var/obj/TribalWall = new/obj/HUD/ClickTribalWall(usr.client)
				var/obj/StoneWall = new/obj/HUD/ClickStoneWall(usr.client)
				var/obj/BoneWall = new/obj/HUD/ClickBoneWall(usr.client)
				var/obj/SecretWall = new/obj/HUD/ClickSecretWall(usr.client)
				var/obj/Detail = new/obj/HUD/ClickDetail(usr.client)
				var/obj/ArrowSlit = new/obj/HUD/ClickArrowSlit(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Wall Menu--")
				if(M.Vampire == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
					BoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"BoneWall")
					StoneWall.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"StoneWall")
					SecretWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"SecretWall")
				if(M.Svartalfar == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
					BoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"BoneWall")
					StoneWall.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"StoneWall")
					SecretWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"SecretWall")
				if(M.Gargoyle == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
					BoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"BoneWall")
					StoneWall.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"StoneWall")
					SecretWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"SecretWall")
				if(M.Goblin == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
				if(M.Race == "Orc")
					OrcWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
				if(M.LizardMan == 1)
					TribalWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"TribalWall")
					BoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"BoneWall")
				if(M.Human == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
					ArrowSlit.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"ArrowSlit")
				if(M.SandWorker == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneWall")
				if(M.Dwarf == 1)
					WoodWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodWall")
				if(M.Kobold == 1)
					BoneWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneWall")
				if(M.Race == "Elf")
					ElfWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"ElfWall")
					ArrowSlit.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"ArrowSlit")
				if(M.Ratmen == 1)
					BoneWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneWall")
				if(M.Goblin == 1)
					BoneWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneWall")
				if(M.Kobold == 0)
					if(M.Human == 1)
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
					if(M.SandWorker == 1)
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
					if(M.Goblin == 1)
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
					if(M.Dwarf == 1)
						StoneWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneWall")
					if(M.Illithid == 1)
						StoneWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneWall")
				if(M.Vampire == 0)
					if(M.Kobold == 1)
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,7,4,10,"SecretWall")
					if(M.LizardMan == 1)
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
					if(M.Race == "Orc")
						SecretWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"SecretWall")
					if(M.Kobold == 0)
						if(M.LizardMan == 0)
							if(M.Race != "Orc")
								SecretWall.screen_loc = "5,9"
								usr.Text(usr,7,9,4,10,"SecretWall")
				if(M.Dwarf == 1)
					Detail.screen_loc = "11,13"
					usr.Text(usr,12,13,4,10,"Detail")
mob
	proc
		MindPower()//This is the proc that creates the OSI
			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.MindMenu()//Creates the OSI Background







		MindMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Illithid == 1)
					var/obj/H = new/obj/HUD/Middle2(usr.client)
					var/obj/O = new/obj/HUD/TopLeft(usr.client)
					var/obj/A = new/obj/HUD/TopRight(usr.client)
					var/obj/B = new/obj/HUD/BottomLeft(usr.client)
					var/obj/C = new/obj/HUD/BottomRight(usr.client)
					var/obj/D = new/obj/HUD/TopMiddle(usr.client)
					var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
					var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
					var/obj/G = new/obj/HUD/RightMiddle(usr.client)
					var/obj/Wall = new/obj/HUD/Forcefield(usr.client)
					var/obj/Telekinesis = new/obj/HUD/Telekinesis(usr.client)
					var/obj/Mindcontrol = new/obj/HUD/Mindcontrol(usr.client)
					var/obj/Pyrokinesis = new/obj/HUD/Pyrokinesis(usr.client)
					var/obj/ReadMind = new/obj/HUD/ReadMind(usr.client)
					var/obj/Warp = new/obj/HUD/Warp(usr.client)
					//var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
					//var/obj/Br = new/obj/HUD/B(usr.client)
					//var/obj/Dec = new/obj/HUD/Dec(usr.client)
					var/obj/Scrying = new/obj/HUD/Scrying(usr.client)
					H.screen_loc = "4,14 to 14,4"
					O.screen_loc = "4,14"
					A.screen_loc = "14,14"
					B.screen_loc = "4,4"
					C.screen_loc = "14,4"
					D.screen_loc = "4,14 to 14,14"
					E.screen_loc = "4,4 to 14,4"
					F.screen_loc = "4,4 to 4,14"
					G.screen_loc = "14,4 to 14,14"
					usr.Text(usr,4,14,4,10,"--Mindcraft Menu--")
					Wall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"Forcefield")
					Telekinesis.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"Telekinesis")
					Mindcontrol.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"Mindcontrol")
					Pyrokinesis.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"Pyrokinesis")
					ReadMind.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"Read Mind")
					Warp.screen_loc = "11,13"
					usr.Text(usr,12,13,4,10,"Warp")
					//SpiderStairs.screen_loc = "11,7"
					//usr.Text(usr,12,7,4,10,"Stairs")
					//if(M.icon == 'SpiderQueenMature.dmi')
					Scrying.screen_loc = "11,11"
					usr.Text(usr,13,11,4,10,"Scrying")
mob
	proc
		Building()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.BuildingMenu()//Creates the OSI Background







		BuildingMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				if(M.density == 1)
					if(M.Spider == 1)
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/SilkWall(usr.client)
						var/obj/SpiderStairs = new/obj/HUD/SpiderStairs(usr.client)
						var/obj/Trap = new/obj/HUD/SpiderTrap(usr.client)
						var/obj/Post = new/obj/HUD/Post(usr.client)
						var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
						var/obj/Br = new/obj/HUD/B(usr.client)
						var/obj/Dec = new/obj/HUD/Dec(usr.client)
						var/obj/Lair = new/obj/HUD/Lair(usr.client)
						H.screen_loc = "4,14 to 14,4"
						O.screen_loc = "4,14"
						A.screen_loc = "14,14"
						B.screen_loc = "4,4"
						C.screen_loc = "14,4"
						D.screen_loc = "4,14 to 14,14"
						E.screen_loc = "4,4 to 14,4"
						F.screen_loc = "4,4 to 4,14"
						G.screen_loc = "14,4 to 14,14"
						usr.Text(usr,4,14,4,10,"--Build Menu--")
						Wall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"SilkWall")
						Trap.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StickyTrap")
						Post.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SilkPost")
						Cacoon.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Cacoon")
						Br.screen_loc = "5,5"
						usr.Text(usr,7,5,4,10,"SilkBridge")
						Dec.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Decorations")
						SpiderStairs.screen_loc = "11,7"
						usr.Text(usr,12,7,4,10,"Stairs")
						if(M.icon == 'SpiderQueenMature.dmi')
							Lair.screen_loc = "11,11"
							usr.Text(usr,13,11,4,10,"Lair")
					if(M.Race == "Devourer")
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/ClickDevourerWall(usr.client)
						var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
						var/obj/Trap = new/obj/HUD/ClickCacoonTrap(usr.client)
						var/obj/Bonecraft = new/obj/HUD/BuiltInBonecraft(usr.client)
						var/obj/Cacoon = new/obj/HUD/CreateZombieCacoon(usr.client)
						var/obj/Organ = new/obj/HUD/CreateOrgan(usr.client)
						var/obj/Improve = new/obj/HUD/ImproveDevourer(usr.client)
						var/obj/Lair = new/obj/HUD/ClickDevourerFloor(usr.client)
						H.screen_loc = "4,14 to 14,4"
						O.screen_loc = "4,14"
						A.screen_loc = "14,14"
						B.screen_loc = "4,4"
						C.screen_loc = "14,4"
						D.screen_loc = "4,14 to 14,14"
						E.screen_loc = "4,4 to 14,4"
						F.screen_loc = "4,4 to 4,14"
						G.screen_loc = "14,4 to 14,14"
						usr.Text(usr,4,14,4,10,"--Build Menu--")
						Wall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"FleshWall")
						Trap.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"Trap")
						Bonecraft.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"Bonecraft")
						Cacoon.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Cacoon")
						Organ.screen_loc = "5,5"
						usr.Text(usr,7,5,4,10,"Organ")
						Improve.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Enhance")
						Stairs.screen_loc = "11,7"
						usr.Text(usr,12,7,4,10,"Stairs")
						Lair.screen_loc = "11,11"
						usr.Text(usr,13,11,4,10,"Floor")
					if(M.Spider == 0 && M.Race != "Devourer")
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/Walls(usr.client)
						var/obj/Floor = new/obj/HUD/Floors(usr.client)
						var/obj/Bridge = new/obj/HUD/Bridges(usr.client)
						var/obj/Trap = new/obj/HUD/Traps(usr.client)
						var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
						var/obj/Stations = new/obj/HUD/Stations(usr.client)
						var/obj/Farming = new/obj/HUD/Farming(usr.client)
						var/obj/Fire = new/obj/HUD/ClickFire(usr.client)
						H.screen_loc = "4,14 to 14,4"
						O.screen_loc = "4,14"
						A.screen_loc = "14,14"
						B.screen_loc = "4,4"
						C.screen_loc = "14,4"
						D.screen_loc = "4,14 to 14,14"
						E.screen_loc = "4,4 to 14,4"
						F.screen_loc = "4,4 to 4,14"
						G.screen_loc = "14,4 to 14,14"
						usr.Text(usr,4,14,4,10,"--Build Menu--")
						Wall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"Walls")
						Floor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"Floors")
						Bridge.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"Bridges")
						Trap.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Traps")
						Stairs.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Stairs")
						Stations.screen_loc = "11,11"
						usr.Text(usr,12,11,4,10,"Stations")
						Farming.screen_loc = "11,9"
						usr.Text(usr,12,9,4,10,"Farming")
						Fire.screen_loc = "11,7"
						usr.Text(usr,12,7,4,10,"CampFire")

mob/verb/WayPoint()
	if(usr.User == 1)
		var/list/menu = new()
		menu += "Goto WayPoint"
		menu += "Goto WayPoint2"
		menu += "Goto WayPoint3"
		menu += "Set WayPoint"
		menu += "Set WayPoint2"
		menu += "Set WayPoint3"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Goto WayPoint")
			if(usr.Restart == 0)
				usr.loc = usr.Waypoint
		if (Result == "Goto WayPoint2")
			if(usr.Restart == 0)
				usr.loc = usr.Waypoint2
		if (Result == "Goto WayPoint3")
			if(usr.Restart == 0)
				usr.loc = usr.Waypoint3
		if (Result == "Set WayPoint")
			usr.Waypoint = usr.loc
			usr << "Way Point Set!"
		if (Result == "Set WayPoint2")
			usr.Waypoint2 = usr.loc
			usr << "Way Point Set!"
		if (Result == "Set WayPoint3")
			usr.Waypoint3 = usr.loc
			usr << "Way Point Set!"
mob/verb/Reboot()
	set hidden = 1
	if(src.GM == 1)
		world << "<b><font color=red> World Rebooting!!"
		sleep(50)
		world.Reboot()
mob/verb/Restart()
	usr.Restarts()
mob/proc/Restarts()
	if(usr.Up == 1)
		usr.Close()
		usr.Up = 0
	if(usr.Restart == 1)
		return
	usr.Done = 0
	usr.Restart = 1
	var/choice2 = alert(usr, "Are you sure you want to restart?", "Choose", "No", "Yes", null)
	if (choice2 == null)
		usr.Restart = 0
		usr.Done = 1
	if (choice2 == "No")
		usr.Restart = 0
	if (choice2 == "Yes")
		usr.Function = null
		usr.Using = null
		usr.Waypoint = null
		usr.Waypoint2 = null
		usr.Waypoint3 = null
		if(client)
			for(var/mob/Monsters/M in usr.Selected)
				usr.Selected.Remove(M)

			for(var/mob/Monsters/M in world)
				if(M.Owner == usr)
					for(var/obj/DigAt/DD in world)
						if(DD.Owner == M.Owner)
							for(var/turf/T in DD.loc)
								if(T.density == 1)
									if(T.IsWall == 0)
										T.icon_state = "CaveWall"
								del(DD)
					for(var/obj/Items/I in M)
						if(I.Content3 == "Cage")
							I.loc = M.loc
							I.suffix = null
					for(var/obj/Items/Shafts/Standard/II in M)
						II.loc = M.loc
						II.suffix = null
					if(M.Caged == 1)
						if(M.Vampire == 0 && M.Gargoyle == 0 && M.SandKing == 0 && M.Werewolf == 0 && M.Svartalfar == 0 && M.Infects == 0 && M.Queen == 0)
							M.CanBeSlaved = 1
							M.Owner = null
							usr.UnitList -= M
						else
							del(M)
					else
						del(M)
			for(var/mob/WorkShops/CampFires/GoodAltar/AG in world)
				if(AG.Owner == usr)
					del(AG)
			for(var/mob/WorkShops/CampFires/EvilAltar/AE in world)
				if(AE.Owner == usr)
					del(AE)
			for(var/mob/WorkShops/CampFires/NeutralAltar/AN in world)
				if(AN.Owner == usr)
					del(AN)
			usr.HasQueen = 0
			usr.HasKing = 0
			usr.QueenLeader = null
			usr.KingLeader = null
			usr.UnitList = null
			usr.UnitCap = 0
			usr.AltarCount = 0
			usr.UnitList = list()
			usr.Done = 1
			usr.User = 1
			usr.Restart = 1
			usr.IsGoodGod = 0
			usr.IsEvilGod = 0
			usr.IsNeutralGod = 0
			usr.AdventureMode = 0
			usr.icon = 'Player.dmi'
			usr.WorshipPoints = 0
			usr.verbs-=typesof(/EvilGod/verb/)
			usr.verbs-=typesof(/GoodGod/verb/)
			usr.verbs-=typesof(/NeutralGod/verb/)
			var/X3
			var/Y3
			X3 = rand(350,700)
			Y3 = rand(400,750)
			usr.loc = locate(X3,Y3,1)
			usr.density = 0
			if(usr.LoggedIn == 0)
				usr.LoggedIn = 1
			var/list/menu = new()
			if("Gargoyle" in usr.Rares)
				menu += "Gargoyle - Rare"
			if("Plantmen" in usr.Rares)
				menu += "Plantmen - Rare"
			if("Dragons" in usr.Rares)
				menu += "Dragons"
			if("Illithids" in usr.Rares)
				menu += "Illithid"
			menu += "Naga"
			menu += "Elves"
			menu += "Ratmen"
			menu += "Kobolds"
			menu += "Gremlins"
			menu += "Orcs"
			menu += "Goblins"
			menu += "Dwarfs"
			menu += "Humans"
			menu += "LizardMen"
			menu += "FrogMen"
			menu += "Spiders"
			menu += "Cancel"
			var/Result = input("Which Race Would You Like To Play?", "Choose", null) in menu
			if (Result == "Cancel")
				usr.Restart = 0
				return
			if(Result == "Devourer")
				var/mob/Monsters/DevourerCacoon/C = new
				var/LocX = rand(250,990)
				var/LocY = rand(780,350)
				C.loc = locate(LocX,LocY,1)
				C.Owner = usr
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("Awoken after Two Thousand years in slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to break away from your cacoon and bring about a second coming of the dreaded Plague of Black Blight!")
				return
			if(Result == "Angel of Death")
				var/mob/Monsters/AngelOfDeath/C = new
				C.loc = locate(440,800,3)
				C.Owner = usr
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				return
			if(Result == "Dragons")
				var/mob/Monsters/Dragon/C = new
				var/X2 = rand(250,990)
				var/Y2 = rand(350,780)
				C.loc = locate(X2,Y2,1)
				C.Owner = usr
				C.name = "{[usr]} Dragon"
				C.PillarPowerup()
				usr.Race = "Dragons"
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("Travelling far from your hatching ground you have arrived in this new land to make your home.")
				return
			if (Result == "Gremlins")
				var/X2 = rand(250,990)
				var/Y2 = rand(780,350)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				usr.Race = "Gremlins"
				var/mob/Monsters/PlayerGremlin/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Age = 20
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight += M.weight
				var/mob/Monsters/PlayerGremlin/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight += M2.weight
				B2.Age = 15
				var/mob/Monsters/PlayerGremlin/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/M3 = new
				M3.loc = B3
				M3.suffix = "(Carrying)"
				B3.weight += M3.weight
				B3.Age = 15
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("Gremlin tribe rise from land to make big eat, eat big, shaman say eat... grem grem... gremlins.. good.. water..")
				usr << "Gremlins breed by fishing until they clone themselves, they eat ANYTHING NOT EQUIPPED IN THEIR INVENTORY, they craft using a MELTER STATION."
				del X
			if (Result == "Naga")
				var/X2 = rand(250,990)
				var/Y2 = rand(780,350)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				usr.Race = "Naga"

				var/mob/Monsters/Naga/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 30
				var/obj/Items/Weapons/Spears/Spear/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/mob/Monsters/Naga/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight = 30
				B2.Age = 20
				var/obj/Items/Weapons/Spears/Spear/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.Gender = "Female"
				var/mob/Monsters/Naga/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/f = new
				f.loc = B3
				f.suffix = "(Carrying)"
				B3.weight = 30
				var/obj/Items/Weapons/Spears/Spear/f2 = new
				f2.M = "Metal"
				f2.CraftRank = "Poor Quality"
				f2.MetalWeaponCraft()
				f2.loc = B3
				f2.suffix = "(Carrying)"
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				B.Birth()
				B2.Birth()
				B3.Birth()
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("Nagas have been risen from the deserts, destined to take over this land, you must succeed or your God will not be happy.")
				del X
			if(Result == "Evil God - Rare")
				usr.Race = "Evil God"
				usr.verbs+=typesof(/EvilGod/verb/)
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				usr.IsEvilGod = 1
				usr.sight = 30
				usr.icon = 'UnholyShield.dmi'
				usr.WorshipPoints += 50
				alert("You have awoken out of the darkest depths of the cosmos to fulfill your purpose, not understandable by mortals... yet you need their power... (Convince someone to sacrifice to you on an Evil Altar.)")
				return
			if(Result == "Good God - Rare")
				usr.Race = "Good God"
				usr.verbs+=typesof(/GoodGod/verb/)
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				usr.IsGoodGod = 1
				usr.sight = 30
				usr.icon = 'HolyShield.dmi'
				usr.WorshipPoints += 50
				alert("You have awoken out of the heavens above to smite evil and protect the weak, yet you also need help... (Convince someone to pray to you on a Good Altar.)")
				return
			if(Result == "Neutral God - Rare")
				usr.Race = "Neutral God"
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				usr.IsNeutralGod = 1
				usr.sight = 30
				usr.icon = 'NeutralGod.dmi'
				alert("You have become a god... But which side will you pick? (Go to either a Evil Altar or a Good Alter to choose the side you wish to join.)")
				return
			if(Result == "Plantmen - Rare")
				var/mob/Monsters/Plantman/C = new
				var/LocX = rand(350,700)
				var/LocY = rand(350,700)
				C.loc = locate(LocX,LocY,1)
				C.Owner = usr
				usr.Race = "Plantmen"
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("Plantmen are territorial, aggressive, evil, and do not move much, they dislike all -Animal- species such as Humans, Orcs, Kobolds, etc. They do not care one way or the other for such non-living things as Vampires, Gargoyles, Devourers, etc.")
				return
			if(Result == "Werewolf - Rare")
				var/mob/Monsters/Werewolf/C = new
				var/LocX = rand(300,800)
				var/LocY = rand(350,500)
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/L1 = new
				var/obj/Items/Armours/Legs/LeatherLeggings/L2 = new
				var/obj/Items/Furniture/Beds/SleepingBag/L3 = new
				var/obj/Items/Weapons/Picks/PickAxe/L4 = new
				L1.loc = C
				L2.loc = C
				L3.loc = C
				L4.loc = C
				L1.suffix = "(Carrying)"
				L2.suffix = "(Carrying)"
				L3.suffix = "(Carrying)"
				L4.suffix = "(Carrying)"
				C.weight += L1.weight
				C.weight += L2.weight
				C.weight += L3.weight
				C.weight += L4.weight
				C.loc = locate(LocX,LocY,1)
				C.Owner = usr
				C.weight += L3.weight
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("You were recently infected with Lycanthropy by an odd creature that attacked you in the night.... You began to realize your transformation and departed from your village to save yourself from your angry neighbors.")
				return
			if(Result == "Gargoyle - Rare")
				var/mob/Monsters/Gargoyle/C = new
				var/LocX = rand(350,999)
				var/LocY = rand(350,500)
				C.loc = locate(LocX,LocY,1)
				C.Owner = usr
				C.overlays += /obj/wing3/
				C.name = "{[usr]} Gargoyle"
				C.PillarPowerup()
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				return
			if (Result == "Svartalfar")
				usr.Race = "Svartalfar"
				var/X2
				var/Y2
				X2 = rand(300,850)
				Y2 = rand(150,800)
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,2)
				X.loc = locate(X2,Y2,2)
				var/mob/Monsters/Svartalfar/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "None"
				B.Age = 20
				B.name = "{[B.Owner]} Svartalfar"
				usr.UnitList += B
				var/obj/Items/Armours/ChestPlates/RedRobe/M1 = new
				M1.loc = B
				M1.suffix = "(Carrying)"
				var/obj/Items/Armours/Helmets/RedHat/M2 = new
				M2.loc = B
				M2.suffix = "(Carrying)"
				var/obj/Items/Weapons/Maces/NecroStaff/M3 = new
				M3.loc = B
				M3.suffix = "(Carrying)"
				var/obj/Items/Food/Meats/UnCookedMeat/M4 = new
				M4.loc = B
				M4.suffix = "(Carrying)"
				for(var/turf/grounds/cavefloor/C in view(1,B))
					C.icon_state = "CaveFloor"
					C.CanDigAt = 0
					C.opacity = 0
					C.density = 0
				B.Birth()
				B.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("A Dark God of another land has destroyed your family, and cursed you with longevity and power, only to warp your appearance and seperate you from the rest of mankind.")
				del X
			if(Result == "Sand Kings - Rare")
				var/mob/Monsters/SandKing/C = new
				var/LocX = rand(1,999)
				var/LocY = rand(1,999)
				C.loc = locate(LocX,LocY,2)
				C.Owner = usr
				for(var/turf/grounds/B in view(1,C))
					B.icon_state = "CaveFloor"
					B.CanDigAt = 0
					B.opacity = 0
					B.density = 0
					B.name = "cavefloor"
					B.icon = 'Cave.dmi'
					B.Sky = 1
					B.Content3 = "CanClimb"
					B.OIcon = "CaveFloor"
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				alert("You hatch in an odd place, completely unaware of your surroundings at first, you begin to realize you are one of the Sand Kings, in larva form, You must create tool bodies for yourself and become mature if you wish to survive... You seem to realize you will need a Castle to protect your fragile form.")
				return
			if(Result == "Illithid")
				var/mob/Monsters/ElderBrain/C = new
				var/LocX = rand(1,999)
				var/LocY = rand(1,999)
				C.loc = locate(LocX,LocY,2)
				C.Owner = usr
				C.name = "{[usr.name]} Elder Brain"
				for(var/turf/grounds/B in view(1,C))
					B.icon_state = "CaveFloor"
					B.CanDigAt = 0
					B.opacity = 0
					B.density = 0
					B.name = "cavefloor"
					B.icon = 'Cave.dmi'
					B.Sky = 1
					B.Content3 = "CanClimb"
					B.OIcon = "CaveFloor"
				usr.loc = C.loc
				usr.UnitList += C
				usr.Done = 1
				usr.User = 1
				usr.Restart = 0
				usr.Race = "Illithids"
				usr << "<font color=red>Illithid guide - F6 to use mind powers, if you do not have an F6 key type MindFlayer into the command bar or make a macro, Mind Worms are all you can create at first, go find an NPC or player to mind control and walk it back to the elder brain, then select the elder brain and click I, Closest Creature, Illithid Spawn |targethere| to turn it into an Illithid, Illithids eat brains and use mental powers."
				alert("You are an Elder Brain of the Illithids, your first action should be to create a Mind Worm to bring live bodies for you to implant the illithid tadpoles into...")
				return
			if (Result == "Adventure Mode")
				usr.icon = null
				usr.User = 0
				var/list/menu2 = new()
				menu2 += "New"
				var/Result2 = input("Which Race Would You Like To Play?", "Choose", null) in menu2
				if (Result2 == "Cancel")
					return
				if (Result2 == "New")
					var/list/menu4 = new()
					menu4 += "Kobold"
					menu4 += "Orc"
					menu4 += "Goblin"
					menu4 += "Dwarf"
					menu4 += "Human"
					menu4 += "LizardMan"
					var/Result4 = input("Which Race Would You Like To Play?", "Choose", null) in menu4
					if (Result4 == "Cancel")
						return
					if (Result4 == "Orc")
						usr.Race = "Orc - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/Orc/K = new
						if (choice == "Male")
							K.icon = 'OrcMale.dmi'
							K.Gender = "Male"
							M = 1
						if (choice == "Female")
							K.Gender = "Female"
							K.icon = 'OrcFemale.dmi'
							M = 0
						var/X2 = rand(350,500)
						var/Y2 = rand(350,500)
						var/Z2 = 1
						usr.loc = locate(X2,Y2,Z2)
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Food/Meats/UnCookedMeat/T = new
						T.loc = K
						T.suffix = "(Carrying)"
						K.weight += T.weight
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.M = "Metal"
						P.CraftRank = "Poor Quality"
						P.MetalWeaponCraft()
						P.loc = K
						P.suffix = "(Carrying)"
						K.weight += P.weight
						var/obj/Items/Weapons/Axes/MetalOrcAxe/A = new
						A.M = "Metal"
						A.CraftRank = "Poor Quality"
						A.MetalWeaponCraft()
						A.loc = K
						A.suffix = "(Carrying)"
						K.weight += A.weight
						K.Birth()
						usr.Done = 1
						usr.User = 1
					if (Result4 == "LizardMan")
						var/X1 = rand(1,999)
						var/Y1 = rand(1,999)
						var/Z1 = 1
						usr.loc = locate(X1,Y1,Z1)
						usr.Race = "LizardMan - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/LizardMan/K = new
						if (choice == "Male")

							K.icon = 'LizardMan.dmi'
							K.icon_state = "Normal"
							K.Gender = "Male"
						if (choice == "Female")

							K.icon = 'LizardWoman.dmi'
							K.icon_state = "Normal"
							K.Gender = "Female"
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Weapons/Spears/Spear/D = new
						D.M = "Metal"
						D.CraftRank = "Poor Quality"
						D.MetalWeaponCraft()
						D.loc = K
						D.suffix = "(Carrying)"
						K.weight += D.weight
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = K
						SB.suffix = "(Carrying)"
						var/obj/Items/Food/Meats/UnCookedMeat/M = new
						M.loc = K
						K.weight += M.weight
						M.suffix = "(Carrying)"
						K.Birth()
						usr.Done = 1
						usr.User = 1
					if (Result4 == "Goblin")
						usr.Race = "Goblin - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/Goblin/K = new
						if (choice == "Male")

							K.icon = 'Goblins.dmi'
							K.icon_state = "Normal"
							K.Gender = "Male"
						if (choice == "Female")

							K.icon = 'FemaleGoblin.dmi'
							K.icon_state = "Normal"
							K.Gender = "Female"
						var/X2 = rand(350,500)
						var/Y2 = rand(350,500)
						var/Z2 = 1
						usr.loc = locate(X2,Y2,Z2)
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Weapons/Spears/Spear/D = new
						D.M = "Metal"
						D.CraftRank = "Poor Quality"
						D.MetalWeaponCraft()
						D.loc = K
						D.suffix = "(Carrying)"
						K.weight += D.weight
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.loc = K
						P.suffix = "(Carrying)"
						K.weight += P.weight
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = K
						SB.suffix = "(Carrying)"
						var/obj/Items/Food/Meats/UnCookedMeat/M = new
						M.loc = K
						K.weight += M.weight
						M.suffix = "(Carrying)"
						K.Birth()
						usr.Done = 1
						usr.User = 1
					if (Result4 == "Kobold")
						usr.Race = "Kobold - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/Kobold/K = new
						if (choice == "Male")

							K.icon = 'Kobold.dmi'
							K.icon_state = "Normal"
							K.Gender = "Male"
						if (choice == "Female")

							K.icon = 'FemaleKobold.dmi'
							K.icon_state = "Normal"
							K.Gender = "Female"
						var/X2 = rand(350,500)
						var/Y2 = rand(350,500)
						var/Z2 = 1
						usr.loc = locate(X2,Y2,Z2)
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Weapons/Spears/Spear/D = new
						D.M = "Metal"
						D.CraftRank = "Poor Quality"
						D.MetalWeaponCraft()
						D.loc = K
						D.suffix = "(Carrying)"
						K.weight += D.weight
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = K
						SB.suffix = "(Carrying)"
						var/obj/Items/Food/Meats/UnCookedMeat/M = new
						M.loc = K
						K.weight += M.weight
						M.suffix = "(Carrying)"
						K.Birth()
						usr.Done = 1
						usr.User = 1
					if (Result4 == "Dwarf")
						usr.Race = "Dwarf - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/Dwarf/K = new
						var/M
						if (choice == "Male")
							K.icon = 'Human.dmi'
							K.Gender = "Male"
							M = 1
						if (choice == "Female")
							K.icon = 'FemaleHuman.dmi'
							K.Gender = "Female"

							M = 0
						if(M == 1)

							K.icon_state = "Normal"
						if(M == 0)
							K.icon = 'FemaleHuman.dmi'

							K.icon_state = "Normal"
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Food/CookedMeats/Tomato/T = new
						T.loc = K
						T.suffix = "(Carrying)"
						K.weight += T.weight
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.M = "Metal"
						P.CraftRank = "Poor Quality"
						P.MetalWeaponCraft()
						P.loc = K
						P.suffix = "(Carrying)"
						K.weight += P.weight
						var/obj/Items/Weapons/Axes/MetalAxe/A = new
						A.M = "Metal"
						A.CraftRank = "Poor Quality"
						A.MetalWeaponCraft()
						A.loc = K
						A.suffix = "(Carrying)"
						K.weight += A.weight
						var/obj/Items/Weapons/Daggers/MetalDagger/D = new
						D.M = "Metal"
						D.CraftRank = "Poor Quality"
						D.MetalWeaponCraft()
						D.loc = K
						D.suffix = "(Carrying)"
						K.weight += D.weight
						var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
						Z.CraftRank = "Poor Quality"
						Z.loc = K
						Z.Defence = 1
						K.Defence += 1
						K.WearingLegs = 1
						Z.suffix = "(Equiped)"
						K.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = K
						SB.suffix = "(Carrying)"
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
						Z2.CraftRank = "Poor Quality"
						Z2.loc = K
						Z2.Defence = 1
						K.Defence += 1
						K.WearingChest = 1
						Z2.suffix = "(Equiped)"
						K.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						K.Birth()
						usr.Done = 1
						usr.User = 1
					if (Result4 == "Human")
						usr.Race = "Human - Adventure Mode"
						var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
						var/mob/Monsters/Human/K = new
						var/M
						if (choice == "Male")
							K.icon = 'Human.dmi'
							K.Gender = "Male"
							M = 1
						if (choice == "Female")
							K.Gender = "Female"
							K.icon = 'FemaleHuman.dmi'
							M = 0
						if(M == 1)

							K.icon_state = "Normal"
						if(M == 0)
							K.icon = 'FemaleHuman.dmi'

							K.icon_state = "Normal"
						if(M == 1)
							if(K.Black == 1)
								K.icon = 'HumanBlack.dmi'
								K.icon_state = "Normal"
						if(M == 0)
							if(K.Black == 1)
								K.icon = 'FemaleHumanBlack.dmi'
								K.icon_state = "Normal"
						K.loc = usr.loc
						K.Age = 18
						K.Strength += 5
						K.Agility += 5
						K.Defence += 5
						K.weightmax += 25
						K.AdventureMode = 1
						usr.Selected.Add(K)
						K.Owner = usr
						usr.UnitList += K
						var/obj/Items/Food/CookedMeats/Tomato/T = new
						T.loc = K
						T.suffix = "(Carrying)"
						K.weight += T.weight
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.M = "Metal"
						P.CraftRank = "Poor Quality"
						P.MetalWeaponCraft()
						P.loc = K
						P.suffix = "(Carrying)"
						K.weight += P.weight
						var/obj/Items/Weapons/Axes/MetalAxe/A = new
						A.M = "Metal"
						A.CraftRank = "Poor Quality"
						A.MetalWeaponCraft()
						A.loc = K
						A.suffix = "(Carrying)"
						K.weight += A.weight
						var/obj/Items/Weapons/Daggers/MetalDagger/D = new
						D.M = "Metal"
						D.CraftRank = "Poor Quality"
						D.MetalWeaponCraft()
						D.loc = K
						D.suffix = "(Carrying)"
						K.weight += D.weight
						var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
						Z.CraftRank = "Poor Quality"
						Z.loc = K
						Z.Defence = 1
						K.Defence += 1
						K.WearingLegs = 1
						Z.suffix = "(Equiped)"
						K.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = K
						SB.suffix = "(Carrying)"
						K.weight += SB.weight
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
						Z2.CraftRank = "Poor Quality"
						Z2.loc = K
						Z2.Defence = 1
						K.Defence += 1
						K.WearingChest = 1
						Z2.suffix = "(Equiped)"
						K.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						K.Birth()
						usr.Done = 1
						usr.User = 1
			if (Result == "DarkLord")
				var/mob/Monsters/DarkKnight/B = new
				B.loc = usr.loc
				B.Owner = usr
				B.Gender = null
				B.Age = 150
				B.icon_state = "Normal"
				usr.UnitList += B
				B.Birth()
				usr.Done = 1
				usr.User = 1
			if (Result == "Spiders")
				usr.Race = "Spiders"
				var/X2 = rand(350,600)
				var/Y2 = rand(350,600)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				var/mob/Monsters/SpiderQueen/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Female"
				B.Age = 20
				B.icon_state = "Normal"
				B.name = "{[B.Owner]} Spider Queen"
				B.AdventureMode = 1
				usr.UnitList += B
				B.Birth()
				B.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("After many weeks of travel from your old nests you arive at new lands, ready to create a new swarm, you begin to locate a suitable area for your hatchlings.")
				del X
			if (Result == "Vampire - Rare")
				usr.Race = "Vampires"
				var/X2
				var/Y2
				X2 = rand(1,999)
				Y2 = rand(1,999)
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,2)
				X.loc = locate(X2,Y2,2)
				var/mob/Monsters/Vampire/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "None"
				B.HasWings = 1
				B.overlays += /obj/wing1/
				B.Age = 20
				B.name = "{[B.Owner]} Vampire"
				usr.UnitList += B
				for(var/turf/grounds/cavefloor/C in view(1,B))
					C.icon_state = "CaveFloor"
					C.CanDigAt = 0
					C.opacity = 0
					C.density = 0
				B.Birth()
				usr.Done = 1
				usr.User = 1
				alert("Created in the very deepest darkest regions of hell, vampires live a cursed exsistence, created by the dark gods for thier amusement you hunger for the blood of the living. You are a vampire lord, one of the strongest vampires to walk this land, and this is your new feeding ground.")
				alert("After your un-holy creation the dark gods summon you into a mountain cave. Confused and dazed, with nothing but your hunger for blood, you awake in the birth place of your kind, the coven....")
				del X
			if (Result == "LizardMen")
				var/X2 = rand(182,364)
				var/Y2 = rand(686,788)
				var/Z1 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z1)
				X.loc = locate(X2,Y2,Z1)
				usr.Race = "LizardMen"

				var/mob/Monsters/LizardMan/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.icon = 'LizardMan.dmi'
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 30
				var/obj/Items/Weapons/Spears/Spear/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/mob/Monsters/LizardMan/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight = 30
				B2.Age = 20
				var/obj/Items/Weapons/Spears/Spear/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.Gender = "Female"
				B2.icon = 'LizardWoman.dmi'
				var/mob/Monsters/LizardMan/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/f = new
				f.loc = B3
				f.suffix = "(Carrying)"
				B3.weight = 30
				var/obj/Items/Weapons/Spears/Spear/f2 = new
				f2.M = "Metal"
				f2.CraftRank = "Poor Quality"
				f2.MetalWeaponCraft()
				f2.loc = B3
				f2.suffix = "(Carrying)"
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				B3.icon = 'LizardMan.dmi'
				usr.Done = 1
				usr.User = 1
				alert("Native to this land the lizardmen live a harsh life in a horrific enviroment, disturbed by the other races your lizardmen decide to hunt down and kill the inruders so that this land may be yours once more.")
				del X
			if (Result == "FrogMen")
				var/X2 = rand(182,364)
				var/Y2 = rand(686,788)
				var/Z1 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z1)
				X.loc = locate(X2,Y2,Z1)
				usr.Race = "FrogMen"

				var/mob/Monsters/Frogmen/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.icon = 'FrogMan.dmi'
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 30
				var/obj/Items/Weapons/Spears/Spear/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/mob/Monsters/Frogmen/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight = 30
				B2.Age = 20
				var/obj/Items/Weapons/Spears/Spear/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.Gender = "Female"
				B2.icon = 'FrogMan.dmi'
				var/mob/Monsters/Frogmen/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/f = new
				f.loc = B3
				f.suffix = "(Carrying)"
				B3.weight = 30
				var/obj/Items/Weapons/Spears/Spear/f2 = new
				f2.M = "Metal"
				f2.CraftRank = "Poor Quality"
				f2.MetalWeaponCraft()
				f2.loc = B3
				f2.suffix = "(Carrying)"
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				B3.icon = 'FrogMan.dmi'
				usr.Done = 1
				usr.User = 1
				alert("You are one of the tribes of FrogMen, by nature you are mortal enemies of the LizardMen who wish to take back your land.")
				del X
			if (Result == "Elves")
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				usr.Race = "Elves"
				var/mob/Monsters/Elf/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20

				var/obj/Items/Food/Meats/UnCookedMeat/SD = new
				SD.loc = B
				SD.suffix = "(Carrying)"
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[Safe_Guard(B.Owner)]"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Armours/Shields/WoodenBuckler/A1 = new
				A1.M = "Metal"
				A1.CraftRank = "Poor Quality"
				A1.MetalArmourCraft()
				A1.loc = B
				A1.suffix = "(Carrying)"
				B.weight = 75
				var/mob/Monsters/Elf/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				B2.Gender = "Female"
				B2.Age = 20
				B2.icon = 'Female Elf.dmi'
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				B2.icon_state = "Normal"
				M2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				usr.UnitList += B2
				var/obj/Items/Weapons/Picks/PickAxe/P2 = new
				P2.M = "Metal"
				P2.CraftRank = "Poor Quality"
				P2.MetalWeaponCraft()
				P2.loc = B2
				P2.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/WoodenAxe/s = new
				s.M = "Metal"
				s.CraftRank = "Poor Quality"
				s.MetalWeaponCraft()
				s.loc = B2
				s.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalArmourCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.weight = 75
				var/mob/Monsters/Elf/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				var/obj/Items/Food/Meats/UnCookedMeat/M3 = new
				M3.loc = B3
				M3.suffix = "(Carrying)"
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Weapons/Picks/PickAxe/P3 = new
				P3.M = "Metal"
				P3.CraftRank = "Poor Quality"
				P3.MetalWeaponCraft()
				P3.loc = B3
				P3.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/WoodenAxe/w = new
				w.M = "Metal"
				w.CraftRank = "Poor Quality"
				w.MetalWeaponCraft()
				w.loc = B3
				w.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A3 = new
				A3.M = "Metal"
				A3.CraftRank = "Poor Quality"
				A3.MetalArmourCraft()
				A3.loc = B3
				A3.suffix = "(Carrying)"
				B3.weight = 75
				B.icon_state = "Normal"
				B2.icon_state = "Normal"
				B3.icon_state = "Normal"
				B.icon = 'Elf.dmi'
				B2.icon = 'Female Elf.dmi'
				B3.icon = 'Elf.dmi'
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				del X
			if (Result == "Orcs")
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				usr.Race = "Orcs"
				var/mob/Monsters/Orc/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20

				var/obj/Items/Food/Meats/UnCookedMeat/SD = new
				SD.loc = B
				SD.suffix = "(Carrying)"
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[Safe_Guard(B.Owner)]"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Weapons/Picks/PickAxe/P = new
				P.M = "Metal"
				P.CraftRank = "Poor Quality"
				P.MetalWeaponCraft()
				P.loc = B
				P.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalOrcAxe/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A1 = new
				A1.M = "Metal"
				A1.CraftRank = "Poor Quality"
				A1.MetalArmourCraft()
				A1.loc = B
				A1.suffix = "(Carrying)"
				B.weight = 75
				var/mob/Monsters/Orc/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				B2.Gender = "Female"
				B2.Age = 20
				B2.icon = 'OrcFemale.dmi'
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				B2.icon_state = "Normal"
				M2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				usr.UnitList += B2
				var/obj/Items/Weapons/Picks/PickAxe/P2 = new
				P2.M = "Metal"
				P2.CraftRank = "Poor Quality"
				P2.MetalWeaponCraft()
				P2.loc = B2
				P2.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalOrcAxe/s = new
				s.M = "Metal"
				s.CraftRank = "Poor Quality"
				s.MetalWeaponCraft()
				s.loc = B2
				s.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalArmourCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.weight = 75
				var/mob/Monsters/Orc/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				var/obj/Items/Food/Meats/UnCookedMeat/M3 = new
				M3.loc = B3
				M3.suffix = "(Carrying)"
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Weapons/Picks/PickAxe/P3 = new
				P3.M = "Metal"
				P3.CraftRank = "Poor Quality"
				P3.MetalWeaponCraft()
				P3.loc = B3
				P3.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalOrcAxe/w = new
				w.M = "Metal"
				w.CraftRank = "Poor Quality"
				w.MetalWeaponCraft()
				w.loc = B3
				w.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A3 = new
				A3.M = "Metal"
				A3.CraftRank = "Poor Quality"
				A3.MetalArmourCraft()
				A3.loc = B3
				A3.suffix = "(Carrying)"
				B3.weight = 75
				B.icon_state = "Normal"
				B2.icon_state = "Normal"
				B3.icon_state = "Normal"
				B.icon = 'OrcMale.dmi'
				B2.icon = 'OrcFemale.dmi'
				B3.icon = 'OrcMale.dmi'
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("Forever have the orcs roamed the lands of this world in nomadic tribes, searching for the perfect place to settle down. Upon reaching [WorldName] the orcs decided they liked it and soon discovered others did also, as the leader of your orc tribe you must decide which races, if any, are worthy of staying in your land and who should be removed, for if you are to create the perfect tribe there can be no room for weakness!")
				del X
			if (Result == "Humans")
				usr.Race = "Humans"
				switch(alert("Black humans or white humans?","**Racist Selection**","Black","White"))
					if("Black")
						var/mob/Monsters/Human/B = new
						var/X2 = rand(350,700)
						var/Y2 = rand(400,750)
						var/Z2 = 1
						var/mob/Monsters/Avatar/X = new
						usr.loc = locate(X2,Y2,Z2)
						X.loc = locate(X2,Y2,Z2)
						B.loc = X.loc
						B.Owner = usr
						B.Gender = "Male"
						B.Age = 20
						var/obj/Items/Food/CookedMeats/CookedMeat/SD = new
						SD.loc = B
						SD.suffix = "(Carrying)"
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = B
						SB.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
						Z.CraftRank = "Poor Quality"
						Z.loc = B
						Z.Defence = 1
						B.Defence += 1
						B.WearingLegs = 1
						Z.suffix = "(Equiped)"
						B.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z9 = new
						Z9.CraftRank = "Poor Quality"
						Z9.loc = B
						Z9.Defence = 1
						B.Defence += 1
						B.WearingChest = 1
						Z9.suffix = "(Equiped)"
						B.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
						if(!T)
							if(B.Owner)
								B.name = "{[Safe_Guard(B.Owner)]"
						else
							if(B.Owner)
								B.name = "{[B.Owner]} [T]"
						usr.UnitList += B
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.M = "Metal"
						P.CraftRank = "Poor Quality"
						P.MetalWeaponCraft()
						P.loc = B
						P.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/A = new
						A.M = "Metal"
						A.CraftRank = "Poor Quality"
						A.MetalWeaponCraft()
						A.loc = B
						A.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/A2 = new
						A2.M = "Metal"
						A2.CraftRank = "Poor Quality"
						A2.MetalWeaponCraft()
						A2.loc = B
						A2.suffix = "(Carrying)"
						B.weight = 95
						var/mob/Monsters/Human/B2 = new
						B2.loc = locate(X.x+1,X.y,X.z)
						B2.Owner = usr
						B2.Gender = "Female"
						B2.Age = 20
						var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
						SB2.loc = B2
						SB2.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z3 = new
						Z3.CraftRank = "Poor Quality"
						Z3.loc = B2
						Z3.Defence = 1
						B2.Defence += 1
						B2.WearingLegs = 1
						Z3.suffix = "(Equiped)"
						B2.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z4 = new
						Z4.CraftRank = "Poor Quality"
						Z4.loc = B2
						Z4.Defence = 1
						B2.Defence += 1
						B2.WearingChest = 1
						Z4.suffix = "(Equiped)"
						B2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/obj/Items/Food/CookedMeats/CookedMeat/M2 = new
						M2.loc = B2
						if(B2.Black == 1)
							B2.icon = 'FemaleHumanBlack.dmi'
						else
							B2.icon = 'FemaleHuman.dmi'
						B2.icon_state = "Normal"
						M2.suffix = "(Carrying)"
						var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
						if(!T2)
							B2.name = "{[B2.Owner]}"
						else
							B2.name = "{[B.Owner]} [T2]"
						usr.UnitList += B2
						var/obj/Items/Weapons/Picks/PickAxe/P2 = new
						P2.M = "Metal"
						P2.CraftRank = "Poor Quality"
						P2.MetalWeaponCraft()
						P2.loc = B2
						P2.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/s = new
						s.M = "Metal"
						s.CraftRank = "Poor Quality"
						s.MetalWeaponCraft()
						s.loc = B2
						s.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/s2 = new
						s2.M = "Metal"
						s2.CraftRank = "Poor Quality"
						s2.MetalWeaponCraft()
						s2.loc = B2
						s2.suffix = "(Carrying)"
						B2.weight = 90
						var/mob/Monsters/Human/B3 = new
						B3.loc = locate(X.x+2,X.y,X.z)
						B3.Owner = usr
						B3.Gender = "Male"
						B3.Age = 20
						var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
						SB3.loc = B3
						SB3.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z5 = new
						Z5.CraftRank = "Poor Quality"
						Z5.loc = B3
						Z5.Defence = 1
						B3.Defence += 1
						B3.WearingLegs = 1
						Z5.suffix = "(Equiped)"
						B3.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z6 = new
						Z6.CraftRank = "Poor Quality"
						Z6.loc = B3
						Z6.Defence = 1
						B3.Defence += 1
						B3.WearingChest = 1
						Z6.suffix = "(Equiped)"
						B3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/obj/Items/Food/CookedMeats/CookedMeat/M3 = new
						M3.loc = B3
						M3.suffix = "(Carrying)"
						var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
						if(!T3)
							B3.name = "{[B3.Owner]}"
						else
							B3.name = "{[B.Owner]} [T3]"
						usr.UnitList += B3
						var/obj/Items/Weapons/Picks/PickAxe/P3 = new
						P3.M = "Metal"
						P3.CraftRank = "Poor Quality"
						P3.MetalWeaponCraft()
						P3.loc = B3
						P3.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/w = new
						w.M = "Metal"
						w.CraftRank = "Poor Quality"
						w.MetalWeaponCraft()
						w.loc = B3
						w.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/w2 = new
						w2.M = "Metal"
						w2.CraftRank = "Poor Quality"
						w2.MetalWeaponCraft()
						w2.loc = B3
						w2.suffix = "(Carrying)"
						B3.weight = 90
						if(B.Black == 1)
							B.icon = 'HumanBlack.dmi'
						else
							B.icon = 'Human.dmi'
						if(B3.Black == 1)
							B3.icon = 'HumanBlack.dmi'
						else
							B3.icon = 'Human.dmi'
						B.icon_state = "Normal"
						B2.icon_state = "Normal"
						B3.icon_state = "Normal"
						B.AdventureMode = 1
						B2.AdventureMode = 1
						B3.AdventureMode = 1
						B.Birth()
						B2.Birth()
						B3.Birth()
						B.icon = 'HumanBlack.dmi'
						B2.icon = 'FemaleHumanBlack.dmi'
						B3.icon = 'HumanBlack.dmi'
						B.Black = 1
						B2.Black = 1
						B3.Black = 3
						B.PillarPowerup()
						B2.PillarPowerup()
						B3.PillarPowerup()
						usr.Done = 1
						usr.User = 1
						alert("As part of the Human empire you were ordered to scout out new lands suitable for settlements, it now looks although your search has come to an end! it might be best if you set up camp for the winter ahead.")
						del X
					if("White")
						var/mob/Monsters/Human/B = new
						var/X2 = rand(350,700)
						var/Y2 = rand(400,750)
						var/Z2 = 1
						var/mob/Monsters/Avatar/X = new
						usr.loc = locate(X2,Y2,Z2)
						X.loc = locate(X2,Y2,Z2)
						B.loc = X.loc
						B.Owner = usr
						B.Gender = "Male"
						B.Age = 20
						var/obj/Items/Food/CookedMeats/CookedMeat/SD = new
						SD.loc = B
						SD.suffix = "(Carrying)"
						var/obj/Items/Furniture/Beds/SleepingBag/SB = new
						SB.loc = B
						SB.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
						Z.CraftRank = "Poor Quality"
						Z.loc = B
						Z.Defence = 1
						B.Defence += 1
						B.WearingLegs = 1
						Z.suffix = "(Equiped)"
						B.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z9 = new
						Z9.CraftRank = "Poor Quality"
						Z9.loc = B
						Z9.Defence = 1
						B.Defence += 1
						B.WearingChest = 1
						Z9.suffix = "(Equiped)"
						B.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
						if(!T)
							if(B.Owner)
								B.name = "{[Safe_Guard(B.Owner)]"
						else
							if(B.Owner)
								B.name = "{[B.Owner]} [T]"
						usr.UnitList += B
						var/obj/Items/Weapons/Picks/PickAxe/P = new
						P.M = "Metal"
						P.CraftRank = "Poor Quality"
						P.MetalWeaponCraft()
						P.loc = B
						P.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/A = new
						A.M = "Metal"
						A.CraftRank = "Poor Quality"
						A.MetalWeaponCraft()
						A.loc = B
						A.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/A2 = new
						A2.M = "Metal"
						A2.CraftRank = "Poor Quality"
						A2.MetalWeaponCraft()
						A2.loc = B
						A2.suffix = "(Carrying)"
						B.weight = 95
						var/mob/Monsters/Human/B2 = new
						B2.loc = locate(X.x+1,X.y,X.z)
						B2.Owner = usr
						B2.Gender = "Female"
						B2.Age = 20
						var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
						SB2.loc = B2
						SB2.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z3 = new
						Z3.CraftRank = "Poor Quality"
						Z3.loc = B2
						Z3.Defence = 1
						B2.Defence += 1
						B2.WearingLegs = 1
						Z3.suffix = "(Equiped)"
						B2.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z4 = new
						Z4.CraftRank = "Poor Quality"
						Z4.loc = B2
						Z4.Defence = 1
						B2.Defence += 1
						B2.WearingChest = 1
						Z4.suffix = "(Equiped)"
						B2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/obj/Items/Food/CookedMeats/CookedMeat/M2 = new
						M2.loc = B2
						if(B2.Black == 1)
							B2.icon = 'FemaleHumanBlack.dmi'
						else
							B2.icon = 'FemaleHuman.dmi'
						B2.icon_state = "Normal"
						M2.suffix = "(Carrying)"
						var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
						if(!T2)
							B2.name = "{[B2.Owner]}"
						else
							B2.name = "{[B.Owner]} [T2]"
						usr.UnitList += B2
						var/obj/Items/Weapons/Picks/PickAxe/P2 = new
						P2.M = "Metal"
						P2.CraftRank = "Poor Quality"
						P2.MetalWeaponCraft()
						P2.loc = B2
						P2.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/s = new
						s.M = "Metal"
						s.CraftRank = "Poor Quality"
						s.MetalWeaponCraft()
						s.loc = B2
						s.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/s2 = new
						s2.M = "Metal"
						s2.CraftRank = "Poor Quality"
						s2.MetalWeaponCraft()
						s2.loc = B2
						s2.suffix = "(Carrying)"
						B2.weight = 90
						var/mob/Monsters/Human/B3 = new
						B3.loc = locate(X.x+2,X.y,X.z)
						B3.Owner = usr
						B3.Gender = "Male"
						B3.Age = 20
						var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
						SB3.loc = B3
						SB3.suffix = "(Carrying)"
						var/obj/Items/Armours/Legs/LeatherLeggings/Z5 = new
						Z5.CraftRank = "Poor Quality"
						Z5.loc = B3
						Z5.Defence = 1
						B3.Defence += 1
						B3.WearingLegs = 1
						Z5.suffix = "(Equiped)"
						B3.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
						var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z6 = new
						Z6.CraftRank = "Poor Quality"
						Z6.loc = B3
						Z6.Defence = 1
						B3.Defence += 1
						B3.WearingChest = 1
						Z6.suffix = "(Equiped)"
						B3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
						var/obj/Items/Food/CookedMeats/CookedMeat/M3 = new
						M3.loc = B3
						M3.suffix = "(Carrying)"
						var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
						if(!T3)
							B3.name = "{[B3.Owner]}"
						else
							B3.name = "{[B.Owner]} [T3]"
						usr.UnitList += B3
						var/obj/Items/Weapons/Picks/PickAxe/P3 = new
						P3.M = "Metal"
						P3.CraftRank = "Poor Quality"
						P3.MetalWeaponCraft()
						P3.loc = B3
						P3.suffix = "(Carrying)"
						var/obj/Items/Weapons/Axes/MetalAxe/w = new
						w.M = "Metal"
						w.CraftRank = "Poor Quality"
						w.MetalWeaponCraft()
						w.loc = B3
						w.suffix = "(Carrying)"
						var/obj/Items/Weapons/Daggers/MetalDagger/w2 = new
						w2.M = "Metal"
						w2.CraftRank = "Poor Quality"
						w2.MetalWeaponCraft()
						w2.loc = B3
						w2.suffix = "(Carrying)"
						B3.weight = 90
						if(B.Black == 1)
							B.icon = 'HumanBlack.dmi'
						else
							B.icon = 'Human.dmi'
						if(B3.Black == 1)
							B3.icon = 'HumanBlack.dmi'
						else
							B3.icon = 'Human.dmi'
						B.icon_state = "Normal"
						B2.icon_state = "Normal"
						B3.icon_state = "Normal"
						B.AdventureMode = 1
						B2.AdventureMode = 1
						B3.AdventureMode = 1
						B.Birth()
						B2.Birth()
						B3.Birth()
						B.icon = 'Human.dmi'
						B2.icon = 'FemaleHuman.dmi'
						B3.icon = 'Human.dmi'
						B.Black = 0
						B2.Black = 0
						B3.Black = 0
						B.PillarPowerup()
						B2.PillarPowerup()
						B3.PillarPowerup()
						usr.Done = 1
						usr.User = 1
						alert("As part of the Human empire you were ordered to scout out new lands suitable for settlements, it now looks although your search has come to an end! it might be best if you set up camp for the winter ahead.")
						del X
			if (Result == "Dwarfs")
				usr.Race = "Dwarfs"
				var/mob/Monsters/Dwarf/B = new
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/obj/Items/Food/CookedMeats/CookedMeat/SD = new
				SD.loc = B
				SD.suffix = "(Carrying)"
				var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
				Z.CraftRank = "Poor Quality"
				Z.loc = B
				Z.Defence = 1
				B.Defence += 1
				B.WearingLegs = 1
				Z.suffix = "(Equiped)"
				B.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z9 = new
				Z9.CraftRank = "Poor Quality"
				Z9.loc = B
				Z9.Defence = 1
				B.Defence += 1
				B.WearingChest = 1
				Z9.suffix = "(Equiped)"
				B.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Weapons/Picks/PickAxe/P = new
				P.M = "Metal"
				P.CraftRank = "Poor Quality"
				P.MetalWeaponCraft()
				P.loc = B
				P.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalAxe/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/obj/Items/Weapons/Daggers/MetalDagger/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B
				A2.suffix = "(Carrying)"
				B.weight = 95
				var/mob/Monsters/Dwarf/B2 = new
				B2.loc = locate(X.x+1,X.y,usr.z)
				B2.Owner = usr
				B2.Gender = "Female"
				B2.Age = 20
				B2.overlays -= 'Beards.dmi'
				B2.overlays -= 'BlackBeard.dmi'
				B2.overlays -= 'BrownBeard.dmi'
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/obj/Items/Armours/Legs/LeatherLeggings/Z3 = new
				Z3.CraftRank = "Poor Quality"
				Z3.loc = B2
				Z3.Defence = 1
				B2.Defence += 1
				B2.WearingLegs = 1
				Z3.suffix = "(Equiped)"
				B2.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z4 = new
				Z4.CraftRank = "Poor Quality"
				Z4.loc = B2
				Z4.Defence = 1
				B2.Defence += 1
				B2.WearingChest = 1
				Z4.suffix = "(Equiped)"
				B2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
				var/obj/Items/Food/CookedMeats/CookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.icon_state = "Normal"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				usr.UnitList += B2
				var/obj/Items/Weapons/Picks/PickAxe/P2 = new
				P2.M = "Metal"
				P2.CraftRank = "Poor Quality"
				P2.MetalWeaponCraft()
				P2.loc = B2
				P2.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalAxe/s = new
				s.M = "Metal"
				s.CraftRank = "Poor Quality"
				s.MetalWeaponCraft()
				s.loc = B2
				s.suffix = "(Carrying)"
				var/obj/Items/Weapons/Daggers/MetalDagger/s2 = new
				s2.M = "Metal"
				s2.CraftRank = "Poor Quality"
				s2.MetalWeaponCraft()
				s2.loc = B2
				s2.suffix = "(Carrying)"
				B2.weight = 90
				var/mob/Monsters/Dwarf/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Armours/Legs/LeatherLeggings/Z5 = new
				Z5.CraftRank = "Poor Quality"
				Z5.loc = B3
				Z5.Defence = 1
				B3.Defence += 1
				B3.WearingLegs = 1
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				Z5.suffix = "(Equiped)"
				B3.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z6 = new
				Z6.CraftRank = "Poor Quality"
				Z6.loc = B3
				Z6.Defence = 1
				B3.Defence += 1
				B3.WearingChest = 1
				Z6.suffix = "(Equiped)"
				B3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
				var/obj/Items/Food/CookedMeats/CookedMeat/M3 = new
				M3.loc = B3
				M3.suffix = "(Carrying)"
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Weapons/Picks/PickAxe/P3 = new
				P3.M = "Metal"
				P3.CraftRank = "Poor Quality"
				P3.MetalWeaponCraft()
				P3.loc = B3
				P3.suffix = "(Carrying)"
				var/obj/Items/Weapons/Axes/MetalAxe/w = new
				w.M = "Metal"
				w.CraftRank = "Poor Quality"
				w.MetalWeaponCraft()
				w.loc = B3
				w.suffix = "(Carrying)"
				var/obj/Items/Weapons/Daggers/MetalDagger/w2 = new
				w2.M = "Metal"
				w2.CraftRank = "Poor Quality"
				w2.MetalWeaponCraft()
				w2.loc = B3
				w2.suffix = "(Carrying)"
				B3.weight = 90
				B.icon = 'Human.dmi'
				B3.icon = 'Human.dmi'
				B2.icon = 'FemaleHuman.dmi'
				B.icon_state = "Normal"
				B3.icon_state = "Normal"
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("You and your companions have arived at the new un-explored lands, here many adventures and dangers await you. You should think about creating a secure place to live deep in the mountains, so that you may start to create a vast dwarven city.")
				del X
			if (Result == "Kobolds")
				usr.Race = "Kobolds"
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				var/mob/Monsters/Kobold/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 30
				var/obj/Items/Weapons/Spears/Spear/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/mob/Monsters/Kobold/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight = 30
				B2.Age = 20
				var/obj/Items/Weapons/Spears/Spear/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.Gender = "Female"
				var/mob/Monsters/Kobold/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/f = new
				f.loc = B3
				f.suffix = "(Carrying)"
				B3.weight = 30
				var/obj/Items/Weapons/Spears/Spear/f2 = new
				f2.M = "Metal"
				f2.CraftRank = "Poor Quality"
				f2.MetalWeaponCraft()
				f2.loc = B3
				f2.suffix = "(Carrying)"
				B3.Gender = "Male"
				B3.Age = 20
				B.icon = 'Kobold.dmi'
				B2.icon = 'FemaleKobold.dmi'
				B3.icon = 'Kobold.dmi'
				B.icon_state = "Normal"
				B2.icon_state = "Normal"
				B3.icon_state = "Normal"
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("Tempted by the un-found treasures of this new land you finally arive, it might be best to create a secure cave so that you may one day make a vast Kobold army to raid this land with.")
				del X
			if (Result == "Ratmen")
				usr.Race = "Ratmen"
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				var/mob/Monsters/Ratman/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				B.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 30
				var/obj/Items/Weapons/Spears/Spear/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/mob/Monsters/Ratman/B2 = new
				B2.loc = locate(usr.x+1,usr.y,usr.z)
				B2.Owner = usr
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				B2.icon_state = "Normal"
				usr.UnitList += B2
				var/obj/Items/Food/Meats/UnCookedMeat/M2 = new
				M2.loc = B2
				M2.suffix = "(Carrying)"
				B2.weight = 30
				B2.Age = 20
				var/obj/Items/Weapons/Spears/Spear/A2 = new
				A2.M = "Metal"
				A2.CraftRank = "Poor Quality"
				A2.MetalWeaponCraft()
				A2.loc = B2
				A2.suffix = "(Carrying)"
				B2.Gender = "Female"
				var/mob/Monsters/Ratman/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/f = new
				f.loc = B3
				f.suffix = "(Carrying)"
				B3.weight = 30
				var/obj/Items/Weapons/Spears/Spear/f2 = new
				f2.M = "Metal"
				f2.CraftRank = "Poor Quality"
				f2.MetalWeaponCraft()
				f2.loc = B3
				f2.suffix = "(Carrying)"
				B3.Gender = "Male"
				B3.Age = 10
				B.icon = 'Ratmen.dmi'
				B2.icon = 'Ratwomen.dmi'
				B3.icon = 'Ratmen.dmi'
				B.icon_state = "Normal"
				B2.icon_state = "Normal"
				B3.icon_state = "Normal"
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("Driven from your home by hordes of dangerous predators, you have arrived in this new land to propagate your kind... and eat cheese.")
				del X
			if (Result == "Goblins")
				usr.Race = "Goblins"
				var/X2 = rand(350,700)
				var/Y2 = rand(400,750)
				var/Z2 = 1
				var/mob/Monsters/Avatar/X = new
				usr.loc = locate(X2,Y2,Z2)
				X.loc = locate(X2,Y2,Z2)
				var/mob/Monsters/Goblin/B = new
				B.loc = X.loc
				B.Owner = usr
				B.Gender = "Male"
				var/obj/Items/Furniture/Beds/SleepingBag/SB = new
				SB.loc = B
				SB.suffix = "(Carrying)"
				var/obj/Items/Weapons/Picks/PickAxe/P = new
				P.M = "Metal"
				P.CraftRank = "Poor Quality"
				P.MetalWeaponCraft()
				P.loc = B
				P.suffix = "(Carrying)"
				var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
				if(!T)
					if(B.Owner)
						B.name = "{[B.Owner]}"
				else
					if(B.Owner)
						B.name = "{[B.Owner]} [T]"
				usr.UnitList += B
				var/obj/Items/Food/Meats/UnCookedMeat/M = new
				M.loc = B
				M.suffix = "(Carrying)"
				B.weight = 75
				B.Age = 20
				var/obj/Items/Weapons/Swords/GoblinSword/A = new
				A.M = "Metal"
				A.CraftRank = "Poor Quality"
				A.MetalWeaponCraft()
				A.loc = B
				A.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/A2 = new
				A2.M = "Wood"
				A2.CraftRank = "Poor Quality"
				A2.WoodArmourCraft()
				A2.loc = B
				A2.suffix = "(Carrying)"
				var/mob/Monsters/Goblin/B2 = new
				B2.loc = locate(X.x+1,X.y,X.z)
				B2.Owner = usr
				B2.Gender = "Female"
				B2.Age = 20
				var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
				SB2.loc = B2
				SB2.suffix = "(Carrying)"
				var/obj/Items/Weapons/Picks/PickAxe/P2 = new
				P2.M = "Metal"
				P2.CraftRank = "Poor Quality"
				P2.MetalWeaponCraft()
				P2.loc = B2
				P2.suffix = "(Carrying)"
				var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
				if(!T2)
					B2.name = "{[B2.Owner]}"
				else
					B2.name = "{[B.Owner]} [T2]"
				usr.UnitList += B2
				B2.icon_state = "Normal"
				var/obj/Items/Food/Meats/UnCookedMeat/g = new
				g.loc = B2
				g.suffix = "(Carrying)"
				B2.weight = 70
				var/obj/Items/Weapons/Spears/Spear/h = new
				h.M = "Metal"
				h.CraftRank = "Poor Quality"
				h.MetalWeaponCraft()
				h.loc = B2
				h.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/f = new
				f.M = "Wood"
				f.CraftRank = "Poor Quality"
				f.WoodArmourCraft()
				f.loc = B2
				f.suffix = "(Carrying)"
				var/mob/Monsters/Goblin/B3 = new
				B3.loc = locate(X.x+2,X.y,X.z)
				B3.Owner = usr
				B3.Gender = "Male"
				B3.Age = 20
				var/obj/Items/Weapons/Picks/PickAxe/P3 = new
				P3.M = "Metal"
				P3.CraftRank = "Poor Quality"
				P3.MetalWeaponCraft()
				P3.loc = B3
				P3.suffix = "(Carrying)"
				var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
				if(!T3)
					B3.name = "{[B3.Owner]}"
				else
					B3.name = "{[B.Owner]} [T3]"
				usr.UnitList += B3
				var/obj/Items/Food/Meats/UnCookedMeat/u = new
				u.loc = B3
				u.suffix = "(Carrying)"
				B3.weight = 75
				var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
				SB3.loc = B3
				SB3.suffix = "(Carrying)"
				var/obj/Items/Weapons/Swords/GoblinSword/j = new
				j.M = "Metal"
				j.CraftRank = "Poor Quality"
				j.MetalWeaponCraft()
				j.loc = B3
				j.suffix = "(Carrying)"
				var/obj/Items/Armours/Shields/WoodenBuckler/o = new
				o.M = "Wood"
				o.CraftRank = "Poor Quality"
				o.WoodArmourCraft()
				o.loc = B3
				o.suffix = "(Carrying)"
				B.icon = 'Goblins.dmi'
				B2.icon = 'FemaleGoblin.dmi'
				B3.icon = 'Goblins.dmi'
				B.icon_state = "Normal"
				B2.icon_state = "Normal"
				B3.icon_state = "Normal"
				B.AdventureMode = 1
				B2.AdventureMode = 1
				B3.AdventureMode = 1
				B.Birth()
				B2.Birth()
				B3.Birth()
				B.PillarPowerup()
				B2.PillarPowerup()
				B3.PillarPowerup()
				usr.Done = 1
				usr.User = 1
				alert("Lured to this land in the hopes of starting a dark dungeon you and your companions finally arive, it might be best to create a basic cave to get started with.")
				del X

		usr.Restart = 0

mob/proc/Plant2()
	for(var/mob/Monsters/M in oview(1,src))
		var/Chew = prob(75)
		if(Chew == 1)
			view() << "[src] spews corrosive posion spores into the air!!"
			M.BloodContent -= 25
			M.BloodLoss()
			M.LeftLungHP -= 15
			M.RightLungHP -= 15
	spawn(20) Plant2()
mob/proc/Plant1()
	for(var/mob/Monsters/M in oview(1,src))
		var/Chew = prob(75)
		if(Chew == 1)
			var/Arm = prob(50)
			if(Arm == 1)
				if(M.HasLeftArm == 1)
					if(M.WearingLeftArm == 0)
						M.HasLeftArm = 0
						M.LeftArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseLeftArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s left arm off!!"
						M.RemoveAllShields()
						M.RemoveAllLeft()
						for(var/obj/Items/Armours/Shields/S in M)
							if(S.suffix == "(Equiped)")
								S.suffix = null
								M.WearingShield = 0
								M.Defence -= S.Defence
								M.RemoveAllShields()
								S.loc = M.loc
								view() <<"<b><font color=red>[M]'s left arm is torn off!, they drop their shield!"
						if(M.HasRightArm == 0)
							M.Crippled = 1
			if(Arm == 0)
				if(M.HasRightArm == 1)
					if(M.WearingRightArm == 0)
						M.HasRightArm = 0
						M.RightArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseRightArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s right arm off!!"
						M.RemoveAllWeapons()
						M.RemoveAllRight()
						for(var/obj/Items/Weapons/S in M)
							if(S.suffix == "(Equiped)")
								S.suffix = null
								M.HoldingWeapon = 0
								M.WeaponDamageMin -= S.WeaponDamageMin
								M.WeaponDamageMax -= S.WeaponDamageMax
								M.RemoveAllWeapons()
								S.loc = M.loc
								view() <<"<b><font color=red>[M]'s right arm is torn off!, they drop their weapon!"
						if(M.HasLeftArm == 0)
							M.Crippled = 1
	spawn(20) Plant1()


mob/verb/SendMSG(var/mob/M in Players, msg as text)
	set hidden = 1
	if(M.User == 1)
		if(usr.ckey in M.IgnoreList)
			usr << "You are on [M]'s ignore list<br>"
			return
	usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PM>[M]</a>:</font color> [html_encode(msg)]"
	M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
	for(var/mob/D in Players2)
		if(D != M && D != usr)
			if(D.GM == 1 && D.DE == 1)
				D<<"<b><font color=silver>[usr] sent to [M]:</font color> [msg]"
mob/verb/AddAlly()
	var/T = input("Set who as an ally?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in Players2)
			if(T == S.key)
				if(S.User == 1)
					if(S.key in usr.AllyList)
						usr << "This person is already your ally"
						return
					else
						usr.AllyList += S.key
						usr << "You have added [S] to your allies list, your units will no longer attack [S]'s unless you remove him/her from your ally list."
						S << "[usr] has added you to their ally list"
mob/verb/RemoveAlly()
	var/T=input("Which ally would you like to remove?")as null|anything in AllyList
	if(!T)
		..()
	else
		for(var/mob/S in Players2)
			if(T == S.key)
				if(S.User == 1)
					if(S.key in usr.AllyList)
						usr.AllyList -= S.key
						usr << "You have removed [S] from your allies list, your units can now attack his/her units."
						S << "[usr] has removed you from their ally list"
mob/verb/AdminLogs()
	var/list/menu6 = new()
	menu6 += "Read Log"
	menu6 += "Delete Log"
	var/Result = input("Choose", "Choose", null) in menu6
	if(Result == "Read Log")
		usr<<browse(file("Logs/Adminlog.html"))
	if(Result == "Delete Log")
		if(usr.key == "Jazora")
			fdel("Logs/Adminlog.html")
		else
			usr << "You are un-able to delete the admin log."
			if(usr.GM == 1)
				if(usr.key != "Nerserus2")
					Log_admin("[usr] tries to delete the admin log.")
mob/verb/Mute()
	set hidden = 1
	if(usr.GM == 1)
		var/T = input("Mute who??")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					var/reason
					reason = input("Reason","Your Name",reason)
					if(S.Muted == 0)
						S << "[reason]"
						world << "[S] was muted"
						S.Muted = 1
						return
					if(S.Muted == 1)
						world << "[S] was un-muted"
						S.Muted = 0
						return


mob/verb/CertainUnit()
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





mob/verb/DeclareLeader()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Spider == 1)
			return
		if(M.UsesPoison == 1)
			for(var/obj/Items/Armours/Helmets/BoneCrown/C in M)
				if(C in M)
					var/choice = alert(usr, "Are you sure you want to make [M] your King/Queen?", "Choose", "Yes", "No", null)
					if (choice == "Yes")
						if(M.Gender == "Female")
							if(usr.HasQueen == 0)
								usr.HasQueen = 1
								M.Defence += C.Defence
								M.HasQueen = 1
								M.overlays += /obj/Items/Armours/Helmets/BoneCrown/
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PoisonSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10

								usr.QueenLeader = M
								if(M.Gender == "Female")
									M.name = "Queen [M.name]"
								C.suffix = "( Wearing )"
								break
						if(M.Gender == "Male")
							if(usr.HasKing == 0)
								usr.HasKing = 1
								M.Defence += C.Defence
								M.HasKing = 1
								M.overlays += /obj/Items/Armours/Helmets/BoneCrown/
								usr.KingLeader = M
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PoisonSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10
								if(M.Gender == "Male")
									M.name = "King [M.name]"
								C.suffix = "( Wearing )"
								break

				else
					usr << "Need a Gold Crown First!"
		if(M.UsesPoison == 0)
			for(var/obj/Items/Armours/Helmets/Crown/C in M)
				if(C in M)
					var/choice = alert(usr, "Are you sure you want to make [M] your King/Queen?", "Choose", "Yes", "No", null)
					if (choice == "Yes")
						if(M.Gender == "Female")
							if(usr.HasQueen == 0)
								usr.HasQueen = 1
								M.Defence += C.Defence
								M.HasQueen = 1
								M.overlays += /obj/Items/Armours/Helmets/Crown/
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PoisonSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10

								usr.QueenLeader = M
								if(M.Gender == "Female")
									M.name = "Queen [M.name]"
								C.suffix = "( Wearing )"
								break
						if(M.Gender == "Male")
							if(usr.HasKing == 0)
								usr.HasKing = 1
								M.Defence += C.Defence
								M.HasKing = 1
								M.overlays += /obj/Items/Armours/Helmets/Crown/
								usr.KingLeader = M
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PoisonSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10
								if(M.Gender == "Male")
									M.name = "King [M.name]"
								C.suffix = "( Wearing )"
								break

				else
					usr << "Need a Gold Crown First!"

mob/verb/Who()
	var/PlayerCount
	usr << "<font color = red size = 4>((-Players Online-))"
	for (var/mob/M in world)
		if(M.client)
			if(M.Content2 != "Invisible")
				PlayerCount ++
				usr << "--<font color = purple>[M]"
			else if(usr.key == "Jazora")
				PlayerCount ++
				usr << "--<font color = red>[M.key] - Invisible"
	usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"
mob/verb/Check_Clan_Members()
	for(var/mob/M in Players2)
		if(M.Faction == usr.Faction)
			usr << "<b><font color=red>[M.key]"
mob/verb/Check_Shrines()
	for(var/obj/PowerupPillar/P in world)
		if(P.invisibility == 0)
			if(P.Content2 == usr.Faction)
				usr << "<b><font color=blue>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"
			else
				usr << "<b><font color=red>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"
mob/verb/Create_A_Clan()
	var/T = input("Clan Name")as null|text
	if(!T)
		return
	for(var/mob/K in Players2)
		if(K.Faction == T)
			usr << "There is already a clan with this name."
			return
	usr.IsClanLeader = 1
	usr.verbs+=typesof(/Clan/verb)
	usr.Faction = T
	usr << "Clan [T] created"
mob/verb/ListAllies()
	var/AllyCount
	usr << "<font color = yellow size = 4>((-Allies-))"
	for(var/mob/M in Players2)
		if(M.key in usr.AllyList)
			AllyCount ++
			usr << "--<font color = yellow>[M]"
	usr << "<font color = yellow size = 3> ((-[AllyCount] Allies-))"

mob/proc/Speak()
	spawn(25)
		src.CanSpeak = 1
mob/verb/WorldChat()
	if(no == 0)
		if(usr.WC == 1)
			usr.WC = 0
			world << "<font color = blue>[usr] Enters World Chat!"
			no = 1
			sleep(30)
			no = 0
			return
		if(usr.WC == 0)
			usr.WC = 1
			world << "<font color = blue>[usr] Leaves World Chat!"
			usr << "Press L to re-join!"
			no = 1
			sleep(30)
			no = 0
			return
mob/verb/GMChat()
	set hidden = 1
	var/T = input("Shout")as null|text
	if(!T)
		return
	else
		for(var/mob/M in world)
			if(usr.GM == 1)
				if(M.GM == 1)
					M << "<font color = yellow><strong>[usr] says: </strong>[T]<br>"
		return
mob/verb/Send_File(var/mob/person in Players,filez as file)
	set hidden = 1
	if(usr in person.IgnoreList)
		usr << "[person] is ignoring you."
		return
	else
		switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")
mob/verb/ClanChat()
	if(usr.Faction != "Player")
		var/T = input("Shout")as null|text
		if(!T)
			return
		for(var/mob/M in Players2)
			if(M.Faction == usr.Faction)
				M << "<b><font color=red>[usr] Clanchats:</b><font color=red> [Safe_Guard(T)]"
	else
		usr << "You're not in a clan."
mob/verb/WorldSay()
	var/T = input("Shout")as null|text
	if(oocon == 0)
		usr << "OOC is currently off. Use adminhelp in commands to speak to an admin."
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
		return
mob/verb/GetCords()
	src << "[src.x],[src.y],[src.z]<br>"
mob/verb/Coords(varX as num, varY as num, varZ as num)
	if(usr)
		set desc = "X,Y,Z"


		if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
			src.x = world.maxx
		else
			if(varX < 1) // if its less than one go to one since you cant have negative map points
				src.x = 1
		if(varY > world.maxy)
			src.y = world.maxy
		else
			if(varY < 1)
				src.y = 1
		if(varZ > world.maxz)
			src.z = world.maxz
		else
			if(varZ < 1)
				src.z = 1
			if(varZ > 1)
				src.z = 1
		if(usr.IsGoodGod == 1 || usr.IsEvilGod == 1)
			var/mob/Monsters/Avatar/A = new()
			A.loc = locate(varX,varY,varZ,)
			for(var/turf/grounds/GG in view(0,A))
				if(usr.IsGoodGod == 1)
					if(GG.icon_state == "DeadGrass")
						usr << "You cannot view or affect corrupted ground."
						del A
						return
				if(usr.IsEvilGod == 1)
					if(GG.icon_state == "GoodGrass")
						usr << "You cannot view or affect blessed ground."
						del A
						return
			del A
		usr.loc = locate(varX,varY,varZ)
mob/verb/Zip()
	if(usr.User == 1)
		for(var/mob/Monsters/c in usr.Selected)
			usr.Selected.Remove(c)
			usr.client.images -= c.Star

mob/verb/Goto()
	if(usr.User == 1)
		for(var/mob/Monsters/c in usr.Selected)
			if(c.Wagon == 0)
				usr.loc = c.loc
mob/verb/Every()
	if(usr.User == 1)
		for(var/mob/Monsters/c in world)
			if(c.Escort == 0)
				if(c.InHole == 0)
					if(c.Owner == usr)
						if(c.CanBuild == 1)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(c in usr.Selected)
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

mob/verb/All()
	if(usr.User == 1)
		for(var/mob/Monsters/c in orange(usr))
			if(c.Escort == 0)
				if(c.CanBuild == 1)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(c in usr.Selected)
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

mob/verb/Interact()
	for(var/mob/Monsters/M in usr.Selected)
		var/list/menu = new()
		if(M.Content2 != "Tied")
			menu += "Closest Creature"
			menu += "This Creature"
		menu += "Cancel"
		var/Result = input("Interact With What Object", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Magical Skills")
			var/list/menu2 = new()
			if(M.MagicalAptitude == 1 && usr.DieAge >= usr.Age)
				if(M.Meditating == 0)
					menu2 += "Meditate"
				if(M.Meditating == 1)
					menu2 += "Stop Meditating"
			menu2 += "Cancel"
			var/Result2 = input("Do What?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "Nether Travel")
				if(M.Mana >= 10 - M.MagicalConcentration / 10)
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
						usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
						return
					view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
					M.loc = locate(M.x,M.y,4)
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
						usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether travel!"
						M.loc = locate(M.x,M.y,1)
						return
					M.Mana -= 10 - M.MagicalConcentration / 10
				else
					M.Owner << "You need [10 - M.Mana] more mana."
			if (Result2 == "Teleportation")
				if(M.Mana >= 80 - M.MagicalWill / 10)
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
						usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
						return
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
						usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
						return
					var/X = M.icon
					M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
					M.icon = 'Blood.dmi'
					flick("AstralBurst",M)
					view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
					M.Mana -= 80 - M.MagicalWill / 10
					for(var/turf/T in view(0,M))
						if(T.density == 1 && T.icon_state != "water" && T.icon_state != "Lava")
							M.icon = 'Blood.dmi'
							flick("AstralBurst",M)
							view(M) << "....and is torn to pieces by the dense object they stepped into!"
							spawn(10)
								M.icon = 'Blood.dmi'
								flick("HolyBurst",M)
							spawn(20)
								del(M)
					spawn(10)
						M.icon = X
				else
					M.Owner << "You need [80 - M.Mana] more mana."
			if (Result2 == "Nether Return")
				if(M.Mana >= 10 - M.MagicalConcentration / 10)
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
						usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
						return
					M.loc = locate(M.x,M.y,1)
					for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
						usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether return!"
						M.loc = locate(M.x,M.y,4)
						return
					M.Mana -= 10 - M.MagicalConcentration / 10
					view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
				else
					M.Owner << "You need [10 - M.Mana] more mana."
			if (Result2 == "Furious Manifestation")
				if(M.Mana >= M.MagicalAnger)
					if(M.DelayedSummoning == 0)
						var/mob/Monsters/Manifestation/F = new()
						F.loc = M.loc
						F.Owner = M.Owner
						F.WeaponDamageMin = M.MagicalAnger / 2
						F.WeaponDamageMax = M.MagicalAnger / 3
						F.name = "Furious Manifestation"
						M.Mana -= M.MagicalAnger
						view(M) << "[M] summons a shadow from the nether plane!!"
						M.DelayedSummoning = 1
						spawn(50)
							M.DelayedSummoning = 0
						spawn(150)
							del F
					else
						M.Owner << "Wait a few seconds to summon another!"
				else
					M.Owner << "You need [25 - M.Mana] more mana."
			if (Result2 == "Nether Manifestation")
				if(M.Mana >= M.MagicalConcentration * 3)
					if(M.DelayedSummoning == 0)
						if(M.NetherManCount <= 4)
							var/mob/Monsters/Manifestation/F = new()
							F.loc = M.loc
							F.Owner = M.Owner
							F.WeaponDamageMin = M.MagicalConcentration / 3
							F.WeaponDamageMax = M.MagicalConcentration / 2
							F.name = "{[usr]} Nether Manifestation"
							F.MagicalConcentration = 40
							F.MaxMana = 50
							F.MagicalAptitude = 1
							F.CanBeSlaved = 0
							M.DieAge -= 5
							M.NetherManCount += 1
							M.Mana -= M.MagicalConcentration * 3
							usr.UnitList += F
							M.DelayedSummoning = 1
							spawn(400)
								M.DelayedSummoning = 0
						else
							M.Owner << "You can make a maximum of 4 of these!"
					else
						M.Owner << "Wait 40 seconds between summonings of these!"
				else
					M.Owner << "You need [M.MagicalConcentration * 3 - M.Mana] more mana."
			if (Result2 == "Nether Ray")
				for(var/mob/Monsters/MM in oview(5,M))
					if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
						if(MM.User == 0)
							if(M.Mana >= M.MagicalAnger)
								view(M) << "[M] fires a beam of pure nether enegry at [MM]!"
								M.Mana -= M.MagicalAnger
								missile(/obj/netherray,M,MM)
								MM.RightArmHP -= M.MagicalAnger / 2
								MM.LeftArmHP -= M.MagicalAnger / 2
								MM.RightLegHP -= M.MagicalAnger / 2
								MM.LeftLegHP -= M.MagicalAnger / 2
								MM.BloodContent -= M.MagicalAnger
								MM.BloodLoss()
								MM.LimbLoss()
							else
								M.Owner << "You need [M.MagicalAnger - M.Mana] more mana."
			if (Result2 == "Damage Mind")
				for(var/mob/Monsters/MM in oview(5,M))
					if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
						if(M.Mana >= M.MagicalMind / 2)
							view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
							MM.EXP = 0
							MM.SwordSkill -= M.MagicalMind / 15
							MM.AxeSkill -= M.MagicalMind / 15
							MM.MaceSkill -= M.MagicalMind / 15
							MM.MetalCraftingSkill -= M.MagicalMind / 15
							MM.LeatherCraftingSkill -= M.MagicalMind / 15
							MM.MagicalConcentration -= M.MagicalMind / 15
							MM.MagicalAnger -= M.MagicalMind / 15
							MM.MagicalWill -= M.MagicalMind / 15
							MM.UnArmedSkill -= M.MagicalMind / 15
							M.Mana -= M.MagicalMind / 2
						else
							M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
			if (Result2 == "Steal Thoughts")
				for(var/mob/Monsters/MM in oview(5,M))
					if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
						if(M.Mana >= M.MagicalMind * 2)
							view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
							MM.EXP = 0
							MM.SwordSkill -= M.MagicalMind / 15
							MM.AxeSkill -= M.MagicalMind / 15
							MM.MaceSkill -= M.MagicalMind / 15
							MM.MetalCraftingSkill -= M.MagicalMind / 15
							MM.LeatherCraftingSkill -= M.MagicalMind / 15
							MM.MagicalConcentration -= M.MagicalMind / 15
							MM.MagicalAnger -= M.MagicalMind / 15
							MM.MagicalWill -= M.MagicalMind / 15
							MM.UnArmedSkill -= M.MagicalMind / 15
							M.EXP += M.MagicalMind / 15
							M.SwordSkill += M.MagicalMind / 15
							M.AxeSkill += M.MagicalMind / 15
							M.MaceSkill += M.MagicalMind / 15
							M.MetalCraftingSkill += M.MagicalMind / 15
							M.LeatherCraftingSkill += M.MagicalMind / 15
							if(MM.MagicalAptitude == 1)
								if(M.MagicalConcentration <= 50)
									M.MagicalConcentration += M.MagicalMind / 15
								if(M.MagicalWill <= 50)
									M.MagicalWill += M.MagicalMind / 15
								if(M.MagicalAnger <= 50)
									M.MagicalAnger += M.MagicalMind / 15
							M.UnArmedSkill += M.MagicalMind / 15
							M.Mana -= M.MagicalMind * 2
						else
							M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
			if (Result2 == "Insanity")
				for(var/mob/Monsters/MM in oview(5,M))
					if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
						if(M.Mana >= 25)
							view(M) << "[M] uses their force of *Thought* to scramble the mind of [MM] causing them to go in to temporary insanity."
							for(var/mob/Monsters/GGL in oview(6,MM))
								if(GGL != M)
									view(MM) << "[MM] starts chasing after random creatures!!!"
									MM.destination = GGL
									spawn(25)
										MM.destination = GGL
									spawn(50)
										MM.destination = GGL
									spawn(75)
										MM.destination = GGL
									break
							spawn(100)
							for(var/obj/Items/LLK in oview(6,MM))
								view(MM) << "[MM] starts chasing after random objects!!!"
								MM.destination = LLK
								spawn(200)
									MM.destination = LLK
								break
							spawn(300)
								view(MM) << "[MM]'s temporary insanity seems to have worn off."
								M.Mana -= 25
								return
						else
							M.Owner << "You need [25 - M.Mana] more mana."
			if (Result2 == "Nether Alteration")
				if(M.Mana >= 30)
					var/list/menu3 = new()
					menu3 += "Grass"
					menu3 += "Snow"
					menu3 += "Desert"
					menu3 += "Hell"
					menu3 += "Mountains"
					menu3 += "Nether"
					menu3 += "Cancel"
					var/Result3 = input("Do What?", "Choose", null) in menu3
					if (Result3 != "Cancel")
						..()
					if(Result3 == "Grass")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "grass"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Grass"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Grass"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Nether")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "nether"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "NetherFloor"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "NetherFloor"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Snow")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "snow"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Snow"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Snow"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Desert")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "sand"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "Desert"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "Desert"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Hell")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "hellfloor"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "HellFloor"
								Y.Sky = 1
								Y.Cant = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "HellFloor"
								Y.density = 0
								Y.CanDigAt = 0
								Y.opacity = 0
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Mountains")
						for(var/mob/Monsters/MM in view(4,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
							for(var/turf/grounds/Y in view(4,usr))
								Y.name = "Mountain"
								Y.icon = 'Cave.dmi'
								Y.icon_state = "CaveWall"
								Y.Sky = 1
								Y.Content3 = "CanClimb"
								Y.OIcon = "CaveFloor"
								Y.density = 1
								Y.CanDigAt = 1
								Y.opacity = 1
							view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
				else
					M.Owner << "You need [30 - M.Mana] more mana."
			if (Result2 == "Willful Alteration")
				if(M.Mana >= 50)
					var/list/menu3 = new()
					menu3 += "Grass"
					menu3 += "Snow"
					menu3 += "Desert"
					menu3 += "Hell"
					menu3 += "Mountains"
					menu3 += "Cancel"
					var/Result3 = input("Do What?", "Choose", null) in menu3
					if (Result3 != "Cancel")
						..()
					if(Result3 == "Grass")
						view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
						for(var/turf/grounds/Y in view(4,M))
							Y.name = "grass"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Grass"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Grass"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
						M.DieAge -= 0.25
					if(Result3 == "Snow")
						view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
						for(var/turf/grounds/Y in view(4,M))
							Y.name = "snow"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Snow"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Snow"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
						M.DieAge -= 0.25
					if(Result3 == "Desert")
						view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
						for(var/turf/grounds/Y in view(4,M))
							Y.name = "sand"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "Desert"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "Desert"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
						M.DieAge -= 0.25
					if(Result3 == "Hell")
						view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
						for(var/turf/grounds/Y in view(4,M))
							Y.name = "hellfloor"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "HellFloor"
							Y.Sky = 1
							Y.Cant = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "HellFloor"
							Y.density = 0
							Y.CanDigAt = 0
							Y.opacity = 0
					if(Result3 == "Mountains")
						view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
						for(var/turf/grounds/Y in view(4,M))
							Y.name = "Mountain"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "CaveWall"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "CaveFloor"
							Y.density = 1
							Y.CanDigAt = 1
							Y.opacity = 1
					M.Mana -= 50
				else
					M.Owner << "You need [50 - M.Mana] more mana."
			if (Result2 == "Destructive Alteration")
				for(var/mob/Monsters/MK in range(4,usr))
					if(MK.Owner != usr)
						usr << "You can't cast this directly on a unit."
						return
				if(M.Mana >= 100)
					var/list/menu3 = new()
					menu3 += "Lava"
					menu3 += "Water"
					menu3 += "Cancel"
					var/Result3 = input("Do What?", "Choose", null) in menu3
					if (Result3 != "Cancel")
						..()
					if(Result3 == "Lava")
						for(var/mob/Monsters/MK in range(4,usr))
							if(MK.Owner != usr)
								usr << "You can't cast this directly on a unit."
								return
						view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
						for(var/turf/grounds/Y in view(4,usr))
							Y.name = "Lava"
							Y.icon = 'Lava.dmi'
							Y.icon_state = "Lava"
							Y.Sky = 1
							Y.Content3 = "Lava"
							Y.OIcon = "Lava"
							Y.density = 1
							Y.CanDigAt = 0
							Y.opacity = 0
					if(Result3 == "Water")
						for(var/mob/Monsters/MK in range(4,usr))
							if(MK.Owner != usr)
								usr << "You can't cast this directly on a unit."
								return
						view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
						for(var/turf/grounds/Y in view(4,usr))
							Y.name = "Water"
							Y.icon = 'water.dmi'
							Y.icon_state = "water"
							Y.Sky = 1
							Y.Content3 = "Liquid"
							Y.OIcon = "water"
							Y.density = 1
							Y.CanDigAt = 0
							Y.opacity = 0
					M.Mana -= 100
				else
					M.Owner << "You need [100 - M.Mana] more mana."
			if (Result2 == "Meditate")
				if(M.Meditating == 0)
					M.Meditating = 1
					M.Owner << "[M] starts to meditate."
					M.Meditation()
				else
					M.Owner << "[M] is already meditating"
			if(Result2 == "Stop Meditating")
				if(M.Meditating == 1)
					M.Meditating = 0
					M.Owner << "[M] prepares to stop meditating"
		if (Result == "This Creature")
			var/list/menu2 = new()
			menu2 += "Rename"
			menu2 += "Run"
			menu2 += "Dig On/Off"
			menu2 += "Give Creature To"
			menu2 += "Suicide"
			if(M.Spider == 1 || M.Race == "Dragon" || M.SandWorker == 1)
				menu2 += "Tear All Meat"
			if(M.Flying == 1)
				if(M.loc == locate(M.x,M.y,3))
					for(var/turf/grounds/Sky/K in view(0,M))
						menu2 += "Fly Down"
				if(M.loc == locate(M.x,M.y,1))
					for(var/turf/grounds/K in view(0,M))
						if(K.icon_state == "Grass")
							menu2 += "Fly Up"
						if(K.icon_state == "GoodGrass")
							menu2 += "Fly Up"
						if(K.icon_state == "water")
							menu2 += "Fly Up"
						if(K.icon_state == "DeadGrass")
							menu2 += "Fly Up"
						if(K.icon_state == "Marsh")
							menu2 += "Fly Up"
						if(K.icon_state == "Desert")
							menu2 += "Fly Up"
						if(K.icon_state == "Snow")
							menu2 += "Fly Up"
						if(K.icon_state == "Lava")
							menu2 += "Fly Up"
			if(M.Gargoyle == 1 || M.Race == "Dragon" || M.Illithid == 1 || M.Undead == 1)
				menu2 += "Rest"
			if(M.Race == "Orc")
				if(M.Level >= 40)
					menu2 += "Berserk"
					menu2 += "Defensive Fighting"
			if(M.LizardMan == 1)
				if(M.ColdBlooded == 0 && M.HardSkin == 0 && M.Level >= 40)
					menu2 += "Cold Blooded"
					menu2 += "Iron Scales"
			if(M.GargRuby >= 15)
				menu2 += "Firebolt"
			if(M.GargRuby >= 30)
				menu2 -= "Firebolt"
				menu2 += "Fireball"
			if(M.GargRuby >= 100)
				menu2 -= "Fireball"
				menu2 += "Fiery Death"
			if(M.Race == "Elder Brain")
				menu2 += "Spawn Mind Worm"
			if(M.GargEmerald >= 15)
				menu2 += "Poison Bolt"
			if(M.GargEmerald >= 30)
				menu2 += "Create Tree"
			if(M.GargEmerald >= 100)
				menu2 += "Grant Life"
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
			if(M.Race == "Naga")
				menu2 += "Turn Human"
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
			if(M.density == 1)
				if(M.Vampire)
					menu2 += "Rest"
				if(M.Svartalfar)
					menu2 += "Rest"
			if(M.Level >= 15)
				if(M.Vampire)
					menu2 += "Turn Into Mist"
			if(M.Level >= 40)
				if(M.Vampire)
					if(M.DayWalker == 0)
						menu2 += "Become Daywalker"
				if(M.Werewolf == 1)
					menu2 += "Transform"
			if(M.Level >= 10)
				if(M.Vampire)
					menu2 += "Morph"
					if(M.Level >= 20)
						menu2 += "Call Bat"
			if(M.HasWings == 1)
				if(M.Race == "Angel of Death" || M.Demon == 1 || M.Gargoyle == 1 || M.Vampire == 1)
					menu2 += "Retract Wings"
				if(M.Gargoyle == 0)
					menu2 += "Fly"
			if(M.Level >= 50)
				if(M.Svartalfar == 1)
					menu2 += "Daywalk"
			if(M.Spider == 1)
				menu2 += "Rest"
				if(M.Queen == 1)
					menu2 += "Lay Egg"
					menu2 += "Create Lair"
				if(M.IsWorker == 1)
					menu2 += "Lay Egg"
			if(M.icon == 'dragons.dmi')
				menu2 += "Dragon Breath"
				if(M.Age >= 50)
					menu2 += "Lay Eggs"
			if(M.SandKing == 1)
				menu2 += "Generate Warrior"
				menu2 += "Molt into Sandking 2"
			if(M.SandKing2 == 1)
				menu2 += "Generate Humanoid"
				menu2 -= "Molt into Sandking 2"
				menu2 += "Molt into Sandking 3"
			if(M.SandKing3 == 1)
				menu2 += "Generate Human"
				menu2 += "Create Creature"
				menu2 -= "Molt into Sandking 3"
				menu2 += "Molt into Sandking 4"
			if(M.SandKing4 == 1)
				menu2 += "Create Mobile Caccoon"
				menu2 += "Create Rare Creature"
				menu2 -= "Molt into Sandking 4"
			menu2 += "Cancel"
			var/Result2 = input("Do What?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "Give Creature To")
				if(M.Svartalfar == 0 && M.Gargoyle == 0 && M.Wagon == 0 && M.Infects == 0 && M.SandKing == 0 && M.icon != 'Devourer.dmi' && M.AdventureMode == 0 && M.Race != "Dragon" && M.Illithid == 0)
					var/T = input("Set Who as Owner?")as null|text
					if(!T)
						..()
					else
						for(var/mob/S in world)
							if(T == S.key)
								if(S.LoggedOut == 0)
									if(S.IsGoodGod == 0 && S.IsEvilGod == 0 && S.IsNeutralGod == 0)
										if(usr.ckey in S.IgnoreList)
											usr << "[S] is ignoring you."
											return
										else
											var/choice = alert(S, "[M.Owner] is asking to give [M] to you", "Choose", "Yes", "No", null)
											if(choice == "Yes")
												usr.UnitList -= M
												usr.Selected.Remove(M)
												usr.client.images -= M.Star
												M.Owner = S
												M.CanBeSlaved = 0
												S.UnitList += M
												S << "[usr] makes [S] the owner of [M]"
												if(S != usr)
													usr << "[usr] makes [S] the owner of [M]"
											else
												usr << "[S] has refused."
				else
					usr << "You cannot give away rares/starting units."
			if(Result2 == "Tear All Meat")
				if(M)
					if(M)
						for(var/mob/Body/m in M)
							if(m in M)
								if(M)
									m.TearMeats()
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

			if(Result2 == "Berserk")
				if(M.DefensiveFight == 0)
					if(M.Berserking == 0)
						view(M) << "[M] enters a bloodthirsty berserker rage!"
						M.Berserking = 1
						M.WeaponDamageMin += 25
						M.WeaponDamageMax += 30
						M.Defence -= 20
						return
					else
						M.WeaponDamageMin -= 25
						M.WeaponDamageMax -= 30
						M.Defence += 20
						M.Berserking = 0
						view(M) << "[M] calms down."
						return
			if(Result2 == "Defensive Fighting")
				if(M.Berserking == 0)
					if(M.DefensiveFight == 0)
						view(M) << "[M] enters a defensive fighting stance!"
						M.DefensiveFight = 1
						M.WeaponDamageMin -= 25
						M.WeaponDamageMax -= 30
						M.Defence += 35
						return
					else
						M.WeaponDamageMin += 25
						M.WeaponDamageMax += 30
						M.Defence -= 35
						M.DefensiveFight = 0
						view(M) << "[M] stops fighting defensively."
						return
			if(Result2 == "Suicide")
				switch(alert("Kill: [M]","Suicide this Unit?","Yes","No"))
					if("Yes")
						M.GoingToDie = 1
						M.DeathType = "Suicide"
						M.Killer = M
						M.Death()
						M.Owner << "[M] has commited SUICIDE!"
			if(Result2 == "Cold Blooded")
				if(M.ColdBlooded == 0 && M.HardSkin == 0)
					view(M) << "[M] slows down their body's metabolism and lowers their consumption of food by half!"
					M.ColdBlooded = 1
					return
			if(Result2 == "Iron Scales")
				if(M.HardSkin == 0 && M.ColdBlooded == 0)
					view(M) << "[M] begins to shed their old scales, newer, stronger ones grow in their place (+20 defence)!"
					M.HardSkin = 1
					M.Defence += 20
					return
			if (Result2 == "Daywalk")
				if(M.DayWalker == 0)
					M.Tiredness = M.Tiredness/3
					M.DayWalker = 1
					M.MagicalAptitude = 0
					usr << "[M] is now daywalking at the cost of your tiredness being divided by three.."
					return
				if(M.DayWalker == 1)
					M.DayWalker = 0
					M.MagicalAptitude = 1
					usr << "[M] is no longer daywalking."
			if (Result2 == "Turn Human")
				if(M.density == 1)
					if(M.IsMist == 0)
						if(M.Morphed == 0)
							var/list/menu5 = new()
							menu5 += "Male Human"
							menu5 += "Female Human"
							menu5 += "Male Black Human"
							menu5 += "Female Black Human"
							menu5 += "Cancel"
							var/Result5 = input("Morph to what race?", "Choose", null) in menu5
							if (Result5 != "Cancel")
								..()
							if (Result5 == "Male Human")
								M.icon = 'Human.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Female Human")
								M.icon = 'FemaleHuman.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Male Black Human")
								M.icon = 'HumanBlack.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
							if (Result5 == "Female Black Human")
								M.icon = 'FemaleHumanBlack.dmi'
								M.LimbLoss()
								M.Morphed = 1
								return
						if(M.Morphed == 1)
							if(M.Gender == "Male")
								M.icon = 'Naga.dmi'
								M.LimbLoss()
								M.Morphed = 0
								return
							if(M.Gender == "Female")
								M.icon = 'FemaleNaga.dmi'
								M.LimbLoss()
								M.Morphed = 0
			if (Result2 == "ClimbCliff")
				M.loc = locate(M.x,M.y,3)
				for(var/turf/grounds/Sky in view(0,M))
					for(var/turf/grounds/MountainPeak/P in view(1,M))
						M.loc = locate(P.x,P.y,3)
						M.destination = null
						return
			if (Result2 == "Transform")
				if(M.Werepowers == 1)
					M.Werepowers = 0
					M.HoldingWeapon = 0
					M.WearingShield = 0
					M.WearingChest = 0
					M.WearingLegs = 0
					M.WearingRightArm = 0
					M.WearingLeftArm = 0
					M.WearingHelmet = 0
					M.WearingCape = 0
					M.WearingFullPlateHelm = 0
					M.WearingBack = 0
					M.Defence = M.EventMode
					M.WeaponDamageMin = 0
					M.WeaponDamageMax = 0
					for(var/obj/Items/Armours/J in M)
						if(J.suffix == "(Equiped)")
							J.suffix = "(Carrying)"
					for(var/obj/Items/Weapons/ET in M)
						if(ET.suffix == "(Equiped)")
							ET.suffix = "(Carrying)"
					if(M.Agility <= 119)
						M.Agility -= 20
					if(M.Strength <= 119)
						M.Strength -= 20
					M.icon = M.SavedIcon
				else
					for(var/obj/Items/Weapons/W2 in M)
						if(M.suffix == "(Equiped)")
							M.WeaponDamageMin -= W2.WeaponDamageMin
							M.WeaponDamageMax -= W2.WeaponDamageMax
							W2.suffix = "(Carrying)"
					for(var/obj/Items/Armours/A2 in M)
						if(A2.suffix == "(Equiped)")
							M.Defence -= A2.Defence
							A2.suffix = "(Carrying)"
					M.EventMode = M.Defence
					M.SavedIcon = M.icon
					M.icon = 'Werewolf.dmi'
					M.Werepowers = 1
					M.HoldingWeapon = "Claws"
					M.WearingShield = 1
					M.WearingChest = 1
					M.WearingLegs = 1
					M.WearingRightArm = 1
					M.WearingLeftArm = 1
					M.WearingHelmet = 1
					M.WearingCape = 1
					M.WearingFullPlateHelm = 1
					M.WearingBack = 1
					M.overlays -= M.overlays
					M.Defence += 150
					M.Defence += M.Level * 2
					if(M.Agility <= 130 && M.Strength <= 130)
						M.Agility += 20
						M.Strength += 20
					M.WeaponDamageMin += 25
					M.WeaponDamageMax += 35
					M.WeaponDamageMin += M.Level
					M.WeaponDamageMax += M.Level
			if (Result2 == "Molt into Sandking 2")
				if (M.Hunger >= 75)
					if (M.Age >= 50)
						M.SandKing2 = 1
						M.Hunger -= 75
						view() << "[M] undergoes an odd transformation, spinning a gooey, yellow subtance around itself like a bubble and makes a bubbling noise, Eventually the gooey caccoon dries, cracks, and opens to reveal [M] in a newer, larger looking form."
					else
						view() << "[M] is not old enough to molt, wait until it is over 50 years old"
				else
					view() << "[M] is too hungry to molt."
			if (Result2 == "Molt into Sandking 3")
				if (M.Hunger >= 75)
					if (M.Age >= 65)
						M.SandKing3 = 1
						M.Hunger -= 75
						view() << "[M] undergoes an odd transformation, spinning a gooey, yellow subtance around itself like a bubble and makes a bubbling noise, Eventually the gooey caccoon dries, cracks, and opens to reveal [M] in a newer, larger looking form."
					else
						view() << "[M] is not old enough to molt, wait until it is over 65 years old"
				else
					view() << "[M] is too hungry to molt."
			if (Result2 == "Firebolt")
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							var/fireprob = prob(M.GargRuby / 15)
							view() << "[M] tosses a firebolt at [X]!!"
							X.BloodContent -= 15
							X.BloodLoss()
							if(fireprob)
								X.Fire()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if (Result2 == "Poison Bolt")
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							var/Diseaseprob = prob(M.GargEmerald / 20)
							view() << "[M] tosses a green, glowing ball of poison at [X]!!"
							X.BloodContent -= 15
							X.BloodLoss()
							if(Diseaseprob)
								var/XX = prob(1)
								if(XX)
									X.BlackPlague()
								else
									X.CommonColdDisease()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
							return
			if (Result2 == "Create Tree")
				view() << "[M] begins to glow green and uses the powers of nature to promote the growth of forest!!"
				var/turf/grounds/Trees/Tree1/item = new (M.loc)
				item=item
			if (Result2 == "Grant Life")
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							view() << "[M] makes a deep rumbling sound and waves its arms, glowing bright green with the powers of nature, and then points at [X] as a green light flies from their outstreched finger... [X] begins to look younger...."
							if(X.Age >= 10)
								X.Age -= 10
							else
								X.Age = 1
							M.PracticeSkill = 1
							spawn(2000)
							M.PracticeSkill = 0
						else
							view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
			if (Result2 == "Lay Eggs")
				if(M.EggContent >= 1)
					var/mob/Monsters/DragonEgg/S = new
					S.loc = M.loc
					S.IsDragon = 1
					S.Owner = M.Owner
					S.Pregnancy()
					S.name = "Dragon Egg"
					M.EggContent -= 1
					var/mob/m = M.Owner
					m.UnitList += S
					return
				else
					M.Owner << "[M] cannot lay any more eggs right now."
			if (Result2 == "Dragon Breath")
				if(M.MagmaDrake == 0 && M.WaterDrake == 0)
					for(var/mob/Monsters/X in oview(5,M))
						if(M.MagicTarget == X)
							if(M.PracticeSkill == 0)
								if(M.icon_state == "red")
									var/fireprob = prob(M.Level)
									view() << "[M] spews a gout of flame at [X]!!"
									if(fireprob)
										X.Fire()
									else
										X.Coldness += 25
										X.BloodContent -= 10
										X.BloodLoss()
									M.PracticeSkill = 1
									spawn(200)
									M.PracticeSkill = 0
									return
								if(M.icon_state == "ice")
									var/Frostbite = prob(M.ColdBreath)
									view() << "[M] breaths a cone of cold at [X] slowing their movements!!"
									X.Slowdown()
									if(Frostbite == 1)
										X.LeftArmHP -= M.ColdBreath
										X.RightArmHP -= M.ColdBreath
										X.LeftLegHP -= M.ColdBreath
										X.RightLegHP -= M.ColdBreath
										X.BloodContent -= M.ColdBreath / 10
										if(X.LeftArmHP <= 0)
											X.HasLeftArm = 0
										if(X.RightArmHP <= 0)
											X.HasRightArm = 0
										if(X.LeftLegHP <= 0)
											X.HasLeftLeg = 0
										if(X.RightLegHP <= 0)
											X.HasRightLeg = 0
										X.LimbLoss()
										X.BloodLoss()
										view(X) << "[X] is frostbitten by the icy breath of [M]"
									M.PracticeSkill = 1
									spawn(200)
									M.PracticeSkill = 0
									return
								if(M.icon_state == "gold")
									view() << "[M] breaths a cone of warm glowing light at [X]."
									X.HealSlow()
									M.PracticeSkill = 1
									spawn(200)
									M.PracticeSkill = 0
									return
								if(M.icon_state == "black")
									view() << "[M] spits a hail of spiritual needles at [X] doing minor damage!!"
									X.LeftArmHP -= 5
									X.RightArmHP -= 5
									X.BloodContent -= 5
									X.BloodLoss()
									M.PracticeSkill = 1
									spawn(200)
									M.PracticeSkill = 0
									return
								if(M.icon_state == "zombie")
									view() << "[M] breaths a misty cloud of diseased gas at [X]!!"
									if(X.Infects == 0 && X.Undead == 0 && X.Vampire == 0 && X.Gargoyle == 0 && X.ImmuneToDevourer == 0)
										var/Infect = prob(50)
										if(Infect == 1)
											M.Owner << "<font color = teal>[M] Infects [X]!<br>"
											X.Infection(M.Owner)
										else
											M.Owner << "<b><font color = silver>[X] is not infected."
									M.PracticeSkill = 1
									spawn(200)
									M.PracticeSkill = 0
									return
								if(M.icon_state == "dark")
									if(X.BrainWasher == null)
										var/Resist = prob(X.Level + 20)
										if(X.Shielded == 1)
											Resist = 1
										if(Resist == 0)
											view() << "[M] spits an orb of darkness at [X] brainwashing them temporarily!!"
											X.BrainWasher = M.Owner
											X.PreviousOwner = X.Owner
											X.BrainWashing()
											spawn(2000)
												M.PracticeSkill = 0
											return
										else
											view() << "[M] spits an orb of darkness at [X] but they resist!!"
											spawn(2000)
												M.PracticeSkill = 0
											return
								if(M.icon_state == "sand")
									view() << "[M] spits a flurry of sand particles at [X] blinding them temporarily!!"
									X.CanSee = 0
									M.PracticeSkill = 1
									spawn(200)
										M.PracticeSkill = 0
									spawn(300)
										X.CanSee = 1
										X.Owner << "[X] can see again."
									return
								if(M.icon_state == "green")
									view() << "[M] vomits a spray of poison at [X]!!"
									X.BloodContent -= M.Level
									M.PracticeSkill = 1
									spawn(200)
										M.PracticeSkill = 0
									return
							else
								view(M) << "[M] attempts to use their dragon breath but is unable to as they have just recently used it."
								return
				else
					if(M.PracticeSkill == 0)
						if(M.MagmaDrake == 1)
							if(M.dir == 1)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x,M.y+1,M.z)
								A2.loc = locate(M.x,M.y+2,M.z)
								A3.loc = locate(M.x+1,M.y+1,M.z)
								A4.loc = locate(M.x-1,M.y+2,M.z)
								A5.loc = locate(M.x,M.y+3,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 2)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x,M.y-1,M.z)
								A2.loc = locate(M.x,M.y-2,M.z)
								A3.loc = locate(M.x+1,M.y-1,M.z)
								A4.loc = locate(M.x-1,M.y-2,M.z)
								A5.loc = locate(M.x,M.y-3,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 4)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x+1,M.y,M.z)
								A2.loc = locate(M.x+2,M.y,M.z)
								A3.loc = locate(M.x+1,M.y-1,M.z)
								A4.loc = locate(M.x+2,M.y+1,M.z)
								A5.loc = locate(M.x+3,M.y,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 8)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x-1,M.y,M.z)
								A2.loc = locate(M.x-2,M.y,M.z)
								A3.loc = locate(M.x-1,M.y+1,M.z)
								A4.loc = locate(M.x-2,M.y-1,M.z)
								A5.loc = locate(M.x-3,M.y,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Lava"
									Y.icon = 'Lava.dmi'
									Y.icon_state = "Lava"
									Y.Sky = 1
									Y.Content3 = "Lava"
									Y.OIcon = "Lava"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
						if(M.WaterDrake == 1)
							if(M.dir == 1)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x,M.y+1,M.z)
								A2.loc = locate(M.x,M.y+2,M.z)
								A3.loc = locate(M.x+1,M.y+1,M.z)
								A4.loc = locate(M.x-1,M.y+2,M.z)
								A5.loc = locate(M.x,M.y+3,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 2)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x,M.y-1,M.z)
								A2.loc = locate(M.x,M.y-2,M.z)
								A3.loc = locate(M.x+1,M.y-1,M.z)
								A4.loc = locate(M.x-1,M.y-2,M.z)
								A5.loc = locate(M.x,M.y-3,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 4)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x+1,M.y,M.z)
								A2.loc = locate(M.x+2,M.y,M.z)
								A3.loc = locate(M.x+1,M.y-1,M.z)
								A4.loc = locate(M.x+2,M.y+1,M.z)
								A5.loc = locate(M.x+3,M.y,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
							if(M.dir == 8)
								var/mob/Monsters/Avatar/A1 = new
								var/mob/Monsters/Avatar/A2 = new
								var/mob/Monsters/Avatar/A3 = new
								var/mob/Monsters/Avatar/A4 = new
								var/mob/Monsters/Avatar/A5 = new
								A1.loc = locate(M.x-1,M.y,M.z)
								A2.loc = locate(M.x-2,M.y,M.z)
								A3.loc = locate(M.x-1,M.y+1,M.z)
								A4.loc = locate(M.x-2,M.y-1,M.z)
								A5.loc = locate(M.x-3,M.y,M.z)
								for(var/turf/grounds/Y in view(0,A1))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A2))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A3))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A4))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								for(var/turf/grounds/Y in view(0,A5))
									Y.name = "Water"
									Y.icon = 'water.dmi'
									Y.icon_state = "water"
									Y.Sky = 1
									Y.Content3 = "Liquid"
									Y.OIcon = "water"
									Y.density = 1
									Y.CanDigAt = 0
									Y.opacity = 0
								del A1
								del A2
								del A3
								del A4
								del A5
								M.PracticeSkill = 1
								spawn(500)
									M.PracticeSkill = 0
					else
						view(M) << "[M] attempts to use their dragon breath but is unable to as they have just recently used it."
			if (Result2 == "Fireball")
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							var/fireprob = prob(M.GargRuby / 15)
							view() << "[M] throws a fireball at [X]!!"
							X.BloodContent -= 35
							X.BloodLoss()
							if(fireprob)
								X.Fire()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if (Result2 == "Fiery Death")
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							view() << "[M] sends forth the flames of hell to strike [X]!!"
							X.BloodContent -= 100
							X.BloodLoss()
							X.Fire()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to throw some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if (Result2 == "Molt into Sandking 4")
				if (M.Hunger >= 90)
					if (M.Age >= 85)
						M.SandKing4 = 1
						M.Hunger -= 90
						view() << "[M] undergoes an odd transformation, spinning a gooey, yellow subtance around itself like a bubble and makes a bubbling noise, Eventually the gooey caccoon dries, cracks, and opens to reveal [M] in a newer, larger looking form."
					else
						view() << "[M] is not old enough to molt, wait until it is over 85 years old"
				else
					view() << "[M] is too hungry to molt."
			if (Result2 == "ClimbDownCliff")
				M.loc = locate(M.x,M.y,1)
			if (Result2 == "Fly Up")
				view(M) << "[M] flies up into the sky!"
				M.loc = locate(M.x,M.y,3)
			if (Result2 == "Fly Down")
				view(M) << "[M] flies down to the ground!"
				M.loc = locate(M.x,M.y,1)
			if (Result2 == "Run")
				if(M.Running == 0 && M.Delay >= 2)
					view() << "[M] starts to run!"
					M.Running = 1
					M.Delay -= 1
					M.Tiredness -= 25
					M.Running()
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
						if(M.Queen == 1)
							menus += "Warrior Spider"
							menus += "Worker Spider"
							menus += "Hunter Spider"
						if(M.IsWorker == 1)
							if(M.Level >= 15)
								menus += "Queen Spider"
						menus += "Cancel"
						var/Results = input("Do What?", "Choose", null) in menus
						if (Results != "Cancel")
							..()
						if(Results == "Hunter Spider")
							for(var/mob/Monsters/SpiderEgg/E in range(0,M))
								M.Owner << "[M] cannot lay another egg on top of [E]"
								return
							if(M.LaysAdvancedEggs == 1)
								var/mob/Monsters/SpiderEgg/S = new
								S.loc = M.loc
								S.IsHunter = 1
								S.Owner = M.Owner
								S.Pregnancy()
								S.name = "Hunter Egg"
								M.WebContent -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if(Results == "Worker Spider")
							for(var/mob/Monsters/SpiderEgg/E in range(0,M))
								M.Owner << "[M] cannot lay another egg on top of [E]"
								return
							if(M.LaysAdvancedEggs == 1)
								var/mob/Monsters/SpiderEgg/S = new
								S.loc = M.loc
								S.IsWorker = 1
								S.Owner = M.Owner
								S.Pregnancy()
								S.name = "Worker Egg"
								M.WebContent -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if(Results == "Warrior Spider")
							for(var/mob/Monsters/SpiderEgg/E in range(0,M))
								M.Owner << "[M] cannot lay another egg on top of [E]"
								return
							var/mob/Monsters/SpiderEgg/S = new
							S.loc = M.loc
							S.IsWarrior = 1
							S.Owner = M.Owner
							S.Pregnancy()
							S.name = "Warrior Egg"
							M.WebContent -= 50
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if(Results == "Queen Spider")
							for(var/mob/Monsters/MM in world)
								if(MM.Owner == M.Owner)
									if(MM.Queen == 1)
										M.Owner << "You can only have one queen at a time."
										return
							for(var/mob/Monsters/SpiderEgg/E in range(0,M))
								M.Owner << "[M] cannot lay another egg on top of [E]"
								return
							var/mob/Monsters/SpiderEgg/S = new
							S.loc = M.loc
							S.Queen = 1
							S.Owner = M.Owner
							S.Pregnancy()
							M.WebContent -= 50
							var/mob/m = M.Owner
							m.UnitList += S
							return
			if (Result2 == "Call Bat")
				var/Bats = 0
				for(var/mob/Monsters/Bat/B in usr.UnitList)
					Bats += 1
				for(var/mob/Monsters/X in usr.UnitList)
					if(X.Vampire && X.Level >= 20)
						Bats -= 1
				if(Bats < 3)
					var/mob/Monsters/Bat/S = new
					S.loc = M.loc
					S.Owner = M.Owner
					S.Birth()
					M.Hunger -= 25
					M.Tiredness -= 25
					usr.UnitList += S
					view(M) << "[M] calls out to the mind of a nearby bat"
					return
				else
					usr << "You can only control 3 bats per level 20 vampire in your unitlist."
			if (Result2 == "Create Creature")
				if (M.SandKing == 1)
					if(M.Hunger >= 75)
						var/list/menus = new()
						menus += "Goblin"
						menus += "Kobold"
						menus += "Dwarf"
						menus += "Wolf"
						menus += "Lizardman"
						menus += "Orc"
						menus += "Cancel"
						var/Results = input("Do What?", "Choose", null) in menus
						if (Results != "Cancel")
							..()
						if (Results == "Goblin")
							var/mob/Monsters/Goblin/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							M.Hunger -= 75
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if (Results == "Kobold")
							var/mob/Monsters/Kobold/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							M.Hunger -= 75
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if (Results == "Dwarf")
							var/mob/Monsters/Dwarf/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							M.Hunger -= 75
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if (Results == "Wolf")
							var/mob/Monsters/Wolf/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							S.CanBeSlaved = 0
							M.Hunger -= 50
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if (Results == "Lizardman")
							var/mob/Monsters/LizardMan/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							M.Hunger -= 75
							var/mob/m = M.Owner
							m.UnitList += S
							return
						if (Results == "Orc")
							var/mob/Monsters/Orc/S = new
							S.loc = M.loc
							S.Owner = M.Owner
							S.Birth()
							M.Hunger -= 75
							var/mob/m = M.Owner
							m.UnitList += S
							return
			if (Result2 == "Create Rare Creature")
				if (M.SandKing == 1)
					if(M.Hunger >= 75)
						var/list/menus = new()
						menus += "Vampire"
						menus += "Spider Queen"
						menus += "Svartalfar"
						menus += "Skeleton"
						menus += "Naga"
						menus += "Cancel"
						var/Results = input("Do What?", "Choose", null) in menus
						if (Results != "Cancel")
							..()
						if (Results == "Vampire")
							if (M.Hunger >= 90)
								var/mob/Monsters/Vampire/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.Birth()
								S.name = "{[usr.key]} Vampire"
								S.PillarPowerup()
								M.Hunger -= 90
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Naga")
							if (M.Hunger >= 90)
								var/mob/Monsters/Naga/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.Birth()
								S.name = "{[usr.key]} Naga"
								S.PillarPowerup()
								M.Hunger -= 90
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Spider Queen")
							if (M.Hunger >= 75)
								var/mob/Monsters/SpiderQueen/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Spider Queen"
								S.PillarPowerup()
								M.Hunger -= 75
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Svartalfar")
							if (M.Hunger >= 50)
								var/mob/Monsters/Svartalfar/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Svartalfar"
								S.PillarPowerup()
								M.Hunger -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
						if (Results == "Skeleton")
							if (M.Hunger >= 25)
								var/mob/Monsters/Skeleton/S = new
								S.loc = M.loc
								S.Owner = M.Owner
								S.CanBeSlaved = 0
								S.Birth()
								S.name = "{[usr.key]} Skeleton"
								S.PillarPowerup()
								M.Hunger -= 25
								var/mob/m = M.Owner
								m.UnitList += S
								return
			if (Result2 == "Create Mobile Caccoon")
				if (M.SandKing == 1)
					var/obj/Items/Shafts/MobileSandKing/Sand = new
					Sand.loc = M.loc
					view() << "[M] begins to spin a tight, hard caccoon around itself as it expels a quantity of undigested food from its gullet, it eventually finishes and is completely encased in a seemingly unbreakable caccoon."
					del M
			if (Result2 == "Generate Warrior")
				if(M.Hunger >= 50)
					var/mob/Monsters/SandWarrior/S = new
					S.loc = M.loc
					S.SandWorker = 1
					S.Owner = M.Owner
					S.name = "{[usr]} Sand Soldier"
					S.Birth()
					S.PillarPowerup()
					M.Hunger -= 25
					var/mob/m = M.Owner
					m.UnitList += S
					view() << "[M] spews out a Sand Soldier and becomes hungrier!"
					return
			if (Result2 == "Spawn Mind Worm")
				for(var/mob/Monsters/K in usr.UnitList)
					if(K.Race == "Mind Worm")
						usr << "You can only have one mind worm at a time."
						return
				var/mob/Monsters/MindWorm/S = new
				S.loc = M.loc
				S.Owner = M.Owner
				S.name = "{[usr]} Mind Worm"
				S.Birth()
				var/mob/m = M.Owner
				m.UnitList += S
				view(M) << "A mind worm slowly crawls out of the pool of cerebral fluid bubbling inside of [M]"
				return
			if (Result2 == "Generate Humanoid")
				if(M.Hunger >= 50)
					var/mob/Monsters/SandHumanoid/S = new
					S.loc = M.loc
					S.Dwarf = 1
					S.Owner = M.Owner
					S.name = "{[usr]} Sand Humanoid"
					S.Birth()
					S.PillarPowerup()
					M.Hunger -= 50
					var/mob/m = M.Owner
					m.UnitList += S
					view() << "[M] spews out a Sand Humanoid and becomes hungrier!"
					return
			if (Result2 == "Generate Human")
				if(M.Hunger >= 75)
					var/mob/Monsters/Human/S = new
					S.loc = M.loc
					S.Human = 1
					S.Owner = M.Owner
					S.name = "{[usr]} Human"
					S.Birth()
					S.PillarPowerup()
					M.Hunger -= 75
					var/mob/m = M.Owner
					m.UnitList += S
					view() << "[M] spews out a Human and becomes hungrier!"
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
			if (Result2 == "Morph")
				if(M.IsMist == 0)
					if(M.Morphed == 0)
						var/list/menu5 = new()
						menu5 += "Human"
						menu5 += "Goblin"
						menu5 += "Devourer"
						menu5 += "Kobold"
						menu5 += "Ratman"
						menu5 += "Dwarf"
						menu5 += "LizardMan"
						menu5 += "Orc"
						menu5 += "SpiderQueen"
						menu5 += "SpiderWarrior"
						menu5 += "Black Widow"
						menu5 += "Bat"
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
						if (Result5 == "Devourer")
							M.icon = 'Devourer.dmi'
							M.LimbLoss()
							M.Morphed = 1
							return
						if (Result5 == "Goblin")
							M.icon = 'Goblins.dmi'
							M.LimbLoss()
							M.Morphed = 1
							return
						if (Result5 == "Ratman")
							M.icon = 'Ratmen.dmi'
							M.LimbLoss()
							M.Morphed = 1
							return
						if (Result5 == "SpiderQueen")
							M.icon = 'SpiderQueenMature.dmi'
							M.LimbLoss()
							M.Morphed = 1
							return
						if (Result5 == "SpiderQueen")
							M.icon = 'SpiderQueenMature.dmi'
							M.LimbLoss()
							M.Morphed = 1
							return
						if (Result5 == "Bat")
							M.icon = 'Bat.dmi'
							M.LimbLoss()
							M.Morphed = 1
							M.Flying = 1
							M.Owner << "[M] starts to fly!"
							M.overlays = null
							M.WearingRightArm = 1
							M.WearingShield = 0
							M.WearingLeftArm = 1
							M.WearingChest = 1
							M.WearingLegs = 1
							M.WearingHelmet = 1
							M.WearingFullPlateHelm = 1
							M.WearingCape = 1
							M.HoldingWeapon = "Claws"
							for(var/obj/Items/Weapons/W in M)
								if(W.suffix == "(Equiped)")
									M.WeaponDamageMin -= W.WeaponDamageMin
									M.WeaponDamageMax -= W.WeaponDamageMax
									W.suffix = "(Carrying)"
							for(var/obj/Items/Armours/A in M)
								if(A.suffix == "(Equiped)")
									M.Defence -= A.Defence
									A.suffix = "(Carrying)"
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
					if (M.Morphed == 1)
						if(M.icon == 'Bat.dmi')
							M.WearingRightArm = 0
							M.WearingLeftArm = 0
							M.WearingChest = 0
							M.WearingLegs = 0
							M.WearingHelmet = 0
							M.WearingFullPlateHelm = 0
							M.WearingCape = 0
							M.HoldingWeapon = 0
							M.Flying = 0
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
						M.Morphed = 0
						M.weightmax = -10
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
						M.WearingBack = 0
						M.WearingCape = 0
						M.WeaponDamageMin = 0
						M.WeaponDamageMax = 0
						M.IsMist = 0
						M.weightmax = M.Old
						M.Owner << "[M] turns solid again."
						M.Old = null
						M.LimbLoss()
						for(var/obj/N in M)
							if(N.suffix == "(Mist Form)")
								N.suffix = "(Carrying)"
								M.overlays = null
						if(M.HasWings == 1)
							M.overlays += /obj/
							M.WingsOut = 1
						return
			if (Result2 == "Become Daywalker")
				M.DayWalker = 1
				view() << "[M] harnesses their power and transforms into a creature out of nightmares, a creature not bound to the darkness!"
			if (Result2 == "Levitate")
				if(M.HasLeftLeg == 1)
					if(M.HasRightLeg == 1)
						if(M.HasLeftArm == 1)
							if(M.HasRightArm == 1)
								if(M.Flying == 0)
									M.Tiredness = M.Tiredness/2
									M.Flying = 1
									M.Old2 = M.weightmax
									M.overlays += /obj/sparkle/
									M.weightmax = -10
									M.Owner << "[M] starts to levitate, their triedness is halved!"
									M.Morphed = 0
									return

								if(M.Flying == 1)
									M.Flying = 0
									M.weightmax = M.Old2
									M.overlays -= /obj/sparkle/
									M.Old2 = null
									M.Owner << "[M] lands."
									if(M.CantLoseLimbs == 0)
										M.LimbLoss()
									return
							else
								M.Owner << "[M] is in too much pain to levitate!"
						else
							M.Owner << "[M] is in too much pain to levitate!"
					else
						M.Owner << "[M] is in too much pain to levitate!"
				else
					M.Owner << "[M] is in too much pain to levitate!"
			if (Result2 == "Fly")
				if(M.HasLeftLeg == 1 && M.Gargoyle == 0 && M.Morphed == 0)
					if(M.HasRightLeg == 1)
						if(M.HasLeftArm == 1)
							if(M.HasRightArm == 1)
								if(M.Flying == 0)
									if(M.IsMist == 0)
										if(M.Vampire == 1)
											M.icon = 'Fly.dmi'
											M.overlays -= /obj/wing1/
										if(M.Demon == 1)
											M.icon = 'Fly2.dmi'
											M.overlays -= /obj/wing2/
										if(M.Race == "Angel of Death")
											M.icon = 'Fly4.dmi'
											M.overlays -= /obj/wing4/
										if(M.icon == 'dragons.dmi')
											if(M.icon_state == "red")
												M.icon_state = "flyingred"
											if(M.icon_state == "ice")
												M.icon_state = "flyingice"
											if(M.icon_state == "black")
												M.icon_state = "flyingblack"
											if(M.icon_state == "sand")
												M.icon_state = "flyingsand"
											if(M.icon_state == "green")
												M.icon_state = "flyinggreen"
											if(M.icon_state == "zombie")
												M.icon_state = "flyingzombie"
											if(M.icon_state == "blue")
												M.icon_state = "flyingblue"
											if(M.icon_state == "dark")
												M.icon_state = "flyingdark"
											if(M.icon_state == "gold")
												M.icon_state = "flyinggold"
										M.Tiredness = M.Tiredness/2
										M.Flying = 1
										M.Old2 = M.weightmax
										M.weightmax = -10
										M.Owner << "[M] starts to fly, their triedness is halved!"
										M.Morphed = 0
										return

								if(M.Flying == 1)
									if(M.IsMist == 0)
										if(M.Demon == 1)
											M.icon = 'Demon.dmi'
											M.overlays += /obj/wing2/
											M.WingsOut = 1
										if(M.Vampire)
											M.icon = 'Vampire.dmi'
											M.overlays += /obj/wing1/
											M.WingsOut = 1
										if(M.Gargoyle == 1)
											M.icon = 'Gargoyle.dmi'
											M.overlays += /obj/wing3/
											M.WingsOut = 1
										if(M.Race == "Angel of Death")
											M.icon = 'Angel of Death.dmi'
											M.overlays += /obj/wing4/
											M.WingsOut = 1
										if(M.icon == 'dragons.dmi')
											if(M.icon_state == "flyingred")
												M.icon_state = "red"
											if(M.icon_state == "flyingice")
												M.icon_state = "ice"
											if(M.icon_state == "flyingblack")
												M.icon_state = "black"
											if(M.icon_state == "flyingsand")
												M.icon_state = "sand"
											if(M.icon_state == "flyinggreen")
												M.icon_state = "green"
											if(M.icon_state == "flyingzombie")
												M.icon_state = "zombie"
											if(M.icon_state == "flyingblue")
												M.icon_state = "blue"
											if(M.icon_state == "flyingdark")
												M.icon_state = "dark"
											if(M.icon_state == "flyinggold")
												M.icon_state = "gold"
										M.Flying = 0
										M.WingsOut = 1
										M.weightmax = M.Old2
										M.Old2 = null
										M.Owner << "[M] lands."
										if(M.Race != "Dragon" && M.CantLoseLimbs == 0)
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
				if(M.Demon == 1 || M.Gargoyle == 1 || M.Vampire == 1 || M.Race == "Angel of Death")
					if(M.Flying == 0)
						if(M.WingsOut == 1)
							M.overlays -= /obj/wing1/
							M.overlays -= /obj/wing2/
							M.overlays -= /obj/wing3/
							M.overlays -= /obj/wing4/
							M.WingsOut = 0
						else
							if(M.Demon == 1)
								M.overlays += /obj/wing2/
							if(M.Gargoyle == 1)
								M.overlays += /obj/wing3/
							if(M.Gargoyle == 1)
								M.overlays += /obj/wing1/
							if(M.Race == "Angel of Death")
								M.overlays += /obj/wing4/
							M.WingsOut = 1
					return
			if(Result2 == "Rest")
				if(M.IsMist == 0)
					if(M.Flying == 0)
						M.AMBed()
					else
						M.Owner << "[M] can't sleep while flying"
			if (Result2 == "Rename")
				var/T = input("What Name Will You Give Your [M.Gender] Creature?")as null|text
				if(!T)
					if(M)
						M.name = "{[Safe_Guard(M.Owner)]}"
				else
					if(M)
						M.name = "{[M.Owner]} [Safe_Guard(T)]"
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
						if(M.Snakeperson == 1)
							menu2 += "Consume [C]"
						if(C.Content2 == "Tied")
							menu2 += "Untie"
							if(C.Puller != M)
								menu2 += "Pull"
							if(M.Human == 1)
								menu2 += "Torture"
						if(C.Puller == M)
							menu2 += "Stop Pulling"
						if(M.Plantman == 1)
							menu2 += "Swallow [C]"
						if(C.IsTrader == 1)
							menu2 += "Trade With [C]"
						if(M.Vampire == 0)
							if(M.Using == null)

								menu2 += "Breed With [C]"
						if(M.Werepowers == 1)
							menu2 += "Bite [C]"
						if(M.Race == "Parasite")
							menu2 += "Infect [C]"
						if(M.Race == "Elder Brain")
							menu2 += "Illithid Spawn [C]"
						menu2 += "Cancel"
						var/Result2 = input("Interact With What Object", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Untie")
							if(M in range(1,C))
								C.CanWalk = 1
								C.InHole = 0
								C.Content2 = null
								C.overlays -= typesof(/obj/Items/Traps/Cages/)
								C.Owner << "[M] unties [C]"
								M.Owner << "[M] unties [C]"
								var/obj/Items/Traps/Cages/Rope/R = new
								R.loc = C.loc
								R.icon_state = "RopeOff"
						if(Result2 == "Pull")
							if(M in range(1,C))
								C.Puller = M
								C.BeingPulled()
						if(Result2 == "Torture")
							var/InfoGain = prob(M.Intelligence * 10)
							C.Owner << "[M] violently tortures [C] for information!"
							M.Owner << "[M] violently tortures [C] for information!"
							C.BloodContent -= 15
							C.BloodLoss()
							if(InfoGain == 1)
								M.Owner << "[M] succeeds at gaining information!"
								C.Owner << "[M] succeeds at gaining information!"
								var/html_doc="<head><title>Unit Chat</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Chat Log</U>From:<br> [C]</font><font face=Verdana><font color=COCOCO><br><br>[C.ChatLog]"
								usr<<browse(html_doc,"window=ChatLog")
							else
								M.Owner << "[M] fails to torture information out of [C]"
								C.Owner << "[M] fails to torture information out of [C]"
						if(Result2 == "Stop Pulling")
							C.Puller = null
						if (Result2 == "Illithid Spawn [C]")
							if(M.Race == "Elder Brain")
								if(C.Owner == M.Owner)
									if(C.Illithid == 0)
										var/count = 0
										for(var/mob/Monsters/O in usr.UnitList)
											if(O.Illithid == 1 && O.Race != "Mind Worm" && O.Race != "Elder Brain" && O.Race != "Ulitharid" && O.Race != "Alhoon")
												count += 1
										if(count >= 3)
											usr << "You have too many Illithids already."
											return
										else
											var/Ulitharid = prob(0.1)
											var/mob/Monsters/Illithid/I = new
											I.Intelligence += C.Intelligence / 6
											I.Strength += C.Strength / 12
											I.Agility += C.Agility / 12
											I.Owner = M.Owner
											usr.UnitList += I
											I.loc = C.loc
											I.PillarPowerup()
											view(C) << "An illithid tadpole slowly swims up to the edge of the cerebral pool and latches on to [C]'s head... before slowly eating it's way inside."
											if(Ulitharid == 1)
												usr << "[I] is an Ulitharid, this is a truly rare occasion, and brings great power to your group! (1 in 1000 chance.)"
												I.Intelligence += 40
												I.Race = "Ulitharid"
												I.Defence += 40
												I.Strength += 40
												I.Agility += 40
											for(var/obj/Items/E in C)
												E.suffix = "(Carrying)"
												E.loc = I
												I.weight += E.weight
												I.weightmax = C.weightmax
											del C
									else
										usr << "You cannot insert an Illithid tadpole into an Illithid's brain."
								else
									usr << "[C] won't hold still long enough for it's brain to be eaten..."

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
							if(C.Content2 == "Tied")
								Bite = 1
							if(M in view(1,C))
								if(Bite)
									if(M.density == 1)
										if(M.CoolDown == 0)
											if(M.HasTeeth == 1)
												if(C.WearingFullPlateHelm == 0 && C.icon != 'Skeleton.dmi')
													if(C.Vampire == 0)
														if(C.Wagon == 0)
															if(C.IsTree == 0 && C.Flying == 0)
																if(M.IsMist == 0)
																	if(Infect == 1 && C.ImmuneToVampire == 0 && C.Werewolf == 0 && C.Infects == 0 && C.Spider == 0 && C.Race != "Dragon")
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
															if(G.IsCape == 0)
																C.weight -= G.weight
																C << "[G] shatters!"
																C.WearingFullPlateHelm = 0
																del(G)
								else
									view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
									return


						if (Result2 == "Bite [C]")
							var/Bite = null
							var/CheckStr = M.Strength - C.Strength
							Bite = prob(CheckStr)
							if(Bite == null)
								Bite = 0
							if(C.Content2 == "Tied")
								Bite = 1
							if(M in view(1,C))
								if(Bite)
									if(M.density == 1)
										if(M.CoolDown == 0)
											if(M.HasTeeth == 1)
												if(C.WearingSilver == 0)
													if(C.Vampire == 0 && C.Werewolf == 0 && C.Gargoyle == 0 && C.Svartalfar == 0 && C.Demon == 0 && C.Race != "PlayerSkeleton" && C.Race != "Dragon")
														if(C.Wagon == 0)
															if(C.IsTree == 0)
																if(M.IsMist == 0)
																	var/WereInfect = prob(50)
																	if(WereInfect)
																		var/WerewolfYes = prob(65)
																		view() << "<b><font color=red>[C] is infected by a werewolf!"
																		view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
																		C.BloodContent -= 15
																		C.BloodLoss()
																		M.EXP += 25
																		M.CoolDown = 1
																		spawn(500)
																		if(WerewolfYes)
																			if(C.Human == 1 || C.Dwarf == 1 || C.LizardMan == 1 || C.Goblin == 1 || C.Race == "Orc" || C.Kobold == 1)
																				var/mob/G = C.Owner
																				C.Werewolf = 1
																				C.WerewolfTransformation()
																				C.Carn = 1
																				C.Delay -= 1
																				C.Regen()
																				view() << "[C] has succumbed to the terrible lycanthropy and falls under the control of [M]"
																				var/Resist = prob(90)
																				if(Resist)
																					G.UnitList -= C
																					G.Selected.Remove(src)
																					G.client.images -= src.Star
																					usr.UnitList += C
																					C.Owner = usr
																					view(C) << "[C] is completely dominated by the lycanthropy and becomes a slave to [M]."
																				else
																					view(C) << "[C] resists the controlling impulse of the disease and remains in control of their body and mind!"
																				M.CoolDown = 0
																			else
																				view() << "[C] has succumbed to the terrible lycanthropy, but it is not compatible with their body, they begin to waste away as blood pours from their eyes and body."
																				C.BloodContent -= 250
																				C.BloodLoss()
																				M.CoolDown = 0
																		else
																			view() << "[C] has recovered from the vile infection passed to it by the werewolf"
																			M.CoolDown = 0
																		return
																	else
																		view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
																		C.BloodContent -= 15
																		C.BloodLoss()
																		M.EXP += 25
																		C.Death()
																		M.CoolDown = 1
																		spawn(300)
																			if(M)
																				M.CoolDown = 0
																		return
													else
														M.Owner << "You can't bite one of those creatures!"

												else
													view() << "<b><font color=red>[M] tries to bite [C] but is burned by their silver armor!"
													M.BloodContent -= 15
													M.BloodLoss()
								else
									view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
									M.CoolDown = 1
									spawn(300)
									M.CoolDown = 0
									return

						if (Result2 == "Breed With [C]")
							if(M.Vampire == 1)
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
															if(C.Owner == M.Owner || C.Content2 == "Tied")
																if(C.Gender == "Female")
																	if(C.Age <= 100)
																		if(C.Age >= 5)
																			if(M.Age <= 100)
																				if(M.Age >= 5)
																					if(M.Spider == 0)
																						if(M in view(1,C))
																							if(C.Preg == 0)
																								view() << "[C] is due to have a baby!"
																								if(C.LizardMan == 0)
																									C.Preg = 1
																									C.overlays += /obj/preg/
																									C.TheDad = M
																									C.Pregnancy()
																								if(C.FrogMan == 1)
																									var/mob/Monsters/LizardEgg/G = new
																									G.loc = C.loc
																									G.Owner = C.Owner
																									G.Mum = C
																									G.Pregnancy()
																									G.SpearSkill = C.SpearSkill/3
																									G.BowSkill = C.BowSkill/3
																									G.SwordSkill = C.SwordSkill/3
																									G.AxeSkill = C.AxeSkill/3
																									G.MaceSkill = C.MaceSkill/3
																									G.UnArmedSkill = C.UnArmedSkill/3
																									G.ShieldSkill = C.ShieldSkill/3
																									G.ArmourSkill = C.ArmourSkill/3
																									G.BuildingSkill = C.BuildingSkill /3
																									G.ForgingSkill = C.ForgingSkill/3
																									G.WoodCraftingSkill = C.WoodCraftingSkill/3
																									G.MetalCraftingSkill = C.MetalCraftingSkill/3
																									G.SkinningSkill = C.SkinningSkill/3
																									G.SmeltingSkill = C.SmeltingSkill/3
																									G.JewlCraftingSkill = C.JewlCraftingSkill/3
																									G.ButcherySkill = C.ButcherySkill/3
																									G.LeatherCraftingSkill = C.LeatherCraftingSkill/3
																									G.PoisonSkill = C.PoisonSkill /3
																									G.BoneCraftingSkill = C.BoneCraftingSkill/3
																									G.StoneCraftingSkill = C.StoneCraftingSkill/3
																									G.SneakingSkill = C.SneakingSkill/3
																									G.LockPickingSkill = C.LockPickingSkill/3
																									G.CookingSkill = C.CookingSkill /3
																									G.FishingSkill = C.FishingSkill /3
																									G.PotionSkill = C.PotionSkill /3
																									G.LizardMan = 0
																									C.Pregnancy()
																									C.TheDad = M
																									C.overlays -= /obj/preg/
																									C.Preg = 1
																									return
																								if(C.LizardMan == 1)
																									var/mob/Monsters/LizardEgg/G = new
																									G.loc = C.loc
																									G.Owner = C.Owner
																									G.Mum = C
																									G.Pregnancy()
																									G.SpearSkill = C.SpearSkill/3
																									G.BowSkill = C.BowSkill/3
																									G.SwordSkill = C.SwordSkill/3
																									G.AxeSkill = C.AxeSkill/3
																									G.MaceSkill = C.MaceSkill/3
																									G.UnArmedSkill = C.UnArmedSkill/3
																									G.ShieldSkill = C.ShieldSkill/3
																									G.ArmourSkill = C.ArmourSkill/3
																									G.BuildingSkill = C.BuildingSkill /3
																									G.ForgingSkill = C.ForgingSkill/3
																									G.WoodCraftingSkill = C.WoodCraftingSkill/3
																									G.MetalCraftingSkill = C.MetalCraftingSkill/3
																									G.SkinningSkill = C.SkinningSkill/3
																									G.SmeltingSkill = C.SmeltingSkill/3
																									G.JewlCraftingSkill = C.JewlCraftingSkill/3
																									G.ButcherySkill = C.ButcherySkill/3
																									G.LeatherCraftingSkill = C.LeatherCraftingSkill/3
																									G.PoisonSkill = C.PoisonSkill /3
																									G.BoneCraftingSkill = C.BoneCraftingSkill/3
																									G.StoneCraftingSkill = C.StoneCraftingSkill/3
																									G.SneakingSkill = C.SneakingSkill/3
																									G.LockPickingSkill = C.LockPickingSkill/3
																									G.CookingSkill = C.CookingSkill /3
																									G.FishingSkill = C.FishingSkill /3
																									G.PotionSkill = C.PotionSkill /3
																									C.Pregnancy()
																									C.TheDad = M
																									C.overlays -= /obj/preg/
																									C.Preg = 1
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
																									if(C.LizardMan == 0)
																										view() << "[C] is due to have a baby!"
																										C.Preg = 1
																										C.overlays += /obj/preg/
																										C.TheDad = M
																										C.Pregnancy()
																										return
																									if(C.FrogMan == 1)
																										var/mob/Monsters/LizardEgg/G = new
																										G.loc = C.loc
																										G.Owner = C.Owner
																										G.Mum = C
																										G.Pregnancy()
																										G.SpearSkill = C.SpearSkill/3
																										G.BowSkill = C.BowSkill/3
																										G.SwordSkill = C.SwordSkill/3
																										G.AxeSkill = C.AxeSkill/3
																										G.MaceSkill = C.MaceSkill/3
																										G.UnArmedSkill = C.UnArmedSkill/3
																										G.ShieldSkill = C.ShieldSkill/3
																										G.ArmourSkill = C.ArmourSkill/3
																										G.BuildingSkill = C.BuildingSkill /3
																										G.ForgingSkill = C.ForgingSkill/3
																										G.WoodCraftingSkill = C.WoodCraftingSkill/3
																										G.MetalCraftingSkill = C.MetalCraftingSkill/3
																										G.SkinningSkill = C.SkinningSkill/3
																										G.SmeltingSkill = C.SmeltingSkill/3
																										G.JewlCraftingSkill = C.JewlCraftingSkill/3
																										G.ButcherySkill = C.ButcherySkill/3
																										G.LeatherCraftingSkill = C.LeatherCraftingSkill/3
																										G.PoisonSkill = C.PoisonSkill /3
																										G.BoneCraftingSkill = C.BoneCraftingSkill/3
																										G.StoneCraftingSkill = C.StoneCraftingSkill/3
																										G.SneakingSkill = C.SneakingSkill/3
																										G.LockPickingSkill = C.LockPickingSkill/3
																										G.CookingSkill = C.CookingSkill /3
																										G.FishingSkill = C.FishingSkill /3
																										G.PotionSkill = C.PotionSkill /3
																										G.LizardMan = 0
																										C.Pregnancy()
																										C.TheDad = M
																										C.overlays -= /obj/preg/
																										C.Preg = 1
																										return
																									if(C.LizardMan == 1)
																										var/mob/Monsters/LizardEgg/G = new
																										G.loc = C.loc
																										G.Owner = C.Owner
																										G.Mum = C
																										G.Pregnancy()
																										G.SpearSkill = C.SpearSkill/3
																										G.BowSkill = C.BowSkill/3
																										G.SwordSkill = C.SwordSkill/3
																										G.AxeSkill = C.AxeSkill/3
																										G.MaceSkill = C.MaceSkill/3
																										G.UnArmedSkill = C.UnArmedSkill/3
																										G.ShieldSkill = C.ShieldSkill/3
																										G.ArmourSkill = C.ArmourSkill/3
																										G.BuildingSkill = C.BuildingSkill /3
																										G.ForgingSkill = C.ForgingSkill/3
																										G.WoodCraftingSkill = C.WoodCraftingSkill/3
																										G.MetalCraftingSkill = C.MetalCraftingSkill/3
																										G.SkinningSkill = C.SkinningSkill/3
																										G.SmeltingSkill = C.SmeltingSkill/3
																										G.JewlCraftingSkill = C.JewlCraftingSkill/3
																										G.ButcherySkill = C.ButcherySkill/3
																										G.LeatherCraftingSkill = C.LeatherCraftingSkill/3
																										G.PoisonSkill = C.PoisonSkill /3
																										G.BoneCraftingSkill = C.BoneCraftingSkill/3
																										G.StoneCraftingSkill = C.StoneCraftingSkill/3
																										G.SneakingSkill = C.SneakingSkill/3
																										G.LockPickingSkill = C.LockPickingSkill/3
																										G.CookingSkill = C.CookingSkill /3
																										G.FishingSkill = C.FishingSkill /3
																										G.PotionSkill = C.PotionSkill /3
																										C.Pregnancy()
																										C.TheDad = M
																										C.overlays -= /obj/preg/
																										C.Preg = 1

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
							if(C.InHole == 1)
								if(M in view(1,C))
									view() << "<b><font color=red>[M] Rescues [C] from a trap"
									C.InHole = 0
									C.SneakingSkill +=1
									C.HasPersonIn = 0
									for(var/obj/Items/Traps/PitTrap/P in view(0,C))
										del(P)
						if (Result2 == "Consume [C]")
							if(C.InHole == 1)
								if(M in view(1,C))
									if(M.DigestingPrey == 0)
										if(C.Gargoyle == 0)
											view() << "<b><font color=red>[M] consumes [C] alive and begins to digest them!"
											C.InHole = 0
											C.SneakingSkill +=1
											C.HasPersonIn = 0
											for(var/obj/Items/Traps/PitTrap/P in view(0,C))
												del(P)
											M.EXPNeeded -= C.EXPNeeded / 10
											M.SwordSkill += C.SwordSkill / 5
											M.UnArmedSkill += C.UnArmedSkill / 5
											M.ShieldSkill += C.ShieldSkill / 5
											M.Strength += C.Strength / 5
											M.Agility += C.Agility / 5
											M.MetalCraftingSkill += C.MetalCraftingSkill / 10
											M.BoneCraftingSkill += C.BoneCraftingSkill / 10
											M.WoodCraftingSkill += C.WoodCraftingSkill / 10
											M.LeatherCraftingSkill += C.LeatherCraftingSkill / 10
											M.AxeSkill += C.AxeSkill / 5
											M.MaceSkill += C.MaceSkill / 5
											M.BowSkill += C.BowSkill / 5
											M.SpearSkill += C.SpearSkill / 5
											M.Hunger = 350
											del C
											M.DigestingPrey = 1
											if(M.Delay >= 1)
												M.Delay -= 0.025
											spawn(700)
											M.DigestingPrey = 0
										else
											M.Owner << "What, are you crazy? That would kill you."
									else
										M.Owner << "[M] cannot try to eat again this soon."
							else if(C.Stunned == 1 && C.Ratmen == 0 && C.Gargoyle == 0)
								if(M in view(1,C))
									if(M.DigestingPrey == 0)
										var/GH = prob(45)
										if(GH == 1)
											view() << "<b><font color=red>[M] consumes [C] alive and begins to digest them!"
											C.InHole = 0
											C.SneakingSkill +=1
											C.HasPersonIn = 0
											for(var/obj/Items/Traps/PitTrap/P in view(0,C))
												del(P)
											M.EXPNeeded -= C.EXPNeeded / 10
											M.SwordSkill += C.SwordSkill / 10
											M.UnArmedSkill += C.UnArmedSkill / 10
											M.ShieldSkill += C.ShieldSkill / 10
											M.Strength += C.Strength / 10
											M.Agility += C.Agility / 10
											M.MetalCraftingSkill += C.MetalCraftingSkill / 15
											M.BoneCraftingSkill += C.BoneCraftingSkill / 15
											M.WoodCraftingSkill += C.WoodCraftingSkill / 15
											M.LeatherCraftingSkill += C.LeatherCraftingSkill / 15
											M.AxeSkill += C.AxeSkill / 10
											M.MaceSkill += C.MaceSkill / 10
											M.BowSkill += C.BowSkill / 10
											M.SpearSkill += C.SpearSkill / 10
											M.Hunger = 350
											del C
											M.DigestingPrey = 1
											if(M.Delay >= 1)
												M.Delay -= 0.025
											spawn(700)
											M.DigestingPrey = 0
										else
											M.DigestingPrey = 1
											spawn(100)
											M.DigestingPrey = 0
											view(M) << "[M] tries to consume [C] alive but fails, even though C is stunned!"
									else
										M.Owner << "[M] cannot try to eat again this soon."
							else
								if(M in view(1,C))
									if(M.DigestingPrey == 0)
										if(C.Gargoyle == 0)
											var/GH = prob(15)
											if(C.Ratmen == 1)
												GH = 1
											if(GH == 1)
												view() << "<b><font color=red>[M] consumes [C] alive and begins to digest them!"
												C.InHole = 0
												C.SneakingSkill +=1
												C.HasPersonIn = 0
												for(var/obj/Items/Traps/PitTrap/P in view(0,C))
													del(P)
												M.EXPNeeded -= C.EXPNeeded / 10
												M.SwordSkill += C.SwordSkill / 10
												M.UnArmedSkill += C.UnArmedSkill / 10
												M.ShieldSkill += C.ShieldSkill / 10
												M.Strength += C.Strength / 10
												M.Agility += C.Agility / 10
												M.MetalCraftingSkill += C.MetalCraftingSkill / 15
												M.BoneCraftingSkill += C.BoneCraftingSkill / 15
												M.WoodCraftingSkill += C.WoodCraftingSkill / 15
												M.LeatherCraftingSkill += C.LeatherCraftingSkill / 15
												M.AxeSkill += C.AxeSkill / 10
												M.MaceSkill += C.MaceSkill / 10
												M.BowSkill += C.BowSkill / 10
												M.SpearSkill += C.SpearSkill / 10
												M.Hunger = 350
												del C
												M.DigestingPrey = 1
												if(M.Delay >= 1)
													M.Delay -= 0.025
												spawn(700)
												M.DigestingPrey = 0
											else
												M.DigestingPrey = 1
												spawn(100)
												M.DigestingPrey = 0
												view(M) << "[M] tries to consume [C] alive but fails miserably!"
										else
											M.Owner << "What, are you crazy? That would kill you."
									else
										M.Owner << "[M] cannot try to eat again this soon."
						if(Result2 == "Swallow [C]")
							if(C.Gargoyle == 0)
								if(M in view(1,C))
									if(M.DigestingPrey == 0)
										var/GH = prob(3)
										if(GH == 1)
											view() << "<b><font color=red>Thick vines lash out from [M]'s gaping mouth, wrapping themselves around [C]'s legs and quickly retracting, drawing the helpless victim into the waiting jaws of [M]"
											C.InHole = 0
											C.SneakingSkill +=1
											C.HasPersonIn = 0
											for(var/obj/Items/Traps/PitTrap/P in view(0,C))
												del(P)
											M.EXPNeeded -= C.EXPNeeded / 10
											M.SwordSkill += C.SwordSkill / 10
											M.UnArmedSkill += C.UnArmedSkill / 10
											M.ShieldSkill += C.ShieldSkill / 10
											M.Strength += C.Strength / 10
											M.Agility += C.Agility / 10
											M.MetalCraftingSkill += C.MetalCraftingSkill / 15
											M.BoneCraftingSkill += C.BoneCraftingSkill / 15
											M.WoodCraftingSkill += C.WoodCraftingSkill / 15
											M.LeatherCraftingSkill += C.LeatherCraftingSkill / 15
											M.AxeSkill += C.AxeSkill / 10
											M.MaceSkill += C.MaceSkill / 10
											M.BowSkill += C.BowSkill / 10
											M.SpearSkill += C.SpearSkill / 10
											M.Hunger = 350
											del C
											M.DigestingPrey = 1
											if(M.Delay >= 1.025)
												M.Delay -= 0.025
											spawn(700)
											M.DigestingPrey = 0
										else
											M.DigestingPrey = 1
											view(M) << "Thick vines lash out of [M]'s mouth and attempt to wrap around [C], but fail and withdraw themselves back into the plant's gaping mouth."
											spawn(100)
											M.DigestingPrey = 0
									else
										M.Owner << "[M] cannot try to eat again this soon."
							else
								M.Owner << "You can't eat gargoyles."
						if (Result2 == "Infect [C]")
							if(C.Vampire == 0)
								if(M in view(1,C))
									if(M.Owner != C.Owner)
										if(C.HumanParts == 1)
											if(C.Race != "Parasite")
												var/One = prob(35)
												if(One)
													view() << "<b><font color=purple>[M] spews spores into [C]'s mouth and infects them with its parasitic disease!"
													var/mob/Monsters/ParaZombie/Z = new
													Z.loc = C.loc
													Z.Owner = usr
													usr.UnitList += Z
													Z.Undead = 1
													Z.icon_state = C.icon_state
													Z.icon = C.icon
													Z.density = 1
													del C
													var/obj/Bloods/Infection/Z2 = new
													Z.overlays += Z2
												else
													view() << "<b><font color=purple>[M] attenpts to spew spores into [C]'s mouth and infect them with its parasitic disease but fails miserably!"
													C.SneakingSkill +=1
mob/verb/Emote(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		M.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				var/list/viewmob = list()
				for(var/mob/m in view(M))
					viewmob += m.Owner
				for(var/mob/g in viewmob)
					var/mob/replace = g
					for(var/mob/g2 in viewmob)
						if(g2 == g)
							viewmob.Remove(g)
					viewmob += replace
				for(var/mob/g in viewmob)
					if(g in view(M))
						g << "[M] [Safe_Guard(T)]"
					else if(M.Owner == g)
						g << "[M] [Safe_Guard(T)]"
					else
						g << "([M.x],[M.y],[M.z])   [M] [Safe_Guard(T)]"
			for(var/mob/K in range(10,M))
				if(K.IsGoodGod == 1 || K.IsEvilGod == 1 || K.GM == 1)
					for(var/mob/KM in view(M))
						if(KM.Owner == K)
							return
					K << "[M] [Safe_Guard(T)]"
mob/verb/TurnOffCombatSound()
	if(usr.Shadowfiend == 0)
		usr << "Combat Sound Off"
		usr.Shadowfiend = 1
		return
	if(usr.Shadowfiend == 1)
		usr << "Combat Sound On"
		usr.Shadowfiend = 0
		return
mob/verb/UnitSay(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		M.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Tame == 0)
				if(M.Wagon == 0)
					var/list/viewmob = list()
					for(var/mob/m in view(M))
						viewmob += m.Owner
					for(var/mob/g in viewmob)
						var/mob/replace = g
						for(var/mob/g2 in viewmob)
							if(g2 == g)
								viewmob.Remove(g)
						viewmob += replace
					for(var/mob/g in viewmob)
						if(g in view(M))
							g << "<font color = blue>[M] says:[Safe_Guard(T)]"
						else if(M.Owner == g)
							g << "<font color = blue>[M] says :[Safe_Guard(T)]"
						else
							g << "<font color = blue>([M.x],[M.y],[M.z])   [M] says:[Safe_Guard(T)]"
				for(var/mob/K in range(10,M))
					if(K.IsGoodGod == 1 || K.IsEvilGod == 1 || K.GM == 1)
						for(var/mob/KM in view(M))
							if(KM.Owner == K)
								return
						K << "<font color = blue>[M] says:[Safe_Guard(T)]"
mob/proc/Patrol()
	if(src.PatrolPoint1)
		if(src.PatrolPoint2)
			if(src.CanSee == 1)
				if(src.Sleeping == 0)
					if(src.HasLeftEye == 1 && src.HasRightEye == 1 && src.Wagon == 0)
						if(src.destination == null)
							src.destination = src.PatrolPoint1
						if(src.destination == src.PatrolPoint1)
							if(src.PatrolPoint1 in view(0,src))
								src.destination = src.PatrolPoint2
						if(src.destination == src.PatrolPoint2)
							if(src.PatrolPoint2 in view(0,src))
								src.destination = src.PatrolPoint1
						for(var/mob/Monsters/M in oview(6,src))
							if(M.destination == src)
								if(M.Wagon == 0)
									src.destination = M
									src.Target = M
							if(M.Owner == src.Owner)
								for(var/mob/Monsters/S in oview(6,M))
									if(S.destination == M)
										if(S.Body == 0)
											if(S.Wagon == 0)
												if(S.Drill == 0)
													src.destination = S
													src.Target = S
					else
						src.Owner << "You're missing eyes!"
						return
				else
					src.Owner << "You're asleep!"
					return
			else
				src.Owner << "You're blind!"
				return
		else
			return
	else
		return
	spawn(20) Patrol()
mob/verb/PlaceTapestry()
	if(usr.Function == "Tapestry")
		usr << "No longer placing/removing tapestries."
		usr.Function = null
	else
		usr.Function = "Tapestry"
		usr << "Now placing/removing tapestries. Single Click a wall near a selected unit."
mob/verb/Guard()
	var/list/menu17 = new()
	menu17 += "Agressive Mode On"
	menu17 += "Agressive Mode Off"
	menu17 += "Guard On"
	menu17 += "Guard Off"
	menu17 += "Set Patrol Points"
	menu17 += "Patrol On"
	menu17 += "Patrol Off"
	menu17 += "Cancel"
	var/Result17 = input("What Action Will You Choose?", "Choose", null) in menu17
	if (Result17 != "Cancel")
		..()
	if (Result17 == "Patrol On")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.CanSee == 1)
				if(M.Wagon == 0)
					M.destination = null
					M.ContinuePatrol()
					M.Patrol()
	if (Result17 == "Patrol Off")
		for(var/mob/Monsters/M in usr.Selected)
			M.destination = null
			M.PatrolPoint1 = null
			M.PatrolPoint2 = null
	if (Result17 == "Set Patrol Points")
		for(var/mob/Monsters/M in usr.Selected)
			M.PatrolPoint1 = null
			M.PatrolPoint2 = null
			usr << "Click tile to place first patrol point<br>"
			usr.Function = "PatrolPoint1"
	if (Result17 == "Guard On")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 0)
					usr << "[M] is now guarding!"
					M.HomeLoc = M.loc
					M.OnGuard = 1
					M.MobAttack()
					M.MobReturnHome()
	if (Result17 == "Agressive Mode Off")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 1)
					usr << "[M] has stopped agressive guarding!"
					M.OnGuard = 0
					M.HomeLoc = null
					M.Target = null
					M.AttackTarget = null
	if (Result17 == "Agressive Mode On")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 0)
					usr << "[M] is now agressive guarding!"
					M.HomeLoc = M.loc
					M.OnGuard = 1
					M.AgressiveAttack()
					M.MobReturnHome()


	if (Result17 == "Guard Off")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 1)
					usr << "[M] has stopped guarding!"
					M.OnGuard = 0
					M.HomeLoc = null
					M.Target = null



mob/proc/ContinuePatrol()
	if(src.PatrolPoint1)
		if(src.PatrolPoint2)
			if(src.Sleeping == 0)
				src.destination = src.PatrolPoint1
				src.Target = null
		else
			return
	else
		return
	spawn(350) ContinuePatrol()
mob/proc/MobReturnHome()
	if(src.OnGuard == 1)
		if(src.Sleeping == 0)
			src.destination = src.HomeLoc
			src.Target = null
	else
		return
	spawn(500) MobReturnHome()
mob/proc/AgressiveAttack()
	var/OGB = 0
	if(src.loc == src.HomeLoc)
		if(src.destination == src.HomeLoc)
			src.destination = null
	if(src.OnGuard)
		for(var/mob/Monsters/M in oview(6,src))
			if(M.Owner != src.Owner)
				if(M.Wagon == 0)
					if(src.destination == null)
						for(var/mob/KLL in Players2)
							if(KLL == src.Owner)
								for(var/mob/MK in Players2)
									if(M.Owner == MK)
										if(MK.key in KLL.AllyList || MK.Faction == KLL.Faction)
											OGB = 1
						if(OGB == 0)
							if(src.HoldingWeapon == "Bow" || src.HoldingWeapon == "Hellbow")
								if(src.BowOn == 0)
									src.BowOn = 1
									src.Target = M
									src.BowTarget()
							else
								src.destination = M
								src.AttackTarget = M
								src.Target = M
	spawn(50)
		AgressiveAttack()

mob/proc/TurretFire()
	var/OGB = 0
	if(src)
		for(var/mob/Monsters/M in oview(6,src))
			if(M.Owner != src.Owner)
				if(M.Wagon == 0 && M.Race != "Gremlin" && M.Humanoid == 1 && M.Mole == 0 && M.Beatle == 0 && M.Wolf == 0 && M.Deer == 0 && M.IsTree == 0)
					for(var/mob/KLL in world)
						if(KLL == src.Owner)
							for(var/mob/MK in Players2)
								if(M.Owner == MK)
									if(MK.key in KLL.AllyList || MK.Faction == KLL.Faction)
										OGB = 1
					if(OGB == 0)
						if(src.icon_state == "GuardstoneRuby")
							var/FireChance = prob(0.1)
							if(FireChance == 1)
								M.Fire()
							M.RightArmHP -= rand(1,10)
							M.LeftArmHP -= rand(1,10)
							M.RightLegHP -= rand(1,10)
							M.LeftLegHP -= rand(1,10)
							M.LeftLeg = "Burned"
							M.RightLeg = "Burned"
							M.LeftArm = "Burned"
							M.RightArm = "Burned"
							M.Owner << "[src] fires a jet of flame at [M]"
							src.Owner << "[src] fires a jet of flame at [M]"
							if(M.RightArmHP <= 0)
								M.HasRightArm = 0
								M.LimbLoss()
							if(M.LeftArmHP <= 0)
								M.HasLeftArm = 0
								M.LimbLoss()
							if(M.RightLegHP <= 0)
								M.HasRightLeg = 0
								M.LimbLoss()
								M.CanWalk = 0
							if(M.LeftLegHP <= 0)
								M.HasLeftLeg = 0
								M.LimbLoss()
								M.CanWalk = 0
							break
						if(src.icon_state == "GuardstoneEmerald")
							var/InfectChance = prob(0.25)
							if(InfectChance == 1)
								M.CommonColdDisease()
							M.BloodContent -= rand(1,10)
							M.BloodLoss()
							M.Owner << "[src] fires a bolt of poison at [M]"
							src.Owner << "[src] fires a bolt of poison at [M]"
							break
						if(src.icon_state == "GuardstoneDiamond")
							M.Slowdown2()
							M.BrainWashed -= 1
							M.BloodContent -= 1
							M.Owner << "[src] fires a field of force at [M]"
							src.Owner << "[src] fires a field of force at [M]"
							if(M.BrainWashed <= 0)
								for(var/mob/S in world)
									if(S == src.Owner)
										for(var/mob/O in world)
											if(O == M.Owner)
												M.Owner = S
												M.CanBeSlaved = 0
												S.UnitList += M
												O.UnitList -= M
												O.Selected.Remove(M)
												O.client.images -= M.Star
												O << "[M] has been brainwashed by the diamond tower and falls under its control!"
												S << "[src] brainwashes [M] and puts it under your control!"
												break
						if(src.icon_state == "GuardstoneRubyAdamantium")
							var/FireChance = prob(0.2)
							if(FireChance == 1)
								M.Fire()
							M.RightArmHP -= rand(20,30)
							M.LeftArmHP -= rand(20,30)
							M.RightLegHP -= rand(20,30)
							M.LeftLegHP -= rand(20,30)
							M.LeftLeg = "Burned"
							M.RightLeg = "Burned"
							M.LeftArm = "Burned"
							M.RightArm = "Burned"
							M.Owner << "[src] fires a jet of flame at [M]"
							if(M.RightArmHP <= 0)
								M.HasRightArm = 0
								M.RightArm = "Burned Off"
								M.LimbLoss()
							if(M.LeftArmHP <= 0)
								M.HasLeftArm = 0
								M.LeftArm = "Burned Off"
								M.LimbLoss()
							if(M.RightLegHP <= 0)
								M.HasRightLeg = 0
								M.RightLeg = "Burned Off"
								M.LimbLoss()
								M.CanWalk = 0
							if(M.LeftLegHP <= 0)
								M.HasLeftLeg = 0
								M.LeftLeg = "Burned Off"
								M.LimbLoss()
								M.CanWalk = 0
							break
						if(src.icon_state == "GuardstoneEmeraldAdamantium")
							var/InfectChance = prob(0.25)
							if(InfectChance == 1)
								M.BlackPlague()
							M.BloodContent -= rand(25,40)
							M.BloodLoss()
							M.Owner << "[src] fires a bolt of poison at [M]"
							break
						if(src.icon_state == "GuardstoneDiamondAdamantium")
							M.Slowdown2()
							M.Slowdown2()
							M.Slowdown2()
							M.BrainWashed -= 3
							M.Owner << "[src] fires a field of force at [M]"
							if(M.BrainWashed <= 0)
								for(var/mob/S in world)
									if(S == src.Owner)
										for(var/mob/O in world)
											if(O == M.Owner)
												M.Owner = S
												M.CanBeSlaved = 0
												S.UnitList += M
												O.UnitList -= M
												O.Selected.Remove(M)
												O.client.images -= M.Star
												O << "[M] has been brainwashed by the diamond tower and falls under its control!"
												S << "[src] brainwashes [M] and puts it under your control!"
												break
	spawn(50)
		TurretFire()
		return
mob/proc/MobAttack()
	if(src.loc == src.HomeLoc)
		if(src.destination == src.HomeLoc)
			src.destination = null
	if(src.OnGuard)
		for(var/mob/Monsters/M in oview(6,src))
			if(M.destination == src)
				if(M.Wagon == 0)
					if(M.Owner != src.Owner)
						if(src.destination == null)
							src.destination = M
							src.AttackTarget = M
							src.Target = M
							if(src.HoldingWeapon == "Bow" || src.HoldingWeapon == "Hellbow")
								if(src.BowOn == 0)
									src.BowOn = 1
									src.Target = M
									src.BowTarget()
			if(M.Owner == src.Owner)
				for(var/mob/Monsters/S in oview(6,M))
					if(S.destination == M)
						if(src.destination == null)
							if(S.Body == 0)
								if(S.Wagon == 0)
									if(S.Drill == 0)
										if(src.HoldingWeapon == "Bow" || src.HoldingWeapon == "Hellbow")
											if(src.BowOn == 0)
												src.Target = S
												src.BowOn = 1
												src.BowTarget()
										else
											src.destination = S
											src.Target = S

	spawn(7) MobAttack()
mob/proc/MobAttack2()
	var/OGB = 0
	if(src.OnGuard == 1)
		for(var/mob/Monsters/M in oview(5,src))
			if(M.Owner == src.Owner)
				OGB = 1
			for(var/mob/KLK in Players2)
				if(KLK == src.Owner)
					for(var/mob/MK in world)
						if(M.Owner == MK)
							if(MK.key in KLK.AllyList || MK.Faction == KLK.Faction)
								OGB = 1
			if(OGB == 0)
				if(src.Target == null)
					src.destination = M
					src.Target = M
					src.AttackTarget = M
	else
		return




	spawn(5) MobAttack2()

mob/proc/Attacks()
	if(src.Tame == 0)
		if(src.destination == null)
			for(var/mob/Monsters/M in oview(6,src))
				if(src.Wolf)
					if(M.Wolf == 0)
						if(M.Wagon == 0)
							src.destination = M
							src.AttackTarget = M
							src.Target = M




	else
		return
	spawn(10) Attacks()

mob/verb/dfdfgff()
	set hidden = 1
	return
	var/list/menu = new()
	for(var/mob/Monsters/A in usr.Selected)
		if(A.density == 1)
			if(A.Spider == 1)
				for(var/mob/Monsters/Wagon/W in usr.Selected)
					usr.Selected.Remove(W)
					usr.client.images -= W.Star
					usr.Selected.Remove(A)
					usr.client.images -= A.Star
					usr << "You cant build with a wagon selected!!!"
				menu += "Silk Contruction"
				menu += "Stairs"
			if(A.Spider == 0)
				if(A.Chest == 0)
					menu += "WorkShops"
					menu += "Traps"
					menu += "Build Walls/Floors"
					menu += "Build Bridge"
					if(A.CanFarm == 1)
						menu += "Build FarmLand"
					menu += "Stairs"
	for(var/mob/Monsters/A in usr.Selected)
		if(A.CanDetail == 1)
			menu += "Detail"
	menu += "Cancel"
	var/Result = input("What Action Will You Choose?", "Choose", null) in menu
	if (Result != "Cancel")
		..()
	if (Result == "Build FarmLand")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Shafts/Spade/S in M)
				for(var/turf/grounds/W in view(1,M))
					if(W.icon_state == "Grass")
						W.icon = 'Cave.dmi'
						W.icon_state = "FarmLand"
						W.name = "FarmLand"
						W.Detailed = 1
						return
			for(var/obj/Items/Shafts/WoodenSpade/S in M)
				for(var/turf/grounds/W in view(1,M))
					if(W.icon_state == "Grass")
						W.icon = 'Cave.dmi'
						W.icon_state = "FarmLand"
						W.name = "FarmLand"
						W.Detailed = 1
						return
	if (Result == "Build Bridge")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/ores/stone/S in M)
				for(var/turf/grounds/waters/W in view(1,M))
					if(W.isbridge == 0)
						W.density = 0
						W.CanFish = 0
						W.isbridge = 1
						W.Cant = 1
						W.icon = 'Cave.dmi'
						W.icon_state = "Bridge"
						M.weight -= S.weight
						del(S)
						break
						return
				for(var/turf/grounds/lavas/W in view(1,M))
					if(W.isbridge == 0)
						W.density = 0
						W.isbridge = 1
						W.Cant = 1
						W.icon = 'Cave.dmi'
						W.icon_state = "LavaBridge"
						M.weight -= S.weight
						del(S)
						break
						return



	if (Result == "Silk Contruction")
		var/list/menu17 = new()
		for(var/mob/Monsters/A in usr.Selected)
			if(A.CanBuildSilk == 1)
				if(A.IsHunter == 0)
					if(A.WebContent >= 25)
						menu17 += "Hardened Silk Wall"
					if(A.WebContent >= 25)
						menu17 += "Silk Decoration"
					if(A.WebContent >= 25)
						menu17 += "Hardened Silk Bridge"
				if(A.WebContent >= 50)
					if(A.IsWorker == 0)
						menu17 += "Sticky Pit Trap"
				if(A.WebContent >= 75)
					menu17 += "Silk Training Post"
				if(A.WebContent >= 50)
					menu17 += "Cacoon"
			menu17 += "Cancel"
			var/Result17 = input("What Action Will You Choose?", "Choose", null) in menu17
			if (Result17 != "Cancel")
				..()
			if (Result17 == "Cacoon")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.WebContent >= 50)
						var/obj/Items/Traps/Cages/Cacoon/C = new
						C.loc = M.loc
						C.desc = "This is a cacoon, it is used by spiders to in-trap victims."
						M.WebContent -= 50
						return
			if (Result17 == "Sticky Pit Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						if(M.WebContent >= 50)
							M.CreatePit()
							M.WebContent -= 50
							break
			if (Result17 == "Silk Training Post")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						if(M.Spider == 1)
							if(M.WebContent >= 75)
								var/obj/Items/Furniture/Posts/SilkTrainingPost/P = new
								P.loc = M.loc
								M.WebContent -= 75
								M.weight -= W.weight
								P.HP = 3000
								del(W)
								break
								return
			if (Result17 == "Silk Decoration")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									var/D
									D = prob(50)
									if(D == 1)
										W.overlays += 'Decoration1.dmi'
									else
										W.overlays += 'Decoration2.dmi'
									M.WebContent -= 25
									break
									return
			if (Result17 == "Hardened Silk Bridge")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						if(M.WebContent >= 25)
							for(var/turf/grounds/waters/W in view(1,M))
								if(W.isbridge == 0)
									W.density = 0
									W.CanFish = 0
									W.isbridge = 1
									W.icon = 'Spiders.dmi'
									W.icon_state = "Silk Bride"
									M.WebContent -= 25

			if (Result17 == "Hardened Silk Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									W.icon = 'Cave.dmi'
									W.icon_state = "SilkWall"
									W.name = "SilkWall"
									W.density = 1
									W.IsWall = 1
									M.WebContent -= 25
									W.CanDigAt = 1
									W.HP = 1000
									W.Detailed = 1
									break
									return

	if (Result == "Stairs")
		for(var/mob/Monsters/A in usr.Selected)
			var/list/menu13 = new()
			for(var/obj/Items/ores/stone/s in A)
				menu13 += "Down"
				menu13 += "Up"
			menu13 += "Cancel"
			var/Result13 = input("What Action Will You Choose?", "Choose", null) in menu13
			if (Result13 != "Cancel")
				..()
			if (Result13 == "Up")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(W.Cant == 1)
									if(W.GoesTo == null)
										if(M.z != 3 && M.z != 4)
											if(M.Kobold == 1)
												W.icon = 'Cave.dmi'
												W.icon_state = "KoboldUp"
												W.Detailed = 1
											if(M.Spider == 1)
												W.overlays += /obj/SpiderUp/
												W.Detailed = 1
											if(M.Kobold == 0 && M.Spider == 0)
												W.icon = 'Cave.dmi'
												W.icon_state = "Up"
												W.Detailed = 1
											W.GoesTo = locate(W.x,W.y,W.z-1)
											for(var/mob/Monsters/Wagon/E in view(1,M))
												E.loc = W.GoesTo
											M.loc = W.GoesTo
											usr.loc = M.loc
											for(var/turf/grounds/W2 in view(0,M))
												if(W2.GoesTo == null)
													if(M.Kobold == 1)
														W2.overlays += /obj/Hole/
													if(M.Spider == 1)
														W2.icon = 'Cave.dmi'
														W2.icon_state = "SpiderStairs"
													if(M.Kobold == 0 && M.Spider == 0)
														W2.icon = 'Cave.dmi'
														W2.icon_state = "Stairs"
													W2.density = 0
													W2.CanDigAt = 0
													W2.opacity = 0
													W2.Detailed = 1
													W2.Cant = 1
													W2.GoesTo = locate(W2.x,W2.y,W2.z+1)
											del(S)
			if (Result13 == "Down")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(W.Cant == 0)
									if(W.GoesTo == null)
										if(M.z != 2 && M.z != 4)
											if(M.Kobold == 1)
												W.overlays += /obj/Hole/
												W.Detailed = 1
											if(M.Spider == 1)
												W.icon = 'Cave.dmi'
												W.icon_state = "SpiderStairs"
												W.Detailed = 1
											if(M.Kobold == 0 && M.Spider == 0)
												W.icon = 'Cave.dmi'
												W.icon_state = "Stairs"
												W.Detailed = 1
											W.GoesTo = locate(W.x,W.y,W.z+1)
											for(var/mob/Monsters/Wagon/E in view(1,M))
												E.loc = W.GoesTo
											M.loc = W.GoesTo
											usr.loc = M.loc
											for(var/turf/grounds/W2 in view(0,M))
												if(W2.GoesTo == null)
													if(M.Kobold == 1)
														W2.icon = 'Cave.dmi'
														W2.icon_state = "KoboldUp"
													if(M.Spider == 1)
														W2.overlays += /obj/SpiderUp/
													if(M.Kobold == 0 && M.Spider == 0)
														W2.icon = 'Cave.dmi'
														W2.icon_state = "Up"
													W2.density = 0
													W2.CanDigAt = 0
													W2.opacity = 0
													W2.Detailed = 1
													W2.Cant = 1
													W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
											del(S)
	if (Result == "Build Walls/Floors")
		for(var/mob/Monsters/B in usr.Selected)
			var/list/menu12 = new()
			for(var/obj/Items/ores/stone/s in B)
				menu12 += "Stone Wall"
			menu12 += "Stone Floor"
			for(var/obj/Items/ores/stone/s in B)
				menu12 += "Secret Wall"
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Kobold == 1)
					for(var/obj/Items/Bones/Bones/s in B)
						menu12 += "Bone Wall"
					menu12 += "Bone Floor"
				if(M.Ratmen == 1)
					for(var/obj/Items/Bones/Bones/s in B)
						menu12 += "Bone Wall"
					menu12 += "Bone Floor"
				if(M.Vampire == 1)
					for(var/obj/Items/Bones/Bones/s in B)
						menu12 += "Bone Wall"
				if(M.Human == 1)
					for(var/obj/Items/woods/wood/s in B)
						menu12 += "Wooden Wall"
					menu12 += "Wooden Floor"
			menu12 += "Destroy Floor"
			menu12 += "Cancel"
			var/Result12 = input("What Action Will You Choose?", "Choose", null) in menu12
			if (Result12 != "Cancel")
				..()
			if (Result12 == "Destroy Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(W.Detailed == 1)
								W.icon_state = "CaveFloor"
								W.name = "Floor"
								W.density = 0
								W.Detailed = 0
								return
			if (Result12 == "Stone Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							W.icon_state = "DetailedFloor"
							W.name = "DetailedFloor"
							W.density = 0
							W.Detailed = 1
							return

			if (Result12 == "Wooden Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Human == 1)
								W.icon_state = "WoodFloor"
								W.name = "WoodFloor"
								W.density = 0
								W.Detailed = 1
								return
							if(M.Goblin == 1)
								W.icon_state = "WoodFloor"
								W.name = "WoodFloor"
								W.density = 0
								W.Detailed = 1
								return
							if(M.Vampire == 1)
								W.icon_state = "WoodFloor"
								W.name = "WoodFloor"
								W.density = 0
								W.Detailed = 1
								return

			if (Result12 == "Secret Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								W.icon_state = "CaveWall"
								W.name = "SecretWall"
								W.HP += 3000
								W.CanDigAt = 1
								M.weight -= S.weight
								M.StoneCraftingSkill += 1
								W.density = 1
								W.IsWall = 1
								W.opacity = 1
								W.Detailed = 1
								del(S)
								break
								return
			if (Result12 == "Wooden Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Wagon == 1)
									W.icon_state = "WoodWall"
									W.name = "WoodWall"
									W.HP += 1000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Human == 1)
									W.icon_state = "WoodWall"
									W.name = "WoodWall"
									W.HP += 1000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Goblin == 1)
									W.icon_state = "WoodWall"
									W.name = "WoodWall"
									W.HP += 1000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
			if (Result12 == "Bone Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Kobold == 1)
								W.icon_state = "BoneFloor"
								W.name = "BoneFloor"
								W.density = 0
								W.Detailed = 1
								return
							if(M.Vampire == 1)
								W.icon_state = "BoneFloor"
								W.name = "BoneFloor"
								W.density = 0
								W.Detailed = 1
								return
							if(M.Ratmen == 1)
								W.icon_state = "BoneFloor"
								W.name = "BoneFloor"
								W.density = 0
								W.Detailed = 1
								return
			if (Result12 == "Bone Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Bones/Bones/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Kobold == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									if(usr.GM == 0)
										del(S)
										break
										return
								if(M.Ratmen == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									if(usr.GM == 0)
										del(S)
										break
										return
								if(M.Wagon == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Vampire == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return

			if (Result12 == "Stone Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Dwarf == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Goblin == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.SandWorker == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Human == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Wagon == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Vampire == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
	if (Result == "Detail")
		var/list/menu10 = new()
		for(var/mob/Monsters/Q in usr.Selected)
			for(var/obj/Items/ores/stone/ST in Q)
				menu10 += "Cave Wall"
			menu10 += "Cancel"
			var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
			if (Result10 != "Cancel")
				..()
			if (Result10 == "Cave Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.density == 1)
								if(W.Detailed == 0)
									if(M.Vampire == 1)
										W.icon_state = "DetailedWall"
										W.name = "DetailedWall"
										W.Detailed = 1
										W.HP += 3000
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										W.IsWall = 1
										del(S)
										break
										return
									if(M.Dwarf == 1)
										W.icon_state = "DetailedWall"
										W.name = "DetailedWall"
										W.Detailed = 1
										W.HP += 1500
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										W.IsWall = 1
										del(S)
										break
										return
									if(M.Goblin == 1)
										W.icon_state = "DetailedWall"
										W.Detailed = 1
										W.name = "DetailedWall"
										W.HP += 1500
										M.weight -= S.weight
										W.IsWall = 1
										M.StoneCraftingSkill += 1
										del(S)
										break
										return
									if(M.Wagon == 1)
										W.icon_state = "DetailedWall"
										W.Detailed = 1
										W.name = "DetailedWall"
										W.HP += 1500
										M.weight -= S.weight
										W.IsWall = 1
										M.StoneCraftingSkill += 1
										del(S)
										break
										return


	if (Result == "Traps")
		for(var/mob/Monsters/Q in usr.Selected)
			var/list/menu9 = new()
			menu9 += "Pit Trap"
			menu9 += "Stone Fall Trap"
			menu9 += "Cancel"
			var/Result9 = input("What Action Will You Choose?", "Choose", null) in menu9
			if (Result9 != "Cancel")
				..()
			if (Result9 == "Stone Fall Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a stone fall trap, it will fall on anyone who nears it.")
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/StoneTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateStone()
							M.weight -= W.weight
							del(W)
							break
			if (Result9 == "Pit Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreatePit()
							M.weight -= W.weight
							del(W)
							break
	if (Result == "WorkShops")
		for(var/mob/Monsters/Q in usr.Selected)
			var/list/menu2 = new()
			for(var/obj/Items/woods/wood/w in Q)
				menu2 += "LeatherCrafting"
				menu2 += "Carpentry"
				menu2 += "Camp Fire"
				if(Q.Goblin == 1)
					menu2 += "Potion Station"
				if(Q.Human == 1)
					menu2 += "Potion Station"
				if(Q.Svartalfar == 1)
					menu2 += "Potion Station"
			for(var/obj/Items/ores/stone/s in Q)
				if(Q.Goblin == 1)
					menu2 += "Glass Forge"
				if(Q.Human == 1)
					menu2 += "Glass Forge"
				if(Q.Svartalfar == 1)
					menu2 += "Glass Forge"
				menu2 += "Smelter"
				menu2 += "Forge"
				menu2 += "Masonary"
			for(var/mob/Monsters/B in usr.Selected)
				if(B.Carn == 0)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "Kitchen"
				if(B.Kobold == 0)
					for(var/obj/Items/ores/stone/s in Q)
						menu2 += "GemCrafting"
				if(B.MakesBoneCraft == 1)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "BoneCrafting"
			for(var/mob/Monsters/B in usr.Selected)
				if(B.UsesPoison == 1)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "PoisonExtractionStation"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "GemCrafting")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a gem crafting station, it can be used to craft un-cut gems into something more intresting")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateGem()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Glass Forge")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a glass forge, it can be used to create items from glass.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateGlass()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Masonary")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a masonary station, it can be used to make stone items and statues")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMasonary()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Potion Station")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a potion station, it can be used to make various potions.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePotion()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "LeatherCrafting")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a leather crafting station, it can be used to make leather armour, sheets and clothes")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateWorkShopLeather()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Camp Fire")
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a camp fire, it can be used to cook with.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							var/mob/WorkShops/CampFires/Fire/F = new
							F.loc = M.loc
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Kitchen")
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a kitchen, take un-cooked meat here to cook it.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateKit()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Carpentry")
				var/list/menu4 = new()
				menu4 += "Create"
				menu4 += "Info"
				menu4 += "Cancel"
				var/Result4 = input("What Action Will You Choose?", "Choose", null) in menu4
				if (Result4 != "Cancel")
					..()
				if (Result4 == "Info")
					alert("This is a carpentry crafting station, it can be used to make lots of things from wood")
					return
				if (Result4 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateCarpentry()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Smelter")
				var/list/menu5 = new()
				menu5 += "Create"
				menu5 += "Info"
				menu5 += "Cancel"
				var/Result5 = input("What Action Will You Choose?", "Choose", null) in menu5
				if (Result5 != "Cancel")
					..()
				if (Result5 == "Info")
					alert("This is a smelter  station, it can be used to create Ingots for armour and weapon creation")
					return
				if (Result5 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateSmelter()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Forge")
				var/list/menu6 = new()
				menu6 += "Create"
				menu6+= "Info"
				menu6 += "Cancel"
				var/Result6 = input("What Action Will You Choose?", "Choose", null) in menu6
				if (Result6 != "Cancel")
					..()
				if (Result6 == "Info")
					alert("This is a forge  station, it can be used to create armour and weapons")
					return
				if (Result6 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateForge()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "BoneCrafting")
				for(var/mob/Monsters/M2 in usr.Selected)
					if(M2.MakesBoneCraft == 1)
						var/list/menu7 = new()
						menu7 += "Create"
						menu7+= "Info"
						menu7 += "Cancel"
						var/Result7 = input("What Action Will You Choose?", "Choose", null) in menu7
						if (Result7 != "Cancel")
							..()
						if (Result7 == "Info")
							alert("This is a Bone crafting station, it can be used to create bone crafts, weapons and armours")
							return
						if (Result7 == "Create")
							for(var/mob/Monsters/M in usr.Selected)
								for(var/mob/WorkShops/LW in view(1,M))
									usr << "Too close to other station!"
									return
								for(var/obj/Items/woods/wood/W in M)
									M.CreateBone()
									M.weight -= W.weight
									del(W)
									break
			if (Result2 == "PoisonExtractionStation")
				var/list/menu8 = new()
				menu8 += "Create"
				menu8+= "Info"
				menu8 += "Cancel"
				var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
				if (Result8 != "Cancel")
					..()
				if (Result8 == "Info")
					alert("This is a posion extraction station, it can be used to extract posion from glands")
					return
				if (Result8 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePoison()
							M.weight -= W.weight
							del(W)
							break
mob/proc/CreatePotion()
	var/mob/WorkShops/PotionStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsPW = 1
	L.name = "Potion Station"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PotionStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsPW = 1
	R.name = "Potion Station"
	src.WoodCraftingSkill += 1
mob/proc/CreateBone()
	var/mob/WorkShops/BoneCraft/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.BoneCraft = 1
	L.name = "BoneCraftingStation"
	L.overlays += /obj/WSoverlays/Bone/
	var/mob/WorkShops/BoneCraft/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.BoneCraft = 1
	R.name = "BoneCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreatePoison()
	var/mob/WorkShops/PoisonStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Poison = 1
	L.name = "PoisonStation"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PoisonStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Poison = 1
	R.name = "PoisonStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateWorkShopLeather()
	var/mob/WorkShops/LeatherWorks/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.WorkShop = 1
	L.name = "LeatherCraftingStation"
	L.overlays += /obj/WSoverlays/Leather/
	var/mob/WorkShops/LeatherWorks/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.WorkShop = 1
	R.name = "LeatherCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateCarpentry()
	var/mob/WorkShops/Carpentry/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Carpentry = 1
	L.name = "CarpentryCraftingStation"
	L.overlays += /obj/WSoverlays/Carpentry/
	var/mob/WorkShops/Carpentry/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Carpentry = 1
	R.name = "CarpentryCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateSmelter()
	var/mob/WorkShops/Smelters/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Smelter = 1
	L.name = "SmelterStation"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/Smelters/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Smelter = 1
	R.name = "SmelterStation"
	src.StoneCraftingSkill += 1
mob/proc/CreatePit()
	var/obj/Items/Traps/PitTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.name = "Pit"
	if(src.IsHunter == 1)
		if(src.Level >= 20)
			L.icon = null
			L.Hole = 1
	src.StoneCraftingSkill += 1
mob/proc/CreateRib()
	var/obj/Items/Traps/RibTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Rib Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateBST()
	var/obj/Items/Traps/BST/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Bone Spike Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateCacoonTrap()
	var/obj/Items/Traps/CacoonTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Cacoon Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateStone()
	var/obj/Items/Traps/StoneTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Stone Fall Trap"
	src.StoneCraftingSkill += 1
mob/proc/CreateForge()
	var/mob/WorkShops/Forge/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Forge = 1
	L.name = "ForgeStation"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Forge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Forge = 1
	R.name = "ForgeStation"
	src.StoneCraftingSkill += 1
mob/proc/CreateKit()
	var/mob/WorkShops/Kitchen/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Kit = 1
	L.name = "Kitchen"
	L.overlays += /obj/WSoverlays/Kitchen/
	var/mob/WorkShops/Kitchen/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Kit = 1
	R.name = "Kitchen"
	src.WoodCraftingSkill += 1
mob/proc/CreateGem()
	var/mob/WorkShops/GemCutter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsGem = 1
	L.name = "GemCutter"
	L.overlays += /obj/WSoverlays/Gem/
	var/mob/WorkShops/GemCutter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsGem = 1
	R.name = "GemCutter"
	src.StoneCraftingSkill += 1

mob/proc/CreateMasonary()
	var/mob/WorkShops/Masonary/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Mason = 1
	L.name = "Masonary"
	L.overlays += /obj/WSoverlays/Masonary/
	var/mob/WorkShops/Masonary/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Mason = 1
	R.name = "Masonary"
	src.StoneCraftingSkill += 1
mob/proc/CreateMelter()
	var/mob/WorkShops/Melter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Mason = 1
	L.name = "Melter"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Melter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Mason = 1
	R.name = "Melter"
	src.StoneCraftingSkill += 1
mob/proc/CreateGlass()
	var/mob/WorkShops/GlassForge/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsGlass = 1
	L.name = "Glass Forge"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/GlassForge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsGlass = 1
	R.name = "Glass Forge"
	src.StoneCraftingSkill += 1



mob/proc/CheckBody()
	if(ismob(src.Content))
		var/mob/m = src.Content
		if(m.icon == 'Skeleton.dmi')
			var/obj/Items/Bones/Bones/C = new
			C.loc = src.loc
			C.name = "[C]'s Bones"
			var/obj/Items/Bones/Skull/C2 = new
			C2.loc = src.loc
			C2.name = "[C]'s Skull"
			del(src)
			del(m)
			return
		if(m.Guardstone == 1)
			var/obj/Items/ores/stone/C = new
			C.loc = src.loc
			C.name = "[m]'s stone"
			if(m.icon_state == "GuardStoneRuby")
				var/obj/Items/gems/UnCutRuby/C2 = new
				C2.loc = src.loc
			if(m.icon_state == "GuardStoneDiamond")
				var/obj/Items/gems/UnCutDiamond/C2 = new
				C2.loc = src.loc
			if(m.icon_state == "GuardStoneEmerald")
				var/obj/Items/gems/UnCutEmerald/C2 = new
				C2.loc = src.loc
			del(src)
			del(m)
			return
		if(m.Race == "Elder Brain")
			var/obj/Bloods/PurpleGoo/C = new
			C.loc = src.loc
			C.name = "Puddle of Goo"
			del(src)
			del(m)
			return
		if(m.Race == "Plant")
			src.Race = "Plant"
			src.icon_state = "Dead1"
		if(m.Race == "Plant2")
			src.Race = "Plant2"
			src.icon_state = "Dead2"
		if(m.Kobold)
			src.Kobold = 1
		if(m.Race == "Dragon")
			src.Race = "Dragon"
		if(m.Race == "Naga")
			src.Race = "Naga"
		if(m.Ratmen)
			src.Ratmen = 1
		if(m.LizardMan)
			src.LizardMan = 1
		if(m.FrogMan)
			src.FrogMan = 1
		if(m.Goblin)
			src.Goblin = 1
		if(m.Dwarf)
			src.Dwarf = 1
		if(m.Infects == 1)
			src.Infects = 1
		if(m.Race == "Illithid")
			src.Race = "Illithid"
		if(m.Demon == 1)
			src.Demon = 1
			if(m.density == 0)
				m.icon = 'Demon.dmi'
				m.LimbLoss()
		if(m.Human == 1 && m.Werewolf == 0)
			src.Human = 1
			if(m.Black)
				src.Black = 1
		if(m.Werewolf == 1)
			src.Werewolf = 1
		if(m.Werepowers == 1)
			src.Werepowers = 1
		if(m.Bug)
			src.Poisonus = 1
			src.Bug = 1
			src.weight = 10
		if(m.Deer)
			src.Deer = 1
		if(m.Race == "Gremlin")
			src.Race = "Gremlin"
		if(m.Race == "Orc")
			src.Race = "Orc"
		if(m.Race == "Svartalfar")
			src.Race = "Svartalfar"
		if(m.Gargoyle == 1)
			src.Gargoyle = 1
		if(m.Spider)
			src.Spider = 1
		if(m.Vampire)
			src.Vampire = 1
			if(m.density == 0)
				m.icon = 'Vampire.dmi'
				m.LimbLoss()
			src.icon = m.icon
			src.icon_state = m.icon_state
			src.icon = turn(src.icon,90)
		if(m.Wolf)
			src.Wolf = 1
		if(m.Beatle)
			src.Beatle = 1
		if(m.Mole)
			src.Mole = 1
		src.Race = m.Race
		src.Intelligence = m.Intelligence
mob/proc/BrainWashing()
	if(src.Wagon == 0)
		for(var/mob/M in world)
			if(M == src.BrainWasher)
				src.Owner = M
				spawn(500)
					M.Selected.Remove(src)
					M.client.images -= src.Star
					M << "The brainwashing has worn off of [src]."
					for(var/mob/M2 in world)
						if(M2 == src.PreviousOwner)
							src.Owner = M2
							M2 << "The brainwashing has worn off of [src]."
					src.BrainWasher = null
					src.PreviousOwner = null
					return
mob/proc/StopWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		src.CanWalk = 0
		spawn(20)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.WalkNumber = 0
				src.Stunned = 0
				src.CanWalk = 1
			return
mob/proc/StunnedWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		view(src) << "[src] is stunned!"
		src.Stunned = 1
		spawn(150)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.Stunned = 0
				src.CanWalk = 1
				view(src) << "[src] is no longer stunned."
			return
mob/proc/HealSlow()
	if(src.Undead == 0)
		src.HealNumber += 1
		src.Teeth = "Healing"
		src.TeethHP += 1
		src.LeftArm = "Healing"
		src.RightArm = "Healing"
		src.LeftLeg = "Healing"
		src.RightLeg = "Healing"
		src.RightLegHP += 1
		src.LeftLegHP += 1
		src.LeftArmHP += 1
		src.RightArmHP += 1
		src.Crippled = 0
		src.CanSee = 1
		src.BloodContent += 5
		src.BleedType = null
		if(src.LeftLegHP >= 10)
			src.HasLeftLeg = 1
			src.CanWalk = 1
			src.LeftLeg = "Good"
		if(src.RightLegHP >= 10)
			src.HasRightLeg = 1
			src.CanWalk = 1
			src.RightLeg = "Good"
		if(src.LeftArmHP >= 10)
			src.HasLeftArm = 1
			src.CanUseLeftArm = 1
			src.LeftArm = "Good"
		if(src.RightArmHP >= 10)
			src.HasRightArm = 1
			src.CanUseRightArm = 1
			src.RightArm = "Good"
		if(src.TeethHP >= 10)
			src.HasTeeth = 1
		src.LimbLoss()
		if(src.HealNumber >= 10)
			src.HealNumber = 0
			return
		else
			spawn(50)
				src.HealSlow()
	else
		src.HealNumber += 1
		src.Teeth = "Damaging"
		src.TeethHP -= 1
		src.LeftArm = "Damaging"
		src.RightArm = "Damaging"
		src.LeftLeg = "Damaging"
		src.RightLeg = "Damaging"
		src.RightLegHP -= 1
		src.LeftLegHP -= 1
		src.LeftArmHP -= 1
		src.RightArmHP -= 1
		src.Crippled = 0
		src.BloodContent -= 5
		src.HP -= 5
		if(src.HP <= 0)
			src.GoingToDie = 1
			src.Killer = "Holy Breath"
			src.DeathType = "being slowly melted by holy energy"
			src.Death()
			return
		if(src.LeftLegHP <= 10)
			src.HasLeftLeg = 0
			src.CanWalk = 0
			src.LeftLeg = "Destroyed"
		if(src.RightLegHP <= 10)
			src.HasRightLeg = 0
			src.CanWalk = 0
			src.RightLeg = "Destroyed"
		if(src.LeftArmHP <= 10)
			src.HasLeftArm = 0
			src.CanUseLeftArm = 0
			src.LeftArm = "Destroyed"
		if(src.RightArmHP <= 10)
			src.HasRightArm = 0
			src.CanUseRightArm = 0
			src.RightArm = "Destroyed"
		if(src.TeethHP <= 10)
			src.HasTeeth = 0
			src.Teeth = "Destroyed"
		src.LimbLoss()
		if(src.HealNumber >= 10)
			src.HealNumber = 0
			return
		else
			spawn(50)
				src.HealSlow()
mob/proc/Slowdown()
	if(src.Wagon == 0)
		src.Delay += 4
		src.overlays += .obj/frozen/
		spawn(500)
			src.Delay -= 4
			src.overlays -= .obj/frozen/
			src.Owner << "Ice Effect has worn off."
			return
mob/proc/Slowdown2()
	if(src.Wagon == 0)
		src.Delay += 5
		spawn(50)
			src.Delay -= 5
			return
mob/proc/Death()
	if(src.Wagon == 0)
		if(src.GoingToDie)
			if(src.Kobold == 1)
				if(src.Level >= 20)
					var/mob/Monsters/Kobold/K1 = new()
					var/mob/Monsters/Kobold/K2 = new()
					var/obj/Items/Weapons/Spears/Spear/S1 = new()
					var/obj/Items/Weapons/Spears/Spear/S2 = new()
					for(var/mob/X in world)
						if(X == src.Owner)
							K1.Owner = X
							K2.Owner = X
							X.UnitList += K1
							X.UnitList += K2
							S1.name = "{[X]} Kobold"
							S2.name = "{[X]} Kobold"
					K1.loc = src.loc
					K2.loc = src.loc
					S1.loc = K1
					S2.loc = K2
					K1.weight += S1.weight
					K2.weight += S2.weight
					S1.PoisonDMG = 10
					S2.PoisonDMG = 10
					S1.WeaponDamageMin = 15
					S2.WeaponDamageMin = 15
					S1.WeaponDamageMax = 20
					S2.WeaponDamageMax = 20
					K1.WeaponDamageMin += 15
					K2.WeaponDamageMin += 15
					K1.WeaponDamageMax += 20
					K2.WeaponDamageMax += 20
					K1.overlays += /obj/Items/Weapons/Spears/Spear/
					K2.overlays += /obj/Items/Weapons/Spears/Spear/
					S1.name = "Spear - Poor Quality {Poisoned}"
					S2.name = "Spear - Poor Quality {Poisoned}"
					S1.suffix = "(Equiped)"
					S2.suffix = "(Equiped)"
					S1.Poisoned = 1
					S2.Poisoned = 1
					K1.HoldingWeapon = "Spear"
					K2.HoldingWeapon = "Spear"
					K1.destination = src.destination
					K2.destination = src.destination
					view(src) << "Enraged by the death of [src], two kobolds jump out of the underbrush and attack!"
			src.destination = null
			if(src.Content3 == "Explode")
				var/EX = prob(10)
				if(EX == 1)
					view(src) << "[src] explodes in a massive fireball!"
					for(var/mob/Monsters/K in view(2,src))
						K.Fire()
					for(var/turf/grounds/G in view(2,src))
						G.Firestorm()
			if(src.Shadowfiend == 1)
				for(var/turf/GG in view(2,src))
					GG.Darkshadow()
			if(src.Killer && ismob(src.Killer))
				var/mob/K = src.Killer
				for(var/obj/Items/Weapons/Swords/SoulBlade/S in K)
					if(S.suffix == "(Equiped)")
						if(src.Gremlin == 0)
							var/Lev1 = src.Level / 90
							var/Lev2 = src.Level / 70
							S.WeaponDamageMax += Lev2
							S.WeaponDamageMin += Lev1
							K.WeaponDamageMax += Lev2
							K.WeaponDamageMin += Lev1
							S.SoulKills += 1
							K.Owner << "[S.name] absorbs the soul of the slain creature and gains it's power!"
				if(K.Owner && ismob(K.Owner))
					var/mob/KO = K.Owner
					KO.Kills += 1
				if(K.Race == "Angel of Death")
					if(src.Beatle == 0 && src.Deer == 0 && src.Mole == 0 && src.Bug == 0 && src.IsTree == 0)
						var/mob/XX = K.Owner
						var/mob/Monsters/DevourerZombie/D = new
						D.loc = src.loc
						D.icon = src.icon
						D.overlays += /obj/Bloods/BlackBlight/
						D.name = "{[K.Owner]} Blight Fiend"
						D.Strength += 15
						D.Agility += 15
						D.Defence += 35
						D.Owner = K.Owner
						D.Delay = 3
						D.LimbLoss()
						XX.UnitList += D
						for(var/obj/A in src)
							if(A.NoDropOnDeath == 1)
								del A
							A.loc = src.loc
							A.suffix = null
							if(A.Content2 != "Standard")
								A.Owner = null
							if(A.Content3 == 0)
								A.DeleteItem()
						for(var/mob/A in src)
							if(A.invisibility > 0)
								del A
							A.loc = src.loc
							A.suffix = null
							A.Owner = null
						del src
			if(src.IsTree)
				var/obj/Items/woods/wood/MET = new
				MET.loc = src.loc
				var/obj/Items/Food/Fungases/Fungas/F = new
				F.loc = src.loc
				var/obj/Items/Seeds/TowerCapSeed/S1 = new
				S1.loc = src.loc
				var/obj/Items/Seeds/TowerCapSeed/S2 = new
				S2.loc = src.loc
				del(src)
				return
			if(src.IsTroll)
				var/obj/Items/woods/wood/MET = new
				MET.loc = src.loc
				del(src)
				return
			if(ismob(src.Owner))
				var/mob/S = src.Owner
				S.UnitList -= src
				S.UnitCap -= 1
				if(src.HasQueen)
					if(S.HasQueen)
						S.HasQueen = 0
						S.QueenLeader = null
				if(src.HasKing)
					if(S.HasKing)
						S.HasKing = 0
						S.KingLeader = null
				for(var/mob/Monsters/m in S.UnitList)
					if(m.InfectedBy == src)
						m.Owner << "[src] has died and so has [m]!"
						m.DeathType = "their master dieing"
						m.Killer = "[src]"
						m.GoingToDie = 1
						m.Death()



			for(var/obj/A in src)
				if(A.NoDropOnDeath == 1)
					del A
				A.loc = src.loc
				A.suffix = null
				if(A.Content2 != "Standard")
					A.Owner = null
				if(A.Content3 == 0)
					A.DeleteItem()
			for(var/mob/A in src)
				if(A.invisibility > 0)
					del A
				A.loc = src.loc
				A.suffix = null
				A.Owner = null
			var/mob/Body/B = new
			B.icon = src.icon
			B.icon_state = src.icon_state
			B.loc = src.loc
			B.icon = turn(B.icon,90)
			B.Dead = 1
			B.Content = src
			if(ismob(src.Owner))
				var/mob/KKZ = src.Owner
				B.Owner = KKZ.ckey
			if(src.Owner == "{NPC Zombies}")
				B.Owner = "{NPC Zombies}"
			B.name = "[src]'s Body"
			if(src.OnFire)
				if(src.HumanParts)
					B.icon = 'DamagedParts.dmi'
					B.Skinned = 1
			B.CheckBody()
			for(var/obj/DigAt/DD in world)
				if(DD.Owner == src.Owner)
					del(DD)
			if(src.Infects)
				if(src.NPCZombieStat == 0)
					var/Rise = prob(33)
					if(Rise)
						B.CreateZombie()
						del(src)
						return
			if(src.Race == "Elder Brain")
				var/mob/ZZ = src.Owner
				ZZ.Rares -= "Illithids"
			if(src.Bug == 0)
				if(src.Wolf == 0)
					if(src.Deer == 0)
						if(src.Mole == 0)
							if(src.Beatle == 0)
								if(src.Race != "Plant")
									if(src.Race != "Plant2")
										if(src.Owner != "{NPC Demons}")
											if(src.CanBeSlaved == 0)
												if(src.IsNPC == 0)
													Legends = {"[Legends]<p>[src] - born in [src.Born] and died [Date],[src] was [Age] when they died. [src] had a fighting rank of [src.Level]. was killed by [src.Killer] and died from [src.DeathType]"}
			if(src.NPC)
				for(var/mob/Monsters/M in oview(1,src))
					if(M.destination == src)
						M.destination = null
				src.NPC = 0
				src.Alive = 0
				src.Freeze = 1
				src.destination = null
				src.InHole = 1
				src.loc = locate(0,0,0)
				return
			del(src)


mob/proc/LegendView()
	src << browse(Legends)
//mob/proc/LoadUnits()
//	var/T=input("Which unit would you like to load?")as null|anything in flist("units/[src.ckey]/")
//	if(!T)
//		..()
//	else
//		var/mob/M = new
//		M.Read(T)
//		M.loc = locate(M.savedx,M.savedy,M.savedz)
//		src.loc = M.loc
//		src.LoggedIn = 1
//		src.User = 1
//		src.Done = 1
//		src.UnitList += M
//		src.Loaded = 1
//		M.Owner = src
//		src.LoadUnits()
mob/verb/Legends()
	usr.LegendView()
obj/proc/Death()
	if(src.HP <= 0)
		del(src)

mob/proc/FightSound()
	if(src.Shadowfiend == 0)
		spawn(5)
			if(src.HoldingWeapon)
				var/S = rand(1,3)
				if(S == 1)
					view() << '1.wav'
				if(S == 2)
					view() << '2.wav'
				if(S == 3)
					view() << '3.wav'
mob/proc/BlackPlague()
	if(src.BlackDeath == 1)
		return
	if(src.Gargoyle == 1)
		return
	if(src.Vampire == 1)
		return
	if(src.Infects == 1)
		return
	if(src.User == 1)
		return
	var/RecoveryChance = prob(30)
	var/ReInfect = prob(90)
	view(src) << "[src] coughs loudly, spraying a reddish mist out of their mouth."
	src.Strength -= 10
	src.Agility -= 10
	src.BlackDeath = 1
	spawn(200)
		view(src) << "[src] coughs loudly, spraying a reddish mist out of their mouth."
		for(var/mob/Monsters/Inf in view(4,src))
			var/Infectchance = prob(45)
			if(Infectchance == 1)
				if(Inf.BlackDeath == 0)
					Inf.BlackPlague()
	spawn(400)
		view(src) << "[src]'s skin begins to turn violent red as large swelling lumps covering their body begin to bleed slightly."
		for(var/mob/Monsters/Inf1 in view(1,src))
			var/Infectchance = prob(80)
			if(Infectchance == 1)
				if(Inf1.BlackDeath == 0)
					Inf1.BlackPlague()
	src.BloodContent -= 20
	src.BloodLoss()
	spawn(600)
		view(src) << "[src] coughs loudly, spraying a reddish mist out of their mouth."
		for(var/mob/Monsters/Inf1 in view(4,src))
			var/Infectchance = prob(45)
			if(Infectchance == 1)
				if(Inf1.BlackDeath == 0)
					Inf1.BlackPlague()
	spawn(1000)
		if(ReInfect == 1)
			src.Strength += 10
			src.Agility += 10
			src.BlackPlague()
		else if(RecoveryChance == 1)
			view(src) << "[src] seems to be getting better, they regain their color and the swelling sores go down and stop bleeding."
			src.Strength += 10
			src.Agility += 10
		else
			view(src) << "[src] goes into convulsions as the sores on their body bleed profusely, spilling blood in all directions around their weak body, they then fall to the ground, bleeding profusely and turning an ashen, grey color."
			src.GoingToDie = 1
			src.Killer = "The Plague"
			src.DeathType = "Blood Loss"
			src.Death()
			for(var/mob/Monsters/Inf2 in view(5,src))
				if(Inf2.BlackDeath == 0)
					Inf2.BlackPlague()
mob/proc/CommonColdDisease()
	if(src.CommonCold == 1)
		return
	if(src.Gargoyle == 1)
		return
	if(src.Vampire == 1)
		return
	if(src.Infects == 1)
		return
	if(src.User == 1)
		return
	var/Recovery = prob(10)
	view(src) << "[src] coughs loudly"
	src.Strength -= 5
	src.Agility -= 5
	src.CommonCold = 1
	spawn(200)
	view(src) << "[src] coughs loudly."
	for(var/mob/Monsters/Mon in view(2,src))
		if(Mon.CommonCold == 0)
			var/Infection = prob(10)
			if(Infection == 1)
				Mon.CommonColdDisease()
	spawn(400)
	view(src) << "[src] sneezes."
	for(var/mob/Monsters/Mon in view(2,src))
		if(Mon.CommonCold == 0)
			var/Infection = prob(10)
			if(Infection == 1)
				Mon.CommonColdDisease()
	spawn(600)
	view(src) << "[src] coughs loudly."
	for(var/mob/Monsters/Mon in view(2,src))
		if(Mon.CommonCold == 0)
			var/Infection = prob(25)
			if(Infection == 1)
				Mon.CommonColdDisease()
	spawn(1000)
	view(src) << "[src] coughs loudly."
	for(var/mob/Monsters/Mon in view(2,src))
		if(Mon.CommonCold == 0)
			var/Infection = prob(25)
			if(Infection == 1)
				Mon.CommonColdDisease()
	spawn(1200)
	if(Recovery == 1)
		view(src) << "[src] regains their color and strength, they seem to be fully cured of this disease."
		src.Strength += 5
		src.Agility += 5
	else
		src.Strength += 5
		src.Agility += 5
		src.CommonColdDisease()


mob/proc/FightSound2()
	if(src.Shadowfiend == 0)
		spawn(5)
			if(src.HoldingWeapon == 0)
				var/S = rand(1,3)
				if(S == 1)
					view() << 'P1.wav'
				if(S == 2)
					view() << 'P2.wav'
				if(S == 3)
					view() << 'P3.wav'






