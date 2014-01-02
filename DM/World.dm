world
	name = "Dungeon Master Expanded+"
	view = 9
	hub = "Ginseng.DungeonMaster"
	version = 0.395
	loop_checks  = 0
	status = "Fun"
	New()
		log = file("ErrorLog.txt")
		LoadBans()
		Name()
		Date()
		Age()
		Aging()
		History()
		SeasonChange()
		NightChange()
		Repop()
		BirthChanges()
		CallSave()
mob/Stat()
	statpanel("Units")
	for(var/mob/Monsters/M in usr.UnitList)
		stat("[M]", M)
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Spider == 1)
			statpanel("Unit Stats")
			stat("Level", "[M.Level]")
			stat("EXP", "[M.EXP]/[M.EXPNeeded]")
			stat("Stomach Fullness", "[M.Hunger] / [M.MaxHunger]")
			stat("Tiredness", "[M.Tiredness]")
			stat("Cold Level", "[M.Coldness]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Strength", "[M.Strength]")
			stat("Agility", "[M.Agility]")
			stat("Defence", "[M.Defence]")
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
			stat("Web Content", "[M.WebContent] / [M.MaxWebContent]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("WoodCuttingSkill", "[M.WoodCuttingSkill]")
			stat("MineingSkill", "[M.MineingSkill]")
			stat("PoisonSkill", "[M.PoisonSkill]")
			stat("SneakingSkill", "[M.SneakingSkill]")
			stat("BuildingSkill", "[M.BuildingSkill]")
			stat("Poison Damage", "[M.PoisonDMG]")
			stat("FishingSkill", "[M.FishingSkill]")
			stat("WoodCraftingSkill", "[M.WoodCraftingSkill]")
			statpanel("Inventory",M.contents)
			statpanel("Unit Information")
			stat("Name", "[M.name]")
			stat("Gender", "[M.Gender]")
			stat("Age", "[M.Age]")
			stat("Mother", "[M.Mum]")
			stat("Father", "[M.Dad]")
			stat("Date Of Birth", "[M.Born]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Head Condition","[M.Head]")
			stat("RightEye Condition","[M.RightEye]")
			stat("LeftEye Condition","[M.LeftEye]")
			stat("Teeth Condition","[M.Teeth]")
			stat("Brain Condition","[M.Brain]")
			stat("Throat Condition","[M.Throat]")
			stat("LeftLegs Condition","[M.LeftLeg]")
			stat("RightLegs Condition","[M.RightLeg]")
			stat("Heart Condition","[M.Heart]")
			stat("LeftLung Condition","[M.LeftLung]")
			stat("RightLung Condition","[M.RightLung]")
			stat("Spleen Condition","[M.Spleen]")
			stat("Gut Condition","[M.Guts]")
			stat("Stomach Condition","[M.Stomach]")
			stat("Liver Condition","[M.Liver]")
			stat("LeftKidney Condition","[M.LeftKidney]")
			stat("RightKidney Condition","[M.RightKidney]")
			stat("Bleeding Condition","[M.BleedType]")
		if(M.Wolf == 1)
			statpanel("Unit Stats")
			stat("Health", "[M.HP] / [M.MAXHP]")
			stat("Level", "[M.Level]")
			stat("EXP", "[M.EXP]/[M.EXPNeeded]")
			stat("Cold Level", "[M.Coldness]")
			stat("Strength", "[M.Strength]")
			stat("Agility", "[M.Agility]")
			stat("Defence", "[M.Defence]")
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
			statpanel("Unit Information")
			stat("Name", "[M.name]")
			stat("Gender", "[M.Gender]")
			stat("Age", "[M.Age]")
			stat("Mother", "[M.Mum]")
			stat("Father", "[M.Dad]")
			stat("Date Of Birth", "[M.Born]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Head Condition","[M.Head]")
			stat("RightEye Condition","[M.RightEye]")
			stat("LeftEye Condition","[M.LeftEye]")
			stat("Teeth Condition","[M.Teeth]")
			stat("Nose Condition","[M.Nose]")
			stat("LeftEar Condition","[M.LeftEar]")
			stat("RightEar Condition","[M.RightEar]")
			stat("Brain Condition","[M.Brain]")
			stat("Throat Condition","[M.Throat]")
			stat("BackLeftLeg Condition","[M.LeftLeg]")
			stat("BackRightLeg Condition","[M.RightLeg]")
			stat("FrontRightLeg Condition","[M.RightArm]")
			stat("FrontLeftLeg Condition","[M.LeftArm]")
			stat("Heart Condition","[M.Heart]")
			stat("LeftLung Condition","[M.LeftLung]")
			stat("RightLung Condition","[M.RightLung]")
			stat("Spleen Condition","[M.Spleen]")
			stat("Gut Condition","[M.Guts]")
			stat("Stomach Condition","[M.Stomach]")
			stat("Liver Condition","[M.Liver]")
			stat("LeftKidney Condition","[M.LeftKidney]")
			stat("RightKidney Condition","[M.RightKidney]")
			stat("Bleeding Condition","[M.BleedType]")
			statpanel("Inventory",M.contents)
		if(M.Wagon == 0)
			if(M.Wolf == 0)
				if(M.Spider == 0)
					statpanel("Unit Stats")
					stat("Level", "[M.Level]")
					stat("EXP", "[M.EXP]/[M.EXPNeeded]")
					stat("Stomach Fullness", "[M.Hunger] / [M.MaxHunger]")
					stat("Cold Level", "[M.Coldness]")
					stat("Tiredness", "[M.Tiredness]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("Strength", "[M.Strength]")
					stat("Agility", "[M.Agility]")
					stat("Intelligence", "[M.Intelligence]")
					stat("Defence", "[M.Defence]")
					if(M.Bullets >= 1)
						stat("Bullets", "[M.Bullets]")
					stat("Carry Weight", "[M.weight] / [M.weightmax]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					if(M.Race != "Dragon" && M.Werepowers == 0)
						stat("SpearSkill", "[M.SpearSkill]")
						stat("SwordSkill", "[M.SwordSkill]")
						stat("BowSkill", "[M.BowSkill]")
						stat("AxeSkill", "[M.AxeSkill]")
						stat("DaggerSkill", "[M.DaggerSkill]")
						stat("MaceSkill", "[M.MaceSkill]")
						stat("Un-Armed Skill", "[M.UnArmedSkill]")
						stat("ShieldSkill", "[M.ShieldSkill]")
						stat("ArmourSkill", "[M.ArmourSkill]")
						for(var/obj/Items/Weapons/Swords/BoltActionRifle/B in M)
							stat("Rifle Skill", "[M.RifleSkill]")
						for(var/obj/Items/Weapons/Swords/Pistol/B in M)
							stat("Pistol Skill", "[M.PistolSkill]")
					if(M.Race == "Dragon" || M.Werepowers == 1 || M.HoldingWeapon == "Claws")
						stat("Claw Skill", "[M.ClawSkill]")
						if(M.Race == "Dragon")
							stat("Eggs", "[M.EggContent]")
							stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
							stat("Fire", "[M.FirePoints/10]% / 100%")
							stat("Ice", "[M.IcePoints/10]% / 100%")
							stat("Sand", "[M.SandPoints/10]% / 100%")
							stat("Poison", "[M.PoisonPoints/10]% / 100%")
							stat("Magma", "[M.MagmaPoints/10]% / 100%")
							stat("Water", "[M.WaterPoints/10]% / 100%")
							stat("Zombie", "[M.ZombiePoints/10]% / 100%")
					if(M.MagicalAptitude == 1)
						stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
						stat("Mana", "[M.Mana]")
						stat("Max Mana", "[M.MaxMana]")
					if(M.Race == "Devourer")
						stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
						stat("Bodies", "[M.EggContent]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("WoodCuttingSkill", "[M.WoodCuttingSkill]")
					stat("MineingSkill", "[M.MineingSkill]")
					stat("WoodCraftingSkill", "[M.WoodCraftingSkill]")
					stat("MetalCraftingSkill", "[M.MetalCraftingSkill]")
					stat("SmeltingSkill", "[M.SmeltingSkill]")
					stat("JewlCraftingSkill", "[M.JewlCraftingSkill]")
					stat("LeatherCraftingSkill", "[M.LeatherCraftingSkill]")
					stat("PoisonSkill", "[M.PoisonSkill]")
					stat("BoneCraftingSkill", "[M.BoneCraftingSkill]")
					stat("StoneCraftingSkill", "[M.StoneCraftingSkill]")
					stat("SneakingSkill", "[M.SneakingSkill]")
					stat("LockPickingSkill", "[M.LockPickingSkill]")
					stat("CookingSkill", "[M.CookingSkill]")
					stat("PotionSkill", "[M.PotionSkill]")
					stat("FishingSkill", "[M.FishingSkill]")
					stat("BuildingSkill", "[M.BuildingSkill]")
					statpanel("Inventory",M.contents)
					statpanel("Unit Information")
					stat("Name", "[M.name]")
					stat("Gender", "[M.Gender]")
					stat("Age", "[M.Age]")
					stat("Mother", "[M.Mum]")
					stat("Father", "[M.Dad]")
					stat("Date Of Birth", "[M.Born]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("Head Condition","[M.Head]")
					stat("Nose Condition","[M.Nose]")
					stat("LeftEar Condition","[M.LeftEar]")
					stat("RightEar Condition","[M.RightEar]")
					stat("RightEye Condition","[M.RightEye]")
					stat("LeftEye Condition","[M.LeftEye]")
					stat("Teeth Condition","[M.Teeth]")
					stat("Brain Condition","[M.Brain]")
					stat("Throat Condition","[M.Throat]")
					stat("LeftArm Condition","[M.LeftArm]")
					stat("RightArm Condition","[M.RightArm]")
					stat("LeftLeg Condition","[M.LeftLeg]")
					stat("RightLeg Condition","[M.RightLeg]")
					stat("Heart Condition","[M.Heart]")
					stat("LeftLung Condition","[M.LeftLung]")
					stat("RightLung Condition","[M.RightLung]")
					stat("Spleen Condition","[M.Spleen]")
					stat("Gut Condition","[M.Guts]")
					stat("Stomach Condition","[M.Stomach]")
					stat("Liver Condition","[M.Liver]")
					stat("LeftKidney Condition","[M.LeftKidney]")
					stat("RightKidney Condition","[M.RightKidney]")
					if(M.HasWings == 1)
						stat("Wings Condition","[M.Wings]")
					stat("Bleeding Condition","[M.BleedType]")
					stat("Blood Content","[M.BloodContent]")



		else
			statpanel("Inventory",M.contents)
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
	statpanel("Your Information")
	stat("Your Queen", "[usr.QueenLeader]")
	stat("Your King", "[usr.KingLeader]")
	stat("Land Name", "[WorldName]")
	stat("Date", "[Date] - [Ages]")
	stat("History", "[History]")
	stat("Kills", "[usr.Kills]")
	stat("Points", "[usr.Points]")
	stat("Worship", "[usr.WorshipPoints]")
	if(Winter == 1)
		stat("Season", "Winter")
	if(Summer == 1)
		stat("Season", "Summer")
	if(Autumm == 1)
		stat("Season", "Autumn")
	if(Spring == 1)
		stat("Season", "Spring")
	if(night == 1)
		stat("Time of Day", "Night")
	if(night == 0)
		stat("Time of Day", "Day")


var/Winter = 0
var/Summer = 1
var/Spring = 0
var/Autumm = 0
var/LoginTimer = 0
var/WorldName
var/Date
var/History
var/Legends
var/Ages
var/RainbowsFound = 0
var/Tiles = list()
var/night = 1

var/PlayerList = list()








/proc/LoginTimerReset()
	spawn(10)
		LoginTimer = 0
/proc/SeasonChange()
	Seasons()
	world.Repop()
	spawn(10000)
		SeasonChange()
/proc/CallSave()
	spawn(9500)
		world << "<font size=4>Units Saving"
		CallSave()
		SaveUnits()
		return
/proc/LoadMap()
	for(var/turf/K in world)
		Tiles += K
	for(var/turf/T in world)
		var/map_sav = "map/[T.x],[T.y],[T.z].sav"
		if(length(file(map_sav)))
			var/savefile/F = new(map_sav)
			F >> T
			Tiles += T
	world << "<font color = teal><b>Map Loaded!<br>"
	for(var/mob/Monsters/MM in world)
		MM.LoggedOut = 1
		MM.DigTarget = null
		MM.destination = null
/proc/SaveMap(var/Time)
	if(Time == null)
		Time = 1
	world << "<font color = teal><b>Map Saving Soon...<br>"
	spawn(Time)
		var/Mobs = list()
		var/Objects = list()
		var/Turfs = list()
		for(var/turf/T in Tiles)
			var/In = 0
			if(T in Turfs)
				In = 1
			if(In == 0)
				Turfs += T
		for(var/turf/T in Turfs)
			spawn(1)
				for(var/mob/M in locate(T.x,T.y,T.z))
					M.LastLoc = M.loc
					M.loc = locate(0,0,0)
					Mobs += M
				for(var/obj/O in locate(T.x,T.y,T.z))
					for(var/V in O.vars)
						var/variable = V
						var/typeof=O.vars[variable]
						if(istype(typeof,/atom/))
							if(O.LastLoc == null && typeof != T)
								O.LastLoc = O.loc
								O.loc = locate(0,0,0)
								Objects += O
					if(O.name == "stone")
						if(O.suffix == null)
							del(O)
				var/tile_sav = "map/[T.x],[T.y],[T.z].sav"
				var/savefile/F = new(tile_sav)
				F << T
				for(var/mob/M in Mobs)
					M.loc = M.LastLoc
				for(var/obj/O in Objects)
					O.loc = O.LastLoc
		world << "<font color = yellow><b>Map Saving...<br>"
/proc/SaveUnits()
	for(var/mob/M in world)
		if(M.UserID == 1)
			var/sav = "units/[M.ckey]_save.sav"
			var/savefile/S = new(sav)
			M.savedx = M.x
			M.savedy = M.y
			M.savedz = M.z
			for(var/mob/X in M.UnitList)
				X.savedx = X.x
				X.savedy = X.y
				X.savedz = X.z
			M.Write(S)

//proc/SaveUnits()
//	for(var/mob/M in world)
	//	if(M.UserID == 1)
	//		var/sav = "units/[M.ckey]_save.sav"
	//		var/savefile/S = new(sav)
	//		for(var/mob/K in M.UnitList)
	//			K.saved_x = K.x
	//			K.saved_y = K.y
	//			K.saved_z = K.z
	//			S << K
/proc/WorldRandomize()
	for(var/area/Square1/A in world)
		A.RandomTurf()
		break
	for(var/area/Square2/A2 in world)
		A2.RandomTurf()
		break
	for(var/area/Square3/A3 in world)
		A3.RandomTurf()
		break
	for(var/area/Square4/A4 in world)
		A4.RandomTurf()
		break
	for(var/area/Square5/A5 in world)
		A5.RandomTurf()
		break
	for(var/area/Square6/A6 in world)
		A6.RandomTurf()
		break
	for(var/area/Square7/A7 in world)
		A7.RandomTurf()
		break
	for(var/area/Square8/A8 in world)
		A8.RandomTurf()
		break
	for(var/area/Square9/A9 in world)
		A9.RandomTurf()
		break
	for(var/area/Square10/A10 in world)
		A10.RandomTurf()
		break
	for(var/area/Square11/A11 in world)
		A11.RandomTurf()
		break
	for(var/area/Square12/A12 in world)
		A12.RandomTurf()
		break
	spawn(200)
		var/obj/Items/Spawners/Spawner/S1 = new()
		var/X1 = rand(1,999)
		var/Y1 = rand(1,999)
		S1.x = X1
		S1.y = Y1
		S1.z = 1
		S1.desc = "Kobold"
		var/obj/Items/Spawners/Spawner/S2 = new()
		var/X2 = rand(1,999)
		var/Y2 = rand(1,999)
		S2.x = X2
		S2.y = Y2
		S2.z = 1
		S2.desc = "Orc"
		var/obj/Items/Spawners/Spawner/S3 = new()
		var/X3 = rand(1,999)
		var/Y3 = rand(1,999)
		S3.x = X3
		S3.y = Y3
		S3.z = 1
		S3.desc = "Goblin"
		var/obj/Items/Spawners/Spawner/S4 = new()
		var/X4 = rand(1,999)
		var/Y4 = rand(1,999)
		S4.x = X4
		S4.y = Y4
		S4.z = 1
		S4.desc = "Kobold"
		for(var/turf/T1 in range(0,S1))
			if(T1.density == 1)
				X1 = rand(1,999)
				Y1 = rand(1,999)
				S1.x = X1
				S1.y = Y1
				S1.z = 1
		for(var/turf/T1 in range(0,S2))
			if(T1.density == 1)
				X2 = rand(1,999)
				Y2 = rand(1,999)
				S2.x = X2
				S2.y = Y2
				S2.z = 1
		for(var/turf/T1 in range(0,S3))
			if(T1.density == 1)
				X3 = rand(1,999)
				Y3 = rand(1,999)
				S3.x = X3
				S3.y = Y3
				S3.z = 1
		for(var/turf/T1 in range(0,S4))
			if(T1.density == 1)
				X4 = rand(1,999)
				Y4 = rand(1,999)
				S4.x = X4
				S4.y = Y4
				S4.z = 1
	spawn(9000)
		var/X = rand(50,950)
		var/Y = rand(50,950)
		var/obj/Portal/P = new
		P.x = X
		P.y = Y
		P.z = 1
		P.suffix = "Stuck"
		world<<"<b><font color=red>The land starts to shake as a strange rift in time and space tear open, creating a way to hell its self!-[usr.x],[usr.y],[usr.z]"
		P.Spawn()
		var/obj/Portal/P2 = new
		P2.loc = locate(P.x,P.y,4)
		P2.suffix = "Stuck"
		P2.Content = P.z
		P2.Portal()
/proc/Seasons()
	Date += 1
	for(var/obj/Items/Shafts/Standard/SS in world)
		if(SS.x == 0 || SS.z == 0 || SS.y == 0)
			if(ismob(SS.loc))
				var/mob/K = SS.loc
				if(K.x == 0 || K.z == 0 || K.y == 0)
					del SS
			else
				del SS
	var/Army = rand(1,6)
	if(Army == 1)
		var/X = rand(200,900)
		var/Y = rand(300,800)
		var/Z = 1
		var/mob/Monsters/NPCKobold/K1 = new
		K1.x = X
		K1.y = Y
		K1.z = Z
		K1.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K1.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K1.WearingChest = 1
		K1.WearingLegs = 1
		for(var/turf/grounds/G in view(0,K1))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCKobold/K2 = new
		K2.x = X
		K2.y = Y
		K2.z = Z
		K2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K2.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K2.WearingChest = 1
		K2.WearingLegs = 1
		for(var/turf/grounds/G in view(0,K2))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCKobold/K3 = new
		K3.x = X
		K3.y = Y
		K3.z = Z
		K3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K3.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K3.WearingChest = 1
		K3.WearingLegs = 1
		for(var/turf/grounds/G in view(0,K3))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCKobold/K4 = new
		K4.x = X
		K4.y = Y
		K4.z = Z
		K4.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K4.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K4.WearingChest = 1
		K4.WearingLegs = 1
		var/mob/Monsters/NPCKobold/K5 = new
		K5.x = X
		K5.y = Y
		K5.z = Z
		K5.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K5.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K5.WearingChest = 1
		K5.WearingLegs = 1
		var/mob/Monsters/NPCKobold/K6 = new
		K6.x = X
		K6.y = Y
		K6.z = Z
		K6.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K6.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K6.WearingChest = 1
		K6.WearingLegs = 1
		var/mob/Monsters/NPCKobold/K9 = new
		K9.x = X
		K9.y = Y
		K9.z = Z
		K9.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate
		K9.overlays += /obj/Items/Armours/Legs/LeatherLeggings
		K9.WearingChest = 1
		K9.WearingLegs = 1
		var/mob/Monsters/NPCKobold/K10 = new
		K10.x = X
		K10.y = Y
		K10.z = Z
		K10.overlays -= K10.overlays
		K10.overlays += /obj/Items/Armours/Helmets/BoneCrown/
		K10.overlays += /obj/Items/Armours/Legs/BoneLeggings/
		K10.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
		K10.overlays += /obj/Items/Armours/RightArms/BoneRightGauntlet/
		K10.overlays += /obj/Items/Armours/LeftArms/BoneLeftGauntlet/
		K10.WearingChest = 1
		K10.WearingLegs = 1
		K10.WearingLeftArm = 1
		K10.WearingRightArm = 1
		K10.ImmuneToTemperature = 1
		K10.name = "{NPC} Kobold Chieftain"
		K10.Strength += 10
		K10.Agility += 10
		K10.Defence += 60
		K10.overlays += /obj/Items/Weapons/Daggers/HellForgedDagger/
		var/obj/Items/Weapons/Daggers/HellForgedDagger/G1 = new
		G1.loc = K10
		G1.name = "Sacrifical Blade of Dragethh"
		G1.desc = "The kobolds probably stole it from the temple of some crazy cult of blood god worshippers, it is very sharp and radiates an aura of pure evil."
		G1.WeaponDamageMin = 65
		G1.WeaponDamageMax = 70
		K1.Function = K10
		K2.Function = K10
		K3.Function = K10
		K4.Function = K10
		K5.Function = K10
		K6.Function = K10
		K9.Function = K10
		K10.WeaponDamageMin = 65
		K10.WeaponDamageMax = 70
		K10.SneakingSkill += 175
		K10.DaggerSkill = 45
		K10.HoldingWeapon = "Dagger"
		world << "An army of Kobolds has arrived at [X],[Y],1 to decimate the land!"
	if(Army == 2)
		var/X = rand(200,900)
		var/Y = rand(300,800)
		var/Z = 1
		var/mob/Monsters/StrayGoblin/K1 = new
		K1.x = X
		K1.y = Y
		K1.z = Z
		for(var/turf/grounds/G in view(0,K1))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/StrayGoblin/K2 = new
		K2.x = X
		K2.y = Y
		K2.z = Z
		for(var/turf/grounds/G in view(0,K2))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/StrayGoblin/K3 = new
		K3.x = X
		K3.y = Y
		K3.z = Z
		for(var/turf/grounds/G in view(0,K3))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/StrayGoblin/K4 = new
		K4.x = X
		K4.y = Y
		K4.z = Z
		var/mob/Monsters/StrayGoblin/K5 = new
		K5.x = X
		K5.y = Y
		K5.z = Z
		var/mob/Monsters/StrayGoblin/K8 = new
		K8.x = X
		K8.y = Y
		K8.z = Z
		var/mob/Monsters/StrayGoblin/K9 = new
		K9.x = X
		K9.y = Y
		K9.z = Z
		var/mob/Monsters/StrayGoblin/K10 = new
		K10.x = X
		K10.y = Y
		K10.z = Z
		K10.overlays -= K10.overlays
		K10.overlays += /obj/Items/Armours/Helmets/BoneCrown/
		K10.overlays += /obj/Items/Armours/Legs/BoneLeggings/
		K10.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
		K10.overlays += /obj/Items/Armours/RightArms/BoneRightGauntlet/
		K10.overlays += /obj/Items/Armours/LeftArms/BoneLeftGauntlet/
		K10.WearingChest = 1
		K10.WearingLegs = 1
		K10.WearingLeftArm = 1
		K10.WearingRightArm = 1
		K10.ImmuneToTemperature = 1
		K10.name = "{NPC} Goblin King"
		K10.Strength += 10
		K10.Agility += 10
		K10.Defence += 35
		K10.overlays += /obj/Items/Weapons/Swords/HolySword/
		var/obj/Items/Weapons/Swords/HolySword/G1 = new
		G1.loc = K10
		G1.name = "Lichbane"
		G1.desc = "Lichbane was created by an order of half-mad monks for the sole purpose of slaying evil creatures, it appears the goblin king killed the crusader who held it... and thought it was shiny."
		G1.WeaponDamageMin = 45
		G1.WeaponDamageMax = 50
		K1.Function = K10
		K2.Function = K10
		K3.Function = K10
		K4.Function = K10
		K8.Function = K10
		K9.Function = K10
		K10.WeaponDamageMin = 45
		K10.WeaponDamageMax = 50
		K10.SneakingSkill += 175
		K10.HoldingWeapon = "Sword"
		world << "An army of Goblins has arrived at [X],[Y],1 to decimate the land!"
	if(Army == 3)
		var/X = rand(200,900)
		var/Y = rand(300,800)
		var/Z = 1
		var/mob/Monsters/SkeletonWarrior/K1 = new
		K1.x = X
		K1.y = Y
		K1.z = Z
		for(var/turf/grounds/G in view(0,K1))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/SkeletonWarrior/K2 = new
		K2.x = X
		K2.y = Y
		K2.z = Z
		for(var/turf/grounds/G in view(0,K2))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/SkeletonWarrior/K3 = new
		K3.x = X
		K3.y = Y
		K3.z = Z
		for(var/turf/grounds/G in view(0,K3))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/SkeletonWarrior/K4 = new
		K4.x = X
		K4.y = Y
		K4.z = Z
		var/mob/Monsters/SkeletonWarrior/K5 = new
		K5.x = X
		K5.y = Y
		K5.z = Z
		var/mob/Monsters/SkeletonLord/K8 = new
		K8.x = X
		K8.y = Y
		K8.z = Z
		var/mob/Monsters/SkeletonLord/K9 = new
		K9.x = X
		K9.y = Y
		K9.z = Z
		var/mob/Monsters/SkeletonLord/K10 = new
		K10.x = X
		K10.y = Y
		K10.z = Z
		K10.overlays -= K10.overlays
		K10.overlays += /obj/Items/Armours/Helmets/BoneCrown/
		K10.overlays += /obj/Items/Armours/ChestPlates/NecroRobe/
		K10.WearingChest = 1
		K10.WearingLegs = 1
		K10.WearingLeftArm = 1
		K10.WearingRightArm = 1
		K10.ImmuneToTemperature = 1
		K10.name = "{NPC} Skeletal Lich King"
		K10.Strength += 10
		K10.Agility += 10
		K10.Defence += 25
		K10.overlays += /obj/Items/Weapons/Maces/AstralStaff/
		var/obj/Items/Armours/ChestPlates/NecroRobe/G10 = new()
		G10.loc = K10
		var/obj/Items/Shafts/LichSkull/L10 = new()
		L10.loc = K10
		K1.Function = K10
		K2.Function = K10
		K3.Function = K10
		K4.Function = K10
		K5.Function = K10
		K8.Function = K10
		K9.Function = K10
		K10.WeaponDamageMin = 50
		K10.WeaponDamageMax = 55
		K10.HP += 500
		K10.SneakingSkill += 175
		K10.HoldingWeapon = "Mace"
		world << "An army of Undead has arrived at [X],[Y],1 to decimate the land!"
	if(Army == 4)
		var/X = rand(200,900)
		var/Y = rand(300,800)
		var/Z = 1
		var/mob/Monsters/NPCRatman/K1 = new
		K1.x = X
		K1.y = Y
		K1.z = Z
		for(var/turf/grounds/G in view(0,K1))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCRatman/K2 = new
		K2.x = X
		K2.y = Y
		K2.z = Z
		for(var/turf/grounds/G in view(0,K2))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCRatman/K3 = new
		K3.x = X
		K3.y = Y
		K3.z = Z
		for(var/turf/grounds/G in view(0,K3))
			if(G.density == 1)
				X = rand(200,900)
				Y = rand(300,800)
		var/mob/Monsters/NPCRatman/K4 = new
		K4.x = X
		K4.y = Y
		K4.z = Z
		var/mob/Monsters/NPCRatman/K5 = new
		K5.x = X
		K5.y = Y
		K5.z = Z
		var/mob/Monsters/NPCRatman/K6 = new
		K6.x = X
		K6.y = Y
		K6.z = Z
		var/mob/Monsters/NPCRatman/K7 = new
		K7.x = X
		K7.y = Y
		K7.z = Z
		var/mob/Monsters/NPCRatman/K10 = new
		K10.x = X
		K10.y = Y
		K10.z = Z
		K10.overlays -= K10.overlays
		K10.overlays += /obj/Items/Armours/Helmets/BoneCrown/
		K10.overlays += /obj/Items/Armours/Legs/BoneLeggings/
		K10.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
		K10.overlays += /obj/Items/Armours/RightArms/BoneRightGauntlet/
		K10.overlays += /obj/Items/Armours/LeftArms/BoneLeftGauntlet/
		K10.WearingChest = 1
		K10.WearingLegs = 1
		K10.WearingLeftArm = 1
		K10.WearingRightArm = 1
		K10.ImmuneToTemperature = 1
		K10.name = "{NPC} Ratman King"
		K10.Strength += 10
		K10.Agility += 10
		K10.Defence += 35
		K10.overlays += /obj/Items/Weapons/Spears/MarineSpear/
		var/obj/Items/Weapons/Spears/MarineSpear/G1 = new
		G1.loc = K10
		G1.name = "Bloodwhisker"
		G1.desc = "The famous spear of the rat kings, stolen from some poor mermaids."
		G1.WeaponDamageMin = 45
		G1.WeaponDamageMax = 50
		K1.Function = K10
		K2.Function = K10
		K3.Function = K10
		K4.Function = K10
		K5.Function = K10
		K6.Function = K10
		K7.Function = K10
		K10.WeaponDamageMin = 45
		K10.WeaponDamageMax = 50
		K10.SneakingSkill += 175
		K10.HoldingWeapon = "Spear"
		world << "An army of Ratmen has arrived at [X],[Y],1 to decimate the land!"
	if(Army == 5)
		var/X = rand(200,900)
		var/Y = rand(300,800)
		var/Z = 1
		var/mob/Monsters/Troll/K1 = new
		K1.x = X
		K1.y = Y
		K1.z = Z
		world << "A wild troll has been spotted at [X],[Y]."
	if(Summer == 1)
		if(Autumm == 0)
			if(Winter == 0)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Autumm!"
					world << "<b><font color=lime>View the forums for miscellanious guides and whatever else.</b> http://dungeonmas.freeforums.org/"
					Autumm = 1
					Summer = 0
					return
	if(Summer == 0)
		if(Autumm == 1)
			if(Winter == 0)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Winter!"
					world << "<b><font color=lime>View the forums for miscellanious guides and whatever else.</b> http://dungeonmas.freeforums.org/"
					Winter = 1
					Autumm = 0
					return
	if(Summer == 0)
		if(Autumm == 0)
			if(Winter == 1)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Spring!"
					world << "<b><font color=lime>View the forums for miscellanious guides and whatever else.</b> http://dungeonmas.freeforums.org/"
					Spring = 1
					Winter = 0
					return
	if(Summer == 0)
		if(Autumm == 0)
			if(Winter == 0)
				if(Spring == 1)
					world << "<b><font color=blue>It Is Now Summer!"
					world << "<b><font color=lime>View the forums for miscellanious guides and whatever else.</b> http://dungeonmas.freeforums.org/"
					Summer = 1
					Spring = 0
					return
/proc/BirthChanges()
	Births()
	spawn(600)
		BirthChanges()
		return
/proc/Births()
	for(var/mob/Monsters/m in world)
		m.overlays -= /obj/dodge/
		m.overlays -= /obj/miss/
		m.overlays -= /obj/block/
		if(m)
			m.Days += 1
			if(m.PregnancyCount == 0)
				if(m)
					if(m.Egg == 0)
						if(m.LizardMan == 1 || m.FrogMan == 1)
							m.Preg = 0
					var/mis
					mis = prob(0)
					if(m.Preg == 1)
						if(mis == 1)
							m.Owner << "[m] has had a mis-carriage!"
							m.Preg = 0
							if(m.Spider == 1)
								m.Owner << "[m] did not mature correctly and died!"
								if(ismob(m.Owner))
									var/mob/A = m.Owner
									A.UnitList -= m
								del(m)
							if(m)
								if(m.LizardMan == 1 || m.FrogMan == 1)
									m.Owner << "[m] did not mature correctly and died!"
									if(ismob(m.Owner))
										var/mob/A = m.Owner
										A.UnitList -= m
									del(m)
						if(m)
							if(mis == 0)
								if(m.LizardMan == 1 || m.FrogMan == 1)
									if(m.Days >= 2)
										if(m)
											var/mob/E = m.Owner
											E.Owner << "[m] has hatched!"
											if(m.LizardMan == 1)
												var/mob/Monsters/LizardMan/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m.Mum
												G.loc = m.loc
												G.Owner = m.Owner
												G.Age = 1
												G.SpearSkill += m.SpearSkill
												G.BowSkill += m.BowSkill
												G.SwordSkill += m.SwordSkill
												G.AxeSkill += m.AxeSkill
												G.MaceSkill += m.MaceSkill
												G.UnArmedSkill += m.UnArmedSkill
												G.ShieldSkill += m.ShieldSkill
												G.ArmourSkill += m.ArmourSkill
												G.BuildingSkill += m.BuildingSkill
												G.ForgingSkill += m.ForgingSkill
												G.WoodCraftingSkill += m.WoodCraftingSkill
												G.MetalCraftingSkill += m.MetalCraftingSkill
												G.SkinningSkill += m.SkinningSkill
												G.SmeltingSkill += m.SmeltingSkill
												G.JewlCraftingSkill += m.JewlCraftingSkill
												G.ButcherySkill += m.ButcherySkill
												G.LeatherCraftingSkill += m.LeatherCraftingSkill
												G.PoisonSkill += m.PoisonSkill
												G.BoneCraftingSkill += m.BoneCraftingSkill
												G.StoneCraftingSkill += m.StoneCraftingSkill
												G.SneakingSkill += m.SneakingSkill
												G.LockPickingSkill += m.LockPickingSkill
												G.CookingSkill += m.CookingSkill
												G.FishingSkill += m.FishingSkill
												G.PotionSkill += m.PotionSkill
												G.Birth()
												G.name = "{[G.Owner]}"
												G.PillarPowerup()
												if(ismob(m.Owner))
													var/mob/A = m.Owner
													A.UnitList += G
												del(m)
											else
												var/mob/Monsters/Frogmen/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m.Mum
												G.loc = m.loc
												G.Owner = m.Owner
												G.Age = 1
												G.SpearSkill += m.SpearSkill
												G.BowSkill += m.BowSkill
												G.SwordSkill += m.SwordSkill
												G.AxeSkill += m.AxeSkill
												G.MaceSkill += m.MaceSkill
												G.UnArmedSkill += m.UnArmedSkill
												G.ShieldSkill += m.ShieldSkill
												G.ArmourSkill += m.ArmourSkill
												G.BuildingSkill += m.BuildingSkill
												G.ForgingSkill += m.ForgingSkill
												G.WoodCraftingSkill += m.WoodCraftingSkill
												G.MetalCraftingSkill += m.MetalCraftingSkill
												G.SkinningSkill += m.SkinningSkill
												G.SmeltingSkill += m.SmeltingSkill
												G.JewlCraftingSkill += m.JewlCraftingSkill
												G.ButcherySkill += m.ButcherySkill
												G.LeatherCraftingSkill += m.LeatherCraftingSkill
												G.PoisonSkill += m.PoisonSkill
												G.BoneCraftingSkill += m.BoneCraftingSkill
												G.StoneCraftingSkill += m.StoneCraftingSkill
												G.SneakingSkill += m.SneakingSkill
												G.LockPickingSkill += m.LockPickingSkill
												G.CookingSkill += m.CookingSkill
												G.FishingSkill += m.FishingSkill
												G.PotionSkill += m.PotionSkill
												G.Birth()
												G.name = "{[G.Owner]}"
												G.PillarPowerup()
												if(ismob(m.Owner))
													var/mob/A = m.Owner
													A.UnitList += G
												del(m)
								if(m)
									if(m.IsDragon == 1)
										if(m.Days >= 2)
											if(m.IsDragon == 1)
												var/mob/A = m.Owner
												var/CanHatch = 1
												var/Num = 0
												for(var/mob/M in A.UnitList)
													if(M.IsDragon == 1 || M.Race == "Dragon")
														Num += 1
												if(Num >= 25)
													CanHatch = 0
												if(CanHatch)
													var/mob/Monsters/Dragon/G = new
													G.Dad = m.TheDad
													m.TheDad = null
													G.Mum = m
													G.loc = m.loc
													G.Owner = m.Owner
													G.Age = 1
													m.Owner << "Egg hatched!"
													G.Birth()
													G.PillarPowerup()
													G.name = "{[G.Owner]} Dragon"
													A.UnitList += G
												else
													m.Owner << "Egg died!"
												del(m)
								if(m)
									if(m.Spider == 1)
										if(m.Days >= 2)
											if(m.IsWorker == 1)
												var/mob/A = m.Owner
												var/CanHatch = 1
												var/Num = 0
												for(var/mob/M in A.UnitList)
													if(M.Spider == 1)
														Num += 1
												if(Num >= 25)
													CanHatch = 0
												if(CanHatch)
													var/mob/Monsters/WorkerSpider/G = new
													G.Dad = m.TheDad
													m.TheDad = null
													G.Mum = m
													G.loc = m.loc
													G.Owner = m.Owner
													G.IsWorker = 1
													G.Age = 1
													m.Owner << "Egg hatched!"
													G.Birth()
													G.PillarPowerup()
													G.name = "{[G.Owner]}"
													A.UnitList += G
												else
													m.Owner << "Egg died!"
												del(m)
									if(m)
										if(m.IsWarrior == 1)
											var/mob/A = m.Owner
											var/CanHatch = 1
											var/Num = 0
											for(var/mob/M in A.UnitList)
												if(M.Spider == 1)
													Num += 1
											if(Num >= 30)
												CanHatch = 0
											if(CanHatch)
												var/mob/Monsters/Spider/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.IsWarrior = 1
												G.Age = 1
												m.Owner << "Egg hatched!"
												G.Birth()
												G.PillarPowerup()
												G.name = "{[G.Owner]}"
												A.UnitList += G
											else
												m.Owner << "Egg died!"
											del(m)
									if(m)
										if(m.IsHunter == 1)
											var/mob/A = m.Owner
											var/CanHatch = 1
											var/Num = 0
											for(var/mob/M in A.UnitList)
												if(M.Spider == 1)
													Num += 1
											if(Num >= 30)
												CanHatch = 0
											if(CanHatch)
												var/mob/Monsters/HunterSpider/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.IsHunter = 1
												G.Age = 1
												m.Owner << "Egg hatched!"
												G.Birth()
												G.PillarPowerup()
												G.name = "{[G.Owner]}"
												A.UnitList += G
											else
												m.Owner << "Egg died!"
											del(m)
									if(m)
										if(m.Queen == 1)
											var/mob/A = m.Owner
											var/CanHatch = 1
											var/Num = 0
											for(var/mob/M in A.UnitList)
												if(M.Spider == 1)
													Num += 1
											if(Num >= 30)
												CanHatch = 0
											if(CanHatch)
												var/mob/Monsters/SpiderQueen/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.Queen = 1
												G.Age = 1
												m.Owner << "Egg hatched!"
												G.Birth()
												G.PillarPowerup()
												G.name = "{[G.Owner]}"
												A.UnitList += G
											else
												m.Owner << "Egg died!"
											del(m)
							if(m)
								if(mis == 0)
									if(m.Vampire == 1)
										var/mob/Monsters/Vampire/G = new
										var/mob/O = m.Owner
										G.Dad = m.TheDad
										m.TheDad = null
										G.Mum = m
										G.loc = m.loc
										G.Owner = m.Owner
										G.Age = 1
										if(O.DayWalker <= 2)
											G.DayWalker = prob(4)
										m.Owner << "[m] has given birth!"
										G.icon_state = "NoWings"
										G.Birth()
										G.PillarPowerup()
										G.name = "{[G.Owner]}"
										G.DieAge = rand(400,500)
										if(G.DayWalker == 1)
											m.Owner << "[G] has been born half a vampire and can walk in day!"

										if(ismob(m.Owner))
											var/mob/A = m.Owner
											A.UnitList += G
											A.DayWalker += 1
									if(m.Kobold == 1)
										if(m)
											if(m.Snakeperson == 0)
												m.Owner << "[m] has given birth!"
												var/mob/Monsters/Kobold/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.Age = 1
												G.SpearSkill += m.SpearSkill/3
												G.BowSkill += m.BowSkill/3
												G.SwordSkill += m.SwordSkill/3
												G.AxeSkill += m.AxeSkill/3
												G.MaceSkill += m.MaceSkill/3
												G.UnArmedSkill += m.UnArmedSkill/3
												G.ShieldSkill += m.ShieldSkill/3
												G.ArmourSkill += m.ArmourSkill/3
												G.ForgingSkill += m.ForgingSkill/3
												G.WoodCraftingSkill += m.WoodCraftingSkill/3
												G.MetalCraftingSkill += m.MetalCraftingSkill/3
												G.SkinningSkill += m.SkinningSkill/3
												G.SmeltingSkill += m.SmeltingSkill/3
												G.JewlCraftingSkill += m.JewlCraftingSkill/3
												G.ButcherySkill += m.ButcherySkill/3
												G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
												G.PoisonSkill += m.PoisonSkill /3
												G.BuildingSkill += m.BuildingSkill /3
												G.BoneCraftingSkill += m.BoneCraftingSkill/3
												G.StoneCraftingSkill += m.StoneCraftingSkill/3
												G.SneakingSkill += m.SneakingSkill/3
												G.LockPickingSkill += m.LockPickingSkill/3
												G.CookingSkill += m.CookingSkill /3
												G.FishingSkill += m.FishingSkill /3
												G.PotionSkill += m.PotionSkill /3
												G.Birth()
												G.PillarPowerup()
												G.name = "{[G.Owner]}"
												var/mob/Monsters/Kobold/G2 = new
												G2.Dad = m.TheDad
												m.TheDad = null
												G2.Mum = m
												G2.loc = m.loc
												G2.Owner = m.Owner
												G2.Age = 1
												G2.SpearSkill += m.SpearSkill/3
												G2.BowSkill += m.BowSkill/3
												G2.SwordSkill += m.SwordSkill/3
												G2.AxeSkill += m.AxeSkill/3
												G2.MaceSkill += m.MaceSkill/3
												G2.UnArmedSkill += m.UnArmedSkill/3
												G2.ShieldSkill += m.ShieldSkill/3
												G2.ArmourSkill += m.ArmourSkill/3
												G2.ForgingSkill += m.ForgingSkill/3
												G2.BuildingSkill += m.BuildingSkill /3
												G2.WoodCraftingSkill += m.WoodCraftingSkill/3
												G2.MetalCraftingSkill += m.MetalCraftingSkill/3
												G2.SkinningSkill += m.SkinningSkill/3
												G2.SmeltingSkill += m.SmeltingSkill/3
												G2.JewlCraftingSkill += m.JewlCraftingSkill/3
												G2.ButcherySkill += m.ButcherySkill/3
												G2.LeatherCraftingSkill += m.LeatherCraftingSkill/3
												G2.PoisonSkill += m.PoisonSkill /3
												G2.BoneCraftingSkill += m.BoneCraftingSkill/3
												G2.StoneCraftingSkill += m.StoneCraftingSkill/3
												G2.SneakingSkill += m.SneakingSkill/3
												G2.LockPickingSkill += m.LockPickingSkill/3
												G2.CookingSkill += m.CookingSkill /3
												G2.FishingSkill += m.FishingSkill /3
												G2.PotionSkill += m.PotionSkill /3
												G2.Birth()
												G2.PillarPowerup()
												G2.name = "{[G.Owner]}"
												if(ismob(m.Owner))
													if(m.Content3 == "Tamed")
														G.CanBeSlaved = 1
														G2.CanBeSlaved = 1
														G.CanBeCaged = 1
														G2.CanBeCaged = 1
												if(ismob(m.Owner))
													var/mob/A = m.Owner
													A.UnitList += G
													A.UnitList += G2
											else
												m.Owner << "[m] has given birth!"
												var/mob/Monsters/Slither/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.Age = 1
												G.SpearSkill += m.SpearSkill/3
												G.BowSkill += m.BowSkill/3
												G.SwordSkill += m.SwordSkill/3
												G.AxeSkill += m.AxeSkill/3
												G.MaceSkill += m.MaceSkill/3
												G.UnArmedSkill += m.UnArmedSkill/3
												G.ShieldSkill += m.ShieldSkill/3
												G.ArmourSkill += m.ArmourSkill/3
												G.ForgingSkill += m.ForgingSkill/3
												G.WoodCraftingSkill += m.WoodCraftingSkill/3
												G.MetalCraftingSkill += m.MetalCraftingSkill/3
												G.SkinningSkill += m.SkinningSkill/3
												G.SmeltingSkill += m.SmeltingSkill/3
												G.JewlCraftingSkill += m.JewlCraftingSkill/3
												G.ButcherySkill += m.ButcherySkill/3
												G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
												G.PoisonSkill += m.PoisonSkill /3
												G.BuildingSkill += m.BuildingSkill /3
												G.BoneCraftingSkill += m.BoneCraftingSkill/3
												G.StoneCraftingSkill += m.StoneCraftingSkill/3
												G.SneakingSkill += m.SneakingSkill/3
												G.LockPickingSkill += m.LockPickingSkill/3
												G.CookingSkill += m.CookingSkill /3
												G.FishingSkill += m.FishingSkill /3
												G.PotionSkill += m.PotionSkill /3
												G.Birth()
												G.PillarPowerup()
												G.name = "{[G.Owner]}"
												if(ismob(m.Owner))
													if(m.Content3 == "Tamed")
														G.CanBeSlaved = 1
														G.CanBeCaged = 1
												if(ismob(m.Owner))
													var/mob/A = m.Owner
													A.UnitList += G
									if(m.Ratmen == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Ratman/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PoisonSkill += m.PoisonSkill /3
											G.BuildingSkill += m.BuildingSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											var/mob/Monsters/Ratman/G2 = new
											G2.Dad = m.TheDad
											m.TheDad = null
											G2.Mum = m
											G2.loc = m.loc
											G2.Owner = m.Owner
											G2.Age = 1
											G2.SpearSkill += m.SpearSkill/3
											G2.BowSkill += m.BowSkill/3
											G2.SwordSkill += m.SwordSkill/3
											G2.AxeSkill += m.AxeSkill/3
											G2.MaceSkill += m.MaceSkill/3
											G2.UnArmedSkill += m.UnArmedSkill/3
											G2.ShieldSkill += m.ShieldSkill/3
											G2.ArmourSkill += m.ArmourSkill/3
											G2.ForgingSkill += m.ForgingSkill/3
											G2.BuildingSkill += m.BuildingSkill /3
											G2.WoodCraftingSkill += m.WoodCraftingSkill/3
											G2.MetalCraftingSkill += m.MetalCraftingSkill/3
											G2.SkinningSkill += m.SkinningSkill/3
											G2.SmeltingSkill += m.SmeltingSkill/3
											G2.JewlCraftingSkill += m.JewlCraftingSkill/3
											G2.ButcherySkill += m.ButcherySkill/3
											G2.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G2.PoisonSkill += m.PoisonSkill /3
											G2.BoneCraftingSkill += m.BoneCraftingSkill/3
											G2.StoneCraftingSkill += m.StoneCraftingSkill/3
											G2.SneakingSkill += m.SneakingSkill/3
											G2.LockPickingSkill += m.LockPickingSkill/3
											G2.CookingSkill += m.CookingSkill /3
											G2.FishingSkill += m.FishingSkill /3
											G2.PotionSkill += m.PotionSkill /3
											G2.Birth()
											G2.PillarPowerup()
											G2.name = "{[G.Owner]}"
											var/mob/Monsters/Ratman/G3 = new
											G3.Dad = m.TheDad
											m.TheDad = null
											G3.Mum = m
											G3.loc = m.loc
											G3.Owner = m.Owner
											G3.Age = 1
											G3.SpearSkill += m.SpearSkill/3
											G3.BowSkill += m.BowSkill/3
											G3.SwordSkill += m.SwordSkill/3
											G3.AxeSkill += m.AxeSkill/3
											G3.MaceSkill += m.MaceSkill/3
											G3.UnArmedSkill += m.UnArmedSkill/3
											G3.ShieldSkill += m.ShieldSkill/3
											G3.ArmourSkill += m.ArmourSkill/3
											G3.ForgingSkill += m.ForgingSkill/3
											G3.BuildingSkill += m.BuildingSkill /3
											G3.WoodCraftingSkill += m.WoodCraftingSkill/3
											G3.MetalCraftingSkill += m.MetalCraftingSkill/3
											G3.SkinningSkill += m.SkinningSkill/3
											G3.SmeltingSkill += m.SmeltingSkill/3
											G3.JewlCraftingSkill += m.JewlCraftingSkill/3
											G3.ButcherySkill += m.ButcherySkill/3
											G3.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G3.PoisonSkill += m.PoisonSkill /3
											G3.BoneCraftingSkill += m.BoneCraftingSkill/3
											G3.StoneCraftingSkill += m.StoneCraftingSkill/3
											G3.SneakingSkill += m.SneakingSkill/3
											G3.LockPickingSkill += m.LockPickingSkill/3
											G3.CookingSkill += m.CookingSkill /3
											G3.FishingSkill += m.FishingSkill /3
											G3.PotionSkill += m.PotionSkill /3
											G3.Birth()
											G3.PillarPowerup()
											G3.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												if(m.Content3 == "Tamed")
													G.CanBeSlaved = 1
													G2.CanBeSlaved = 1
													G3.CanBeSlaved = 1
													G.CanBeCaged = 1
													G2.CanBeCaged = 1
													G3.CanBeCaged = 1
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
												A.UnitList += G2
												A.UnitList += G3

									if(m.Race == "Orc")
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Orc/G = new
											var/MagicChance = prob(2)
											var/Inheritedmagic = prob(4)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PoisonSkill += m.PoisonSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."

									if(m.Race == "Elf")
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Elf/G = new
											var/MagicChance = prob(12)
											var/Inheritedmagic = prob(24)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/2
											G.BowSkill += m.BowSkill/2
											G.SwordSkill += m.SwordSkill/2
											G.AxeSkill += m.AxeSkill/2
											G.MaceSkill += m.MaceSkill/2
											G.UnArmedSkill += m.UnArmedSkill/2
											G.ShieldSkill += m.ShieldSkill/2
											G.ArmourSkill += m.ArmourSkill/2
											G.BuildingSkill += m.BuildingSkill /2
											G.ForgingSkill += m.ForgingSkill/2
											G.WoodCraftingSkill += m.WoodCraftingSkill/2
											G.MetalCraftingSkill += m.MetalCraftingSkill/2
											G.SkinningSkill += m.SkinningSkill/2
											G.SmeltingSkill += m.SmeltingSkill/2
											G.JewlCraftingSkill += m.JewlCraftingSkill/2
											G.ButcherySkill += m.ButcherySkill/2
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/2
											G.PoisonSkill += m.PoisonSkill /2
											G.BoneCraftingSkill += m.BoneCraftingSkill/2
											G.StoneCraftingSkill += m.StoneCraftingSkill/2
											G.SneakingSkill += m.SneakingSkill/2
											G.LockPickingSkill += m.LockPickingSkill/2
											G.CookingSkill += m.CookingSkill /2
											G.FishingSkill += m.FishingSkill /2
											G.PotionSkill += m.PotionSkill /2
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."

									if(m.Race == "Angel of Death")
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/AngelOfDeath/G = new
											var/MagicChance = prob(6)
											var/Inheritedmagic = prob(12)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/2
											G.BowSkill += m.BowSkill/2
											G.SwordSkill += m.SwordSkill/2
											G.AxeSkill += m.AxeSkill/2
											G.MaceSkill += m.MaceSkill/2
											G.UnArmedSkill += m.UnArmedSkill/2
											G.ShieldSkill += m.ShieldSkill/2
											G.ArmourSkill += m.ArmourSkill/2
											G.BuildingSkill += m.BuildingSkill /2
											G.ForgingSkill += m.ForgingSkill/2
											G.WoodCraftingSkill += m.WoodCraftingSkill/2
											G.MetalCraftingSkill += m.MetalCraftingSkill/2
											G.SkinningSkill += m.SkinningSkill/2
											G.SmeltingSkill += m.SmeltingSkill/2
											G.JewlCraftingSkill += m.JewlCraftingSkill/2
											G.ButcherySkill += m.ButcherySkill/2
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/2
											G.PoisonSkill += m.PoisonSkill /2
											G.BoneCraftingSkill += m.BoneCraftingSkill/2
											G.StoneCraftingSkill += m.StoneCraftingSkill/2
											G.SneakingSkill += m.SneakingSkill/2
											G.LockPickingSkill += m.LockPickingSkill/2
											G.CookingSkill += m.CookingSkill /2
											G.FishingSkill += m.FishingSkill /2
											G.PotionSkill += m.PotionSkill /2
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."

									if(m.Goblin == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Goblin/G = new
											var/MagicChance = prob(4)
											var/Inheritedmagic = prob(8)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PoisonSkill += m.PoisonSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."

									if(m.Dwarf == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Dwarf/G = new
											var/MagicChance = prob(2)
											var/Inheritedmagic = prob(5)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PoisonSkill += m.PoisonSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."



									if(m.Human == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Human/G = new
											var/MagicChance = prob(10)
											var/Inheritedmagic = prob(20)
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PoisonSkill += m.PoisonSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.PillarPowerup()
											G.name = "{[G.Owner]}"
											if(m.Black == 1)
												G.Black = 1
												if(G.Gender == "Male")
													G.icon = 'HumanBlack.dmi'
													G.icon_state = "Normal"
												if(G.Gender == "Female")
													G.icon = 'FemaleHumanBlack.dmi'
													G.icon_state = "Normal"
											if(m.Black == 0)
												G.Black = 0
												if(G.Gender == "Male")
													G.icon = 'Human.dmi'
													G.icon_state = "Normal"
												if(G.Gender == "Female")
													G.icon = 'FemaleHuman.dmi'
													G.icon_state = "Normal"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											if(MagicChance == 1)
												G.MagicalAptitude = 1
												G.DieAge += 15
												G.Owner << "[G] has been born with a connection to otherworldly forces, allowing [G] to control and shape the energies of Magic."
											if(Inheritedmagic == 1)
												if(m.MagicalAptitude == 1)
													G.MagicalAptitude = 1
													G.DieAge += 10
													G.Owner << "[G] has inherited their mother's connection to otherworldly forces."

									if(m.Deer == 1)
										view() << "[m] has given birth!"
										var/mob/Monsters/Deer/G = new
										G.Dad = m.TheDad
										m.TheDad = null
										G.Mum = m
										G.loc = m.loc
										G.Owner = m.Owner
										G.Age = 1
										if(m.Tame == 1)
											G.Tame = 1


									if(m.Spider == 0)
										if(m.Beatle == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/DeathBeatle/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Mole == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/Mole/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Bug == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/CaveSpider/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Wolf == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/Wolf/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.Birth()
											G.name = "{[G.Owner]}"
											if(m.Tame == 1)
												G.Tame = 1


						if(m)
							m.overlays -= /obj/preg/
							if(m.Egg == 0)
								m.Preg = 0
	return
/proc/NightChange()
	Night()
	spawn(5500)
		NightChange()
/proc/Night()
	if(night == 0)
		world << "<b><font color=blue>It Starts To Get Darker"
		spawn(500)
			night = 1
			world << "<b><font color=blue>Night Falls"
			for(var/mob/W in world)
				if(W.Shadowfiend == 1)
					var/mob/G = W.Owner
					G.see_invisible = 10
					W.Defence += 25
			for(var/mob/X in Players2)
				for(var/obj/Hud/Day/D in usr.client.screen)
					D.icon_state = "Moon"
					D.name = "Night"
					D.text = "<font color=blue>°"
			for(var/mob/Monsters/m in world)
				if(m)
					m.Days += 1
					if(m.Underground == 0)
						if(m.SunSafe == 0)
							if(night == 0)
								if(m.Vampire == 1 || m.Svartalfar == 1)
									if(m.CanBeSlaved == 1)
										if(m.z == 2)
											m.SunSafe = 1
											m.z = 1
											view(m) << "<font color=red>[m] tunnels up out of the ground!"
									if(m.DayWalker == 0 && m.CanBeSlaved == 0)
										m.Owner << "<b><font color=red> [m] walks into the light and is burned badly!!"
										m.HP -= 25
										m.SunLight()
										m.destination = null
										if(m.HP <= 0)
											m.Freeze = 1
											sleep(2)
											m.GoingToDie = 1
											m.Killer = "The Sun"
											m.DeathType = "Being Burned"
											m.Death()


				if(m)
					if(m.Age >= m.DieAge)
						if(m.InHole == 0)
							m.HP = 0
							m.Owner << "[m] has died of old age!"
							if(ismob(m.Owner))
								var/mob/A = m.Owner
								A.UnitList -= m
							m.GoingToDie = 1
							m.Killer = "Old Age"
							m.DeathType = "Old Age"
							m.Death()
		return
	if(night == 1)
		world << "<b><font color=blue>It Starts To Get Lighter"
		spawn(500)
			night = 0
			world << "<b><font color=blue>Day Rises"
			for(var/mob/X in Players2)
				for(var/obj/Hud/Day/D in X.client.screen)
					D.icon_state = "Sun"
					D.name = "Day"
					D.text = "<font color=yellow>¤"
			for(var/mob/Monsters/W in world)
				if(W.Shadowfiend == 1)
					W.Defence -= 25
			for(var/mob/Monsters/m in world)
				if(m)
					m.Days += 1
					if(m.Underground == 0)
						if(m.SunSafe == 0)
							if(night == 0)
								if(m.Vampire == 1)
									if(m.CanBeSlaved == 1)
										if(m.z == 1)
											m.SunSafe = 1
											view(m) << "<font color=red>[m] tunnels underground because of the approaching sunlight"
											m.z = 2
										if(m.z == 3)
											m.SunSafe = 1
											view(m) << "<font color=red>[m] tunnels down because of the approaching sunlight"
											m.z = 1
									if(m.DayWalker == 0 && m.CanBeSlaved == 0)
										m.Owner << "<b><font color=red> [m] walks into the light and is burned badly!!"
										m.HP -= 25
										m.SunLight()
										m.destination = null
										if(m.HP <= 0)
											m.Freeze = 1
											sleep(2)
											m.GoingToDie = 1
											m.Killer = "The Sun"
											m.DeathType = "Being Burned"
											m.Death()
				if(m)
					if(m.Age >= m.DieAge)
						if(m.InHole == 0)
							m.HP = 0
							m.Owner << "[m] has died of old age!"
							if(ismob(m.Owner))
								var/mob/A = m.Owner
								A.UnitList -= m
							m.GoingToDie = 1
							m.Killer = "Old Age"
							m.DeathType = "Old Age"
							m.Death()
			return
obj/proc/CacoonTrap()
	var/OGB = 0
	for(var/mob/Monsters/X in range(4,src))
		if(X.Owner != src.Owner)
			if(X.Humanoid == 1 && X.Mole == 0 && X.Beatle == 0 && X.Wolf == 0 && X.Deer == 0 && X.IsTree == 0)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.key in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0 && X.Owner != src.Owner)
			var/mob/Monsters/FleshCrawler/F1 = new()
			var/mob/Monsters/FleshCrawler/F2 = new()
			F1.loc = src.loc
			F2.loc = src.loc
			F1.Owner = src.Owner
			F2.Owner = src.Owner
			F1.WeaponDamageMin = 5
			F2.WeaponDamageMin = 5
			F1.WeaponDamageMax = 8
			F2.WeaponDamageMax = 8
			F1.destination = X
			F2.destination = X
			F1.name = "{[F1.Owner]} Flesh Crawler"
			F2.name = "{[F2.Owner]} Flesh Crawler"
			view(src) << "[src] explodes open in a shower of gore and releases two small monstrosities!"
			src.Owner << "<b><font color=red><font size=3>[src] has detected an intruder at [src.x],[src.y],[src.z]!"
			del src
	spawn(5)
		src.CacoonTrap()
obj/proc/BSTTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.key in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									M.LeftLegHP -= 10
									M.RightLegHP -= 10
									M.BloodContent -= 15
									M.BloodLoss()
									M.SneakingSkill += 0.1
									var/Break = prob(3)
									if(Break == 1)
										del(src)
										return
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Gargoyle == 0)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									else
										M.SneakingSkill += 0.1
	spawn(5)
		BSTTrap()
		return
obj/proc/RibTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.key in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									src.Hole = 0
									src.IsSpiked = 0
									view() << "<b><font color=red>[M] walks over a trap and their legs are crushed!"
									M.LeftLegHP -= 60
									M.RightLegHP -= 60
									M.BloodContent -= 50
									M.BloodLoss()
									M.SneakingSkill += 1.5
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Gargoyle == 0)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									del(src)
								else
									M.SneakingSkill += 0.1
	spawn(5)
		RibTrap()
		return
obj/proc/StoneTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			for(var/mob/KLK in world)
				if(src.Owner == KLK)
					for(var/mob/MK in world)
						if(M.Owner == MK)
							if(MK.key in KLK.AllyList || MK.Faction == KLK.Faction)
								OGB = 1
			if(M.Owner == src.Owner)
				..()
			else
				if(M.Wagon == 0)
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							var/avoid = prob(M.SneakingSkill)
							if(avoid == 0)
								if(M.WearingHelmet == 0)
									if(M.Gargoyle == 0)
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head"
										M.HeadHP -= 80
										M.BloodContent -= 65
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(70)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Gargoyle == 1)
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
								else
									if(M.Gargoyle == 0)
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head, but some of the force is deflected by their helmet."
										M.HeadHP -= 50
										M.BloodContent -= 40
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(50)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Gargoyle == 1)
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
							else
								M.SneakingSkill += 0.1
	spawn(5)
		StoneTrap()
		return
obj/proc/PitTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(src.Owner == KLK)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.key in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(M.Wagon == 0)
						if(src.HasPersonIn == 0)
							if(OGB == 0)
								if(M.density == 1)
									var/avoid = prob(M.SneakingSkill)
									if(src.IsSpiked == 0)
										if(avoid == 0)
											M.destination = null
											for(var/mob/A in world)
												if(A == M.Owner)
													A.Selected.Remove(M)
													A.client.images -= M.Star
											src.HasPersonIn = 1
											M.InHole = 1
											src.Hole = 0
											src.icon = 'Cave.dmi'
											src.icon_state = "Hole"
											view(src) << "<b><font color=red>[M] falls into a pit"
											src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
											M.Struggle()

									if(src.Poisoned == 1)
										if(avoid == 0)
											if(src.IsSpiked == 1)
												M.HP  -= src.PoisonContent
												M.LeftLegHP -= 80
												M.RightLegHP -= 80
												M.BloodContent -= 60
												M.BloodLoss()
												src.Hole = 0
												src.icon = 'Cave.dmi'
												src.icon_state = "Hole"
												src.IsSpiked = 0
												src.Poisoned = 0
												src.PoisonContent = 0
												view(src) << "<b><font color=red>[M] falls into a posionious spiked trap"
												src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
												var/Stun = prob(50)
												if(Stun == 1)
													if(M.Gargoyle == 0)
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
												else
													M.SneakingSkill += 0.1
											if(src.IsSpiked == 1)
												if(avoid == 0)
													M.LeftLegHP -= 70
													M.RightLegHP -= 70
													M.BloodContent -= 50
													M.BloodLoss()
													src.Hole = 0
													src.icon = 'Cave.dmi'
													src.icon_state = "Hole"
													src.IsSpiked = 0
													view(src) << "<b><font color=red>[M] falls into a spiked trap"
													src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
													var/Stun = prob(50)
													if(Stun == 1)
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
													else
														M.SneakingSkill += 0.1
	spawn(5)
		PitTrap()
		return

mob/proc/Level()
	if(src.Level >= 100)
		return
	if(src.EXP >= EXPNeeded)
		if(src.HasLeftArm == 1)
			if(src.FrogMan)
				src.OrganMaxHP += rand(1,2)
			if(src.Vampire)
				src.OrganMaxHP += rand(2,3)
			if(src.Svartalfar)
				src.OrganMaxHP += rand(2,3)
			if(src.Kobold)
				src.OrganMaxHP += rand(0.75,1)
			if(src.Ratmen)
				src.OrganMaxHP += rand(0.50,0.75)
			if(src.Gremlin)
				src.OrganMaxHP += rand(0.50,0.75)
			if(src.Goblin)
				src.OrganMaxHP += rand(1,1.5)
			if(src.LizardMan == 1)
				src.OrganMaxHP += rand(2,3)
			if(src.Demon == 1)
				src.OrganMaxHP += rand(2,3)
			if(src.Race == "Orc" || src.Race == "Angel of Death")
				src.OrganMaxHP += rand(2,3)
			if(src.Dwarf)
				src.OrganMaxHP += rand(2,3)
			if(src.Werewolf)
				src.OrganMaxHP += rand(2,3)
			if(src.Plantman)
				src.OrganMaxHP += rand(2,3)
			if(src.Human)
				src.OrganMaxHP += rand(1,3)
			if(src.Race == "Elf")
				src.OrganMaxHP += pick(0.25,0.5)
			if(src.Wolf)
				src.OrganMaxHP += rand(1,2)
			if(src.Spider)
				src.OrganMaxHP += rand(0.50,0.75)
			if(src.OrganMaxHP >= 300)
				src.OrganMaxHP = 300
		src.EXP -= src.EXPNeeded
		src.EXPNeeded += 50
		src.EXPNeeded += src.Level / 3
		src.Level += 1
		if(src.Race == "Devourer")
			src.Strength += rand(1.5,2)
			src.Agility += rand(1.5,2)
			src.Defence += rand(1.5,2)
			src.weightmax += rand(20,30)
			src.Intelligence += pick(0.01,0.02)
		if(src.Race == "PlayerSkeleton")
			src.Strength += rand(0.5,1)
			src.Agility += rand(0.5,1)
			src.Defence += rand(0.5,1)
			src.weightmax += rand(5,10)
			src.Intelligence += pick(0.01,0.02)
		if(src.HalfDemon == 1)
			src.Strength += 0.5
			src.Agility += 0.5
			src.Defence += 0.5
			src.weightmax += rand(3,5)
			src.Intelligence += pick(0.01,0.02)
		if(src.Race == "Zombie")
			src.Strength += rand(0.5,1)
			src.Agility += rand(0.5,1)
			src.Defence += rand(0.5,1)
			src.weightmax += rand(5,10)
			src.Intelligence += pick(0.01,0.02)
		if(src.FrogMan == 1)
			src.Strength += rand(1,1)
			src.Agility += rand(1,3)
			src.weightmax += rand(10,20)
			src.Intelligence += pick(0.01,0.02)
		if(src.Illithid == 1)
			src.Strength += rand(1,1)
			src.Agility += rand(1,2)
			if(src.Flying == 0)
				src.weightmax += rand(15,25)
			else
				src.Old2 += rand(15,25)
			src.Intelligence += pick(0.1,0.2)
		if(src.Kobold == 1)
			src.Strength += rand(0.75,1)
			src.Agility += rand(2,3)
			src.weightmax += rand(10,20)
			src.Intelligence += pick(0.01,0.02)
		if(src.Ratmen == 1)
			src.Strength += rand(0.50,0.75)
			src.Agility += rand(2.5,3.5)
			src.weightmax += rand(5,15)
			src.Intelligence += pick(0.01,0.02)
		if(src.Gremlin == 1)
			src.Strength += rand(0.50,0.75)
			src.Agility += rand(2.25,3.25)
			src.weightmax += rand(5,15)
			src.Intelligence += pick(0.01,0.02)
		if(src.Goblin == 1)
			src.Strength += rand(1,1.5)
			src.Agility += rand(1,2)
			src.weightmax += rand(15,25)
			src.Intelligence += pick(0.05,0.06)
			if(src.Level == 10)
				src.Delay -= 1
		if(src.LizardMan == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(1,2)
			src.weightmax += rand(26,36)
			src.Intelligence += pick(0.05,0.1)
			src.PoisonDMG += 0.25
		if(src.Race == "Orc")
			src.Strength += rand(2,3)
			src.Agility += rand(1,1.5)
			src.weightmax += rand(27,37)
			src.Intelligence += pick(0.01,0.02)
		if(src.Gargoyle == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(0.5,1)
			if(src.Flying == 0)
				src.weightmax += rand(30,40)
			else
				src.Old2 += rand(30,40)
			src.Intelligence += pick(0.01,0.02)
		if(src.Dwarf == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(0.75,1)
			if(src.Flying == 0)
				src.weightmax += rand(30,40)
			else
				src.Old2 += rand(30,40)
			src.Intelligence += pick(0.025,0.05)
		if(src.Human == 1)
			src.Strength += rand(1,2)
			src.Agility += rand(2,3)
			if(src.Flying == 0)
				src.weightmax += rand(20,30)
			else
				src.Old2 += rand(20,30)
			src.Intelligence += pick(0.05,0.075)
		if(src.Race == "Elf" || src.Race == "Angel of Death")
			src.Strength += pick(1,1.5)
			src.Agility += rand(2,3)
			if(src.Flying == 0)
				src.weightmax += rand(15,25)
			else
				src.Old2 += rand(15,25)
			src.Intelligence += pick(0.25,0.35)
			if(src.Race == "Angel of Death")
				src.Strength += 1
		if(src.Race == "Dragon")
			src.Strength += rand(2,3)
			src.Agility += rand(1,2)
			if(src.Flying == 0)
				src.weightmax += rand(20,30)
			else
				src.Old2 += rand(20,30)
			src.Intelligence += pick(0.2,0.3)
			src.Defence += 1.5
			src.WeaponDamageMax += 0.5
			src.WeaponDamageMin += 0.5
			if(src.icon_state == "black" || src.icon_state == "flyingblack")
				if(src.IcePoints >= 1000 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.IcePoints >= src.FirePoints && src.IcePoints >= src.SandPoints && src.IcePoints >= src.DarkPoints && src.IcePoints >= src.GoldPoints && src.IcePoints >= src.PoisonPoints && src.IcePoints >= src.MagmaPoints)
					src.IceDrake = 1
					src.ImmuneToTemperature = 0
					if(src.Flying == 1)
						src.icon_state = "ice"
					if(src.Flying == 0)
						src.icon_state = "flyingice"
					src.Owner << "[src] has become an ice drake (Gains ice breath & more defence)."
					src.Defence += 25
				if(src.FirePoints >= 1000 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.FirePoints >= src.IcePoints && src.FirePoints >= src.SandPoints && src.FirePoints >= src.DarkPoints && src.FirePoints >= src.GoldPoints && src.FirePoints >= src.PoisonPoints && src.FirePoints >= src.MagmaPoints)
					src.FireDrake = 1
					src.ImmuneToTemperature = 0
					if(src.Flying == 1)
						src.icon_state = "red"
					if(src.Flying == 0)
						src.icon_state = "flyingred"
					src.Owner << "[src] has become an fire drake (Gains fire breath & more melee damage.)."
					src.WeaponDamageMin += 7
					src.WeaponDamageMax += 14
				if(src.SandPoints >= 1000 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.SandPoints >= src.IcePoints && src.SandPoints >= src.FirePoints && src.SandPoints >= src.DarkPoints && src.SandPoints >= src.GoldPoints && src.SandPoints >= src.PoisonPoints && src.SandPoints >= src.MagmaPoints)
					src.SandDrake = 1
					src.ImmuneToTemperature = 0
					if(src.Flying == 1)
						src.icon_state = "sand"
					if(src.Flying == 0)
						src.icon_state = "flyingsand"
					src.Owner << "[src] has become an sand drake (Gains entomb & more speed.)."
					src.Delay = 3
				if(src.PoisonPoints >= 1000 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.PoisonPoints >= src.IcePoints && src.PoisonPoints >= src.FirePoints && src.PoisonPoints >= src.DarkPoints && src.PoisonPoints >= src.GoldPoints && src.PoisonPoints >= src.SandPoints && src.PoisonPoints >= src.MagmaPoints)
					src.PoisonDrake = 1
					src.ImmuneToTemperature = 0
					if(src.Flying == 1)
						src.icon_state = "green"
					if(src.Flying == 0)
						src.icon_state = "flyinggreen"
					src.Owner << "[src] has become an poison drake (Gains poison spit & fangs.)."
					src.HasGland = 1
					src.PoisonDMG = 25
				if(src.MagmaPoints >= 1000 && src.ZombieDrake == 0 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.MagmaPoints >= src.IcePoints && src.MagmaPoints >= src.FirePoints && src.MagmaPoints >= src.DarkPoints && src.MagmaPoints >= src.GoldPoints && src.MagmaPoints >= src.SandPoints)
					src.MagmaDrake = 1
					if(src.Flying == 1)
						src.icon_state = "red2"
					if(src.Flying == 0)
						src.icon_state = "flyingred2"
					src.Owner << "[src] has become an magma drake (Gains magma spit & magic immmunity.)."
					src.ImmuneToMagic = 1
				if(src.ZombiePoints >= 1000 && src.FireDrake == 0 && src.MagmaDrake == 0 && src.IceDrake == 0 && src.SandDrake == 0 && src.PoisonDrake == 0 && src.ZombiePoints >= src.IcePoints && src.ZombiePoints >= src.FirePoints && src.ZombiePoints >= src.DarkPoints && src.ZombiePoints >= src.GoldPoints && src.ZombiePoints >= src.SandPoints && src.ZombiePoints >= src.MagmaPoints)
					src.ZombieDrake = 1
					src.ImmuneToDevourer = 1
					src.ImmuneToVampire = 1
					src.CommonCold = 1
					src.BlackPlague = 1
					src.BlackDeath = 1
					if(src.Flying == 1)
						src.icon_state = "zombie"
					if(src.Flying == 0)
						src.icon_state = "flyingzombie"
					src.Owner << "[src] has become an zombie drake (Gains diseased breath & disease immmunity.)."
				if(src.WaterPoints >= 1000)
					src.WaterDrake = 1
					src.Delay -= 1
					src.BlackPlague = 1
					src.BlackDeath = 1
					src.CommonCold = 1
					if(src.Flying == 1)
						src.icon_state = "flyingblue"
					if(src.Flying == 0)
						src.icon_state = "blue"
					src.Owner << "[src] has become an water drake (Gains immunity to disease, faster movement, and the ability to spit water!)."
				if(src.Unholy == 1)
					src.DarkDrake = 1
					src.ImmuneToMagic = 1
					src.BlackPlague = 1
					src.BlackDeath = 1
					src.CommonCold = 1
					if(src.Flying == 1)
						src.icon_state = "dark"
					if(src.Flying == 0)
						src.icon_state = "flyingdark"
					src.Owner << "[src] has become an dark drake (Gains immunity to magic, dsease, and the ability to brainwash units!)."
				if(src.Shielded == 1)
					src.HolyDrake = 1
					src.ImmuneToMagic = 1
					src.BlackPlague = 1
					src.BlackDeath = 1
					src.CommonCold = 1
					if(src.Flying == 1)
						src.icon_state = "gold"
					if(src.Flying == 0)
						src.icon_state = "flyinggold"
					src.Owner << "[src] has become an holy drake (Gains immunity to magic, dsease, and the ability to heal units!)."
		if(src.Werewolf == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(2,3)
			if(src.Flying == 0)
				src.weightmax += rand(25,35)
			else
				src.Old2 += rand(25,35)
		if(src.Svartalfar == 1)
			src.Strength += rand(1,2)
			src.Agility += rand(2,4)
			if(src.Flying == 0)
				src.weightmax += rand(15,25)
			else
				src.Old2 += rand(15,25)
			src.Intelligence += pick(0.1,0.2)
		if(src.Plantman == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(2,3)
			src.weightmax += rand(30,35)
		if(src.Demon == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(2,3)
			if(src.Flying == 0)
				src.weightmax += rand(30,40)
			else
				src.Old2 += rand(30,40)
			src.Intelligence += pick(0.1,0.2)
		if(src.Wolf == 1)
			src.Strength += rand(1,2)
			src.Agility += rand(1,2)
		if(src.Spider == 1)
			src.Intelligence += pick(0.2,0.3)
			if(src.Queen)
				src.Strength += rand(3,4)
				src.Agility += rand(3,4)
				src.weightmax += rand(10,15)
				src.MaxWebContent += rand(15,20)
				if(src.PoisonDMG <= 75)
					src.PoisonDMG += rand(2,3)
				src.WeaponDamageMin += 0.5
				src.WeaponDamageMax += 1
			if(src.IsWarrior)
				src.Strength += rand(2,3)
				src.Agility += rand(2,3)
				src.weightmax += rand(10,15)
				if(src.PoisonDMG <= 75)
					src.PoisonDMG += rand(0.75,1)
				src.WeaponDamageMin += 0.5
				src.WeaponDamageMax += 1
			if(src.IsWorker)
				src.Strength += rand(0.5,1)
				src.Agility += rand(2,3)
				src.weightmax += rand(30,50)
				src.MaxWebContent += rand(1.5,2)
				if(src.PoisonDMG <= 50)
					src.PoisonDMG += rand(0.3,0.5)
			if(src.IsHunter)
				src.Strength += rand(1,1.5)
				src.Agility += rand(2,3)
				src.weightmax += rand(10,15)
				src.MaxWebContent += rand(1,1.5)
				if(src.PoisonDMG <= 50)
					src.PoisonDMG += rand(0.5,0.75)
		//Dragoon (PM)---> From: Alexhatcher: alright Dragoon gains  per level: Strength: 2.5 to 3.75 // agility: 2.5 to 3.75 //defense: 0.5 to 1
		if(src.Vampire == 1)
			src.Strength += rand(3,4)
			src.Agility += rand(3,4)
			src.Intelligence += pick(0.1,0.2)
			if(src.Old2)
				src.Old2 += rand(30,35)
			if(src.Old)
				src.Old += rand(30,35)
			if(src.Old == null && src.Old2 == null)
				src.weightmax += rand(30,35)
			if(src.E == 1)
				if(src.HasWings == 0)
					src.Owner << "[src] grows wings!"
					src.icon = 'Vampire.dmi'
					src.overlays += /obj/wing1/
					src.WingsOut = 1
					src.HasWings = 1
					src.Strength += rand(3,4)
					src.Agility += rand(3,4)
					src.weightmax += rand(25,50)
			if(src.E == 0)
				src.Owner << "[src] has evolved into a full vampire!"
				src.icon = 'Vampire.dmi'
				src.CliffClimber = 1
				src.E = 1
				src.Strength += rand(3,4)
				src.Agility += rand(3,4)
				src.weightmax += rand(25,50)
				src.AutoCliffClimb()
			if(src.Level == 40)
				view(src) << "[src] becomes a daywalker"
				src.DayWalker = 1
		src.Owner << "[src] : I feel stronger!"
	if(src.Agility >= 120 && src.Kobold == 0 && src.Vampire == 0 && src.Werewolf == 0 && src.Race != "Angel of Death")
		src.Agility = 120
	if(src.Strength >= 120 && src.Dwarf == 0 && src.Vampire == 0 && src.Werewolf == 0 && src.Race != "Angel of Death")
		src.Strength = 120
	if(src.Agility >= 130 && src.Kobold == 1 && src.Race != "Angel of Death")
		src.Agility = 130
	if(src.Strength >= 130 && src.Dwarf == 1 && src.Race != "Angel of Death")
		src.Strength = 130
	if(src.Vampire == 1 || src.Werewolf == 1 && src.Race != "Angel of Death")
		if(src.Agility >= 130)
			src.Agility = 130
		if(src.Strength >= 130)
			src.Strength = 130
	if(src.Strength >= 70 && src.Gremlin == 1)
		src.Strength = 70
	if(src.Agility >= 75 && src.Gremlin == 1)
		src.Agility = 75
	if(src.Race == "Angel of Death")
		if(src.Agility >= 200)
			src.Agility = 200
		if(src.Strength >= 200)
			src.Strength = 200
	spawn(50)
		Level()
		return
mob/proc/AMBed()
	if(src.weight <= 0)
		src.weight = 0
	if(src.Sleeping == 0)
		if(src.SavedDest == 0)
			if(src.destination != null)
				src.SavedDest = src.destination
			else
				src.SavedDest = src.loc
		src.Tiredness = 100
		src.Sleeping = 1
		if(src.Race != "Dragon" && src.Illithid == 0)
			if(src.HasWings == 1)
				src.icon_state = "Sleep"
			if(src.HasWings == 0)
				src.icon_state = "WSleep"
			if(src.E == 0)
				src.icon_state = "Sleep"
		else
			src.overlays += /obj/sleepbubble/
		src.destination = null
		if(ismob(src.Owner))
			var/mob/A = src.Owner
			if(A.User == 1)
				A.Selected.Remove(src)
				A.client.images -= src.Star
		spawn(300)
			if(src)
				src.Sleeping = 0
				if(src.Race != "Dragon" && src.CantLoseLimbs == 0 && src.Illithid == 0)
					if(src.HasWings == 1)
						src.icon_state = "Normal"
					if(src.HasWings == 0)
						src.icon_state = "NoWings"
					if(src.Svartalfar == 1)
						src.icon_state = "Normal"
					if(src.E == 0)
						src.icon_state = "Normal"
					src.Tiredness = 100
					src.said2 = 0
				else
					src.overlays -= /obj/sleepbubble/
					src.Tiredness = 100
					src.said2 = 0
					if(src.BrainWashed <= 100)
						src.BrainWashed += 4.5
					if(src.Gremlin == 1)
						src.icon_state = null
				src.destination = src.SavedDest
				src.SavedDest = 0
mob/proc/Bed()
	if(src.InfectedBy)
		return
	if(src.weight <= 0)
		src.weight = 0
	for(var/obj/Items/Furniture/Beds/B in view(0,src))
		if(src.Tiredness <= 20)
			var/CanSleep = 1
			for(var/mob/Monsters/J in oview(5,src))
				if(J.destination == src)
					CanSleep = 0
			if(CanSleep && src.Sleeping == 0)
				if(src.SavedDest == 0)
					if(src.destination != null)
						src.SavedDest = src.destination
					else
						src.SavedDest = src.loc
				var/SleepTime = 300
				SleepTime -= B.CR
				if(SleepTime <= 40)
					SleepTime = 40
				src.Sleeping = 1
				src.overlays += 'Sleep.dmi'
				src.destination = null
				if(ismob(src.Owner))
					var/mob/A = src.Owner
					if(A.User == 1)
						A.Selected.Remove(src)
						A.client.images -= src.Star
				spawn(SleepTime)
					if(src)
						src.overlays -= 'Sleep.dmi'
						src.Sleeping = 0
						src.Tiredness = 100
						src.said2 = 0
						src.destination = src.SavedDest
						src.SavedDest = 0
	spawn(5) Bed()







mob/proc/NeutralPointGeneration()
	if(src.AltarCount == 1)
		if(src.ActivityCounter >= 0)
			src.WorshipPoints += 100
			src.ActivityCounter -= 1
		spawn(600)
			NeutralPointGeneration()
			return
mob/proc/Hunger()
	if(src.MagicalAptitude == 1)
		if(src.Mana <= src.MaxMana)
			src.Mana += src.MagicalConcentration / 2
			for(var/obj/Items/Armours/ChestPlates/ChaosRobe/C in src)
				if(C.suffix == "(Equiped)")
					src.Mana += 5
			for(var/obj/Items/Armours/Helmets/ChaosHood/C in src)
				if(C.suffix == "(Equiped)")
					src.Mana += 5
			for(var/obj/Items/Armours/NeckGuards/ChaosCape/C in src)
				if(C.suffix == "(Equiped)")
					src.Mana += 5
		if(src.Mana >= src.MaxMana)
			src.Mana = src.MaxMana
	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			if(src.HP >= 0)
				if(src.Spider == 1)
					if(src.WebContent <= src.MaxWebContent)
						src.WebContent += 35 + src.Level
						if(src.WebContent >= src.MaxWebContent)
							src.WebContent = src.MaxWebContent
						if(src.WebContent <= 0)
							src.WebContent = 0
				if(src.Race == "Dragon" && src.Age >= 50)
					if(src.EggContent <= 3)
						src.EggContent += 0.015
						if(src.EggContent >= 3)
							src.EggContent = 3
				if(src.HP <= src.MAXHP)
					src.HP += 10
					if(src.HP >= src.MAXHP)
						src.HP = src.MAXHP
				if(src.Gremlin == 1)
					if(src.Hunger <= 10)
						src.Owner << "<b><font color=red>[src] : I'm Hungry!"
						for(var/obj/Items/M in src)
							if(M.suffix == "(Carrying)")
								src.weight -= M.weight
								src.Hunger = 100
								src.Owner << "<b><font color=red>[src] eats [M]"
								src.said = 0
								del(M)
								break
						for(var/mob/M in src)
							if(M.suffix == "(Carrying)")
								src.weight -= M.weight
								src.Hunger = 100
								src.Owner << "<b><font color=red>[src] eats [M]"
								src.said = 0
								del(M)
								break
				if(src.Gremlin == 0)
					if(src.Hunger <= 10)
						src.Owner << "<b><font color=red>[src] : I'm Hungry!"
						if(src.Carn == 1)
							if(src.Vampire == 0)
								if(src.Gargoyle == 0)
									for(var/obj/Items/M in src)
										if(M.CanEat == 1)
											if(M.Poisoned == 0)
												src.weight -= M.weight
												src.Hunger = 100
												src.Owner << "<b><font color=red>[src] eats [M]"
												src.said = 0
												del(M)
												break
											if(M.Poisoned == 1)
												src.HP = 0
												src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
												src.said = 0
												src.GoingToDie = 1
												src.Killer = "[M]"
												src.DeathType = "Poison"
												src.Death()
												del(M)
												break
										if(M.IsBread == 1)
											if(M.Poisoned == 0)
												if(M.IsCake == 1)
													src.weight -= M.weight
													src.Hunger = 300
													src.Owner << "<b><font color=red>[src] eats the cake"
													src.said = 0
													del(M)
													break
												else
													src.weight -= M.weight
													src.Hunger = 200
													src.Owner << "<b><font color=red>[src] eats [M]"
													src.said = 0
													del(M)
													break
											if(M.Poisoned == 1)
												src.HP = 0
												if(M.IsCake == 1)
													src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
												else
													src.Owner << "<b><font color=red>[src] a poisoned cake......[src] dies."
												src.said = 0
												src.GoingToDie = 1
												src.Killer = "[M]"
												src.DeathType = "Poison"
												src.Death()
												del(M)
												break
								if(src.Gargoyle == 1)
									for(var/obj/Items/ores/M in src)
										src.weight -= M.weight
										src.Hunger = 100
										src.Owner << "<b><font color=red>[src] eats [M]"
										src.said = 0
										del(M)
										break
							if(src.Vampire == 1)
								for(var/mob/Monsters/C in view(1,src))
									if(C.WearingFullPlateHelm == 0)
										if(C.Owner != src.Owner)
											var/Bite = null
											if(src.Strength >= C.Strength)
												Bite = prob(85)
											else
												Bite = prob(35)
											var/Infect = prob(1)
											if(Bite == null)
												Bite = 0
											if(src in view(1,C))
												if(Bite)
													if(src.density == 1)
														if(src.CoolDown == 0)
															if(src.HasTeeth == 1)
																if(C.WearingFullPlateHelm == 0 && C.icon != 'Skeleton.dmi')
																	if(C.Vampire == 0)
																		if(C.Wagon == 0)
																			if(C.IsTree == 0)
																				if(src.IsMist == 0)
																					if(Infect == 1 && C.ImmuneToVampire == 0 && C.Werewolf == 0 && C.Infects == 0 && C.Spider == 0)
																						view() << "<b><font color=red>[C] is infected by a vampire!"
																						view() << "<b><font color=red>[src] feeds on [C]!"
																						C.BloodContent -= 15
																						C.BloodLoss()
																						src.Hunger = 100
																						src.EXP += 25
																						C.InfectedBy = M
																						C.FutureOwner = src.Owner
																						C.TurnVamp()
																						C.Death()
																						src.CoolDown = 1
																						spawn(300)
																							if(src)
																								src.CoolDown = 0
																						break
																					else
																						view() << "<b><font color=red>[src] feeds on [C]!"
																						C.BloodContent -= 15
																						C.BloodLoss()
																						src.Hunger = 100
																						src.EXP += 25
																						C.Death()
																						src.CoolDown = 1
																						spawn(300)
																							if(src)
																								src.CoolDown = 0
																						break

																else
																	view() << "<b><font color=red>[M] teeth shatter!!!"
																	src.TeethHP = 0
																	src.Teeth = "Destroyed"
																	src.BloodContent -= 10
																	src.BloodLoss()
																	for(var/obj/Items/Armours/NeckGuards/G in C)
																		if(G.suffix == "(Equiped)")
																			if(G.IsCape == 0)
																				C.weight -= G.weight
																				C << "[G] shatters!"
																				C.WearingFullPlateHelm = 0
																				del(G)
												else
													view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
													break


						else
							for(var/obj/Items/Food/CookedMeats/M in src)
								if(M.CanEat == 1)
									if(src.Vampire == 0)
										if(src.Gargoyle == 0)
											src.weight -= M.weight
											src.Hunger = 100
											src.Owner << "<b><font color=red>[src] eats [M]"
											src.said = 0
											if(M.icon_state == "Tomato")
												var/obj/Items/Seeds/TomatoSeed/S = new
												S.loc = src.loc
												var/obj/Items/Seeds/TomatoSeed/S2 = new
												S2.loc = src.loc
											del(M)
											break
										if(M.Poisoned == 1)
											src.HP = 0
											src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
											src.said = 0
											src.GoingToDie = 1
											src.Killer = "[M]"
											src.DeathType = "Poison"
											src.Death()
											del(M)
											break
							if(src.Dwarf == 1 && src.Hunger <= 25)
								for(var/obj/Items/Food/Fungases/Fungas/M in src)
									if(M.CanEat == 1)
										if(src.Vampire == 0)
											if(src.Gargoyle == 0)
												src.weight -= M.weight
												src.Hunger = 100
												src.Owner << "<b><font color=red>[src] eats [M]"
												src.said = 0
												del(M)
												break
											if(M.Poisoned == 1)
												src.HP = 0
												src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
												src.said = 0
												src.GoingToDie = 1
												src.Killer = "[M]"
												src.DeathType = "Poison"
												src.Death()
												del(M)
												break
							for(var/obj/Items/Food/M in src)
								if(src.Hunger <= 25)
									if(M.IsBread == 1)
										if(M.Poisoned == 0)
											if(M.IsCake == 1)
												src.weight -= M.weight
												src.Hunger = 300
												src.Owner << "<b><font color=red>[src] eats the cake"
												src.said = 0
												del(M)
												break
											else
												src.weight -= M.weight
												src.Hunger = 200
												src.Owner << "<b><font color=red>[src] eats [M]"
												src.said = 0
												del(M)
												break
										if(M.Poisoned == 1)
											src.HP = 0
											if(M.IsCake == 1)
												src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
											else
												src.Owner << "<b><font color=red>[src] a poisoned cake......[src] dies."
											src.said = 0
											src.GoingToDie = 1
											src.Killer = "[M]"
											src.DeathType = "Poison"
											src.Death()
											del(M)
											break
			if(src.Hunger <= 10)
				var/OOZ = 0
				for(var/obj/Items/Food/F in src)
					OOZ = 1
				if(OOZ == 0)
					for(var/obj/Items/Food/M in range(4,src))
						if(M.CanEat == 1 || M.IsBread == 1)
							M.loc = src
							src.weight += M.weight
							if(src.weight >= src.weightmax)
								M.loc = src.loc
								src.weight -= M.weight
								break
							break
					for(var/mob/LL in range(4,src))
						var/GX = 0
						for(var/obj/Items/Food/M in LL)
							GX += 1
						if(GX >= 2 || LL.Wagon == 1)
							for(var/obj/Items/Food/M2 in LL)
								if(M2.CanEat == 1 || M2.IsBread == 1)
									if(src.weight <= src.weightmax)
										M2.loc = src
										LL.weight -= M2.weight
										src.weight += M2.weight
										break
			if(src.Hunger <= -10)
				src.HP -= 25
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Food"
					src.DeathType = "Starvation"
				src.Death()
			else
				if(src.InHole == 0)
					if(src.Race == "Angel of Death")
						src.Hunger += 4
					if(src.ColdBlooded == 0)
						src.Hunger -= 1
					else
						src.Hunger -= 0.5

	spawn(350)
		Hunger()
	return
mob/proc/Gotoo()
	for(var/obj/Items/Furniture/Beds/B in orange(100,src))
		if(src.Goblin == 1)
			if(B.BelongsToGoblin == 1)
				src.destination = B
				return
		if(src.Dwarf == 1)
			if(B.BelongsToDwarf == 1)
				src.destination = B
				return
		if(src.Kobold == 1)
			if(B.BelongsToKobold == 1)
				src.destination = B
				return
mob/proc/NPCTiredness()
	if(src.NPC == 0)
		return
	if(src.Tiredness <= 20)
		src.Owner << "<b><font color=red>[src] : I'm Tired!"
		src.Gotoo()

	if(src.Tiredness <= -10)
		src.HP -= 25
		if(src.HP <= 0)
			src.GoingToDie = 1
			src.Killer = "Lack Of Sleep"
			src.DeathType = "Tiredness"
		src.Death()
	else
		if(src.InHole == 0)
			src.Tiredness -= 1
	spawn(300)
		NPCTiredness()
		return
mob/proc/STiredness()
	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			if(src.Tiredness <= 20)
				src.Owner << "<b><font color=red>[src] : I'm Tired!"
				if(src.IsMist == 0)
					if(src.Spider == 1 || src.Gremlin == 1)
						src.density = 1
						src.AMBed()

			if(src.Tiredness <= -10)
				src.HP -= 25
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Sleep"
					src.DeathType = "Tiredness"
				src.Death()
			else
				if(src.InHole == 0)
					src.Tiredness -= 1

	spawn(350)
		Tiredness()
		return
mob/proc/Tiredness()
	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			src.BrainHP += 0.05
			src.LeftLungHP += 0.05
			src.RightLungHP += 0.05
			if(src.BrainHP >= 100)
				src.BrainHP = 100
			if(src.LeftLungHP >= 100)
				src.LeftLungHP = 100
			if(src.RightLungHP >= 100)
				src.RightLungHP = 100
			if(src.Tiredness <= 20)
				src.Owner << "<b><font color=red>[src] : I'm Tired!"
				if(src.IsMist == 0)
					if(src.Spider == 1 || src.Race == "Dragon" || src.Gremlin == 1)
						if(src.density == 1)
							src.AMBed()
				for(var/obj/Items/Furniture/Beds/B in view(20,src))
					if(src.Spider == 0 && src.Vampire == 0 && src.Gargoyle == 0)
						if(src.Sleeping == 0)
							if(src.SavedDest == 0)
								if(src.destination != null)
									src.SavedDest = src.destination
								else
									src.SavedDest = src.loc
								for(var/turf/Tur in view(0,B))
									src.destination = Tur
			if(src.Tiredness <= -10)
				src.HP -= 10
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Sleep"
					src.DeathType = "Tiredness"
				src.Death()
			else
				if(src.Race == "Angel of Death")
					src.Tiredness += 4
				if(src.InHole == 0)
					src.Tiredness -= 1

	spawn(300)
		Tiredness()
		return

mob/verb/Update()
	usr.Updates()
mob/proc/Updates()
	html = {"
		<style>
		body{background:#000000}
		</style>
		<b><font color=red>Update Log v0.1</b><p>
		<o>
		<p>
		Humans can make an item that stops teleports for 20 spaces around it at a masonry station.
		<p>
		Vampires and werewolves can hurt themselves on silver armor someone is wearing if they aren't wielding a weapon and have no gauntlets.
		<p>
		Werewolves and vampires can now not touch silver items, as well as silver bars and ores.
		<p>
		Nether manifestations now start with 50 mana.
		<p>
		Fixed another problem with meditation
		<p>
		Gave devourers shield skill.
		<p>
		Fixed werewolves being able to wear armor in werewolf form.
		<p>
		Fixed werewolves transforming at night.
		<p>
		Fixed werewolf unlimited stats bug
		<p>
		Fixed bug with meditation
		<p>
		Fixed one random bug and forgot what it was.
		<p>
		Made a chess set.
		<p>
		Meditation is now a toggle, you only have to press it once to turn it on, then turn it off later when you want to stop.
		<p>
		Fixed werewolf corpse devour.
		<p>
		Trees give EXP when cut down.
		<p>
		Dragons given a count of progress towards becoming another type of dragon for everything but Dark and Holy
		<p>
		Grapes and tomatos will give seeds when eaten.
		<p>
		The spears kobold ambushes on death start with given 15/20 damage and a bit stronger poison.
		<p>
		Changed icon of ropes to better fit unit icons and be more visible.
		<p>
		Fixed bug with demon leather armor crafting giving you unlimited defence.
		<p>
		Units will grab food from other units and chests and wagons within 4 spaces of them now, also they'll grab food from units on the same space as them as well.
		<p>
		Humans can torture tied up units to access their chat logs.
		<p>
		Several food items moved to doubleclick instead of singleclick.
		<p>
		Rope is made with silk.
		<p>
		Vampire and werewolf bites always succeed on tied units.
		<p>
		All werewolves should properly transform after level 40, I'm not sure if they'll still be bugged before that.
		<p>
		Added rope to the leathercrafting station as a new type of cage, the unit remains out but can be pulled like a wagon with I, Closest Creature, it can still talk and preform most actions besides walking and magic, I, Closest Creature, Untie to release it.
		<p>
		Fixed a few issues with vampires turning into bats.
		<p>
		Spiders can lay eggs into people who are trapped in cages, and then release them, and trigger the hatching of the egg at any time they would like.
		<p>
		Fixed problem where everyone was able to summon bats.
		<p>
		Werewolf claw damage now scales with level, 25 min + werewolf's level, 35 max + werewolf's level,  level 100 will have 15 more min/max damage than a sword of destruction.
		<p>
		Werewolves can jump off of cliffs etc. without hurting themselves.
		<p>
		Vampires can no longer turn into jesus after morphing into a bat and back again.
		<p>
		Werewolves can devour corpses whole for 400 hunger, 200 tiredness, full healing of their blood content, and +1 max blood content (Up to a total of 325 max blood content)
		<p>
		Trapdoors can be locked now
		<p>
		Elf Walls do more damage.
		<p>
		Lava Forging - If there is a tile of lava within 1 space of a metalcrafting station things created at the station get bonuses to defence and damage, weapons get +10 min/max damage, armors get +3 defence.
		<p>
		Elves given magical solid stone smashing wooden pickaxes of dooooooom.
		<p>
		Pickaxes moved to doubleclick instead of singleclick menu.
		<p>
		Werewolves get better defence bonuses when transformed based on level.
		<p>
		Full Wooden Armor option added for elves.
		<p>
		Elves given wooden gauntlets.
		<p>
		Elves bonecrafting fixed.
		<p>
		Fixed issue with demonleather leggings icon.
		<p>
		Elves can make their own type of walls that do damage to non-elves digging them, using a pickaxe reduces but does not eliminate the damage recieved.
		<p>
		Fixed problem with bat icons.
		<p>
		Added verb to turn combat sounds on and off.
		<p>
		Fixed glitch with overlays remaining.
		<p>
		Svartalfars can build wooden walls correctly.
		<p>
		Werewolves resist normal damage to some extent and regenerate limbs like a lizardman.
		<p>
		Level 20+ vampires can summon bats as disposable units/meat shields, 3 bats per vampire.
		<p>
		Vampires can again turn into bats.
		<p>
		Dragons made nonrare.
		<p>
		Elves are ignored by NPCs
		<p>
		Elves can now build bridges.
		<p>
		Elves now start with wooden axes instead of orc axes.
		<p>
		Elves can eat meat raw.
		<p>
		Elves never need to sleep.
		<p>
		Armor will now always give the correct defence value when inspected.
		<p>
		Decreased chance of finding rainbow pearls.
		<p>
		Editing or changing in some way a unit's Delay to 0 should no longer crash the server.
		<p>
		Added more words to the random name generation on world creation.
		<p>
		Invisible shrines will no longer appear in the CheckShrines verb.
		<p>
		Fixed icon bug with adamantium bucklers.
		<p>
		Added Elves, they craft armor and weapons out of wood, inherit 1/2 of their mother's skills instead of 1/3rd, make better bows, and live for 1600 - 1700 years.
		<p>
		The sun no longer kills svartalfars, it just steals all of their mana.
		<p>
		Adamantium bucklers and helmets can no longer be broken in combat.
		<p>
		Vampires and werewolves given higher stat caps.
		<p>
		Gremlins given lower stat caps than other races.
		<p>
		Fixed bug with uncut rainbow pearls and gremlin crafting.
		<p>
		Added Gremlin Maces.
		<p>
		Fixed bug with capes and vampire mist forms.
		<p>
		Rainbow rings can now be enchanted.
		<p>
		Fixed chance of finding rainbow gems.
		<p>
		Gremlins will correctly equip weapons with EquipAllArmor now.
		<p>
		Added bucklers to all of the Full Armor crafting options, they're crafted last if you have any materials left.
		<p>
		Added Full Gremlin Armor option to melter station.
		<p>
		Added wooden trapdoors for humans to place at the top of staircases.
		<p>
		Added adamantium daggers
		<p>
		Gargoyles are now immune to temperature.
		<p>
		Gremlins and gargoyles can fish in lava again.
		<p>
		Sleeping of all types will remember the unit's last destination.
		<p>
		Added rainbow pearls and rainbow pearl adamantium rings, you get them from fishing, only 10 spawn per reboot.
		<p>
		EquipAll won't equip hellforged unless you have 150 skill in the weapon type.
		<p>
		When an elder brain dies you'll actually lose the rare.
		<p>
		Fixed ignore list issue.
		<p>
		Fixed bug with arrow slits, fixed poison.
		<p>
		Good/Evil gods removed, Neutral gods stay.
		<p>
		Kobolds can max out at 130 agility, dwarves at 130 strength, dwarves also cap out at 120 armor skill instead of 100.
		<p>
		Added a verb to locate all pillars/shrines in the world for convenience.
		<p>
		Humans can place arrow slits to make walls see-through and allow the firing of arrows and magic through them.
		<p>
		Added flawless gem cutting and better rings made out of them.
		<p>
		Female units can be milked and cheese can be made at a kitchen, use wooden buckets.
		<p>
		Removed the annoying music.
		<p>
		You can also use the altars in hell to bless flasks of water and use them on weapons, there are different changes depending on which type of water you use. (You can only bless a weapon with one type of water.)
		<p>
		The altars in hell can now be used to buff units, the evil altar gives damage and immunity to temperature, the holy altar gives defence and immunity to magic.
		<p>
		Added silver axes and maces.
		<p>
		Added a few shrines around the map, double click them with a unit to take control, defend them by having a unit within 30 spaces of them, your clan will get bonuses to any units born while you own the shrine.
		<p>
		Randomized rune list.
		<p>
		Devourers can't eat swamp plants anymore.
		<p>
		Bed quality now actually changes the time required to sleep.
		<p>
		Dwarves can dig channels with a metal spade to make water and lava moats/sources etc.
		<p>
		Stonefall traps can be click-drag placed now.
		<p>
		Magical/flood water should now put out flaming units.
		<p>
		Autoguard defaults to normal guard, not aggressive, also, it turns off when you log in.
		<p>
		Units probably won't teleport over water anymore
		<p>
		Fixed most reported bugs.
		<p>
		Gremlins are quite a bit harder to clone now, but get extra limb hp etc.
		<p>
		Gremlins given a unit cap of 25
		<p>
		Fixed icon bug on Strong Poison
		<p>
		Internal restoration potions will now fully heal all organs.
		<p>
		All organs heal and gain max HP now, brains included, some heal slower than others.
		<p>
		Fixed bug with chasm bridges
		<p>
		Clanwho button moved to the regular commands list so anyone can use it.
		<p>
		After a weapondamage of 70 zombies get 1/2 of the effect from additional claw organs.
		<p>
		Chasms can be bridged now, you won't fall through as long as you make absolutely sure not to touch an unbridged chasm tile, I recommend 3 tile wide bridges.
		<p>
		Flying units can pass over water and lava without issues now.
		<p>
		Vampires can build bone bridges correctly now.
		<p>
		Fixed the logout guard on units to be slightly less retarded, it defaults to aggressive mode so ally anyone you don't want to murder.
		<p>
		Bonespike and ribcage traps can be placed with click-drag now.
		<p>
		Added messages with the required ingredients for potions if you try to make them without the required items.
		<p>
		Cliff climbing creatures can't fly through solid floors anymore, they'll only climb up if sky is directly above them.
		<p>
		Removed any possibility of restart-teleportation on most races, a few races might still be affected by it, I'll get to them later.
		<p>
		Fixed glitch on demon leather gloves.
		<p>
		Ratmen are a default race choice again, they have no special abilities whatsoever, but always have triplets.
		<p>
		Added special option to magic scrolls for units too retarded to read them.
		<p>
		Devourer zombie claw damage capped at 120((Sword of Destruction damage.))
		<p>
		Strong poison adds 3/5 min/max damage to a weapon, normal poison 1/2, and toxic 2/3, these are whole numbers not fractions, so 1 to 2 damage, not 1 half.
		<p>
		Previously there were only two differences between toxic and regular poison, the first was Toxic got 2x of the unit's poison skill added to poison damage, the second was toxic gave +2/3 min/max damage, and poison gave +1/2, now toxic damage caps at 45((Previous default value for both)), poison damage caps at 40, and strong poison damage caps at 55.
		<p>
		Orcs can make a stronger poison than any other race at a poisoncrafting station with poison spore plant roots, it's not extreme, but the difference should be noticeable.
		<p>
		Poisoned daggers have a higher chance to poison on a hit.
		<p>
		Deer can walk around after they're tamed.
		<p>
		You can't pick up already planted seeds and grow grapes/tomatos/etc in a unit's inventory anymore.
		<p>
		Fixed problem with gremlin cloning.
		<p>
		Fixed glitch with devourers eating corpses and getting no stored bodies for it, prevented devourers from eating deer and wolves.
		<p>
		Cliff climbers will climb walls/cliffs whether your camera is up there or not now, as long as you click a turf in the sky.
		<p>
		Kobolds/Spiders/Anything that can climb can climb up trees, this is not a bug.
		<p>
		Kobolds can no longer climb over water.
		<p>
		Fixed bug with dwarves eating 1 unit of food and 1 unit of fungus every time they get hungry.
		<p>
		Finished devourers, race open for use.
		<p>
		Devourers can bonecraft without a station, but can't make chitin, or several other items, including arrows.
		<p>
		Added a button for devourers to improve their main unit, it's fairly expensive to do, and most improvements are one time only, they will probably be a good idea to get if you plan on using your devourer for anything but spawning.
		<p>
		Fixed a couple of bugs with the updates.
		<p>
		Race selection added to humans.
		<p>
		New devourers in testing stages, removed from rares list.
		<p>
		Svartalfar made nonrare.
		<p>
		All chitin weapons now have different shapes than their bone versions.
		<p>
		Units not on guard mode will defend themselves if attacked when the owner is offline, all other units with the same owner will attempt to assist.
		<p>
		Adventure mode no longer locks your camera to your unit.
		<p>
		Illithid forcefields can be made near units with the ability to fly.
		<p>
		NPC Human crusaders are using the correct names now.
		<p>
		Added a small notification to attempts to build stairs without wood/stone.
		<p>
		Day/Night symbol will now be correct when you first log in.
		<p>
		Day/Night symbol at the top of the HUD works in text mode now.
		<p>
		Daggers added to EquipAll.
		<p>
		Attacking doors now notifies the owner of the door.
		<p>
		Humans can pick locks without lockpicks and get a bonus to success chance.
		<p>
		Evil/Holy trees will create the correct type of tile when you cut them down.
		<p>
		Fixed a carryweight bug with MobileSandkings.
		<p>
		MobileSandkings won't all get deleted if you have more than one cacoon in your inventory anymore.
		<p>
		Hunter spiders don't spaz out when they get told to attack things anymore.
		<p>
		Fixed bump code on all mobs, this update doesn't actually change very much ingame, although a few things might work differently now, but it will make most other additions faster and easier to do, and reduce the memory cost of running the game.
		<p>
		Kobolds and Spiders can climb cliffs automatically if you tell them to walk to a clifftop.
		<p>
		Mining out a bone wall will give you bones, stone walls give you stones, and wooden walls give you wood now, 65% chance on all types to drop resources.
		<p>
		Made several improvements to text mode, colored blood, mining makes floors appear as the correct letter now.
		<p>
		Dwarves, Kobolds, and Spiders are now immune to caveins, spiders were immune previously and have just been listed as part of this for convenience.
		<p>
		Daggers added as a type of weapon, bone, silver, and chitin daggers added to the game, Daggers do 1/2 the damage of other weapons, but do huge damage to sleeping units, and at 125+ dagger skill, 'Is Bleeding' messages aren't shown to the owner of units you're fighting, also, daggers have no combat sounds.
		<p>
		Adamantium has no weight, now.
		<p>
		Poisoning units in their sleep works as an instant kill.
		<p>
		Illithids can be butchered now.
		<p>
		Svartalfars can make magical scrolls at a woodcrafting station and write any spell they know on them, anyone can use the scrolls at no cost.
		<p>
		PickUpAllSeeds picks up all seeds as stated instead of just one seed.
		<p>
		Campfires cook all meat instead of one piece of meat, extra convenience.
		<p>
		B'uild menu works in text mode now.
		<p>
		PickUpAllArmor will grab a weapon as well, now.
		<p>
		Each piece of equipped demon leather armor increases a unit's resistance to fire, the full set makes a unit immune.
		<p>
		Demon Leather Armor given 10% more defence than legendary metal armor, and a random 1 to 4 defence bonus after this.
		<p>
		Svartalfars can now be butchered.
		<p>
		Zombies can now be butchered.
		<p>
		Dwarves now automatically eat fungus.
		<p>
		Unarmed and Spear skill have special attacks now, spear gives a spear skill / 100 chance of blocking any incoming attacks, unarmed skill has a chance to disarm and put your enemy's weapon in your unit's inventory.
		<p>
		Kobold death-cloning happens at level 20 instead of level 40.
		<p>
		Necrostaves can raise skeletons again. - Skeletons get a bonus to their starting EXP based on the unit's necromancy skill, which increases fairly slowly.
		<p>
		EquipAllArmor will now equip the best weapon you have for your best weaponskill in each unit's inventory, if you don't have any weapons for your best weaponskill it just equips the weapon in your inventory with the highest damage.
		<p>
		Glitch with Up/Down z-level arrows fixed, glitch with teleporting units probably fixed.
		<p>
		TearAllSkin/TearAllMeat on HUD work now.
		<p>
		Experimenting with a full-map save.
		<p>
		Fixed the Up/Down z level buttons to make more sense now.
		<p>
		Tomatos regenerate like grape vines now.
		<p>
		Added a button to toggle autodig on your units near the EquipArmor button.
		<p>
		PickUpAllEdibles will pick grape/tomato plants near the unit as well as picking up food from the ground(It will always leave one grape/tomato on the plant to allow it to regenerate so you don't have to plant a new one).
		<p>
		The random armies now stick together until their leader dies.
		<p>
		Made spiders unable to lay 2 eggs on the same spot.
		<p>
		Fixed Sent_File command.
		<p>
		Fixed a glitch with axes.
		<p>
		Made Clan Standards in limbo delete every season (Limbo is 0,0,0)
		<p>
		Added Up/Down z level buttons to HUD.
		<p>
		Added Pickupallseeds button.
		<p>
		Fixed a small glitch with shadowfiend, dragons can level up while flying now(Other creatures too)
		<p>
		Added a mutation that makes a creature sometimes explode when killed.
		<p>
		Changed Shadowfiend mutation to make a creature have higher defence and lower chance to die from bloodloss at night.
		<p>
		PickUpAllSkin button added.
		<p>
		HUD button for tearallskin and tearallmeat added, if you need a campfire to do it stand next to one and press it, otherwise if you're a spider/dragon just click the button.
		<p>
		All weapons moved to double-click interface(Except bows and pickaxes for now)
		<p>
		All shields moved over to a double-click interface.
		<p>
		(Un)Holy symbols are made at a woodcrafting station, you need a ruby for unholy and a diamond for holy + a piece of wood.
		<p>
		Enabled gods with the option for regular players to craft holy/unholy symbols to prevent attacks by gods (They can still use their powers but there is a relatively high chance for them to fail near units holding a symbol, with the effect increasing the more symbols you have.)
		<p>
		Disabled - Gods, Magic Books, Clan Points.
		<p>
		Added - NPC spawners for: Kobolds, Orcs, Goblins.
		<p>
		Started converting weapons/shields to use double-click instead of single-click to bring up their menu.
		<p>
		Gremlin armor no longer equips on non-gremlins when using EquipAllArmor.
		<p>
		Crowns are no longer equipped when using EquipAllArmor
		<p>
		Adjusted random map and added pregenerated NPC forts.
		<p>
		Added random map
		<p>
		Added a visual effect to Nether Ray
		<p>
		Fixed several bugs with gremlins, made material of armor make a difference in it's defence, training post material can also change it's quality.
		<p>
		Added new normal race (Gremlins)
		<p>
		Fixed autoeat for bread/cakes
		<p>
		Text mode given a major update
		<p>
		Chameleon now works correctly
		<p>
		Clan Membership stays over savewipes
		<p>
		Fixed a small glitch with loading + devourer's overlays.
		<p>
		Added Clan Armor.
		<p>
		Fixed a save rollback glitch.
		<p>
		Added quite a few other things but forgot what they were before I wrote them down.
		<p>
		Flying is fixed(over water/lava) on SOME CREATURES(This is a TEST, not EVERY creature can fly, this is only to test the code, thank you)
		<p>
		You can now fly over water/lava.
		<p>
		Illithids have a new power now, Warp.
		<p>
		Forcefields can work around flying units now.
		<p>
		Added Equip all armor button to HUD
		<p>
		Spiders/Kobolds automatically climb down cliffs instead of falling off.
		<p>
		Units/Chests/Wagons will share food with other units if they get hungry and have none (Other units won't share unless they have at least 10 food in them)
		<p>
		Armor is automatically equipped(icons) on loading.
		<p>
		Added a PickUpAllArmor button to the HUD.
		<p>
		Re-added flying(Currently you cannot fly over water/lava, this will be added in the next update.)
		<p>
		Added crafting options for full suits of armor (Metal, Chitin, Bone only) with one mouseclick (You get exp for all the pieces and it still uses up 5 bars/bones/shells (1 skull and 4 bones to bone armor) IF YOU DON'T HAVE ALL OF THE MATERIALS it will craft as many pieces as POSSIBLE and then stop when you run out (eg. 1 chestplate, 1 leggings, 1 left arm - stop).
		<p>
		Added NPC Vampires, they'll tunnel underground in the daytime and dig back up at night.
		<p>
		Beginning work on re-adding flying.
		<p>
		Altered a few things with NPC targetting (They won't follow a unit to the end of the earth any longer.)
		<p>
		Armour un-equips when you load now so you don't have to un-equip/re-equip all of it.
		<p>
		Fixed some save rollback glitches
		<p>
		Fixed the Make NPC admin verb.
		<p>
		NPCs will now pick up weapons and armour and equip them if they can.
		<p>
		Fixed infinite defence glitch on wands.
		<p>
		Illithid Elder Brain destruction is now permanent.
		<p>
		Use SpendMyPoints in the commands tab to spend points.
		<p>
		Added a Clan-War system, STEAL THEIR BAST-STANDARDS!
		<p>
		-Fixed- Demons (Mwuhahahahhahahahahahahahahahahahahahahahahahahahahahaaahaaah haa... ha... GAH HAA HA... Ha.....ha?)
		<p>
		Added Clans.
		<p>
		Added random Crusader Army.
		<p>
		Added Illithid walls/floors to admin tab, changes icons to look less like a gay orgy.
		<p>
		Added secret cheatcodes to the command bar, they are epic-sauce but you'll never figure them out.
		<p>
		Illithids build walls now.
		<p>
		Expanded wands.
		<p>
		Added magic wands.
		<p>
		Fixed crashing bug with flying units + dense turf bumping + dry camel humping.
		<p>
		Fixed the unit duping glitch.
		<p>
		Fixed units holding chests during saves.
		<p>
		Fixed the Give Rare verb.
		<p>
		Added HellForgedBows (Sadly NPCs will pincushion you with them now. >:D)
		<p>
		Fixed spammed login messages.
		<p>
		Fixed the Illithid/sandking problem of spawning inside walls/mountains.
		<p>
		Finished the saving system, fixed the red arrow not appearing glitch, changed mobs to spawn at their last coordinates instead of the player's camera.
		<p>
		Fixed force births.
		<p>
		Fixed turrets to not shoot deers, tower caps, & deathbeetles.
		<p>
		Updated the admin GiveRare verb.
		<p>
		Made Elder Brains unable to use Mind Control.
		<p>
		Allies List will now show offline allies.
		<p>
		Fixed lizardmen bone walls.
		<p>
		Guardstones will no longer fire at gremlins, moles, etc.
		<p>
		Increased the EXP Illithids gain from using Telekinesis.
		<p>
		Fixed bug with soul blade creating and equiped hellforged weapons.
		<p>
		REMOVED FORCEFIELDS TEMPORARILY.
		<p>
		Made Vampires, Devourers, and Illithids un-mindcontrollable
		<p>
		Fixed minor bug with mind controlling NPCs.
		<p>
		Added Holy Drakes, holy breath damages evil creatures slowly, and heals good creatures slowly.
		<p>
		Illithid mind control now works automatically on NPCs.
		<p>
		Illithids can now mind control anything, with an intelligence save weighted in favor of the target.
		<p>
		Fixed some stuff with chat logs.
		<p>
		Fixed Neutral God Spires.
		<p>
		Fixed Bloodwhisker.
		<p>
		Illithids now gain EXP from eating brains.
		<p>
		Fixed bug with elder brains using telekinesis to move items.
		<p>
		Mind worms now die when they mind control something.
		<p>
		Illithids added to rare list/chances.
		<p>
		Dragons can no longer become werewolves/vampires.
		<p>
		Most traps no longer work on flying units, however stone fall traps DO work on flying units.
		<p>
		Starting out the Elder Brain needs to create a mind worm to go nab an NPC slave for it, after this the elder brain can transform the NPC into an Illithid with Interact, Closest Creature.
		<p>
		The elder brain creates the other forms of illithids, each from can use the basic telekinesis, and also recieves a second menu of special powers.
		<p>
		Added Illithid Elder Brains, they cannot move, ever, they can use unlimited mind powers yet as previously stated, the inability to move limits them to a range of 8 tiles.
		<p>
		Completely removed fake logins / logouts.
		<p>
		Fixed bug with baby frogmen going nuts and killing everything as soon as they're born.
		<p>
		Fixed illithid levitation abilities.
		<p>
		Added illithid brain-eating for intelligence.
		<p>
		Fixed some stuff with illithid telekinesis.
		<p>
		Nerfed demon book (Although it really isn't supposed to be used anyway.)
		<p>
		Lowered rare chances to more reasonable amounts due to the large number of rares available.
		<p>
		Fixed bone walls for lizardmen.
		<p>
		Fixed bug with picking up arrows
		<p>
		Several powers for Illithids are finished, have created illithid icons, not finished limbless icons for now.
		<p>
		Added maximum 250 arrows per quiver to prevent massive arrow count lag.
		<p>
		Fixed bug with DropAllEdibles that could give you unlimited carry weight.
		<p>
		Fixed glitch where units owned by a neutral god couldn't walk onto turf owned by the neutral god, this would also cause lag if they stood on the turf for a while.
		<p>
		Fixed whisper system
		<p>
		Added sword of destruction, it has a chance to catch the person you're fighting on fire, ¡I WILL NOT TELL PEOPLE HOW TO GET THIS! ¿Got That? However, you CAN get them WITHOUT admin help.
		<p>
		Added Dark Drakes
		<p>
		Re-Enabled sand drakes.
		<p>
		Added Water Dragons, changed the power of Sand Drakes to blind the target instead of creating walls.
		<p>
		Changed whisper system.
		<p>
		Fixed the glitch where you could use bows while meditating.
		<p>
		Fixed spire crystal creation spamming messages when you don't have enough points.
		<p>
		Fixed neutralize turfs so it won't reduce your worship points below 0 anymore.
		<p>
		Fixed a few major bugs with stairs / neutral god altars.
		<p>
		Added Create Golem to neutral gods, you need to use it on a guardstone with ONE OF EACH UNCUT GEM inside.
		<p>
		Neutral gods can now create teleportation scrolls for 1000 worship points.
		<p>
		Made adamantium stop spawning underneath iron, it got annoying after a while.
		<p>
		Changed stairs code a bit.
		<p>
		Fixed admin/god turf creation to not bug up hell floors.
		<p>
		Added some drop all verbs.
		<p>
		Made bow combat factor in the target's defence value and the bow users bow quality in the damage output.
		<p>
		Fixed bug that prevented the destroying of Neutral Altars sometimes.
		<p>
		Slightly reduced the size of NPC armies.
		<p>
		Gave ruby guardstones the ability to actually burn off limbs.
		<p>
		Added neutral god speak/emote/find altars.
		<p>
		Made guardstones non-flammable.
		<p>
		Changed how Diamond Guardstones work.
		<p>
		Fixed invisible ratman glitch.
		<p>
		Neutral gods now can only use powers on -their OWN- neutral turf (They cannot jack the base of another neutral god anymore.)
		<p>
		Changed guardstone pedestal icon to be more visible on neutral turfs.
		<p>
		Removed Kamikazi Flaming Units.
		<p>
		Arrows can puncture lungs, spleen, etc, losing both lungs is fatal.
		<p>
		Added organ shots for archers.
		<p>
		Soul Blades will now start at hellforged damage since they're much harder to get than hellforged swords.
		<p>
		Added neutral gods.
		<p>
		Fixed a few things with Neutral Gods (They play more like a tower defence game.)
		<p>
		Found mega crashing bug with sand drakes, turned them off for now.
		<p>
		Humans weren't gaining digging / tree chopping when they turned into vampires.
		<p>
		Made bridges flood proof.
		<p>
		Fixed the hellforged axe being named "Hell Forged Sword"
		<p>
		Removed forest regeneration to prevent lag.
		<p>
		Smoke removed from fires to prevent lag.
		<p>
		Gave Tear All Meat to dragons and sand workers(soldiers)
		<p>
		Fixed the annoying Tombs with multi-icons.
		<p>
		Gargoyles can build stone floors now.
		<p>
		Added PickUpAllArrows to HUD, removed PickUpAll from Interact.
		<p>
		Enabled poison arrows, added an instant kill ability to heart shots (Very low chance, has to get through your Block and your Armour saves, has to hit heart, after that has a 2% chance of happening.)
		<p>
		Fixed hilarious bug with archery that caused it to check the target's bowskill instead of the shooter's bowskill.
		<p>
		Werewolf / Dragons now use Claw Skill instead of Sword Skill.
		<p>
		Black Plague made a bit more dangerous.
		<p>
		Fixed it so gods cannot infect player ghosts with the Common Cold.
		<p>
		Statues now copy the direction the unit is facing too, along with the armour they're wearing.
		<p>
		Maces can now smash helmets.
		<p>
		Evil god summon will no longer grab every unit in the world with the name you specify, It will grab ONE of them (No more massive demon armies.).
		<p>
		Evil gods can't summon units into the void, chasms, or lava now.
		<p>
		Fixed ability to create infinite gargoyles with stonecrafting stations.
		<p>
		Removed melee ability on Bows.
		<p>
		Redid ranged combat to be much more effective.
		<p>
		Fixed a minor bug with Autodigging not selecting tiles that had items on them.
		<p>
		Removed every admin on the server permanently as no admins are needed.
		<p>
		Fixed admin logs.
		<p>
		Fixed fast breeding bug you could do if you used another player to breed with your female units instead of using your own unit.
		<p>
		Fixed bug with lizardmen females not being able to breed with other player's units without bugging up.
		<p>
		Fixed magma drake breath.
		<p>
		Evil gods can create hell portals, good gods can destroy hell portals, and hell portals that spawn on the map are not affected.
		<p>
		Nerfed Svartalfar physical stats, gave them 2x magic gains.
		<p>
		Fixed bug with dragons & restarting.
		<p>
		Gods can now see through walls.
		<p>
		Fire and Magma drakes made immune to flames.
		<p>
		Some types of dragons now gain extra stats from eating certain types of meat (Depends on type of dragon.)
		<p>
		Dragons can no longer be given away with Give Creature To.
		<p>
		Added option for gods to change their RP name of their god to anything they choose, their current altars will be renamed to reflect this, and all future altars will also be renamed, their speech/emotes will show their RP name also, finally to undo this simply rename yourself to your BYOND key, (OOC chat/whispers will not be affected.).
		<p>
		Swords now have a very small chance to disarm the opponent in combat.
		<p>
		Axes now have a small chance to break shields in combat.
		<p>
		Fixed dragon stat panel.
		<p>
		Sped up dragon egg regeneration
		<p>
		Fixed dragon eggs.
		<p>
		Fixed a bug in the Birth() process that may have been causing a lot of the lag.
		<p>
		Added Good/Evil emote for gods.
		<p>
		Fixed bug where dragons could sleep while flying.
		<p>
		Added dragons to rare chances.
		<p>
		Filled in bone floor/walls so they aren't partially transparant (Would cause you to not walk onto them if you clicked certain parts.)
		<p>
		You can now skin dragons.
		<p>
		Dragons can now lay eggs, they lay them rather slowly though and need a mimimum age of 50 to do so.
		<p>
		Made dragons butcherable (They won't drop heads however.).
		<p>
		Fixed bug that made dragons revert to default icon upon sleeping.
		<p>
		Fixed bug that caused dragons to sleep forever.
		<p>
		Fixed bug that turned dragons invisible when flying/landing.
		<p>
		Usage of dragons & tricks to using dragons are secret, expect to figure it out yourself, currently only three types of dragons work, the starting -Generic- dragon, and two other types it can transform into if played correctly.
		<p>
		Dragons now semi-work as a race, will be giving out dragons for testing purposes, DO NOT ASK FOR THEM OR YOU WILL NEVER GET ONE.
		<p>
		Fixed glitch with multiple hell portal possessions.
		<p>
		-Really- fixed gargoyle power spam.
		<p>
		Fixed autocover pit traps for Hunter Spiders.
		<p>
		Stone Doors work now.
		<p>
		Added PickUpAll Ores to HUD.
		<p>
		Evil gods probably shouldn't go into negative worship points when using possession.
		<p>
		Added stone doors.
		<p>
		Fixed the spam from using gargoyle powers.
		<p>
		Added a few admin turf buttons for the new turfs, also bone walls.
		<p>
		Fixed bug with obsidian floors/walls and sandking floors/walls (They had incorrect icon if built in the sky.)
		<p>
		Gave adamantium armour a slight nerf so that people wearing a full set would still be able to be damaged if the person attacking was using hellforged or better.
		<p>
		Reduced damage on adamantium weapons to better reflect damage norms, they are now only slightly better than hellforged.
		<p>
		Added obsidian stairs for goblins.
		<p>
		Fixed a small bug with spider stairs.
		<p>
		Fixed bug with the HUD pickupall edibles, and fixed bug with the ingots icon looking like a gem.
		<p>
		Spider hunters and workers cap off at 50 poison damage, warriors and queens cap off at 75.
		<p>
		Fixed icon glitch with the soul blade.
		<p>
		Added new HUD icons.
		<p>
		Added a few pickupall verbs to the hud.
		<p>
		Also, Adamantium is MUCH easier to fail at when smelting, only a smelting skill of 100 will provide 100% success.
		<p>
		Adamantium Ore added, Only dwarves can mine it, and only dwarves can USE it for any purpose, it creates the best armour/weapons in the game, and it is VERY rare.
		<p>
		Goblins can correctly make bone traps now.
		<p>
		Goblins construct obsidian walls now instead of stone (Harder to mine out, different icon, still uses stone as material).
		<p>
		Spiders were previously doing a null type of damage that had no effect, now they do sword damage like intended.
		<p>
		Removed the speed bonus hunter spiders get because it made them way too overpowered, instead gave them the ability to auto-cover pit traps at level 20+.
		<p>
		Vampires will now automatically transform into daywalkers at level 40 instead of you having to press a button.
		<p>
		Goblins automatically get a speed bonus on level 10.
		<p>
		The last update was done quickly so I never had a chance to edit spiders etc to be unable to wear capes, therefore, now, Spiders, Devourers, and Sand Soldiers can no longer wear capes.
		<p>
		Capes now take up a seperate armour slot from Neckguards, this prevents the usage of a bug involving the skorn helmet that could give unlimited defence.
		<p>
		Your three starting units now cannot be given away, neither can adventure mode units.
		<p>
		Halved the bonus spiders can get to poison damage, Made poison immunity instead resist half of the poison damage.
		<p>
		Drills removed from goblins and given to Dwarfs and Humans.
		<p>
		Gave orcs the "Defensive Fighting" ability, it is the opposite of berserk and increases their defence while lowering their attack.
		<p>
		Made orcs unable to Berserk until level 40 like it was supposed to be.
		<p>
		You can now bake cakes.
		<p>
		You get 4 bread doughs per flour bag now.
		<p>
		Fixed Goblin Wood Walls.
		<p>
		Gaining damage on Soul Eater made slightly easier.
		<p>
		Soul Eater's max damage could fall below it's min damage before, this no longer happens.
		<p>
		The sacrificial dagger is still carried by the kobolds and is exactly the same as the hellforged dagger in stats.
		<p>
		Replaced the hellforged weapons that the army kings carry with non-hellforged weapons.
		<p>
		Made sandking floors/walls not lag server when created.
		<p>
		Units will probably stop fishing when you logout to prevent excess lag for no real reason.
		<p>
		Fixed invisible poison bottles.
		<p>
		Fixed Evil God Earthquake power.
		<p>
		Fixed orc bridges.
		<p>
		Capes will now correctly add their defence to your defence total
		<p>
		Sand Soldiers when building will create slightly differently colored walls & floors (Experimental, may be buggy).
		<p>
		Added the Soul Blade, it gets stronger with every creature you kill (Depending on the creature's level), You make it at a metalcrafting station, you need all 5 hellforged weapons in your inventory -AND- 100 metalcrafting skill.
		<p>
		Added all the hellforged weapons to demons, they spawn with a random one and use it to smash your brain.
		<p>
		Sand Soldiers can build stone walls correctly
		<p>
		Goblins can build wood floors correctly
		<p>
		Sleeping bags don't decay when left on the ground too long anymore.
		<p>
		Spider silk no longer brings a popup box up when you pick it up.
		<p>
		Bind/Unbind camera was causing a few glitches and really served no purpose, removed.
		<p>
		Removed the auto-transfer of rares to alt accounts as this was allowing a possible exploit where you could transfer rares to other people if you let them log into your account.
		<p>
		Gods will now be told -who- destroyed their altar(s).
		<p>
		Devourers & other undead creatures can no longer drink potions.
		<p>
		Skeletons now have to be killed the same way gargoyles are killed (Cut off all 4 limbs and they die instantly, or smash their heads.)
		<p>
		Skeletons cannot bleed.
		<p>
		Skeletons cannot turn into werewolves.
		<p>
		Skeletons cannot be fed on by vampires.
		<p>
		Spiders & Zombies/Skeletons now cannot be infected by vampires.
		<p>
		Fixed bug with NPC/Devourer zombies coming back to life after having been killed (The icon was sideways and nobody would own the creature.)
		<p>
		Gave the kings of all armies Average quality armour equivilant.
		<p>
		Made the kings in armies immune to temperature, made the army respawn somewhere else if they spawn on dense turf(If they spawn on dense turf 3 times in a row they will stop retrying and just spawn there though.).
		<p>
		Demons can be enslaved again.
		<p>
		Gargoyles can no longer catch on fire.
		<p>
		Any admin can now force night/day.
		<p>
		Fixed bug with armies, fixed bug with admin Season Change and Day/Night change so they don't make things go faster.
		<p>
		Added armies that will randomly invade you every season, they spawn at a random spot on the map and look for people to murder (Don't complain when they spawn inside your base.).
		<p>
		Wooden doors/chests/wagons will delete properly when burned.
		<p>
		Made kobolds unable to sneak in werewolf form.
		<p>
		Kitchens will cook all of the meat in your inventory with one click of the Cook button, Campfires will not.
		<p>
		Fixed werepyre shit glitch adventure quest crap sh00t.
		<p>
		Advenure mode units given a small bonus to stats when starting (+5 to str, agi, and def. +25 to carryweight.)
		<p>
		Player-made skeletons will get 1/2 to 1 point of every stat and 5 to 10 carry weight each levelup.
		<p>
		Gave evil gods the ability to invoke earthquakes to collapse caves in range (50 spaces.) It has little effectiveness for -real- killing potential, but units can suffer minor damage from collapsing ceillings (Earthquakes only collapse 1/4 of cave floors in range).
		<p>
		Made Dwarves able to eat Fungus without dieing.
		<p>
		Re-Added Astral book with some tweaks (Removed Lightning Bolt, increased time it takes to learn all the spells.)
		<p>
		Corrected annoying "Posion"  Made it "Poison" - Sscral
		<p>
		MALE Kobolds now have the ability to use "Sneak" at level 10+, it halves the tiredness of the Kobold whom uses it. By Maxdax222
		<p>
		Fixed the marine buckler and spear icon. By Maxdax222
		<p>
		Improved the create and edit commands for admins. Added a report button in commands if OOC is off, added an admin PM, added a make vote verb and cleaned up the admin verbs tabs. By Maxdax222
		<p>
		Also, when a good god possesses a unit, their eyes glow green (No other effects), when an evil god does so, their eyes glow red (No other effects)
		<p>
		Removed ability to gift devourer cacoons.
		<p>
		Also ignoring a god will prevent them from spamming you with possession requests.
		<p>
		There's a small chance to resist evil god possession (100% if you're blessed by a good god with holy shield) They still lose the worship points and you keep your unit.
		<p>
		Replaced the ability to give units to gods with a god power to "Possess" a unit, good gods can possess with a small amount of worship BUT the owner of the unit has to choose if it wants to be possessed, evil gods can possess ANY unit, but the cost in worship points increases with the unit's level, stats, etc, and it -very- high.
		<p>
		Made units automatically de-select upon gifting to someone.
		<p>
		Made people capable of refusing the gifting of creatures, made the Yes/No choice default "No" so it won't bother you IF they're on your ignore list (So ignore em if they spam you.)
		<p>
		Fixed bug with autofeeding that could stop vampires from regenerating mana and from becoming hungry.
		<p>
		Allowed human / goblin / dwarrf vampires etc... to cut trees without an axe.
		<p>
		REMEMBER : If you get a vampire to bite you to turn you into one, and then he gives your unit back... IF the vampire dies, your vampire dies, any vampires YOUR unit made dies, etc, so this isn't necessarily safe.
		<p>
		Vampires created by infection will live longer just like vampires that drink a potion now.
		<p>
		Human / dwarf / goblin etc. vampires given the ability to dig without pickaxes.
		<p>
		Gave ability to give any non-rare units(vampires and werewolves are non-rare.) to another person(I, This Creature, Give To Other, Type in their key name, if nobody with that key exists nothing happens, likewise if you enter nothing.)
		<p>
		Allowed Svartalfars to build alchemy stations & glass forges.
		<p>
		Made vampires able to use poison stations.
		<p>
		Made vampires and gargoyles unable to eat cooked meat.
		<p>
		Made units wander over to beds they can see when they're tired, they'll go stand/do whatever/where ever they were doing before after they sleep.
		<p>
		Added admin ability to switch icons easily and effectively.
		<p>
		Added Vampirism potion to alchemy station
		<p>
		Probably fixed bug with werewolves
		<p>
		All other rares returned to normal.
		<p>
		Added magic rings, you need a mage to enchant them and a gemcrafter to make them, Plant Fibre Ring can turn you into a werewolf but likewise the ingredients (Besides gold) are secret so have fun.
		<p>
		Added Vampirism Potions. Secret Formula, Figure it out and you essentially have perm vampire, I suggest you don't give it away eh?
		<p>
		Fixed bug with lizardmen powers.
		<p>
		Re-Added necromancy book as it was the least overpowered magic book.
		<p>
		Orcs and Lizards given +1% chance to gain magic.
		<p>
		Added poison immunity potions, Poison Spore Plant seed + Cut Emerald
		<p>
		Orc : Berserk : Ability is toggled with I : This Creature : Berserk. (At level 40, increases damage by a set, large number, reduces defence by 20)
		<p>
		Kobolds : Ambush : Upon death a level 40 kobold spawns two level 0 kobolds with spears at its location, they automatically attack whatever it was attacking.
		<p>
		Lizards : Cold Blooded -OR- (You choose) Iron Scales. (Cold Blooded halves hunger cost, Iron Scales gives +20 Defence at level 40)
		<p>
		Goblins : Gem Finder (2x chance to find gems at level 40)
		<p>
		Humans : Temperature Resistance(Temperature affects them 1/2 as much at level 40)
		<p>
		Gave special abilities to : Lizards, Goblins, Kobolds, Orcs, and Humans
		<p>
		Fixed bug with vampire autofeeding (You could get unlimited hunger)
		<p>
		Gave evil icon wings, may change evil to black instead of reddish, may remove wings (?)
		<p>
		Fixed bug where evil/good god icons would revert if you turned icon on/off
		<p>
		Fixed bug where people who logged out got removed from your ally list.
		<p>
		Fixed bug with Unholy Vigor (It didn't reduce worship points when used.)
		<p>
		Good/Evil gods have a new avatar icon, different from normal players (Good gods appear as a whitish angel type figure, evil gods are reddish and have horns.)
		<p>
		Made bridges buildable on chasms (All but tribal bridges.)
		<p>
		Removed fishmen from map.
		<p>
		Fixed a bug with silver weapons that would cause you to technically be using silver no matter what weapon was equipped if you dropped it while it was equipped(Double clicked in inventory)
		<p>
		Changed Nether Alteration to not work directly on units and made the casting unit have to be within 100 spaces of the target to cast.
		<p>
		Fishmen Icon finished by Wimopy
		<p>
		Added Silver Gem-Encrusted Helmets.
		<p>
		Added Silver Swords.
		<p>
		Vampires will autofeed on an unit not wearing a neckguard and not owned by the vampire that is within 1 space distance, the infect chance on autofeeding is 1/15 of the normal bite infect chance.
		<p>
		Fixed a few icon glitches with flying, fixed the permanent dodge/miss/block messages (They automatically disappear after a maximum of 1 minute.)
		<p>
		Multi-Craft added for wood and silver arrows, bug with bone arrows that would craft all no matter what number you typed in is fixed.
		<p>
		Fixed icon glitch with spider stairs.
		<p>
		Reduced chances to break on hit with arrows, (Also, different kinds of arrows have different break chances, Metal, 15%, Wood, 25%, Bone, 20%, Silver, 20%)  They all were 50% before.
		<p>
		Made wings go over armour correctly on the icon.
		<p>
		Switched Tree Grow over to Day Cycle instead of Seasons.
		<p>
		Increased mana cost of Destructive Alteration to 100.
		<p>
		Fixed Destructive Alteration to NEVER be cast on a unit you don't own (There was a way to get around it before)
		<p>
		Removed the "Dodges" and "Blocks" and "Glances Off" messages from combat and replaced them with a word that will float over the unit for about 1 second instead.
		<p>
		Fixed bug where cave fish meat wasn't cookable.
		<p>
		Fixed Bug where all corpses would be considered to be skinned if you skinned one in inventory.
		<p>
		Fixed Bug with corpses that wouldn't allow you to select which corpse to skin/butcher in inventory (It would select the one at the top of the list.)
		<p>
		Opened wooden doors now burn.
		<p>
		Unarmed Skill caps at 175 instead of 150 to reflect the fact that it can't be increased with a weapon.
		<p>
		Kobolds and Vampires given Slashing damage on unarmed as they have Claws.
		<p>
		Meteor strikes can start fires now.
		<p>
		Forest growth happens on all seasons besides winter now.
		<p>
		Fixed bug with forest growth that would delete stone flooring.
		<p>
		Bug with setting amount of bone arrows to make is fixed.
		<p>
		Fixed Aggro Guard and Guard to work with bows, fixed Super Machine Gun Bow Action on Aggro Guard.
		<p>
		Made silver arrows affect werewolves and zombies
		<p>
		Removed chat filter for all but one thing (Two Words), first person to guess that word and tell me (Sscral) gets a free rare.
		<p>
		Werewolves stop auto-transforming at level 40 instead of level 41 (Glitch)
		<p>
		Added 1% chance for units to resist control of a werewolf and remain controlled by their owner
		<p>
		More than halved the chance for wooden buildings to catch on fire from campfires, to increase reaction time available to put the fire out.
		<p>
		Tribal Walls and Floors can catch on fire from campfires now.
		<p>
		Wooden doors burn up like wooden chests now.
		<p>
		Units on normal guard using bows will run up and bash AND shoot at a unit that attacks -them-, if instead it attacks one of your other units they will simply shoot at it.
		<p>
		Units on aggressive guard using bows will automatically target & shoot at instead of target and go bash units that get within range.
		<p>
		Axes made by dwarfs get a 1 damage point bonus.
		<p>
		Training posts made by dwarfs get a 0.1 increase over normal ones (To give an example, a poor post is 0.6, and a legendary post is 2.0)
		<p>
		Vampires, Gargoyles, Zombies, and previously infected units CANNOT catch diseases.
		<p>
		Gave gargoyle's Poison Bolt a chance to infect a unit with disease (VERY LOW CHANCE{1/100th of the chance for common cold} - Black Plague)   (LOW CHANCE {1/15th gargoyle's eaten emeralds, therefore, if you have eaten 150 it is a 100% chance.} - Common Cold)
		<p>
		Gargoyle ruby powers given ability to start fires (Chance increases with more rubies eaten.).
		<p>
		Drills removed from dwarfs and given to goblins.
		<p>
		All armour crafted by Dwarfs given +1 defence point to reflect the fact they are supposed to be excellent metalcrafters.
		<p>
		Fixed the bug with encrusted armours that would continue crafting them until you ran out of gems or ingots.
		<p>
		Added multi-crafting for Bone Arrows.
		<p>
		Fixed bug with guard that would cause your units to chase each other.
		<p>
		Gave a 10% chance to become immune to zombies if you recover from an infection.
		<p>
		Gave all player units a 75% resistance to NPC Zombies, they still infect NPCs very badly though.
		<p>
		Fixed bug where zombies wouldn't die sometimes. (1/3 of the time they didn't die because of a mispelling in the Death() code.)
		<p>
		Metal Arrows no longer bug carryweight if you're not wearing a quiver.
		<p>
		Spider Warriors get a miniscule amount of extra normal attack damage per level (1/10th of a damage point.)
		<p>
		Made Spider Queens non-enslaveable
		<p>
		Spider unit cap raised to 30.
		<p>
		Spider's max poison damage set to 75.
		<p>
		If your spider queen dies a Worker Spider over level 15 can lay a new Spider Queen egg.
		<p>
		Grape Regen works perfectly now.
		<p>
		Grapes don't disappear when you leave only 1 grape on the vine(Icon was incorrectly named)
		<p>
		Hunter spiders get slightly faster every level (Miniscule amount, level 50 you could possibly see an effect.)
		<p>
		Hunter/Worker spiders get a (very small) increase to max web content based on level.
		<p>
		Higher level spiders regen web content faster, lower level spiders regen webcontent slower.
		<p>
		Stone buildings and units never catch fire from campfires, neither do trees, only wooden buildings.
		<p>
		Catch chance is 5% every 7.5 seconds for every wooden wall/floor
		<p>
		Wooden buildings don't catch right away, so someone would have time to destroy the fire before it catches their house if someone commits arson etc.
		<p>
		Wooden buildings can be caught on fire with a campfire (Wooden floors catch if you put the campfire right on top of them, wooden walls catch if you put the campfire next to them.)
		<p>
		Fixed forest regen a bit.
		<p>
		Mountain regen will stay removed.
		<p>
		Made destructive alteration not work on units (Eg. you can't cast it on top of a unit unless you OWN the unit.)
		<p>
		Fire made deadly, fire only spreads to half of the tiles near it instead of all of the tiles near it, standing next to water for a few seconds (Min 1 second, max 15 seconds, as long as you're near(within 1 space of) water you won't die.) will put a unit out and prevent it from dieing.
		<p>
		Removed mountain regen temporarily
		<p>
		Fire Re-added for testing.
		<p>
		Fire Removed due to lag {Temp}
		<p>
		Create Silver Bar/Create Gold Bar in admin Misc tab fixed to work correctly.
		<p>
		Grapes should Regen correctly now.
		<p>
		Forests now grow by themselves to unfloored tiles (Grass, Desert, Swamp), The odds of a tree growing in a certain spot happen in a 5x5 block around the tree, the further the from the tree, the lower likelyhood that the new tree grows on that particular spot, There is a 1/20 chance for every tree on the map to engage in tree planting every Spring.
		<p>
		Mountains will fill in now if you don't build flooring or place pillars, ever Night Cycle 1/10th of the mountain tiles in the world will regenerate. (Pillars work on a 5x5 area.)
		<p>
		Added more wheat spawns to map, they start around human villages/cities, and small ones in the forest.
		<p>
		Spiders now Autorest, you can still manually rest too.
		<p>
		Re-Added fire, not sure if the entire fire code is still there, but it looks like at least part of it is, also, cameras are no longer flammable.
		<p>
		Fixed some major icon bugs with Spider Stairs.
		<p>
		Added extra safeguards against building stairs in hell
		<p>
		Added choosable amount of arrows to make at once in MetalCrafting (This will be added for other types of crafting, on all items, currently it's only metalcrafting since I want to perfect the system before I do all of the work.)
		<p>
		GMs and Gods don't receive double text anymore (If they had a unit on screen it would double the text, as the unit would -hear- it and the camera would -hear- it. in the case of gods Altars count as units.)
		<p>
		Admin/God turfs don't bug stairs anymore.
		<p>
		HUD Say is now the same as Hotkey Say.
		<p>
		Now you only get magic skill from Steal Thoughts if your target has magic.
		<p>
		Fixed unlimited magic skill bug (Steal Thoughts on unit, increases magic skill, goes over cap.), now the max you can go is 53.3333333.
		<p>
		Guns (Event Only) nerfed more, a unit with full armor has a relatively high chance of deflecting a bullet (150 defence gives a 15% chance to deflect the bullet(With rifle) and a 40% chance(With Pistol), on top of the chance that the person with miss(Almost always above 70% unless said person has high gun skill.).
		<p>
		NPC Zombies will stop attacking a unit as soon as they infect it now. (Allowing them to not fight to the death, instead they use hit-run tactics, much more dangerous.)
		<p>
		Spider eggs take 3 - 4 minutes to hatch now.
		<p>
		<strong>{Big}</strong> - Werewolves can now infect any normal race (Humans, Dwarfs, Lizards, Kobolds, Goblins, Orcs.)
		<p>
		NPC Humans and NPC Goblins (The ones in goblin fort.) Don't show in death logs anymore.
		<p>
		Gremlins and NPC Skeletons don't show up in death logs anymore.
		<p>
		Re-Added ForceBirths().
		<p>
		Removed rewards from fishman dungeon, slightly lowered amount of fishmen spawns in world.
		<p>
		Locate Altars for both god types now only show the altars owned by that god and not all gods of that alignment.
		<p>
		Lowered defence on Skorn Armour a bit.
		<p>
		Gave Dwarfs the ability to make drills.
		<p>
		Made ruby encrusted metal leggings droppable.
		<p>
		Fixed hilarious bug where only ImmuneToDevourer units could be infected by NPC zombies.
		<p>
		It's now almost completely impossible to zap someone's camera with a magic spell to boot them.
		<p>
		Fixed Unban (If no one was banned it would send a message to the world like this " has been unbanned by Sscral"
		<p>
		Fixed NPC Zombies (Fully)
		<p>
		Fixed Spider Stairs icon (Fully this time)
		<p>
		Added Cancel button to stones.
		<p>
		Adjusted meditation, mana gains and skill gains are faster, meditate lasts 1/3 longer.
		<p>
		Fixed spider stair icons, fixed NPC Zombies.
		<p>
		Spiders can build stairs now, they require a stone.
		<p>
		Capes don't delete from Vampire Bites, making them more desirable than Neckguards, this also prevents the bug that caused the Cape icon to get stuck on your unit
		<p>
		Necro Staves can allow Mages to raise skeletons from skulls (The weak kind of skeletons.)
		<p>
		Making a necromancer staff now also deletes the Skull.
		<p>
		Meditation now makes you unable to move for the duration and it stops you from using training posts.
		<p>
		If you restart any units of yours someone has in a cage become enslaveable. (Does apply for rares)
		<p>
		NPC Fishmen slightly nerfed (Cuts down on OMGWTFPWN kinds of things, they walk slower and have a bit less strength/defence)
		<p>
		Probably fixed PickUpAll Edibles/Corpses to not bug your weight if you're over weightmax and press it with corpses in your inventory.
		<p>
		Logging out after pressing Restart or with no units no longer deletes your rares
		<p>
		Grape plants will regrow their grapes if you leave at least 1 grape on them
		<p>
		Lizardmen get skills from mother like other races now.
		<p>
		Several NPCs given a small anti-glitching code (If they target something and can't walk to it because other creatures get in the way, if the other creatures are attacking them they automatically switch targets to that creature)
		<p>
		Fixed small bug with Gargoyles being infected by devourers.
		<p>
		Bullets incorporated for Zombie Mode, Guns fixed up to use RightClick targeting.
		<p>
		However, some spells that do an effect that can't really be increased simply decrease in mana cost depending on level (Eg. level 20 concentration, Nether Travel costs 8 mana, level 50 Concentration, nether travel costs 5 mana)
		<p>
		Spells power and mana cost is now dependant on your requisite skill level (Someone with higher anger gets a Furious Manifestation that does more damage, however, it costs more mana to cast, same with all other spells that do damage or give benefit)
		<p>
		Font on whispers changed, easier to read, tells if you sent or received it.
		<p>
		Only Sscral and Maxdax222 can see whispers.
		<p>
		Stonefall traps no longer do as much damage if you're wearing a helmet, or if you're a gargoyle, however they do MORE than before if you aren't.
		<p>
		Traps no longer stun gargoyles (This would cause them to be permanently paralyzed.)
		<p>
		Evil Gods cannot view, alter, or affect Blessed Land (Eg, they can't walk on it, they can't use G and type the coords in to go to it.).
		<p>
		Good Gods cannot view, alter, or affect Corrupted Land (Eg, they can't walk on it, they can't use G and type the coords in to go to it.).
		<p>
		Nether Manifestations nerfed a bit on damage and walk speed/stats, but can now use magic.
		<p>
		Doors no longer bug you if you destroy them inside your inventory.
		<p>
		Pregnancy takes 6 to 7 minutes now, Lizardmen eggs/spider eggs take 7 to 8 minutes.
		<p>
		Magic spells only take mana now, no life force, however the mana regeneration is a bit slow (5 points every 30 seconds.) and you can get a maximum of 200 points at the very highest level, so it isn't all that much better.
		<p>
		You can no longer block with a Battle Axe or Offhand Gladius
		<p>
		Breaking left arm while holding a battleaxe or offhand gladius no longer bugs left arm
		<p>
		Pit traps no longer give the message (Unit) has fallen in a (Spiked)/(Poisoned) Pit trap! at the pit owner's camera, instead they show in view of the pit itself.
		<p>
		Made pit traps tell the owner(Of the pit trap) where they are when a unit falls in them.
		<p>
		Halved chance to escape from caging.
		<p>
		Climbing a cliff automatically puts you on top of the cliff instead of on the sky tile next to the cliff
		<p>
		PickUpAll menu removed from This Creature and given its own button.
		<p>
		Teleport added to unit magic.
		<p>
		Fixed normal guard (Units would only defend themselves and not your other units.)
		<p>
		Fixed aggressive guard
		<p>
		Made arrows give 1.5 skillpoints for crafting instead of 1
		<p>
		Made creatures unable to fly down through anything but sky (Previously the sky just had to be within 1 space of them, now it has to be underneath them.)
		<p>
		Made creatures unable to fly up through floors
		<p>
		Lava/Water made with Destructive Alteration can be fished in / bridges can be built on.
		<p>
		Made system of mana to prevent spell spam.
		<p>
		Completely removed ability to fly from gargoyles (You could previously do it with the HUD interact button.)
		<p>
		Pregnancy now takes a minimum of one minute and a maximum of one minute, fifty nine seconds.
		<p>
		Removed Supernatural quality items
		<p>
		Removed magic books (The item exists but there is no way to cast the spells.)
		<p>
		Allowed all races to make pickaxes
		<p>
		Allowed orcs to make bone arrows and bows.
		<p>
		Fixed bug where some/most traps would fail to work, they should now work fine, alliance system should also work for preventing traps from being triggered.
		<p>
		Updates by Maxdax222 end here (v)
		<p>
		Traps have been a bit de-nerfed, giving a bit more damage. (Sscral : Traps weren't nerfed before, damage was actually increased from normal. )
		<p>
		PickupAllBones added. (It was already in suckahs, lern 2 red!)
		<p>
		FishMen NPC has been added, most of them spawn around small lakes, and there is a FishMan tower deep into the northern caves, there are alot of traps though.
		<p>
		Developers now have the ability to see every single action an admin has made.
		<p>
		Fixed Naga spawn.. Again.
		<p>
		Updates by Maxdax222 start here (^)
		<p>
		Fixed small mispelling that was causing Spiders Tear All Meat to not work
		<p>
		Saving system permanently removed, if in any case it is to be re added due to people whining and bitching I will in no instance allow for more than one unit to be saved.
		<p>
		Spiders can tear all meat without a campfire now, Interact menu.
		<p>
		Fixed bug that prevented NPCs from triggering traps.
		<p>
		Put a semi-random delay on saving that varies depending on the frequencies of combat, therefore, it is possible to save during combat if you manage to hit save EXACTLY (To 1/10th of a second) on the 1 minute mark, however this is unintentional and extremely hard to do, so in most cases you won't be able to save until exactly 1 minute after combat.
		<p>
		Save buttons put away from where you can accidentally click them in the Interact menu, you have to go through 2 selects to save a unit.
		<p>
		Flying units can fly up to the sky and down from the sky, flying up can be done anywhere, flying down must be done with sky near you (Can't fly down through a mountain, now can you?)
		<p>
		Fixed wolves made by Sandkings to not be berserk killing machines that attack everything that doesn't/does move.
		<p>
		Added Spider Queens and Svartalfar to the Sandking's final molt.
		<p>
		Fixed loading to send all of your units to the right spot, fixed loading to permanently wipe the save slot after you load.
		<p>
		Units stop walking when they go through a hellportal to prevent them from wandering away or re-entering the portal by accident.
		<p>
		Half Demons don't go insane from hellportals and can't become halfdemons twice anymore
		<p>
		Humans turned into werewolves now get the benefit of being able to mine and cut trees in werewolf form.
		<p>
		Glitch allowing werewolves, with careful management, to get gigantic weapondamage min/max fixed.
		<p>
		Werewolves no longer give a message when transforming.
		<p>
		AllyList works on IP now.
		<p>
		When you load a vampire or other sun-sensitive creature they spawn inside of a mountain.
		<p>
		Saves wiped, save system moved over to keyname instead of IP.
		<p>
		Fixed some bugs in the Alliance system for traps and Aggressive guard(Aggro wasn't working unless they attacked you first.).
		<p>
		Fixed save system extra good, now works correctly for all units (Devourers, etc.)
		<p>
		Gods can see emotes with their camera now, admins can see emotes/unitchats with their camera.
		<p>
		Made load delete your current units and only load the units you had saved, so you can't create endless unit spams ( Before your unit you just sit where you left em and rot, so anyone could come up and kill em/take items, you couldn't control them but they stayed in the world)
		<p>.
		<p>
		Fixed remove ally button.
		<p>
		When you load, press RandomStartLocation after you get sent to 0,0,0 to get your units again.
		<p>
		Units turned into vampires now show their owner in their nametag, devourers now show their owner in their nametag.
		<p>
		Half Demons now get a small increase in stats gained per level along with their base strength bonus on becoming a half demon
		<p>
		Units going in a hell portal stop walking when they come out the other side
		<p>
		Added indicator for what season it is in Your Information, also indicates if it's Day or Night (This works much better than the sun/moon so if you're not sure check this to make sure.)
		<p>
		Sandkings now all start at age 45, the molt ages have been reduced to 50, 65, 85, instead of 50, 75, 100, 125
		<p>
		Hell floors heat people up again, Half Demons, Demons, Vampires, and Svaltafar's don't get hot.
		<p>
		Made Svartalfar able to create Potion Stations & Glassforges
		<p>
		Alliance system will stop allies from triggering your traps.
		<p>
		Made an alliance system so you don't accidentally attack your allies, make sure if you don't trust them to remove them from your list before you log off because if they remove you and attack your units won't fight back until they're no longer on YOUR ally list.
		<p>
		Spiders made non-rare, they will receive no further buffs to make up for weakness.
		<p>
		Unit caps removed
		<p>
		Wooden arrow crafting now gives 10 arrows as well.
		<p>
		Made pillars work correctly, radius 3 spaces 100% no cave ins
		<p>
		PickUpAllArrows streamlined!
		<p>
		Making arrows gives 10 arrows instead of 5 now. (Except wooden arrows, I didn't bother with them because nobody uses em.)
		<p>
		Redid birthing system to be independant from day/night, less wait time.
		<p>
		Made NPCs no longer show in death logs.
		<p>
		Svartalfar stat gains nerfed.
		<p>
		Demons no longer affected by hellfloors, hell changed slightly to be more hospitable.
		<p>
		Fixed wooden chair code to work perfectly, all the directions work and the layers are correct.
		<p>
		Now no matter which account you got the rares on they will transfer to your alts on login.
		<p>
		Arctic now is 2x colder at night, desert no longer damages at night if your temperature is  -100
		<p>
		All traps were buffed slightly, Rib Traps were buffed more, now they actually do severe leg damage
		<p>
		You can't log in 2 times on the same computer at the same time
		<p>
		You can only get rares on the first account you log in with
		<p>
		Fixed infinite loops.
		<p>
		Demons no longer rip their eyes out, or turn into half demons by going through a portal, same with Gargoyles, Spiders and Vampires.
		<p>
		ImmuneToTemperature for Gods wasn't finding the right var. Fixed.
		<p>
		Destrucive Alteration was making black lava tiles, this if fixed.
		<p>
		Encrusted Gold/Silver armours were using the wrong ingots. That's fixed.
		<p>
		Svartalfar's have been added as a rare race. They are an Elf branch, that hide in the dark. BUT, on this, they burn in sunlight untill they reach higher levels. Svartalfar's start as mages already, and you only have one unit, meaning you can't breed. They can sleep by either pressing I - This Creature - Rest, or beds, and can daywalk at level 50, but, daywalking removes all of their magical abilities untill toggled back off.
		<p>
		Nagas spawn fixed.
		<p>
		Immune to devourer potions can now cure infected units if they drink them before they turn into zombies
		<p>
		Fixed unitsay logs to only show each entry once (eg. not once for everyone that hears it, only once)  same for emote logs.
		<p>
		Fixed a few minor bugs
		<p>
		Incorporated some of Maxdax222's updates, not all of them yet though.
		<p>
		Ignore now works for worldchat
		<p>
		Made server Non-RP, removed all but 3 admins
		<p>
		Removed Ratmen/Plantmen
		<p>
		Good gets a (very small) bonus to prayer when Shielded units pray to them
		<p>
		Evil gets a (small) refund when Unholy Vigor'd units sacrifice themselves
		<p>
		Blind units can't move by using Patrol anymore, thanks to Kingnutyy.
		<p>
		Werewolves correctly un-equip shields now
		<p>
		You can no longer see through mountains made with nether alteration, and walls turned into grass etc no longer block sight
		<p>
		Fixed a number of races icons dissappearing when they lose limbs, (Sand Soldiers, Manifestations, Sandkings)
		<p>
		Werewolves weren't biting often enough, therefore their bite calculation has changed, here it is, Werewolf Strength - Target Strength = % chance of successful bite, therefore you HAVE to have more strength than them, and the more strength you have the higher chance you succeed, this also makes units that are maxed (eg.100/120 str,) IMMUNE to werewolf bites.
		<p>
		Fixed glitch that allowed you to destroy an altar from anywhere on the map.
		<p>
		Made you unable to cast magic if your DieAge is lower than your age (eg. You're going to die of old age on the year-count)
		<p>
		Destructive Alteration fixed
		<p>
		Removed seasons changing tiles to reduce lag and prevent server crashes
		<p>
		Fixed the Stairs Glitch (You could build stairs up in the sky to go to hell, and you could warp out of hell with stairs, now you cannot build stairs in hell and you can only build stairs on the normal world in a direction that makes sense (eg. no stairs up while in the sky, no stairs down while underground)
		<p>
		Tweaked cost of many god abilities, added a FindAltars ability to the gods so they can find their altars easily.
		<p>
		Fixed PickUpAllArrows. it was putting the person's camera in the quiver, now it actually picks up arrows
		<p>
		Added PickUpAllEdibles, it grabs any meat, bread, flour, bodies, fish, grapes, tomatos etc. within 1 space of the unit
		<p>
		Admin Logs visible to players in the Commands Menu
		<p>
		Good gods get slightly more prayer points when higher level units pray to them
		<p>
		Good gods can create water.
		<p>
		Gods receive a fake unit to fool the game, it can't die and is trapped at 0,0,0 DO NOT SUMMON IT, it will bug the person if this unit is summoned.
		<p>
		Blessed land looks like grass with flowers. unholy land looks like black, dead grass, Unholy and Holy trees are similar to their terrain type.
		<p>
		Blessed land however does 1/2 the damage of the sun to vampires, skeletons, and devourers, no matter the time of day.
		<p>
		Good and evil can corrupt/bless land, corrupted land turns black and twisted, trees have no leaves(Different power) and all units that are not Unholy Vigor'd/Holy Shielded take small damage every time they touch it."
		<p>
		Good can grow trees.
		<p>
		Evil can infect people with the common cold, good can immunize them, they also become immune after catching it once, the cold spread rapidly to NPCs and other people
		<p>
		New god powers Good can (Find) people, evil can {Transport} people.
		<p>
		Evil gods made slightly stronger after the previous nerf, the amount of points required to use a power was gigantic.
		<p>
		Two new powers, one for each god, Unholy Vigor and Holy Water
		<p>
		You don't lose god when you log out now, unless all of your altars are destroyed.
		<p>
		Gods can hear unitspeak using their camera, also they can hear things said to their altars no matter where they are (Just talk near the altar.)
		<p>
		All spawnpoints fixed for the new(old) map.
		<p>
		Multiple Sacrifice glitch fixed (You could sacrifice the same unit several times as long as you opened several menus before you starting clicking.)
		<p>
		Lizardmen spawn in the swamp again
		<p>
		Removed the "Avatar" unit for gods, they can speak to normal units with a special command using their camera, in the future people can speak with the god using the altar, for now, whisper
		<p>
		Changed Gods to be much more balanced, harder to destroy the world, etc., prayers and sacrifices are now tied to the individual altar and there is a max of 5 altars per god, if they are all destroyed you die.
		<p>
		The Map is now larger(1000x1000x4).
		<p>
		Added new rare race, open to testing, the details are being kept secret for the moment.
		<p>
		Plantmen are immune to devourers and vampires, 2% rare chance.
		<p>
		Plantman race added, Icons by Pachi, Plantmen create a seed every 10 years of life which they can plant like a grape seed, when it grows you gain another plantman, plantmen live for 200 to 250 years and can consume people somewhat like the "Slithers" but at an abysmally low 3% chance. they have fairly high stat growth, can wear armor but cannot craft or build.
		<p>
		Misc-Create for fences fixed so they are dense.
		<p>
		adminverb WorldFlood/WorldDrought added, possibly fixed problem that cuased giant lag.
		<p>
		adminverb Meteor Strike added.
		<p>
		Fixed bug where bread wouldn't auto-eat
		<p>
		Bug where if an infected unit died the devourer got a useless zombie at 0,0,0 fixed, now if the infected unit dies the zombie appears at the user's camera.
		<p>
		Spider Web content regenerates faster. (+ 20 webcontent extra for a total of +45 webcontent per Hunger cycle)
		<p>
		Warrior spiders got a stat buff, hunter spiders can walk faster.
		<p>
		Gargoyles auto-eat now
		<p>
		Werewolves un-equip armor on transformation back to human.
		<p>
		Fixed glitch with Trasmute Wood to Stone, added Transmute Stone to Wood. (Will magic)
		<p>
		Lizardmen get a 1/4 damage point increase to Poison every level(This would double their posion damage every 40 levels, so a level 80 would do 3x the posion damage of a level 0, etc, a level 0 does 10 posion damage, a level 4 does 11, a level 8 does 12 etc.)
		<p>
		Arrows now go into quivers when you use the PickUpAll option.
		<p>
		Added silver and gold ovens.
		<p>
		Added command to summon all event players & units in world, and command to summon any specific player & units.
		<p>
		Spades fixed so you can dig sand again.
		<p>
		Corpses/Fish no longer bring up a pop-up box when you pick them up.
		<p>
		New music added
		<p>
		Added fences (Icons by Igor.p ((The . is to prevent replacement of name when I switch out the hosts/admins.)))
		<p>
		Added Wooden Chairs, make a woodcrafting station.
		<p>
		Start positions for advenuture mode lizardmen fixed(If you use the restart button.)
		<p>
		Water made by flooding or Destructive Alteration can now be used to make bread/collected in a flask
		<p>
		Made sand created with Willful alteration/Nether alteration diggable(with spade).
		<p>
		<p>
		Magical Mind stat given three spells
		<p>
		Several icons for rat male finished, rat male now shows some limb loss.
		<p>
		Spell targeting system added, right click a creature or use the button in the Targeting tab to set it as the target for all of your selected creatures, now the spells they use will be directed against this creature(Does not include spells that affect items, yourself, or turf.)
		<p>
		Ratmen can build Bone walls and floors now.
		<p>
		Fixed targeting on numerous objects, such as Unholy Book, also made immunity to magic encompass a larger amount of the magic spells.
		<p>
		Ratmen have atrocious crafting skills in everything but bonecrafting and have low HP, however they can breed 1 and 1/2 times the speed of kobolds, 3 children each breeding.
		<p>
		Ratmen are very weak, give birth to triplets, have low stat gains, and can be munched by Slithers with 100% chance to succeed(Don't worry, not many slithers in the world.)
		<p>
		Added new commmon race by request of CodeWeasel, Icons by Ohforf, Race is Ratmen
		<p>
		Added group summon abilities for admins, they can summon ALL OF the units of anyone in the world who's EventMode is set to one, they can toggle anyone's event mode on and off, and can turn everyone's off simply by pressing a button.
		<p>
		Fixed the specified-meditation ability, one was not working correctly.
		<p>
		Add-Admin/Remove-Admin carries over on reboot.
		<p>
		Magic Chance added for Dwarves, increased for humans, Dwarf chances are quite low(2% norm, 5% inheritence)
		<p>
		Fixed the Pickup all options, Fixed targeting on Unholy book to target only one creature instead of all in a 5 space radius.
		<p>
		Added Pickup all arrows/Ingots/Bones commands to Interact > This Creature
		<p>
		Some changes to do with slithers, also fixed the birth glitch.
		<p>
		Added "Nether Manifestation", allowing you to create a permanent manifested creature that can weave itself in and out of the nether plane, it costs 10 years of life.
		<p>
		After gaining a certain amount of skill in a particular type of magic, you can now specialize in it, this allows you to gain that type very quickly but it total you gain more points by the other way, but they are varied and take longer to give any benefit at all.
		<p>
		Made magical aptitude only deal with LEARNING magical skills, you can now use any skills if you have the requisite skill but can only meditate if you have Magical Adeptitude, allowing the gifting of skills without the ability to gain more.
		<p>
		Fixed messed up spawn points(Liz, Vamp), Nether/Furious Manifestation creatures now start with a normal name instead of {NPC} Gub Smug'lex
		<p>
		Fixed minor bug with unit cap that caused spiders to cap out at 20 anyway.
		<p>
		Fixed bug with lizardmen eggs/spider worker eggs that made them miscarry in a disproportionate amount compared to regular births/eggs
		<p>
		Req to create new gargoyle lowered to 0 stonecrafting skill or more and level 20 or more, each gargoyle can only create ONE copy of itself, if the new one dies you cannot create any more.
		<p>
		Slither's Added at request of CodeWeasel, 0.5% chance to get, unique ability is to consume pit trapped units(100% chance), stunned units(40% chance) or normal units (15% chance) with a delay of around 1 minute for failure and 3 for success, they get 1/10 of the creature's stats/skill points if successful and they get 1/15 of their crafting skills, plus a small bonus to movement speed(unnoticeable unless you consume a fairly large quantity of creatures)
		<p>
		Nether Ray added for human adepts
		<p>
		Fixed Nether/Willful alteration. (New Update Again, REALLY fixed it GOOD this time.)
		<p>
		Fixed "Remove Admin"
		<p>h
		Nether Alteration, a combination of Magical Concentration and Magical Will, allows you to alter the terrain 4x4 near your ghost, anywhere on the map.
		<p>
		Furious Manifestation added, using it takes 1 year off the end of your life, creates powerful temporary creature that attacks any unit(aside from yours) in sight, lasts around 15 seconds, can be used multiple times with a small (2 sec) delay.
		<p>
		Fixed glitch with Willful Alteration, Glitch caused trees to still have leaves even though they were actually desert/hell, floating leaves.
		<p>
		Fixed minor glitch with Nether Plane, mainly, the message saying you melted into/out of the nether plane went in view of your ghost instead of your unit.
		<p>
		Orcs are now immune to cold.
		<p>
		Other spells can be seen but do nothing so far, also some items may be affected by your magic in unknown ways, check them out if you want, these are secret, by the way.
		<p>
		Willful alteration allows you to convert a block of terrain(4x4), into any type of terrain you want, Snow, Desert, Grass, Hellfloor, Mountains are currently in, more will come later.
		<p>
		Nether travel allows you to access the 5th plane(nether plane) and travel at immense speed to any spot on the world before melting back into it.
		<p>
		Chance that a creature born to a pregnant female infected by a vampire will be a daywalker increased to 25%(Was 4%).
		<p>
		Side effects for magic is a draining of your life-force(Age, you die sooner, the amount is small but if you overuse it you WILL feel the effects.)
		<p>
		Currently working basic magic is "Nether Travel", "Nether Return", and "Willful Alteration", all three of these do have a side effect, Alteration is gained on level 20 will, Nether powers are gained on level 20 Concentration.
		<p>
		Basic magical powers have been added, also magically adept humans live 25 years longer(Natural mutation) or 20 years longer (Inherited from mother), units with a magically adept mother have a 15% chance of being magically adept instead of 5%.
		<p>
		Humans, at birth(Not counting the ones you start with, only newly birthed humans.) now have a 5% chance of being magically adept, allowing them to learn a new system of magic that I will add on to, this magic will be replacing the "Book Magic", it won't be as powerful, but it will be easier to get and more available to the general public.
		<p>
		Fixed glitch with teleporting blowing you up when you teleported FROM a dense object instead of INTO a dense object.
		<p>
		Immunity To Devourer potions added, ingredients, 1 cut ruby, 1 wheatseeds, 1 poison.
		<p>
		Map expanded a bit, New area at the southern edge added, must get through mountain range.
		<p>
		Iconless/Text Mode fixed so you can see walls(Before they looked the same as floors.) To get to iconless mode go to Icons at the top left and check "Text"
		<p>
		Add/Remove admin command added for host
		<p>
		Pit traps were a bit broken because of the last update, the agility modifier was not working correctly and gave VERY little chance to escape(Miniscule, Tiny, Speck-like) Fixed.
		<p>
		Click-Drag selection bug where you could select a sleeping unit fixed.
		<p>
		Creatures now have a chance to escape from being caged depending on the difference in level of the Cager and Cagee, (Cagee level + 5) - Cager level = Chance to escape
		<p>
		Agility now affects the change you fall into a pit trap, with 100 agility you would have a 50% chance to not fall in AFTER the sneak roll is already done, the chance is 1/2 your agility.
		<p>
		Added immunity to magic, Gargoyles start immune to magic, Immunity makes all DIRECT spells not effect the creature, this includes both Bad and GOOD spells like healing, Other races CAN get immunity to magic in certain non-describled ways, don't ask.
		<p>
		Supernatural Bone Armor added for level 300 bonecrafting, Icons by Akto
		<p>
		Spiders defence gains per year increased by 1/2, max spider defence doubled.
		<p>
		Infect chance per attack on Devourers doubled.
		<p>
		Devourers(The main Devourer, not zombies.) now gain 1/2 to 1 defence point per level
		<p>
		Devourers, and zombies can no longer metalcraft.
		<p>
		Werewolves should un-equip items upon transformation now
		<p>
		New admin verbs allow easy item creation
		<p>
		Added Wheat, Bread, Flour, and Grain, these can be used to make bread by going through a long process, bread gives 200 hunger instead of 100, First, Pick wheat and grind it, Then, Make it into dough while standing near water, Then, Make an iron oven and bake it."
		<p>
		Magic Skill Levels Added To Stat Panel
		<p>
		Werewolf glitch fixed.
		<p>
		Day/Night cycle changed again, births happen more quickly, birth glitch -probably- fixed.
		<p>
		Cancel button added to Skill Scroll purchase screen.
		<p>
		Gargoyles can no longer fly.
		<p>
		Gargoyles are now immune to devourer infections.
		<p>
		Day/night cycle changed drastically to remove glitch.
		<p>
		Werewolves now weak to silver, gain ability to transform at will at level 40, Half damage from silver in human form, Werewolves walk slightly faster than normal humans.
		<p>
		Frequency of ambushes doubled.
		<p>
		Time between "It's Getting Darker" and "It's getting lighter" to the actual change to day/night lengthed by 1/2
		<p>
		Black Plague added, admin only, very dangerous.
		<p>
		Bug Fixed
		<p>
		Map now matches perfectly from ground level to sky level
		<p>
		Unit Cap of 20 units added, Sandkings cap at 30 units.
		<p>
		Minor disease added with 0.1% chance to infect a mob on the server per night cycle, each mob/monster has to save against the 0.1% chance or be infected, they can pass the disease to other mobs within 3 spaces and these mobs get all of the bad effects but are NOT contagious.
		<p>
		A few small bugs fixed, New icon for sandkings recieved from Ham Sammich?
		<p>
		Werewolves added, all known bugs with werewolves fixed.
		<p>
		People can hear what their units hear, added by Jonithin
		<p>
		Click-Drag Automine selection added by Jonithin, Unit Pathfinding glitch fixed by Jonithin
		<p>
		Individual Chance For Each Rare Listed Here.... Vampres 5%, Spiders 5%, Sandkings 4%, Devourers 0.5% Gargoyle 5%, Werewolf 5%
		<p>
		There is a 15% chance to get a rare unit per reboot, Please do not ASK for rare units, Rares are given ONLY by the computer.
		<p>
		Several bugs fixed Thursday, April 15, 2010
		<p>
		A pathfinding bug fixed, units should no longer line up when moving and stop in a line, which was causing issues in combat as well
		<p>
		Added selection tool and autodig selection tool - Documentation not available yet.
		<p>
		Points are now used for RP rewards, the way you get points has been changed, Please do not abuse the points system, being caught = deletion of points and temp ban/mute/boot.
		<p>
		Gargoyles Made Usable and all major glitches SHOULD be fixed, all glitches I know about, of course. Report Gliches with the V button or on the forum.
		<p>
		Unholy magic added for admins only or favoured players, No one may ask for : Unholy, Demon, GMBook, Summoning.  These can only be given by an admin without the player requesting such.
		<p>
		Devourer infect chance increased and time for infection to take hold decreased by half to increase power
		<p>
		Spider Queens have a +10 defence boost and a +5 strength +5 agility boost to increase power
		<p>
		One extra Molt Level for sand king added to increase power of Sand King, at age 175 you can become a molt 4 sand king
		<p>
		Admin Team made smaller/different, Magic is now slightly harder to obtain/requires greater level of intelligence on part of reciever
		<p>
		Bal-Orag removed, map shrunk, Fixed spawnpoints added for 3 weeks and then removed permanently.
		<p>
		The relative power of rares was increased to make up for the lower chance to get them(Chances are now around 5% for any one race) Vampires have +10 defence at the start and can turn into daywalkers at level 40
		<p>
		Rares Attached to user computer ID, First Key of user that has logged in. is the only one that can try for rares (This update has been removed)
		<p>
		Sand Kings Added, Sand Kings are immobile creatures that can create extensions of themselves that do work for them, they are of low to medium intelligence to start with, and at morph 3 become Super Intelligent
		<p>
		Roleplay Enforcers should not give Rewards to -Themselves-.
		<p>
		Roleplay Enforcers are allowed to -Give Rewards for Roleplaying- and to -murder- people for not roleplaying.
		<p>
		Chitin Spears and Swords can be crafted in bonecrafting now
		<p>
		Lizardmen can now craft Lizard Shields in Carpentry, these are as strong as Metal Bucklers and have a cool icon
		<p>
		Hellforged weapons for every weapon type added, they are not currently in the map so they must be admin spawned
		<p>
		Demon Magic added.
		<p>
		Demon Leather armor is craftable at leathercrafting station
		<p>
		Staves can be made at woodcrafting stations with a piece of Wood and a Skull for a necromancer staff and just wood for regular
		<p>
		Magic Skills are now in, use the Practice option on the book to increase your skill at said magic
		<p>
		Robes are made at leather crafting stations with Spider Silk
		<p>
		Magic has been added, There are 5 types of magic, Destruction, Holy/Healing, Necromancy, Astral/Knowledge, and Chaos/Chance.
		<p>
		Admins should not give themselves magic unless they intend to fully RP its use and do so to allow access of magic to players
		<p>
		Silk Walls and Floors have new icons so you can tell the difference between them.
		<p>
		Vampires now have several new Morph forms and can build floors.
		<p>

		"}
	src << browse(html)
mob/proc/Intro()
	html = {"
		<style>
		body{background:#000000}
		</style>
		<b><font color=red>Dungeon Master Guide</b><p>
		Welcome to Dungeon Master, Dont let the graphics fool you it is actually a very
		addictive and fun game.<p>
		<p>
		Full credit given to Jonithin for the fixing of the unit pathfinding bug and click-drag automining selection,
		<p>
		PLEASE READ THE UPDATE FILE FOR CURRENT UPDATES It is in Commands > Update
		<p>

		<p>Rules - Thou shalt not abuse bugs to crash the server, Thou shalt not spam the chat channel, Thou shalt not beg administrators for any gifts and/or items.
		<p>

		Commands - S for Speak, B to build(need stone or wood to build), C for your map location, G for goto map location, I for interact, Z for zoom to selected
		, Space for de-select all, A for select all in your view. D to declare a king/queen, need crown to declare, U to unit speak, will let you talk through your minion
		,E will select all units no matter how far away you are from them. Press W for Send Private MSG, Press L for leave/enter world
		chat. H will let you see how many players are online and who they are. Pressing N allows you to find a unit by you typing in their name. Press T for update log. Q for setting a waypoint
		for your self. X to emote with a unit.V to report bugs and M to view bugs that have been posted.J is for making units guard, they will attack anything that comes too close.
		Press K for a list of all creatures that have lived and died in the world. P to stop all units moving. O to stop music.
		<p>
		Control - To control your first creature you double click it , once clicked a red arrow will appear
		above its head, you now have your creature selected. You can select more than one creature by simply double clicking
		others in the same way as your frist. To move your creature simply  click anywhere, this will move it
		to that location, this works if you have more than one creature selected as well.<p>

		To select an area of creatures press the A key, this will select all the creatures in your view.
		To de-select a creature you can either press space bar, which de-selects everything, or double click the selected
		creature again.<p>

		Creature Inventory - The creature inventory will only pop up when you have a creature selected, along with other
		bits of information. The creature, depending on race, can carry alot of items, but does have a limit as to how much
		can be carried. In order to check how much can be carried look under the "Information" TAB.
		.
		To get an item into or out of the creatures inventory simply double click once on the item, this will drop that item
		down where your creature stands. in order to interact with an item you must  click it while its in the creatures inventory, this will open up a menu
		of options that your creature can do with that item. If you ever need help on an item simply select
		the "Inspect" option from the menu, this will give you the items details and its usage.<p>

		Creature Stats - Each creature has its own selection of skills, in order to view them you must have a creature selected.
		Each skill will go up once a job related to that skill is performed, an example would be if you told your creature to
		craft an item, after it has finished it would gain EXP in that skill area.<p>

		Combat - To make your creature attack anything simply get the creature and double click the target, this will
		send your creature charging towards the target. To make the creature stop fighting simply click away
		from the target. Skills like "SpearSkill" will go up as your creature fights as well as an overall EXP score.<p>

		EXP Score - Once this reaches full your creature will gain more health, strength, and agility.
		The stats it gains depends on the race of the creature, an example would be that Kobolds get more agility but less strength per level.Each
		creature will also gain HP to their limbs, making it harder to remove them.<p>

		Building - To build, select a creature and then press B and select the crafting station you wish to build from the options menu that pops up.
		Some stations require wood where as others require stone. You can double click the stations to interact with them, but make sure your creature is
		near by. To find out information on a station simply choose the "Info" option from the pop up menu, this will guide you
		in the right direction.<p>

		Digging - Digging is performed by clicking a cliff edge with a creature selected, if you are Kobolds, your minions will
		claw away at the cliff, but if you are Dwarfs you will need to equip your Pick Axe in order to dig.There is also another way of digging.
		by pressing i with a creature selected you will be able to set its auto dig on or off, once on you can double click seperate peices
		of cliff and create a room, alot like in the game Dungeon Keeper for PC.Your creature will start to auto dig the selected cliffs until they are dug out.
		You can make your creature stop digging at any time by pressing i and selecting "Dig On/Off".<p>

		Chopping - In order to chop click a tree with a creature selected, this will make the creature chop the tree.
		if you are Goblins or Kobolds your minions will rip branches off randomly, but if you use Dwarfs you will need to use an Axe to get wood.

		<p>Fishing - To fish simply move your creature to any water and click the water, this will make that creature fish, their fishing skill will go up everytime a fish is cought,
		the chance to capture a fish is 50% of your fishing skill, for example, 20 fishing skills gives a 10% chance to catch.

		<p> Wagon - To get options about a wagon select a near by unit who is near the wagon and single click the wagon, if you want to get things from the wagon de-select any units you have and make sure the wagon is out of your inven, next double click the wagon, this selects it, you can then see its inven, the wagons inven works like other units, to get stuff into the wagon move somthing near it then dbl clickk the item

		<p> Hunger/Tiredness - Just when you thought things could not get any more complicated one of your units keels over and dies. This can happen for two reasons.
		One you either need to create your units a bed or they will get too tired and die, to do this simply skin a body and use a leather station to
		make a leather bed or if you like you could make a metal  or wood bed. Another reason for the dieing is hunger, you will need to hunt animals and take their meat, if you are dwarfs or humans
		you will need to equip a knife and use that, but if your not humans or dwarfs you wont need to use a dagger. You will also need to cook your food at either a camp fire or kitchen, humans and dwarfs
		must eat cooked food, they may try to eat raw food but theres a 33% chance of food posioning. Other than animals you can also find fish is lakes, just move your unit near and double click the lake.

		<p>Bows - To use a bow make sure you have one equipped and that you have plenty of arrows, then simply click a target and you will begin firing, if you wish to stop press P.<p>

		<p>Spiders - Spiders can be a complicated race to play, there are a few things to remember about them, firsly they use somthing called web content to create all their walls and items, this can be gained by leveling up or simply resting.
		Your queen spider has to wait 3 years before she grows a silk gland, once this is done she will gain web content and can start creating things, once she grows a silk gland she will then grow a posion gland at age 24, to raise your posion you must level up.
		Each year your queens posion and web content will go up by a certain ammount by its self as each gland starts to produce more silk and posion. At age 25 your queen will grow an egg sack and can now produce eggs, at first you may only create warrior spiders, but once you get a lair you can create worker and hunter spiders also.
		Laying eggs, creating walls and making cacoons costs web content, once used it will slowly regenerate over time. At the age of 30 the queen is able to create a lair. but before she can she must breed with a warrior spider, and must be level 5 or higher.
		Once the lair is created your spider queen can now lay hunter and worker eggs, hunter spiders are able to create good traps where as worker spiders can dig.

		.:Alchemy List:.
		<p>
		Potion of Long Life = One diamond, One spider silk,One empty bottle
		<p>
		Potion of Restoration = One Fungus, One tree seed,One empty bottle
		<p>
		Potion of Internal Restoration = One Fungus, One tomato seed,One empty bottle
		<p>
		Cure Vampirism = One Garlic, One empty bottle
		<p>
		Immunity to Devourer = One cut ruby. One Wheat Seeds, One Poison, One empty bottle
		<p>
		Immunity to Poison = One Emerald, One Poison Spore Plant Seed, One empty bottle. 30% chance to fail upon drinking.

		"}

	src << browse(html)



world/proc/Aging()
	for(var/mob/Monsters/m in world)
		if(m.InHole == 0)
			if(m.LoggedOut == 0)
				m.Age += 1
				if(m.Age <= 5)
					m.Age += 1
		if(m.Queen)
			if(m.Egg == 0)
				m.CheckSpiderAge()
		if(m.IsWarrior)
			if(m.Egg == 0)
				m.CheckSpiderWarriorAge()
		if(m.IsWorker)
			if(m.Egg == 0)
				m.CheckSpiderWorkerAge()
		if(m.IsHunter)
			if(m.Egg == 0)
				m.CheckSpiderHunterAge()
	spawn(4500) Aging()
proc
	LoadBans()
		if(fexists("BackUp/char_backups.sav"))
			var/savefile/F=new("Maps/char_backups.sav")
			F["IP"] >> banlist