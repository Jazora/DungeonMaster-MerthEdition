area/proc/RandomTurf()
	var/AreaType = rand(1,6)
	if(AreaType == 1)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/Tree = prob(2.5)
				var/Grape = prob(0.01)
				var/Tomato = prob(0.01)
				var/Garlic = prob(0.01)
				var/Wheat = prob(0.01)
				if(Tree == 1)
					T.icon = 'plants.dmi'
					T.icon_state = "tree 2x1"
					T.overlays += /obj/Trees/tree2x2
					T.overlays += /obj/Trees/tree1x2
					T.overlays += /obj/Trees/tree3x2
					T.overlays += /obj/Trees/leaves3x2
					T.overlays += /obj/Trees/leaves2x2
					T.overlays += /obj/Trees/leaves1x2
					T.overlays += /obj/Trees/leaves1x1
					T.overlays += /obj/Trees/leaves2x1
					T.overlays += /obj/Trees/leaves3x1
					T.Tree = 1
					T.IsWood = 1
					T.density = 1
					T.opacity = 1
					T.HP = 250
					T.text = "<font color=#33CC33>×"
					T.name = "Tree"
					T.OIcon = "Grass"
				else if(T.density == 0)
					T.name = "grass"
					T.icon = 'Cave.dmi'
					T.icon_state = "Grass"
					T.Sky = 1
					T.Content3 = "CanClimb"
					T.OIcon = "Grass"
					T.text = "<font color=#33CC33>×"
					T.density = 0
					T.CanDigAt = 0
					T.opacity = 0
					T.Tree = 0
					if(Grape == 1)
						var/obj/Items/Plants/GrapeVine/G = new
						G.loc = T
					else if(Tomato == 1)
						var/obj/Items/Plants/TomatoPlant/G = new
						G.loc = T
					else if(Garlic == 1)
						var/obj/Items/Plants/GarlicPlant/G = new
						G.loc = T
					else if(Wheat == 1)
						var/obj/Items/Plants/Wheat/G = new
						G.loc = T
	if(AreaType == 2)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/Tree = prob(12.5)
				var/Grape = prob(0.01)
				var/Tomato = prob(0.01)
				var/Garlic = prob(0.01)
				var/Wheat = prob(0.01)
				if(Tree == 1)
					T.icon = 'plants.dmi'
					T.icon_state = "tree 2x1"
					T.overlays += /obj/Trees/tree2x2
					T.overlays += /obj/Trees/tree1x2
					T.overlays += /obj/Trees/tree3x2
					T.overlays += /obj/Trees/leaves3x2
					T.overlays += /obj/Trees/leaves2x2
					T.overlays += /obj/Trees/leaves1x2
					T.overlays += /obj/Trees/leaves1x1
					T.overlays += /obj/Trees/leaves2x1
					T.overlays += /obj/Trees/leaves3x1
					T.Tree = 1
					T.IsWood = 1
					T.density = 1
					T.opacity = 1
					T.text = "<font color=#33CC33>×"
					T.HP = 250
					T.OIcon = "Grass"
					T.name = "Tree"
				else if(T.density == 0)
					T.name = "grass"
					T.icon = 'Cave.dmi'
					T.icon_state = "Grass"
					T.Sky = 1
					T.Content3 = "CanClimb"
					T.OIcon = "Grass"
					T.text = "<font color=#33CC33>×"
					T.density = 0
					T.CanDigAt = 0
					T.opacity = 0
					T.Tree = 0
					if(Grape == 1)
						var/obj/Items/Plants/GrapeVine/G = new
						G.loc = T
					else if(Tomato == 1)
						var/obj/Items/Plants/TomatoPlant/G = new
						G.loc = T
					else if(Garlic == 1)
						var/obj/Items/Plants/GarlicPlant/G = new
						G.loc = T
					else if(Wheat == 1)
						var/obj/Items/Plants/Wheat/G = new
						G.loc = T
	if(AreaType == 3)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/Tree = prob(2.5)
				if(Tree == 1)
					T.icon = 'plants.dmi'
					T.icon_state = "SnowTree"
					T.overlays += /obj/Trees/tree2x2
					T.overlays += /obj/Trees/tree1x2
					T.overlays += /obj/Trees/tree3x2
					T.Tree = 1
					T.IsWood = 1
					T.density = 1
					T.opacity = 1
					T.HP = 250
					T.OIcon = "Snow"
					T.name = "Tree"
				else if(T.density == 0)
					T.name = "snow"
					T.icon = 'Cave.dmi'
					T.icon_state = "Snow"
					T.Sky = 1
					T.Content3 = "CanClimb"
					T.OIcon = "Snow"
					T.density = 0
					T.CanDigAt = 0
					T.opacity = 0
					T.text = "<font color=#F8F8F8>×"
					T.Tree = 0
	if(AreaType == 4)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/Tree = prob(8.5)
				if(Tree == 1)
					T.icon = 'plants.dmi'
					T.icon_state = "SnowTree"
					T.overlays += /obj/Trees/tree2x2
					T.overlays += /obj/Trees/tree1x2
					T.overlays += /obj/Trees/tree3x2
					T.Tree = 1
					T.IsWood = 1
					T.density = 1
					T.opacity = 1
					T.HP = 250
					T.name = "Tree"
					T.OIcon = "Snow"
					T.Content3 = "PermTree"
				else if(T.density == 0)
					T.name = "snow"
					T.icon = 'Cave.dmi'
					T.icon_state = "Snow"
					T.Sky = 1
					T.Content3 = "CanClimb"
					T.OIcon = "Snow"
					T.density = 0
					T.CanDigAt = 0
					T.opacity = 0
					T.text = "<font color=#F8F8F8>×"
					T.Tree = 0
	if(AreaType == 5)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/Tree = prob(1)
				if(Tree == 1)
					T.icon_state = "Cactus"
					T.Tree = 1
					T.density = 1
					T.HP = 250
					T.opacity = 1
					T.IsWood = 1
					T.name = "Cactus"
					T.OIcon = "Desert"
					T.Cactus = 1
				else if(T.density == 0)
					T.name = "sand"
					T.icon = 'Cave.dmi'
					T.icon_state = "Desert"
					T.Sky = 1
					T.Content3 = "CanClimb"
					T.OIcon = "Desert"
					T.density = 0
					T.CanDigAt = 0
					T.opacity = 0
					T.text = "<font color=#FFFF66>×"
					T.Tree = 0
	if(AreaType == 6)
		for(var/turf/T in src)
			if(T.Detailed == 0)
				var/SwampWater = prob(0.2)
				if(SwampWater == 1)
					for(var/turf/Y in range(10,T))
						var/IsSwamp = prob(25)
						if(IsSwamp == 1)
							Y.name = "Swamp"
							Y.icon = 'Swamp.dmi'
							Y.icon_state = "water"
							Y.Sky = 1
							Y.Content3 = "Swamp"
							Y.OIcon = "Swamp"
							Y.density = 1
							Y.CanDigAt = 0
							Y.opacity = 0
							Y.text = "<font color=#00CC99>S"
							Y.overlays = null
				else if(T.density == 0)
					var/Bamboo = prob(6)
					var/CarnPlant = prob(0.02)
					var/SporePlant = prob(0.02)
					if(Bamboo == 0)
						T.name = "marsh"
						T.icon = 'Cave.dmi'
						T.icon_state = "Marsh"
						T.Sky = 1
						T.Content3 = "Marsh"
						T.Content3 = "CanClimb"
						T.OIcon = "Marsh"
						T.density = 0
						T.CanDigAt = 0
						T.opacity = 0
						T.text = "<font color=#00CC66>×"
						if(CarnPlant == 1)
							var/mob/Monsters/CarnivorousPlant/G = new
							G.loc = T
						else if(SporePlant == 1)
							var/mob/Monsters/PoisonSporePlant/G = new
							G.loc = T
					else
						T.icon_state = "Bamboo"
						T.Tree = 1
						T.density = 1
						T.HP = 250
						T.opacity = 1
						T.IsWood = 1
						T.name = "Bamboo"
						T.OIcon = "Marsh"
						T.Content = "Marsh"
						T.Cactus = 1
	for(var/turf/T in src)
		if(T.Detailed == 0)
			var/Lake = prob(0.005)
			if(Lake == 1)
				for(var/turf/Y in range(5,T))
					if(Y.Detailed == 0)
						Y.name = "Water"
						Y.icon = 'water.dmi'
						Y.icon_state = "water"
						Y.Sky = 1
						Y.Content3 = "Liquid"
						Y.OIcon = "water"
						Y.density = 1
						Y.CanDigAt = 0
						Y.opacity = 0
						Y.overlays -= Y.overlays
						Y.Tree = 0
						Y.WaterFlood()
	for(var/turf/T in src)
		if(T.Detailed == 0)
			var/Mountain = prob(0.015)
			if(Mountain == 1)
				for(var/turf/Y in range(7,T))
					if(Y.Detailed == 0)
						if(Y.density == 0)
							Y.name = "Mountain"
							Y.icon = 'Cave.dmi'
							Y.icon_state = "CaveWall"
							Y.Sky = 1
							Y.Content3 = "CanClimb"
							Y.OIcon = "CaveFloor"
							Y.text = "<font color=#999933>#"
							Y.density = 1
							Y.CanDigAt = 1
							Y.opacity = 1
							Y.overlays -= Y.overlays
							Y.HP = rand(95,105)
							Y.Tree = 0
							Y.MountainErosion()
obj/proc/UndeadSpawner()
	spawn(1250)
		var/Skeleton = prob(25)
		var/SkeletonLord = prob(15)
		var/Vampire = prob(5)
		var/Nothing = prob(85)
		if(Nothing == 0 && night == 1)
			if(Skeleton == 1)
				var/mob/Monsters/Skeleton/S = new(src.loc)
				S.Owner = "{NPC Undead}"
				S.name = "{NPC Undead} Skeleton"
				S.Agility += 1
				S.Strength += 1
				S.Defence += 1
				for(var/obj/Items/Shafts/LichSkull/L in world)
					if(L.Content3 == "NPC")
						S.CanBeSlaved = 1
						S.RandomWalk()
					if(L.Content3 == "Player")
						for(var/mob/Monsters/M in world)
							if(L in M)
								var/mob/MM = M.Owner
								S.Owner = MM
								S.CanBeSlaved = 0
								S.name = "{[MM]} Skeleton"
								MM.UnitList += S
			if(SkeletonLord == 1)
				var/WeaponType = rand(1,3)
				var/mob/Monsters/Skeleton/S = new
				S.loc = src.loc
				S.Owner = "{NPC Undead}"
				S.name = "{NPC Undead} Skeleton Lord"
				S.Agility += 10
				S.Strength += 10
				S.Defence += 5
				var/obj/Items/Armours/ChestPlates/MetalChestPlate/A1 = new(S)
				var/obj/Items/Armours/Legs/MetalLeggings/A2 = new(S)
				A1.Defence = rand(4,7)
				A2.Defence = rand(4,7)
				A1.name = "Rusty Chestplate - Normal Quality"
				A2.name = "Rusty Leggings - Normal Quality"
				A1.suffix = "(Equiped)"
				A2.suffix = "(Equiped)"
				S.overlays += A1.type
				S.overlays += A2.type
				S.Defence += A1.Defence
				S.Defence += A2.Defence
				S.WearingChest = 1
				S.WearingLegs = 1
				S.weight += A1.weight
				S.weight += A2.weight
				if(WeaponType == 1)
					var/obj/Items/Weapons/Swords/StraightSword/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Rusty Sword - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Sword"
					S.overlays += W1.type
				if(WeaponType == 2)
					var/obj/Items/Weapons/Maces/MetalMace/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Rusty Mace - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Mace"
					S.overlays += W1.type
				if(WeaponType == 3)
					var/obj/Items/Weapons/Axes/MetalOrcAxe/W1 = new()
					W1.loc = S
					W1.name = "Rusty Axe - Average Quality"
					W1.suffix = "(Equiped)"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Sword"
					S.overlays += W1.type
				for(var/obj/Items/Shafts/LichSkull/L in world)
					if(L.Content3 == "NPC")
						S.CanBeSlaved = 1
						S.RandomWalk()
					if(L.Content3 == "Player")
						for(var/mob/Monsters/M in world)
							if(L in M)
								var/mob/MM = M.Owner
								S.Owner = MM
								S.CanBeSlaved = 0
								S.name = "{[MM]} Skeleton Lord"
								MM.UnitList += S
			if(Vampire == 1)
				var/mob/Monsters/Vampire/S = new(src.loc)
				S.Owner = "{NPC Undead}"
				S.name = "{NPC Undead} Vampire"
				S.Agility += 15
				S.Strength += 15
				S.Defence += 15
				for(var/obj/Items/Shafts/LichSkull/L in world)
					if(L.Content3 == "NPC")
						S.CanBeSlaved = 1
						S.RandomWalk()
					if(L.Content3 == "Player")
						for(var/mob/Monsters/M in world)
							if(L in M)
								var/mob/MM = M.Owner
								S.Owner = MM
								S.CanBeSlaved = 0
								S.name = "{[MM]} Vampire"
								MM.UnitList += S
		src.UndeadSpawner()
obj/proc/Spawner()
	spawn(1550)
		var/Nothing = prob(85)
		if(Nothing == 0)
			if(src.desc == "Kobold")
				var/WeaponType = rand(1,2)
				var/mob/Monsters/Kobold/S = new
				S.loc = src.loc
				S.Owner = "{NPC Kobold}"
				S.name = "{NPC} Kobold"
				S.Agility += 10
				S.Strength += 10
				S.Defence += 5
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/A1 = new(S)
				var/obj/Items/Armours/Legs/LeatherLeggings/A2 = new(S)
				A1.Defence = rand(4,7)
				A2.Defence = rand(4,7)
				A1.name = "Leather Armor - Normal Quality"
				A2.name = "Leather Leggings - Normal Quality"
				A1.suffix = "(Equiped)"
				A2.suffix = "(Equiped)"
				S.overlays += A1.type
				S.overlays += A2.type
				S.Defence += A1.Defence
				S.Defence += A2.Defence
				S.WearingChest = 1
				S.WearingLegs = 1
				S.weight += A1.weight
				S.weight += A2.weight
				if(WeaponType == 1)
					var/obj/Items/Weapons/Swords/BoneSword/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Crude Bone Sword - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Sword"
					S.overlays += W1.type
				if(WeaponType == 2)
					var/obj/Items/Weapons/Spears/BoneSpear/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Crude Bone Spear - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Spear"
					S.overlays += W1.type
				S.CanBeSlaved = 1
				S.RandomWalk()
			if(src.desc == "Orc")
				var/WeaponType = rand(1,3)
				var/mob/Monsters/Orc/S = new
				S.loc = src.loc
				S.Owner = "{NPC Orc}"
				S.name = "{NPC} Orc"
				S.Agility += 10
				S.Strength += 10
				S.Defence += 5
				var/obj/Items/Armours/ChestPlates/LeatherChestPlate/A1 = new(S)
				var/obj/Items/Armours/Legs/LeatherLeggings/A2 = new(S)
				A1.Defence = rand(4,7)
				A2.Defence = rand(4,7)
				A1.name = "Leather Armor - Normal Quality"
				A2.name = "Leather Leggings - Normal Quality"
				A1.suffix = "(Equiped)"
				A2.suffix = "(Equiped)"
				S.overlays += A1.type
				S.overlays += A2.type
				S.Defence += A1.Defence
				S.Defence += A2.Defence
				S.WearingChest = 1
				S.WearingLegs = 1
				S.weight += A1.weight
				S.weight += A2.weight
				if(WeaponType == 1)
					var/obj/Items/Weapons/Swords/GoblinSword/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Crude Sword - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Sword"
					S.overlays += W1.type
				if(WeaponType == 2)
					var/obj/Items/Weapons/Spears/Spear/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Crude Spear - Average Quality"
					W1.WeaponDamageMin = rand(5,8)
					W1.WeaponDamageMax = rand(8,12)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Spear"
					S.overlays += W1.type
				if(WeaponType == 3)
					var/obj/Items/Weapons/Axes/MetalOrcAxe/W1 = new()
					W1.loc = S
					W1.name = "Orc Axe - Average Quality"
					W1.suffix = "(Equiped)"
					W1.WeaponDamageMin = rand(6,9)
					W1.WeaponDamageMax = rand(9,14)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Axe"
					S.overlays += W1.type
				S.CanBeSlaved = 1
				S.RandomWalk()
			if(src.desc == "Goblin")
				var/WeaponType = rand(1,3)
				var/mob/Monsters/Goblin/S = new
				S.loc = src.loc
				S.Owner = "{NPC Goblin}"
				S.name = "{NPC} Goblin"
				S.Agility += 10
				S.Strength += 10
				S.Defence += 5
				var/obj/Items/Armours/ChestPlates/MetalChestPlate/A1 = new(S)
				var/obj/Items/Armours/Legs/MetalLeggings/A2 = new(S)
				A1.Defence = rand(5,8)
				A2.Defence = rand(5,8)
				A1.name = "Metal Armor - Normal Quality"
				A2.name = "Metal Leggings - Normal Quality"
				A1.suffix = "(Equiped)"
				A2.suffix = "(Equiped)"
				S.overlays += A1.type
				S.overlays += A2.type
				S.Defence += A1.Defence
				S.Defence += A2.Defence
				S.WearingChest = 1
				S.WearingLegs = 1
				S.weight += A1.weight
				S.weight += A2.weight
				if(WeaponType == 1)
					var/obj/Items/Weapons/Swords/GoblinSword/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Goblin Sword - Average Quality"
					W1.WeaponDamageMin = rand(8,12)
					W1.WeaponDamageMax = rand(12,15)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Sword"
					S.overlays += W1.type
				if(WeaponType == 2)
					var/obj/Items/Weapons/Spears/MetalSpear/W1 = new()
					W1.loc = S
					W1.suffix = "(Equiped)"
					W1.name = "Goblin Spear - Average Quality"
					W1.WeaponDamageMin = rand(8,12)
					W1.WeaponDamageMax = rand(12,15)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Spear"
					S.overlays += W1.type
				if(WeaponType == 3)
					var/obj/Items/Weapons/Maces/MetalMace/W1 = new()
					W1.loc = S
					W1.name = "Goblin Mace - Average Quality"
					W1.suffix = "(Equiped)"
					W1.WeaponDamageMin = rand(8,12)
					W1.WeaponDamageMax = rand(12,15)
					S.WeaponDamageMin += W1.WeaponDamageMin
					S.WeaponDamageMax += W1.WeaponDamageMax
					S.weight += W1.weight
					S.HoldingWeapon = "Mace"
					S.overlays += W1.type
				S.CanBeSlaved = 1
				S.RandomWalk()
		src.Spawner()
obj/proc/DeleteItem()
	if(src.suffix)
		src.Content3 = 0
		return
	if(src.Content3 <= 3)
		src.Content3 += 1
	if(src.Content3 >= 3)
		del(src)
		return
	spawn(1000) DeleteItem()


obj/proc/StandardGeneratePoints()
	for(var/mob/M in world)
		if(src in M)
			var/mob/X = M.Owner
			if(X.Faction == src.Owner)
				for(var/mob/K in world)
					if(K.IsClanLeader == 1)
						K.Points += 5
				X.Points += 1
			if(X.Faction != src.Owner)
				for(var/obj/Items/Shafts/Standard/S in M)
					if(S != src)
						for(var/mob/K in world)
							if(K.IsClanLeader == 1)
								if(K.Faction == src.Owner)
									K.Points -= 2.5
								if(K.Faction == X.Faction)
									K.Points += 10
	spawn(600)
		src.StandardGeneratePoints()
obj/proc/CursedItem()
	spawn(6000)
	if(src.suffix == null)
		del(src)
	else
		spawn(1) CursedItem()
obj/proc/FireballPathfinder()
	if(src.loc == src.destination)
		for(var/mob/Monsters/K in view(3,src))
			K.Fire()
		for(var/turf/grounds/G in view(3,src))
			G.Firestorm()
		del src
		return
	if(src.destination == null)
		for(var/mob/Monsters/K in view(3,src))
			K.Fire()
		for(var/turf/grounds/G in view(3,src))
			G.Firestorm()
		del src
		return
	step_towards(src,src.destination)
	spawn(2)
		src.FireballPathfinder()
obj/proc/ShockwavePathfinder()
	if(src.Content3 >= 0)
		src.Content3 -= 1
		for(var/mob/Monsters/M in range(0,src))
			step_towards(M,src.dir)
			M.StunnedWalk()
		for(var/turf/T in range(0,src))
			if(T.icon_state != "Lava" && T.icon_state != "water")
				T.name = "cavefloor"
				T.icon = 'Cave.dmi'
				T.icon_state = "CaveFloor"
				T.CanDigAt = 0
				T.density = 0
				T.CanFish = 0
				T.Detailed = 0
				T.Content3 = null
				T.opacity = 0
				T.Sky = 1
		step_towards(src,src.dir)
		if(src.dir == 9)
			var/obj/shockwave/S1 = new
			var/obj/shockwave/S2 = new
			S1.Content3 = src.Content3
			S2.Content3 = src.Content3
			S1.loc = src.loc
			S2.loc = src.loc
			S1.x += 1
			S2.y -= 1
			S1.dir = 2
			S2.dir = 8
			S1.ShockwavePathfinder()
			S2.ShockwavePathfinder()
		if(src.dir == 5)
			var/obj/shockwave/S1 = new
			var/obj/shockwave/S2 = new
			S1.Content3 = src.Content3
			S2.Content3 = src.Content3
			S1.loc = src.loc
			S2.loc = src.loc
			S1.x -= 1
			S2.y -= 1
			S1.dir = 1
			S2.dir = 4
			S1.ShockwavePathfinder()
			S2.ShockwavePathfinder()
		if(src.dir == 10)
			var/obj/shockwave/S1 = new
			var/obj/shockwave/S2 = new
			S1.Content3 = src.Content3
			S2.Content3 = src.Content3
			S1.loc = src.loc
			S2.loc = src.loc
			S1.x += 1
			S2.y += 1
			S1.dir = 2
			S2.dir = 8
			S1.ShockwavePathfinder()
			S2.ShockwavePathfinder()
		if(src.dir == 6)
			var/obj/shockwave/S1 = new
			var/obj/shockwave/S2 = new
			S1.Content3 = src.Content3
			S2.Content3 = src.Content3
			S1.loc = src.loc
			S2.loc = src.loc
			S1.x -= 1
			S2.y += 1
			S1.dir = 2
			S2.dir = 4
			S1.ShockwavePathfinder()
			S2.ShockwavePathfinder()
		spawn(3)
			src.ShockwavePathfinder()
	else
		for(var/mob/Monsters/M in range(0,src))
			step_towards(M,src.dir)
			M.BloodContent -= 150
			M.BloodLoss()
		del src
mob/proc
	textlist(var/textlist)
		writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)
	Text(mob/m,var/x,var/y,var/offx,var/offy,var/t)
		if(m.key!=null)
			textlist(t)
			for(var/w in writing)
				var/obj/HUD/Text/s=new(m.client)
				s.screen_loc="[x]:[offx],[y]:[offy]"
				s.icon_state=w
				s.name="\proper[w]"
				offx+=8
				if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}
var/writing
mob/proc/FrogResetTarget()
	src.Stunned = 0
	src.Fainted = 0
	if(src.CanBeSlaved == 1)
		src.destination = null
		src.AttackTarget = null
	else
		return
	spawn(300) FrogResetTarget()
mob/proc/PillarPowerup()
	for(var/obj/PowerupPillar/P in world)
		var/mob/M = src.Owner
		if(M.Faction == P.Content2)
			src.Strength += P.AM
			src.EXP += P.Content3
			src.Agility += P.Agility
			src.Defence += P.Defence
			src.Intelligence += P.Intelligence
			src.weightmax += P.weightmax
mob/proc/WerewolfTransformation()
	var/mob/W = src
	if(W.Werewolf == 1)
		if(W.Level < 40)
			if(night == 1)
				if(W.Werepowers == 0)
					for(var/obj/Items/Weapons/W2 in W)
						if(W.suffix == "(Equiped)")
							W.WeaponDamageMin -= W2.WeaponDamageMin
							W.WeaponDamageMax -= W2.WeaponDamageMax
							W2.suffix = "(Carrying)"
					for(var/obj/Items/Armours/A2 in W)
						if(A2.suffix == "(Equiped)")
							W.Defence -= A2.Defence
							A2.suffix = "(Carrying)"
					W.EventMode = W.Defence
					W.SavedIcon = W.icon
					W.icon = 'Werewolf.dmi'
					W.Werepowers = 1
					W.HoldingWeapon = "Claws"
					W.overlays -= W.overlays
					W.Defence += 150
					W.Defence += W.Level * 2
					if(W.Agility <= 130 && W.Strength <= 130)
						W.Agility += 20
						W.Strength += 20
					W.WearingShield = 1
					W.WearingChest = 1
					W.WearingLegs = 1
					W.WearingRightArm = 1
					W.WearingLeftArm = 1
					W.WearingHelmet = 1
					W.WearingCape = 1
					W.WearingFullPlateHelm = 1
					W.WearingBack = 1
					W.WeaponDamageMin += 25
					W.WeaponDamageMax += 35
					W.WeaponDamageMin += W.Level
					W.WeaponDamageMax += W.Level
			if(night == 0)
				if(W.Werepowers == 1 && W.Level < 40)
					W.Werepowers = 0
					W.HoldingWeapon = 0
					W.WearingShield = 0
					W.WearingChest = 0
					W.WearingLegs = 0
					W.WearingRightArm = 0
					W.WearingLeftArm = 0
					W.WearingHelmet = 0
					W.WearingCape = 0
					W.WearingFullPlateHelm = 0
					W.WearingBack = 0
					W.Defence = W.EventMode
					W.WeaponDamageMin = 0
					W.WeaponDamageMax = 0
					for(var/obj/Items/Armours/J in W)
						if(J.suffix == "(Equiped)")
							J.suffix = "(Carrying)"
					for(var/obj/Items/Weapons/ET in W)
						if(ET.suffix == "(Equiped)")
							ET.suffix = "(Carrying)"
					if(W.Agility <= 119)
						W.Agility -= 20
					if(W.Strength <= 119)
						W.Strength -= 20
					W.icon = W.SavedIcon
			spawn(20)
				src.WerewolfTransformation()
mob/proc/Meditation()
	var/mob/M = src
	if(M.Meditating == 1)
		M.Target = null
		M.BowOn = 0
		var/Will = prob(35)
		var/Anger = prob(35)
		var/Concentration = prob(30)
		var/Mind = prob(30)
		var/Mana = prob(40)
		if(M.MagicalWill >= 50)
			Will = 0
		if(M.MagicalAnger >= 50)
			Anger = 0
		if(M.MagicalConcentration >= 50)
			Concentration = 0
			Mana = prob(75)
		if(M.MagicalMind >= 50)
			Mind = 0
		if(M.MaxMana >= 250)
			Mana = 0
		M.CanWalk = 0
		M.destination = null
		spawn(200)
			if(Will)
				if(M.MagicalWill <= 50)
					M.MagicalWill += 1
					M.Owner << "[M] has gained insight into the force of Will and its controlling influence on reality."
					if(M.Svartalfar == 1)
						M.MagicalWill += 1
				if(M.MagicalWill >= 50)
					M.Owner << "[M] cannot get any better at Will."
					M.MagicalWill = 50
			if(Anger)
				if(M.MagicalAnger <= 50)
					M.Owner << "[M] has gained an insight into the effects of fury in destruction, strength and power."
					M.MagicalAnger += 1
					if(M.Svartalfar == 1)
						M.MagicalAnger += 1
				if(M.MagicalAnger >= 50)
					M.Owner << "[M] cannot get any better at Anger."
					M.MagicalAnger = 50
			if(Mind)
				if(M.MagicalMind <= 50)
					M.Owner << "[M] has gained an insight into the effects of *Thought* and *Mind* on others and itself."
					M.MagicalMind += 1
					if(M.Svartalfar == 1)
						M.MagicalMind += 1
				if(M.MagicalMind >= 50)
					M.Owner << "[M] cannot get any better at Mind."
					M.MagicalMind = 50
			if(Concentration)
				if(M.MagicalConcentration <= 50)
					M.Owner << "[M] has expanded its abilities of concentrating on the world around it and gains a small amount of experience along with this."
					M.EXP += 15
					M.MagicalConcentration += 1
					if(M.Svartalfar == 1)
						M.EXP += 15
						M.MagicalConcentration += 1
				if(M.MagicalConcentration >= 50)
					M.Owner << "[M] cannot get any better at Concentration."
					M.MagicalConcentration = 50
			if(Mana)
				if(M.MaxMana <= 250)
					M.Owner << "[M] has increased the amount of magical energy they can store for later use!"
					M.MaxMana += 1.5
					if(M.Svartalfar == 1)
						M.MaxMana += 1.5
				else
					M.Owner << "[M] cannot store any more Mana"
			M.Meditation()
	else
		M.Owner << "[M] finishes meditating and stands up."
		M.CanWalk = 1
mob/proc/TearSkins()
	var/mob/M = src.loc
	if(src.Race == "Dragon")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Dragon"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Race == "Elf")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Elf"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Race == "Orc")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Orc"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Race == "Svartalfar")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Svartalfar"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Race == "Gremlin")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Gremlin"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Demon == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Demon"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
	if(src.Mole == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Mole"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.FrogMan == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Frogman"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Infects == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Zombie"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Race == "Naga")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Naga"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"

	if(src.LizardMan == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Lizardman"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Plantman == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Plantman"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Gargoyle == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Gargoyle"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Ratmen == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Ratman"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Werewolf == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Werewolf"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Spider == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Spider"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Wolf == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Wolf"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Vampire == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Vampire"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Race == "Illithid")
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Illithid"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Deer == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Deer"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Human == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				if(src.Black == 0)
					var/obj/Items/Skins/Skin/DS = new
					DS.loc = M.loc
					DS.Content2 = "Human"
					DS.name = "[DS.Content2] Skin"
					DS.icon_state = "[DS.Content2] Skin"
					M.SkinningSkill += 1
					return
				if(src.Black == 1)
					var/obj/Items/Skins/Skin/DS = new
					DS.loc = M.loc
					DS.Content2 = "Human"
					DS.name = "[DS.Content2] Skin"
					DS.icon_state = "[DS.Content2] Skin Black"
					M.SkinningSkill += 1
					return
		else
			usr << "This has already been skinned!"
		return
	if(src.Goblin == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Goblin"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
	if(src.Kobold == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Kobold"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return



		else
			usr << "This has already been skinned!"
		return
	if(src.Dwarf == 1)
		if(src.Skinned == 0)
			src.Skinned = 1
			if(M.SkinningSkill)
				var/obj/Items/Skins/Skin/DS = new
				DS.loc = M.loc
				DS.Content2 = "Dwarf"
				DS.name = "[DS.Content2] Skin"
				DS.icon_state = "[DS.Content2] Skin"
				M.SkinningSkill += 1
				return

		else
			usr << "This has already been skinned!"
		return
mob/proc/TearMeats()
	var/mob/M = src.loc
	if(src.Werepowers == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Werewolf"
			DS.name = "Werewolf Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]'s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]'s Head"
			B2.icon_state = "WerewolfHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Vampire == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Vampire"
			DS.name = "Vampire Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "VampireHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Infects == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Zombie"
			DS.name = "Zombie Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "ZombieHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.LizardMan == 1 && src.FrogMan == 0)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Lizardman"
			DS.name = "Lizardman Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Glands/PoisonGland/PG = new
			PG.loc = M.loc
			PG.Poisoned = 1
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]'s Head"
			B2.Intelligence = src.Intelligence
			B2.icon_state = "LizardHead"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Naga")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Naga"
			DS.name = "Naga Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]'s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]'s Head"
			B2.icon_state = "NagaHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Elf")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Elf"
			DS.name = "Elf Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]'s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]'s Head"
			B2.icon_state = "ElfHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Dragon")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Dragon"
			DS.name = "Dragon Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]'s Bones"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Ratmen == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Ratman"
			DS.name = "Ratman Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "RatHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Plantman == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "PlantHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Gargoyle == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/ores/stone/B = new
			B.loc = M.loc
			B.name = "[src.name]'s Stone"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "GargoyleHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Orc")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Orc"
			DS.name = "Orc Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "OrcHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Gremlin")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Gremlin"
			DS.name = "Gremlin Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "GremlinHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Race == "Illithid")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Illithid"
			DS.name = "Illithid Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "IllithidHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Demon == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Demon"
			DS.name = "Demon Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "DemonHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Wolf == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Wolf"
			DS.name = "Wolf Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Skull/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Skull"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.FrogMan == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Frogman"
			DS.name = "Frogman Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "FrogManHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.Race == "Svartalfar")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Svartalfar"
			DS.name = "Svartalfar Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "SvartalfarHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.Deer == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Deer"
			DS.name = "Deer Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Skull/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Skull"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.icon_state == "CaveFish")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Cavefish"
			DS.name = "Cavefish Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.icon_state == "TFish")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Tropical Fish"
			DS.name = "Tropical Fish Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.icon_state == "BlowFish")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Blowfish"
			DS.name = "Blowfish Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return


	if(src.Fish == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Fish"
			DS.name = "Fish Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src]s Bones"
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return



	if(src.Kobold == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Kobold"
			DS.name = "Kobold Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "KoboldHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.Goblin == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Goblin"
			DS.name = "Goblin Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "GoblinHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return


	if(src.Dwarf == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Dwarf"
			DS.name = "Dwarf Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "HumanHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Illithid == 1 && src.Race == "Illithid")
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Illithid"
			DS.name = "Illithid Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			var/obj/Items/Bones/Head/B2 = new
			B2.loc = M.loc
			B2.name = "[src.name]s Head"
			B2.icon_state = "IllithidHead"
			B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return
	if(src.Human == 1)
		if(M.ButcherySkill >= 1)
			var/obj/Items/Food/Meats/UnCookedMeat/DS = new
			DS.loc = M.loc
			DS.Content2 = "Human"
			DS.name = "Human Meat"
			var/obj/Items/Bones/Bones/B = new
			B.loc = M.loc
			B.name = "[src.name]s Bones"
			if(src.Black == 0)
				var/obj/Items/Bones/Head/B2 = new
				B2.loc = M.loc
				B2.name = "[src.name]s Head"
				B2.icon_state = "HumanHead"
				B2.Intelligence = src.Intelligence
			if(src.Black == 1)
				var/obj/Items/Bones/Head/B2 = new
				B2.loc = M.loc
				B2.name = "[src.name]s Head"
				B2.icon_state = "HumanHeadBlack"
				B2.Intelligence = src.Intelligence
			M.ButcherySkill += 1
			M.weight -= src.weight
			del(src)
			return

	if(src.Spider == 1)
		var/S
		S = prob(30)
		if(S == 1)
			var/obj/Items/Silks/SpiderSilk/SS = new
			SS.loc = M.loc
		var/obj/Items/Food/Meats/UnCookedMeat/DS = new
		DS.Content2 = "Spider"
		DS.name = "Spider Meat"
		DS.loc = M.loc
		var/obj/Items/Glands/PoisonGland/PG = new
		PG.loc = M.loc
		PG.Poisoned = 1
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
	if(src.Bug == 1)
		var/Silk
		Silk = prob(10)
		if(Silk == 1)
			var/obj/Items/Silks/SpiderSilk/S = new
			S.loc = M.loc
		var/obj/Items/Food/Meats/UnCookedMeat/DS = new
		DS.loc = M.loc
		DS.Content2 = "Bug"
		DS.name = "Bug Meat"
		var/obj/Items/Glands/PoisonGland/PG = new
		PG.loc = M.loc
		PG.Poisoned = 1
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
	if(src.Race == "Plant")
		var/obj/Items/Glands/PoisonRoots/PG = new
		PG.loc = M.loc
		var/obj/Items/Seeds/CarnivorousPlantSeed/PG2 = new
		PG2.loc = M.loc
		var/obj/Items/Seeds/CarnivorousPlantSeed/PG3 = new
		PG3.loc = M.loc
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
	if(src.Race == "Plant2")
		var/obj/Items/Glands/PoisonRoots/PG = new
		PG.loc = M.loc
		var/obj/Items/Seeds/PoisonSporeSeed/PG2 = new
		PG2.loc = M.loc
		var/obj/Items/Seeds/PoisonSporeSeed/PG3 = new
		PG3.loc = M.loc
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
	if(src.Beatle == 1)
		var/obj/Items/Food/Meats/UnCookedMeat/DS = new
		DS.loc = M.loc
		DS.Content2 = "DeathBeetle"
		DS.name = "Death Beetle Meat"
		var/obj/Items/Glands/ToxicGland/PG = new
		PG.loc = M.loc
		PG.Poisoned = 1
		var/obj/Items/Bones/Shell/DS2 = new
		DS2.loc = M.loc
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
	if(src.Mole == 1)
		var/obj/Items/Food/Meats/UnCookedMeat/DS = new
		DS.loc = M.loc
		DS.Content2 = "Mole"
		DS.name = "Mole Meat"
		var/obj/Items/Bones/Skull/DS2 = new
		DS2.loc = M.loc
		DS2.name = src.name
		var/obj/Items/Bones/Bones/DS3 = new
		DS3.loc = M.loc
		DS3.name = src.name
		M.ButcherySkill += 1
		M.weight -= src.weight
		del(src)
		return
mob/proc/EquipWeapons()
	if(src.CanUseRightArm == 1)
		var/WeaponType = null
		if(src.DaggerSkill >= src.SpearSkill && src.DaggerSkill >= src.SwordSkill && src.DaggerSkill >= src.AxeSkill && src.DaggerSkill >= src.MaceSkill)
			WeaponType = "Dagger"
		else if(src.SwordSkill >= src.SpearSkill && src.SwordSkill >= src.AxeSkill && src.SwordSkill >= src.MaceSkill)
			WeaponType = "Sword"
		else if(src.SpearSkill >= src.AxeSkill && src.SpearSkill >= src.MaceSkill)
			WeaponType = "Spear"
		else if(src.AxeSkill >= src.MaceSkill)
			WeaponType = "Axe"
		else if(src.MaceSkill)
			WeaponType = "Mace"
		if(src.Gremlin == 1)
			for(var/obj/Items/Weapons/Swords/GremlinSword/W in src)
				if(src.HoldingWeapon == 0)
					src.HoldingWeapon = "Sword"
					W.loc = src
					W.suffix = "(Equiped)"
					src.overlays += W.type
					src.WeaponDamageMin += W.WeaponDamageMin
					src.WeaponDamageMax += W.WeaponDamageMax
				if(src.HoldingWeapon != 0)
					for(var/obj/Items/Weapons/W2 in src)
						if(W2.suffix == "(Equiped)")
							if(W2 != W)
								if(W.WeaponDamageMax >= W2.WeaponDamageMax)
									src.overlays -= W2.type
									src.overlays += W.type
									src.WeaponDamageMin -= W2.WeaponDamageMin
									src.WeaponDamageMax -= W2.WeaponDamageMax
									src.WeaponDamageMin += W.WeaponDamageMin
									src.WeaponDamageMax += W.WeaponDamageMax
									W2.suffix = "(Carrying)"
									W.suffix = "(Equiped)"
									src.HoldingWeapon = "Sword"
			for(var/obj/Items/Weapons/Spears/GremlinSpear/W in src)
				if(src.HoldingWeapon == 0)
					src.HoldingWeapon = "Spear"
					W.loc = src
					W.suffix = "(Equiped)"
					src.overlays += W.type
					src.WeaponDamageMin += W.WeaponDamageMin
					src.WeaponDamageMax += W.WeaponDamageMax
				if(src.HoldingWeapon != 0)
					for(var/obj/Items/Weapons/W2 in src)
						if(W2.suffix == "(Equiped)")
							if(W2 != W)
								if(W.WeaponDamageMax >= W2.WeaponDamageMax)
									src.overlays -= W2.type
									src.overlays += W.type
									src.WeaponDamageMin -= W2.WeaponDamageMin
									src.WeaponDamageMax -= W2.WeaponDamageMax
									src.WeaponDamageMin += W.WeaponDamageMin
									src.WeaponDamageMax += W.WeaponDamageMax
									W2.suffix = "(Carrying)"
									W.suffix = "(Equiped)"
									src.HoldingWeapon = "Spear"
			for(var/obj/Items/Weapons/Maces/GremlinMace/W in src)
				if(src.HoldingWeapon == 0)
					src.HoldingWeapon = "Mace"
					W.loc = src
					W.suffix = "(Equiped)"
					src.overlays += W.type
					src.WeaponDamageMin += W.WeaponDamageMin
					src.WeaponDamageMax += W.WeaponDamageMax
				if(src.HoldingWeapon != 0)
					for(var/obj/Items/Weapons/W2 in src)
						if(W2.suffix == "(Equiped)")
							if(W2 != W)
								if(W.WeaponDamageMax >= W2.WeaponDamageMax)
									src.overlays -= W2.type
									src.overlays += W.type
									src.WeaponDamageMin -= W2.WeaponDamageMin
									src.WeaponDamageMax -= W2.WeaponDamageMax
									src.WeaponDamageMin += W.WeaponDamageMin
									src.WeaponDamageMax += W.WeaponDamageMax
									W2.suffix = "(Carrying)"
									W.suffix = "(Equiped)"
									src.HoldingWeapon = "Mace"
		if(src.Gremlin == 0)
			if(WeaponType == "Dagger")
				for(var/obj/Items/Weapons/Daggers/W in src)
					var/Eq = 0
					if(W.icon_state == "HellDagger")
						if(src.DaggerSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellDagger")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Dagger"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Dagger"
			if(WeaponType == "Sword")
				for(var/obj/Items/Weapons/Swords/W in src)
					var/Eq = 0
					if(W.icon_state == "HellSword")
						if(src.SwordSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellSword")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Sword"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Sword"
			if(WeaponType == "Spear")
				for(var/obj/Items/Weapons/Spears/W in src)
					var/Eq = 0
					if(W.icon_state == "HellSpear")
						if(src.SpearSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellSpear")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Spear"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Spear"
			if(WeaponType == "Axe")
				for(var/obj/Items/Weapons/Axes/W in src)
					var/Eq = 0
					if(W.icon_state == "HellAxe")
						if(src.AxeSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellAxe")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Axe"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Axe"
			if(WeaponType == "Mace")
				for(var/obj/Items/Weapons/Spears/W in src)
					var/Eq = 0
					if(W.icon_state == "HellMace")
						if(src.MaceSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellMace")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Mace"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Mace"
			if(src.HoldingWeapon == 0)
				for(var/obj/Items/Weapons/Daggers/W in src)
					var/Eq = 0
					if(W.icon_state == "HellDagger")
						if(src.DaggerSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellDagger")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Dagger"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Dagger"
				for(var/obj/Items/Weapons/Swords/W in src)
					var/Eq = 0
					if(W.icon_state == "HellSword")
						if(src.SwordSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellSword")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Sword"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Sword"
				for(var/obj/Items/Weapons/Spears/W in src)
					var/Eq = 0
					if(W.icon_state == "HellSpear")
						if(src.SpearSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellSpear")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Spear"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Spear"
				for(var/obj/Items/Weapons/Axes/W in src)
					var/Eq = 0
					if(W.icon_state == "HellAxe")
						if(src.AxeSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellAxe")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Axe"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Axe"
				for(var/obj/Items/Weapons/Maces/W in src)
					var/Eq = 0
					if(W.icon_state == "HellMace")
						if(src.MaceSkill >= 150)
							Eq = 1
					if(W.icon_state != "HellMace")
						Eq = 1
					if(Eq == 1)
						if(W.icon != 'Gremlin Equipment.dmi')
							if(src.HoldingWeapon == 0)
								src.HoldingWeapon = "Mace"
								W.loc = src
								W.suffix = "(Equiped)"
								src.overlays += W.type
								src.WeaponDamageMin += W.WeaponDamageMin
								src.WeaponDamageMax += W.WeaponDamageMax
							if(src.HoldingWeapon != 0)
								for(var/obj/Items/Weapons/W2 in src)
									if(W2.suffix == "(Equiped)")
										if(W2 != W)
											if(W.WeaponDamageMax >= W2.WeaponDamageMax)
												src.overlays -= W2.type
												src.overlays += W.type
												src.WeaponDamageMin -= W2.WeaponDamageMin
												src.WeaponDamageMax -= W2.WeaponDamageMax
												src.WeaponDamageMin += W.WeaponDamageMin
												src.WeaponDamageMax += W.WeaponDamageMax
												W2.suffix = "(Carrying)"
												W.suffix = "(Equiped)"
												src.HoldingWeapon = "Mace"
mob/proc/AntBehavior()
	if(src.Gender == "Queen")
		if(src.z != 3 && src.z != 4)
			for(var/turf/T in view(src))
				if(T.GoesTo != null)
					var/mob/Monsters/Avatar/A = new(T.GoesTo)
					if(A.z == 3)
						src.destination = T
					del A
		for(var/mob/Monsters/M in view(src))
			if(M.Owner != src.Owner)
				view(src) << "[src] lets out an alarm cry!"
				for(var/mob/Monsters/M2 in range(30,src))
					if(M2.Owner == src.Owner)
						M2.destination = M
	if(src.Gender == "Soldier")
		for(var/mob/Monsters/M in view(src))
			if(M.Owner != src.Owner)
				src.destination = M
				for(var/mob/Monsters/M2 in range(20,src))
					if(M2.Owner == src.Owner)
						if(M2.Gender == "Soldier")
							M2.destination = M
mob/proc/RandomBlink()
	var/Timer = rand(100,6000)
	if(src.x <= 950 && src.x >= 50)
		if(src.y <= 950 && src.y >= 50)
			view(src) << "[src] phases!"
			src.x += rand(-30,30)
			src.y += rand(-30,30)
			src.Owner << "[src] has phased to [src.x],[src.y],[src.z]"
	spawn(Timer)
		RandomBlink()
mob/proc/CacoonTrap()
	for(var/mob/Monsters/X in range(4,src))
		var/OGB = 0
		if(X.Owner != src.Owner)
			if(X.Humanoid == 1 && X.Mole == 0 && X.Beatle == 0 && X.Wolf == 0 && X.Deer == 0 && X.IsTree == 0)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.key in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0)
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
mob/proc/SolarPowered()
	if(night == 0)
		src.Hunger += 1
		if(src.Hunger >= 100)
			src.Hunger = 100
		src.Mana += 1
		if(src.Mana >= src.MaxMana)
			src.Mana = src.MaxMana
		src.Tiredness += 0.5
		if(src.Tiredness >= 100)
			src.Tiredness = 100
	spawn(100)
		src.SolarPowered()
mob/proc/ResetTarget()
	if(src.CanBeSlaved)
		src.destination = null
		src.AttackTarget = null
		src.BowOn = 0
	else
		return
	spawn(300) ResetTarget()
mob/proc/Running()
	spawn(300)
		src.Delay += 1
		view() << "[src] stops running!"
		spawn(100)
		src.Running = 0
mob/proc/RanWalk()
	if(src.InHole == 0)
		if(src.CanWalk)
			if(src.destination == null)
				step_rand(src)
				for(var/mob/Monsters/M in view(4,src))
					if(M.Owner == src.Owner)
						..()
					else
						if(M.CantKill == 0)
							src.destination = M
							src.AttackTarget = M
			if(destination)
				step_towards(src,src.destination)


	spawn(5) RanWalk()


mob/proc/RanWalkPassive()
	if(src.InHole == 0)
		if(src.CanWalk)
			if(src.destination == null)
				step_rand(src)
			if(destination)
				step_towards(src,src.destination)


	spawn(5) RanWalkPassive()

mob/proc/RandomWalk()
	var/OOO = 0
	var/SpecialPower = 0
	if(src.CanBeSlaved == 1)
		if(src.InHole == 0)
			if(src.CanWalk)
				if(src.Illithid == 1)
					SpecialPower = prob(1.5)
					if(SpecialPower == 1)
						for(var/mob/Monsters/XX in range(7,src))
							if(XX.Owner != src.Owner)
								view(src) << "[src] concentrates a mental blast at [XX]!"
								XX.BrainHP -= rand(1,6)
								if(XX.BrainHP <= 0)
									XX.GoingToDie = 1
									XX.DeathType = "Brain Hemorrhage"
									XX.Killer = src
									XX.Death()
								break
							break
				if(src.destination)
					if(src.destination in range(10,src))
						step_towards(src,src.destination)
					else
						src.destination = null
				if(src.destination == null)
					step_rand(src)
					for(var/mob/Monsters/M in view(4,src))
						if(M.Owner == src.Owner && M.Sneak == 0)
							..()
						else
							if(src == M.InfectedBy)
								..()
							else if(M.CantKill == 0)
								if(M.Infects == 1 && src.Infects == 1)
									if(src.NPCZombieStat == 1 && M.NPCZombieStat == 1)
										..()
									else
										src.destination = M
										src.AttackTarget = M
								else
									src.destination = M
									src.AttackTarget = M
					for(var/obj/Items/I in view(1,src))
						OOO = 1
					if(OOO == 1)
						if(src.WearingChest == 0)
							for(var/obj/Items/Armours/ChestPlates/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingChest = 1
									src.overlays += A.type
									break
						if(src.WearingHelmet == 0)
							for(var/obj/Items/Armours/Helmets/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingHelmet = 1
									src.overlays += A.type
									break
						if(src.WearingLegs == 0)
							for(var/obj/Items/Armours/Legs/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingLegs = 1
									src.overlays += A.type
									break
						if(src.WearingCape == 0)
							for(var/obj/Items/Armours/NeckGuards/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingCape = 1
									src.overlays += A.type
									break
						if(src.WearingRightArm == 0)
							for(var/obj/Items/Armours/RightArms/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingRightArm = 1
									src.overlays += A.type
									break
						if(src.WearingLeftArm== 0)
							for(var/obj/Items/Armours/LeftArms/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingLeftArm = 1
									src.overlays += A.type
									break
						if(src.WearingShield == 0)
							for(var/obj/Items/Armours/Shields/A in view(1,src))
								if(src.weight <= src.weightmax)
									A.loc = src
									src.weight += A.weight
									A.suffix = "(Equiped)"
									src.Defence += A.Defence
									src.WearingShield = 1
									src.overlays += A.type
									break
						if(src.HoldingWeapon == 0)
							for(var/obj/Items/Weapons/W in view(1,src))
								if(src.weight <= src.weightmax)
									W.loc = src
									src.weight += W.weight
									W.suffix = "(Equiped)"
									src.WeaponDamageMin += W.WeaponDamageMin
									src.WeaponDamageMax += W.WeaponDamageMax
									for(var/obj/Items/Weapons/Axes/A in src)
										if(A == W)
											src.HoldingWeapon = "Axe"
									for(var/obj/Items/Weapons/Swords/A in src)
										if(A == W)
											src.HoldingWeapon = "Sword"
									for(var/obj/Items/Weapons/Spears/A in src)
										if(A == W)
											src.HoldingWeapon = "Spear"
									for(var/obj/Items/Weapons/Maces/A in src)
										if(A == W)
											src.HoldingWeapon = "Mace"
									src.overlays += W.type
									break
					if(src.Function != null)
						for(var/mob/Monsters/G in world)
							if(src.Function == G)
								src.destination = G.destination
								src.AttackTarget = G.AttackTarget

	else
		src.WalkTo()
		return
	spawn(6) RandomWalk()
obj/proc/Portal()
	for(var/mob/M in view(0,src))
		if(M.loc != locate(M.x,M.y,4))
			M.loc = locate(M.x,M.y-1,4)
			M.destination = null
			var/C = prob(15)
			var/P = prob(25)
			if(M.client == null)
				if(C)
					if(M.CanSee)
						if(M.Wagon == 0 && M.Spider == 0 && M.Demon == 0 && M.Vampire == 0 && M.Gargoyle == 0 && M.Race != "Demon" && M.Race != "Dragon" && M.HalfDemon == 0 && M.Unholy == 0 && M.Illithid == 0)
							M.Owner << "[M] goes insane from the horror and tears their own eyes out!"
							M.HasLeftEye = 0
							M.HasRightEye = 0
							M.CanSee = 0
							M.RightEyeHP = 0
							M.LeftEyeHP = 0
							M.LeftEye = "Destroyed"
							M.RightEye = "Destroyed"
				if(C == 0)
					if(P)
						if(ismob(M.Owner))
							if(M.Wagon == 0)
								if(M.Spider == 0)
									if(M.Vampire == 0 && M.Demon == 0 && M.Gargoyle == 0 && M.Race != "Demon" && M.HalfDemon == 0 && M.Race != "Dragon" && M.Illithid == 0)
										M.Owner << "[M] is possessed by the demonic forces surrounding the portal!"
										M.TurnDemon()
		else
			M.loc = locate(M.x,M.y-1,src.Content)
			M.destination = null
	spawn(10)
		Portal()
		return
obj/proc/PlantRegen()
	if(src.Content <= 4)
		src.Content += 1
		if(src.Content >= 1)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant5"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant5"
		if(src.Content >= 2)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant4"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant4"
		if(src.Content >= 3)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant3"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant3"
		if(src.Content >= 4)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant2"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant2"
		if(src.Content >= 5)
			if(src.Content3 == "Grape")
				src.icon_state = "PPlant1"
			if(src.Content3 == "Tomato")
				src.icon_state = "Plant1"
	spawn(1200)
		src.PlantRegen()
		return
obj/proc/Spawn()
	if(src.Content >= 0)
		var/mob/Monsters/DemonNPC/D = new
		D.loc = src.loc
		src.Content -= 1
	else
		src.Portal()
		return
	spawn(200) Spawn()
obj/proc/AstralPortal()
	for(var/mob/M in view(0,src))
		var/obj/AstralPortal/A
		M.loc = A.GoesTo
mob/proc/FindItems()
	for(var/obj/Items/I in view(6,src))
		if(I.suffix == null)
			if(I.Door == 0)
				if(I.IsTrap == 0)
					if(I.Content3 != "Cage")
						if(src.Target == null)
							src.Target = I
	for(var/obj/Items/I in view(0,src))
		if(src.Target == I)
			del(I)
	if(src.Target)
		var/obj/A = src.Target
		if(A.suffix == null)
			step_towards(src,src.Target)
		else
			src.Target = null
	else
		step_rand(src)
	spawn(10) FindItems()

mob/proc/TurnOffAttack()
	src.destination = null
	spawn(500) TurnOffAttack()

mob/proc/PetFollow()
	if(destination)
		step_towards(src,src.destination)

	else
		return
	spawn(5) PetFollow()


mob/proc/Ready()
	src.Owner << "<b><font color=purple>[src]'s egg sack begins to swell she may now create a lair!"
	src.icon = 'SpiderQueenMature.dmi'
	src.icon_state = "Normal"
	src.MaxWebContent += 100
	src.WebContent = src.MaxWebContent
	src.CanBreed = 1

mob/proc/CheckSpiderHunterAge()
	if(src.CanGrowShell == 1)
		if(src.Defence <= 90)
			src.Defence += 1.5
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanGrowShell == 0)
		if(src.Age >= 2)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.MakesPoison == 1)
		if(src.PoisonDMG <= 50)
			src.PoisonDMG += 0.3
	if(src.MakesPoison == 0)
		if(src.Age >= 2)
			src.MakesPoison = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] s a posion gland!"
			src.Owner << "<b><font color=purple>[src] grows a silk gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PoisonDMG = 7
			src.CanBuildSilk = 1
			src.MaxWebContent += 100
			src.WebContent = 100
			src.icon = 'SpiderHunterOlder.dmi'
			src.icon_state = "Normal"
mob/proc/CheckSpiderWorkerAge()
	if(src.MakesPoison == 1)
		if(src.PoisonDMG <= 50)
			src.PoisonDMG += 0.3
	if(src.MakesPoison == 0)
		if(src.Age >= 2)
			src.MakesPoison = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] grows a posion gland!"
			src.Owner << "<b><font color=purple>[src] grows a silk gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PoisonDMG = 3
			src.CanBuildSilk = 1
			src.MaxWebContent += 100
			src.WebContent = 100
			src.IsYoungWorker = 0
			src.icon = 'SpiderWorkerOlder.dmi'
			src.icon_state = "Normal"
			src.CanLayEggs = 1
mob/proc/CheckSpiderWarriorAge()
	if(src.CanGrowShell == 1)
		if(src.Defence <= 100)
			src.Defence += 2
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanGrowShell == 0)
		if(src.Age >= 2)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.MakesPoison == 1)
		if(src.PoisonDMG <= 75)
			src.PoisonDMG += 0.5
	if(src.MakesPoison == 0)
		if(src.Age >= 2)
			src.MakesPoison = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] grows a posion gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PoisonDMG = 8
			src.IsYoungWarrior = 0
			src.icon = 'SpiderWarriorOlder.dmi'
			src.icon_state = "Normal"



mob/proc/CheckSpiderAge()
	if(src.CanGrowShell == 0)
		if(src.Age >= 23)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.CanGrowShell == 1)
		if(src.Defence <= 90)
			src.Defence += 3
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanBuildSilk == 1)
		src.MaxWebContent += 15
		src.Owner << "<b><font color=purple>[src]'s glands produce more silk."
	if(src.MakesPoison == 1)
		if(src.PoisonDMG <= 75)
			src.PoisonDMG += 1
		src.Owner << "<b><font color=purple>[src]'s glands produce deadlier posion."
	if(src.IsYoungQueen == 1)
		if(src.CanBuildSilk == 0)
			if(src.Age >= 22)
				src.CanBuildSilk = 1
				src.Owner << "<b><font color=purple>[src] grows a silk gland!"
				src.WebContent = 150
				src.MaxWebContent = 150
		if(src.MakesPoison == 0)
			if(src.Age >= 23)
				src.MakesPoison = 1
				src.Owner << "<b><font color=purple>[src] grows a posion gland!"
				src.PoisonDMG = 15
				src.HasGland = 1
	if(src.IsYoungQueen == 1)
		if(src.Age >= 24)
			src.IsYoungQueen = 0
			src.IsOlderQueen = 1
			src.Owner << "<b><font color=purple>[src] grows an egg sack!"
			src.icon = 'SpiderQueenOlder.dmi'
			src.icon_state = "Normal"
			src.CanLayEggs = 1
	if(src.IsOlderQueen == 1)
		if(src.Age >= 29)
			src.IsOlderQueen = 0
			src.IsMatureQueen = 1
			src.Owner << "<b><font color=purple>[src]'s organs have matured enough so that she may breed."



mob/proc/Detail()
	for(var/mob/Monsters/M in usr.Selected)
		var/mob/Test/left = new
		left.loc = locate(M.x-1,M.y,M.z)
		for(var/turf/TUR in view(0,left))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTH
				src.destination = null
			if(TUR.dir == SOUTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == NORTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHEAST
		var/mob/Test/right = new
		right.loc = locate(M.x+1,M.y,M.z)
		for(var/turf/TUR in view(0,right))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTH
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == NORTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHWEST
		var/mob/Test/top = new
		top.loc = locate(M.x,M.y+1,M.z)
		for(var/turf/TUR in view(0,top))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = WEST
				src.destination = null
			if(TUR.dir == NORTHEAST)
				TUR.dir = WEST
			if(TUR.dir == NORTHWEST)
				TUR.dir = WEST
			if(TUR.dir == NORTH)
				TUR.dir = SOUTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = SOUTHWEST
		var/mob/Test/bot = new
		bot.loc = locate(M.x,M.y-1,M.z)
		for(var/turf/TUR in view(0,bot))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = EAST
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = EAST
			if(TUR.dir == SOUTHWEST)
				TUR.dir = EAST
			if(TUR.dir == NORTH)
				TUR.dir = NORTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = NORTHWEST
		var/mob/Test/botleft = new
		botleft.loc = locate(M.x-1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHWEST
				src.destination = null
		var/mob/Test/botright = new
		botright.loc = locate(M.x+1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHEAST
				src.destination = null
		var/mob/Test/topright = new
		topright.loc = locate(M.x+1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHEAST
				src.destination = null
		var/mob/Test/topleft = new
		topleft.loc = locate(M.x-1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHWEST
				src.destination = null
		del(topleft)
		del(topright)
		del(botright)
		del(botleft)
		del(bot)
		del(top)
		del(left)
		del(right)
mob/proc/Save()
	var/sav = "players/[src.ckey]_save.sav"
	var/savefile/S = new(sav)
	S["Kills"] << src.Kills
	S["Points"] << src.Points
	S["Faction"] << src.Faction
	S["IsClanLeader"] << src.IsClanLeader
mob/proc/Load()
	var/sav = "players/[src.ckey]_save.sav"
	if(length(file(sav)))
		var/savefile/S = new(sav)
		S["Kills"] >> src.Kills
		S["Points"] >> src.Points
		S["Faction"] >> src.Faction
		S["IsClanLeader"] >> src.IsClanLeader
mob/proc/Dig()
	if(Dig)
		if(src.Sleeping == 0)
			for(var/obj/DigAt/D in oview(src))
				if(D.Owner == src)
					if(src.DigTarget == D)
						for(var/turf/T in view(0,D))
							src.destination = T
					if(src.DigTarget == null)
						src.DigTarget = D
	else
		return
	spawn(1) Dig()
mob/proc/Heat()
	if(src)
		for(var/mob/Monsters/M in view(4,src))
			if(M)
				if(M.Coldness >= 0)
					M.Coldness = 0
		for(var/turf/grounds/KKG in view(1,src))
			if(KKG.OnFire == 0)
				if(KKG.IsWood == 1)
					var/CatchChance = prob(2)
					if(CatchChance)
						if(KKG.icon_state == "WoodWall")
							KKG.Fire()
						if(KKG.icon_state == "TribalWall")
							KKG.Fire()
						if(KKG.icon_state == "OrcWall")
							KKG.Fire()
						if(KKG in view(0,src))
							if(KKG.icon_state == "WoodFloor")
								KKG.Fire()
							if(KKG.icon_state == "OrcFloor")
								KKG.Fire()
							if(KKG.icon_state == "Tribal")
								KKG.Fire()
	spawn(75) Heat()
mob
	var
		tmp
			InfectedBy = null
			IgnoreList
			AllyList = null
			MagicTarget = null
			AttackTarget = null
			TemporaryUnitTarget = null
			BrainWasher = null
			Meditating = 0
			PracticeSkill = 0
			Puller
		EmoteLog = null
		ChatLog = null
		Kills = 0
		Faction = "Player"
		AdventureMode = 0
		UserID = 0
		Loaded = 0
		Points = 0
		Sneak = 0
		Kobo = 0
		EventMode = 0
		UnitList = null
		UnitCap = 0
		EntPortal = 0
		Heard = 0
		Seen = 0
		DMID = null
		RandomID = null
		InvisiCount = 0
		IsClanLeader = 0

		PatrolPoint1

		PatrolPoint2

		CanSpeak = 1

		Svartalfar = 0
		AttackDelay = 0

		SavedUnitStat = 0

		Waypoint = null
		Waypoint2 = null
		Waypoint3 = null


		HasLeftEye

		IsSkorn = 0



		StoleFromSkorn = 0

		IsBleeding = 0

		SaidBleed = 0

		CanUseLeftArm = 1

		CanUseRightArm = 1

		CanWalk = 1

		WalkNumber = 0

		HealNumber = 0

		AITree = 0

		Killer = null

		DeathType = null

		BloodContent = 0

		MaxBloodContent = 0

		HasRightEye

		HasRightLung

		Function = null

		HasLeftLung

		HitWings

		Wings

		WingHP = 100

		Morphed = 0

		HasSpleen

		WingsOut = 0

		CanLayEggs = 0

		HasTeeth

		HasLeftArm

		TreeTarget = null


		HasRightArm

		CanGrowShell = 0

		HasLeftLeg

		HasRightLeg

		CanBreed = 0

		HasHead

		HasLeftEar

		HasRightEar

		HasGuts

		HasStomach

		HasLeftKidney

		HasRightKidney

		HasLiver

		LoggedIn = 0

		HasBrain

		HasHeart

		SkillDMG


		HasThroat

		HasNose

		BleedType



		Stunned = 0



		Fainted



		LeftEye

		RightEye

		RightLung

		HasGland = 0

		LeftLung

		Alive = 1

		Spleen

		Teeth

		LeftArm

		RightArm

		LeftLeg

		RightLeg

		Head

		LeftEar

		RightEar

		Guts

		Stomach

		LeftKidney

		RightKidney

		CanSee = 1

		Liver

		Brain

		Heart

		Throat

		Nose

		HitHead

		HitLeftArm

		HitRightArm

		HitLeftLeg

		HitRightLeg

		HitLowerBody

		HitUpperBody

		BowOn = 0

		HitLeftEar

		HitRightEar
		EXP = 0

		HitGuts

		HitStomach

		HitLeftKidney

		HitRightKidney

		HitLiver

		HitBrain

		HitHeart

		HitThroat

		HitNose

		HitLeftEye

		HitRightEye

		HitRightLung

		HitLeftLung

		HitSpleen

		HitTeeth

		HitSkull

		LeftEyeHP = 100

		RightEyeHP = 100

		RightLungHP = 100

		LeftLungHP = 100

		SpleenHP = 100

		TeethHP = 100

		LeftArmHP = 100

		RightArmHP = 100

		LeftLegHP = 100

		RightLegHP = 100

		HeadHP = 100

		LeftEarHP = 100

		RightEarHP = 100

		SellsPotion = 0

		GutsHP = 100

		StomachHP = 100

		LeftKidneyHP = 100

		RightKidneyHP = 100

		LiverHP = 100

		BrainHP = 100

		HeartHP = 100

		ThroatHP = 100

		NoseHP = 100

		DamageType

		OrganMaxHP = 100

		TeethHPMax = 100

		CraftCount = 0

		Age = 0
		Flying = 0
		CreatedGargoyle = 0
		Unlimited = 0
		Muted = 0
		IsYoungWarrior = 0
		IsWarrior = 0
		IsHunter = 0
		StealTarget
		MakesPoison = 0
		IsYoungQueen = 0
		IsOlderQueen = 0
		IsMatureQueen = 0
		RifleSkill = 0
		PistolSkill = 0
		SavedIcon
		SandKing = 0
		SandKing2 = 0
		SandKing3 = 0
		SandKing4 = 0
		SandWorker = 0
		Snakeperson = 0
		HalfDemon = 0
		Crippled = 0
		MakesBoneCraft = 0
		Sleeping = 0
		OldIcon = null
		OldState = null
		PregnancyCount = 0
		ShieldSkill = 0
		Mana = 0
		MaxMana = 0
		NetherManCount = 0
		Egg = 0
		HammerSkill = 0
		Mutated = 0
		Shadowfiend = 0

		WearingBack = 0
		AxeSkill = 0
		CliffClimber = 0
		DaggerSkill = 0
		Delay = 4
		ButcherySkill = 0
		HoldingWeapon = 0
		Shielded = 0
		SavedHoldingWeapon = 0
		SavedOverlays = null
		LeatherCraftingSkill = 0
		Using = null
		StoneCraftingSkill = 0
		CanKill = 0
		Poisonus = 0
		Poison = 0
		CantLoseLimbs = 0
		UsesPoison = 0
		CanBuild = 1
		WearingCape = 0
		WearingLeftArm = 0
		WearingRightArm = 0
		WearingFullPlateHelm = 0
		CanBuildSilk = 0
		Fling = 0
		Caged = 0
		CanBeCaged = 0
		CanFarm = 0
		DigTarget = null
		BuildingSkill = 0

		WoodCraftingSkill = 0
		Gremlin = 0
		MagicalAptitude = 0
		MagicalWill = 0
		MagicalMind = 0
		MagicalAnger = 0
		MagicalConcentration = 0
		HoldingOffHandWeapon = 0
		DodgeDelay = 0
		AltarCount = 0
		Werepowers = 0
		ImmuneToMagic = 0
		ImmuneToTemperature = 0
		ColdBlooded = 0
		HardSkin = 0
		CannotLoseLimbs = 0
		CommonCold = 0
		BlackPlague = 0
		Berserking = 0
		DefensiveFight = 0
		BlackDeath = 0
		ImmuneToVampire = 0
		IsEvilGod = 0
		IsGoodGod = 0
		IsNeutralGod = 0
		ActivityCounter = 0
		RPGodName = null
		IsNPC = 0
		VampPick = 0
		WorshipPoints = 0
		CommonColdInfection = 0
		SavedDest = 0
		DigestingPrey = 0
		MetalCraftingSkill = 0
		NotInLight = 0
		SkinningSkill = 0
		SpecialUnit = 0
		SmeltingSkill = 0
		NecromancySkill = 0
		GargRuby = 0
		GargEmerald = 0
		HolySkill = 0
		SummoningSkill = 0
		DestructionSkill = 0
		AstralSkill = 0
		ChaosSkill = 0
		SpearSkill = 0
		SunSafe = 0
		speeding = 0
		Running = 0
		OldOwner = null
		SettingAIWood = 0
		ReturnOwner = null
		IsYoungHunter = 0
		OnGuard = 0
		SaveToggle1 = 0
		WebContent = 0
		MaxWebContent = 0
		Queen = 0
		FishingSkill = 0
		HasWings = 0
		Level = 0
		PlantCounter = 0
		IsWorker = 0
		DayWalker = 0
		Infects = 0
		DelayedSummoning = 0
		IsTrader = 0
		ImmunePoison = 0
		ListOn = 0
		LoggedOut = 0
		StoleFromDwarfs = 0
		StoleFromKobolds = 0
		StoleFromGoblins = 0
		Cantame = 0
		CantBeSummoned = 0
		Mum = null
		Dad = null
		TheDad = null
		Bullets = 0
		ReturningHome = 0
		AttackModeOn = 1
		ForgingSkill = 0
		JewlCraftingSkill = 0
		BoneCraftingSkill = 0
		SneakingSkill = 0
		KingLeader = null
		QueenLeader = null
		DieAge = 0
		ImmuneToDevourer = 0
		HasKing = 0
		HasQueen  = 0
		PoisonHits = 0
		FangsHit = 0
		MaceSkill = 0
		Strength
		WearingLegs = 0
		WearingSilver = 0
		PreviousOwner = null
		WillJoin = 0
		TalkingTo
		PotionSkill = 0
		EXPNeeded = 100
		LockPickingSkill = 0
		Intelligent = 0
		Unholy = 0
		EggContent = 0
		IsDragon = 0
		FireDrake = 0
		IceDrake = 0
		SandDrake = 0
		ColdBreath = 0
		PoisonDrake = 0
		ZombieDrake = 0
		WaterDrake = 0
		DarkDrake = 0
		HolyDrake = 0
		MagmaDrake = 0
		FirePoints = 0
		IcePoints = 0
		GoldPoints = 0
		DarkPoints = 0
		SandPoints = 0
		PoisonPoints = 0
		MagmaPoints = 0
		ZombiePoints = 0
		WaterPoints = 0
		Humanoid
		Freeze = 0
		HasPick = 0
		UsesPicks = 0
		Hunger = 100
		WearingHelmet = 0
		WearingRing = 0
		MaxHunger = 100
		UnArmedSkill = 0
		HomeLoc = null
		Tiredness = 100
		FutureOwner = null
		BoneCraft = 0
		BreedLimit = 0
		WearingShield = 0
		Leave = 0
		CookingSkill = 0
		LaysAdvancedEggs = 0
		Preg = 0
		BrainWashed = 100
		Rares = null
		Address = null
		MineingSkill = 0
		WoodCuttingSkill = 0
		Guardstone = 0
		IsTroll = 0

var/RP_Status
var/LoginMessage="Welcome to Dungeon Master Extended+!"
var/AdminMOTD="This is the Admin MOTD."

atom
	var
		tmp
			Target
			NeutralGodOwner
			Owner
		LastLoc = null
		Deer = 0
		Runelist = null
		MakerZ = null
		NoDropOnDeath = 0
		Dead = 0
		Dwarf = 0
		Intelligence = 0
		CanEat = 0
		IsBread = 0
		IsCake = 0
		User = 0
		ArmourSkill = 0
		Defence
		Agility
		SavedDefence
		LockVar = 0
		Human = 0
		Werewolf = 0
		Gargoyle = 0
		LizardMan = 0
		Demon = 0
		Vampire = 0
		Cant = 0
		WearingChest = 0
		Goblin = 0
		Illithid = 0
		Poisoned = 0
		CraftRank = null
		HumanParts = 0
		BelongsToHumans = 0
		StoleFromHumans = 0
		Beatle = 0
		SoulKills = 0
		Star
		Gender = "None"
		NPCZombieStat = 0
		CanFish = 0
		Undead = 0
		CoinContent = 0
		Up = 0
		CantKill = 0
		Tame = 0
		Tree = 0
		Bamboo = 0
		IsCape = 0
		Icon = null
		State = null
		AMMode = 0
		Coldness = 0
		HasHeadOn = 0
		Sky = 0
		Chest = 0
		BelongsToSkorn = 0
		Mole = 0
		GoingToDie = 0
		BloodAcidity = 0


		IsPotion = 0
		Cactus = 0


		WS = 0

		IsEmpty = 0

		HasWater = null





		Historys
		Born
		SwordSkill = 0
		ClawSkill = 0
		Done = 0
		Dig = 0

		Drill = 0
		PermSnow = 0
		IsWall = 0
		Days = 0
		BowSkill
		CaveWater = 0
		T = 0

		Race = null
		IsBodyPart = 0
		CF = 0
		IsCave = 1

		UsingSilver = 0
		PoisonDMG = 0
		PoisonContent = 0
		IsHead = 0

		Old
		Old2

		Wait = 0


		IsTree = 0
		EncrustedRuby = 0

		Spider = 0
		EncrustedEmerald = 0
		EncrustedDiamond = 0
		Restart = 0
		CoolDown = 0


		GoesTo = null
		Underground = 1
		no = 0
		FrogMan = 0
		isbridge = 0
		Wolf = 0
		NPC = 0
		BOwner = null
		BelongsToDwarf = 0
		IsYoungWorker = 0
		BelongsToGoblin = 0
		BelongsToKobold = 0


		Content = 0
		Content2 = 0
		Content3 = 0

		Fish = 0
		Mason = 0
		GM = 0
		WC = 0
		DE = 0

		FishMan = 0
		Kobold = 0
		Plantman = 0
		Ratmen = 0

		G = 0
		BB = 0
		B = 0

		OnFire = 0
		Fuel = 75
		OIcon = null
		IsWood = 0
		CanBeSlaved = 0
		Door = 0

		IsGem = 0
		Escort = 0
		CanDigAt = 0
		CanDetail = 0
		html
		Placed = 0
		Locked = 0
		Supported = 0
		Told = 0
		IsGlass = 0
		IsPW = 0

		Detailed = 0
		IsTrap = 0

		Hole = 0
		InHole = 0
		IsSpiked = 0
		HasPersonIn = 0

		ScrollWoodCraftingSkill = 0
		ScrollEXP = 0
		ScrollMetalCraftingSkill = 0
		Enchanted = 0
		ScrollSwordSkill = 0
		ScrollAxeSkill = 0
		ScrollMaceSkill = 0
		ScrollMineingSkill = 0
		ScrollLeatherCraftingSkill = 0
		LodestoneX = 0
		LodestoneY = 0
		LodestoneZ = 0
		ItemBullets = 0
		ItmID
		savedx = 0
		savedy = 0
		savedz = 0

		Wagon = 0
		Body = 0
		IsSkin = 0

		Kit = 0
		said = 0
		Gold = 0
		Silver = 0
		Gems = 0
		Skinned = 0
		TP = 0
		Carn = 0
		Pale = 0
		Jailed = 0
		PoisonSkill = 0
		Stop = 0
		WorkShop = 0

		CR = 0
		M = 0

		said2 = 0
		Skill = 0
		Black = 0
		Carpentry = 0
		Smelter =0
		HasPlantIn = 0
		Forge = 0

		Bug = 0
		AM = 0
		E = 0

		IsMist = 0

		TS = 0
		IsElf = 0
obj/proc/TowerCapGrow()
	sleep(1000)
	var/mob/Monsters/TowerCap/C = new
	C.loc = src.loc
	del(src)
	return
obj/proc/GrapeGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/GrapeVine/T = new
		T.loc = src.loc
		T.name = "Grape Vine Plant"
		del(src)
	if(Winter == 1)
		del(src)
	return
obj/proc/AcidSpray()
	if(src.BloodAcidity >= 1)
		for(var/mob/Monsters/M in range(0,src))
			if(M.BloodAcidity == 0)
				view(M) << "[M] steps into a pool of acidic blood!"
				M.BloodContent -= 10
				M.BloodLoss()
		for(var/turf/grounds/Y in view(1,src))
			var/AcidMelt = prob(src.BloodAcidity)
			if(AcidMelt == 1)
				Y.name = "acid ground"
				Y.icon = 'Cave.dmi'
				Y.icon_state = "Acidground"
				Y.Sky = 1
				Y.Content3 = "CanClimb"
				Y.OIcon = "Acidground"
				Y.density = 0
				Y.CanDigAt = 0
				Y.opacity = 0
		for(var/obj/Items/I in view(0,src))
			var/Melt = prob(src.BloodAcidity)
			if(Melt == 1)
				var/obj/Bloods/AcidGoo/A = new(I.loc)
				A.name = I.name
				del I
		if(src.Undead == 0)
			src.icon += rgb(-50,150,0)
			src.Undead = 1
	spawn(20)
		src.AcidSpray()
obj/proc/PlantmanGrow()
	sleep(1000)
	var/mob/Monsters/Plantman/T = new
	T.loc = src.loc
	T.Owner = src.Owner
	for(var/mob/LLL in world)
		if(LLL == T.Owner)
			LLL.UnitList += T
	T.name = "{[src.Owner]} Plantman"
	del(src)
	return
obj/proc/TomatoGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/TomatoPlant/T = new
		T.loc = src.loc
		T.name = "Tomato Plant"
		del(src)
	if(Winter == 1)
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return
obj/proc/Seek()
	if(src.Target)
		walk_towards(src,src.Target,2)
	else
		src.BowSkill = 0
		return
	spawn(0.1) Seek()
obj/proc/GarlicGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/GarlicPlant/T = new
		T.loc = src.loc
		T.name = "Garlic Plant"
		del(src)
	if(Winter == 1)
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return
obj/proc/WheatGrow()
	sleep(1000)
	var/obj/Items/Plants/Wheat/T = new
	T.loc = src.loc
	T.name = "Wheat"
	del(src)
	return
mob/proc/BeingPulled()
	if(ismob(src.Puller))
		var/mob/X = src.Puller
		src.loc = X.loc
		spawn(4)
			src.BeingPulled()
mob/proc/AutoCliffClimb()
	var/mob/Monsters/Avatar/F = new()
	F.loc = src.destination
	if(src.z == 1 && F.z == 3)
		for(var/turf/W in range(1,src))
			if(W.density == 1 && W.opacity == 1)
				src.z = 3
				for(var/turf/W2 in range(0,src))
					if(W2.icon_state != "Sky")
						src.z = 1
	del F
	spawn(4)
		src.AutoCliffClimb()
mob/proc/BowTarget()
	if(src.BowOn == 0)
		return
	if(src.HoldingWeapon == "Bow" || src.HoldingWeapon == "Hellbow")
		if(src.Meditating == 0)
			if(src.HasRightArm == 1)
				if(src.Sleeping == 0)
					if(src.Target)
						if(src.Target in oview(5,src))
							if(src.HoldingWeapon == "Bow")
								for(var/obj/Items/Armours/Back/LeatherQuiver/L in src)
									if(L.suffix == "(Equiped)" && L.Content >= 1)
										for(var/obj/Items/Arrows/A in L)
											view() << 'Arrow.wav'
											A.suffix = null
											A.Owner = src.Owner
											A.Target = src.Target
											src.BowSkill += 0.3
											src.EXP += 4
											src.destination = null
											if(src.BowSkill >= 200)
												src.BowSkill = 200
											for(var/mob/Monsters/M in oview(5,src))
												if(M == src.Target)
													var/Block = 0
													var/Hit = prob(src.BowSkill / 4 + src.Agility / 2)
													var/Deflect = 0
													var/BreakA = prob(25)
													var/LodgeA = prob(3)
													var/Damage = rand(src.WeaponDamageMin,src.WeaponDamageMax)
													Damage += src.BowSkill
													Damage -= M.Defence
													Damage += src.Agility / 10
													A.loc = M.loc
													if(M.HumanParts == 0)
														M.HP -= Damage
														if(M.HP <= 0)
															del M
													if(M.Race == "Skeleton" || M.Race == "Guardstone")
														M.HP -= Damage / 2
														if(M.HP <= 0)
															M.GoingToDie = 1
															M.Death()
													if(M.WearingShield == 1)
														var/BlockChance = prob(M.ShieldSkill / 2)
														if(BlockChance == 1)
															view(M) << "[M] blocks [src]'s arrow with their shield!"
															Block = 1
													if(M.WearingChest == 1 && M.WearingLegs == 1)
														var/DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
														if(DeflectChance == 1)
															Deflect = 1
															view(M) << "[M]'s armour deflects the arrow!"
													if(Hit == 1)
														if(Block == 0 && Deflect == 0)
															var/Limb = rand(1,20)
															view(M) << "[M] is hit by [src]'s arrow!"
															M.BloodContent -= Damage
															M.BloodLoss()
															if(M.ImmunePoison == 0)
																M.BloodContent -= A.PoisonContent / 5
															if(M.ImmunePoison == 1)
																M.BloodContent -= A.PoisonContent / 7
															var/Faint = 0
															if(Limb == 1)
																M.LeftLegHP -= Damage
																if(M.LeftLegHP <= 0)
																	M.HasLeftLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LegFling()
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 2)
																M.RightLegHP -= Damage
																if(M.RightLegHP <= 0)
																	M.HasRightLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LegFling()
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 3)
																M.RightArmHP -= Damage
																if(M.RightArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.RightArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.RightArmHP <= 0)
																	M.HasRightArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightArm  = "Destroyed"
																	M.LimbLoss()
																	M.ArmFling()
																	for(var/obj/Items/Weapons/S in M)
																		if(S.suffix == "(Equiped)")
																			S.suffix = null
																			M.HasPick = 0
																			M.WeaponDamageMin -= S.WeaponDamageMin
																			M.WeaponDamageMax -= S.WeaponDamageMax
																			M.RemoveAllWeapons()
																			M.HoldingWeapon = 0
																			M.weight -= S.weight
																			S.loc = M.loc
																			view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 4)
																M.LeftArmHP -= Damage
																if(M.LeftArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.LeftArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.LeftArmHP <= 0)
																	M.HasLeftArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftArm  = "Destroyed"
																	M.LimbLoss()
																	M.ArmFling()
																	for(var/obj/Items/Armours/Shields/S in M)
																		if(S.suffix == "(Equiped)")
																			S.suffix = null
																			M.WearingShield = 0
																			M.HoldingOffHandWeapon = 0
																			M.Defence -= S.Defence
																			M.RemoveAllShields()
																			M.weight -= S.weight
																			S.loc = M.loc
																			view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 5 && M.HasRightEye == 1)
																M.RightEyeHP -= Damage
																M.RightEye = "Slashed"
																view(M) << "[M] is hit in the right eye by the arrow!"
																if(M.RightEyeHP <= 0)
																	M.HasRightEye = 0
																	M.RightEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
															if(Limb == 6 && M.HasLeftEye == 1)
																M.LeftEyeHP -= Damage
																M.LeftEye = "Slashed"
																view(M) << "[M] is hit in the left eye by the arrow!"
																if(M.LeftEyeHP <= 0)
																	M.HasLeftEye = 0
																	M.LeftEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
																	view(M) << "[M] is blinded!"
															if(Limb == 7)
																var/HeartShot = prob(2)
																if(HeartShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the heart with an arrow and instantly killed!"
																	M.GoingToDie = 1
																	M.Killer = "[src]"
																	M.DeathType = "being shot in the heart with an arrow"
																	M.Death()
															if(Limb == 8)
																var/SpleenShot = prob(40)
																if(SpleenShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the spleen with an arrow!"
																	M.SpleenHP -= Damage
																	M.Spleen = "Destroyed"
																	M.BloodContent -= rand(1,10)
															if(Limb == 9)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.LeftLungHP -= Damage
																	M.LeftLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.LeftLungHP <= 0)
																		M.LeftLung = "Destroyed"
																		M.HasLeftLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()
															if(Limb == 10)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.RightLungHP -= Damage
																	M.RightLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.RightLungHP <= 0)
																		M.RightLung = "Destroyed"
																		M.HasRightLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()
															if(LodgeA == 1)
																view(M) << "<b><font color=red>[A] lodges itself into [M]<br>"
																A.loc = M
																M.weight += A.weight
																A.suffix = "(Stuck In)"
															if(BreakA == 1 && LodgeA == 0)
																del A
																break
															break
														break

													else
														view(src) << "[src] fires an arrow but misses its target!"
														break
											L.Content -= 1
											break
									break
							if(src.HoldingWeapon == "Hellbow")
								if(src.HoldingWeapon == "Hellbow")
									if(src.HoldingWeapon == "Hellbow")
										if(src.HoldingWeapon == "Hellbow")
											view(src) << 'Arrow.wav'
											src.BowSkill += 0.3
											src.EXP += 4
											src.destination = null
											if(src.BowSkill >= 200)
												src.BowSkill = 200
											for(var/mob/Monsters/M in oview(5,src))
												if(M == src.Target)
													var/Block = 0
													var/Hit = prob(src.BowSkill / 4 + src.Agility / 2)
													var/Deflect = 0
													var/Damage = rand(src.WeaponDamageMin,src.WeaponDamageMax)
													Damage += src.BowSkill
													Damage -= M.Defence
													Damage += src.Agility / 10
													if(M.HumanParts == 0)
														M.HP -= Damage
														if(M.HP <= 0)
															del M
													if(M.Race == "Skeleton" || M.Race == "Guardstone")
														M.HP -= Damage / 2
														if(M.HP <= 0)
															M.GoingToDie = 1
															M.Death()
													if(M.WearingShield == 1)
														var/BlockChance = prob(M.ShieldSkill / 2)
														if(BlockChance == 1)
															view(M) << "[M] blocks [src]'s magic arrow with their shield!"
															Block = 1
													if(M.WearingChest == 1 && M.WearingLegs == 1)
														var/DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
														if(DeflectChance == 1)
															Deflect = 1
															view(M) << "[M]'s armour deflects the magic arrow!"
													if(Hit == 1)
														if(Block == 0 && Deflect == 0)
															var/Limb = rand(1,20)
															view(M) << "[M] is hit by [src]'s arrow!"
															M.BloodContent -= Damage
															M.BloodLoss()
															var/Faint = 0
															if(Limb == 1)
																M.LeftLegHP -= Damage
																if(M.LeftLegHP <= 0)
																	M.HasLeftLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LegFling()
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 2)
																M.RightLegHP -= Damage
																if(M.RightLegHP <= 0)
																	M.HasRightLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LegFling()
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 3)
																M.RightArmHP -= Damage
																if(M.RightArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.RightArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.RightArmHP <= 0)
																	M.HasRightArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightArm  = "Destroyed"
																	M.LimbLoss()
																	M.ArmFling()
																	for(var/obj/Items/Weapons/S in M)
																		if(S.suffix == "(Equiped)")
																			S.suffix = null
																			M.HasPick = 0
																			M.WeaponDamageMin -= S.WeaponDamageMin
																			M.WeaponDamageMax -= S.WeaponDamageMax
																			M.RemoveAllWeapons()
																			M.HoldingWeapon = 0
																			M.weight -= S.weight
																			S.loc = M.loc
																			view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 4)
																M.LeftArmHP -= Damage
																if(M.LeftArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.LeftArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.LeftArmHP <= 0)
																	M.HasLeftArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftArm  = "Destroyed"
																	M.LimbLoss()
																	M.ArmFling()
																	for(var/obj/Items/Armours/Shields/S in M)
																		if(S.suffix == "(Equiped)")
																			S.suffix = null
																			M.WearingShield = 0
																			M.HoldingOffHandWeapon = 0
																			M.Defence -= S.Defence
																			M.RemoveAllShields()
																			M.weight -= S.weight
																			S.loc = M.loc
																			view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 5 && M.HasRightEye == 1)
																M.RightEyeHP -= Damage
																M.RightEye = "Slashed"
																view(M) << "[M] is hit in the right eye by the arrow!"
																if(M.RightEyeHP <= 0)
																	M.HasRightEye = 0
																	M.RightEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
															if(Limb == 6 && M.HasLeftEye == 1)
																M.LeftEyeHP -= Damage
																M.LeftEye = "Slashed"
																view(M) << "[M] is hit in the left eye by the arrow!"
																if(M.LeftEyeHP <= 0)
																	M.HasLeftEye = 0
																	M.LeftEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
																	view(M) << "[M] is blinded!"
															if(Limb == 7)
																var/HeartShot = prob(2)
																if(HeartShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the heart with an arrow and instantly killed!"
																	M.GoingToDie = 1
																	M.Killer = "[src]"
																	M.DeathType = "being shot in the heart with an arrow"
																	M.Death()
															if(Limb == 8)
																var/SpleenShot = prob(40)
																if(SpleenShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the spleen with an arrow!"
																	M.SpleenHP -= Damage
																	M.Spleen = "Destroyed"
																	M.BloodContent -= rand(1,10)
															if(Limb == 9)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.LeftLungHP -= Damage
																	M.LeftLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.LeftLungHP <= 0)
																		M.LeftLung = "Destroyed"
																		M.HasLeftLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()
															if(Limb == 10)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Gargoyle == 0)
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.RightLungHP -= Damage
																	M.RightLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.RightLungHP <= 0)
																		M.RightLung = "Destroyed"
																		M.HasRightLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()

													else
														view(src) << "[src] fires a magic arrow but misses its target!"

						else
							src.Target = null
							src.BowOn = 0
			else
				src.BowOn = 0
				return
		else
			src.BowOn = 0
			src.Target = null
			return
	else
		src.BowOn = 0
		return
	if(src.BowOn)
		spawn(50) BowTarget()
obj/proc/PoisonSporeGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/GrownPoisonSporePlant/P = new
					P.loc = src.loc
	del(src)
	return
obj/proc/CarnGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/GrownCarnivorousPlant/P = new
					P.loc = src.loc
	del(src)
	return
obj/proc/TreeGrow()
	sleep(1000)
	if(Winter == 0)
		for(var/turf/T in view(0,src))
			if(T.icon_state == "Grass")
				T.icon = 'plants.dmi'
				T.icon_state = "tree 2x1"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.overlays += /obj/Trees/leaves3x2
				T.overlays += /obj/Trees/leaves2x2
				T.overlays += /obj/Trees/leaves1x2
				T.overlays += /obj/Trees/leaves1x1
				T.overlays += /obj/Trees/leaves2x1
				T.overlays += /obj/Trees/leaves3x1
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Snow")
				T.icon = 'plants.dmi'
				T.icon_state = "SnowTree"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Desert")
				T.icon_state = "Cactus"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.opacity = 1
				T.IsWood = 1
				T.name = "Cactus"
				T.Cactus = 1
			if(T.Content == "Marsh")
				T.icon_state = "Bamboo"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.IsWood = 1
				T.opacity = 1
				T.name = "Bamboo"
				T.Bamboo = 1
	del(src)
	return
mob/proc/Struggle()
	if(src)
		for(var/obj/Items/Traps/PitTrap/P in view(0,src))
			if(src.InHole == 1)
				var/E
				E = prob(src.SneakingSkill/2)
				if(E == 1)
					view()<< "<b><font color=red>[src] has escaped from a pit trap!"
					src.Owner << "<b><font color=red>[src] has escaped from a pit trap!"
					src.InHole = 0
					src.SneakingSkill += 0.5
					del(P)

			else
				return
	spawn(100) Struggle()
mob/proc/SunLight()
	if(src.Vampire == 1 || usr.Svartalfar)
		if(src.Underground == 0)
			if(src.SunSafe == 0)
				src.Owner << "<b><font color=red>[src] takes damage from the sun!"
				src.HP -= 25
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "The Sun"
					src.DeathType = "Being Burned"
					src.Death()
					return
			else
				return
		else
			return
	spawn(50) SunLight()
mob/proc/CreateZombie()
	spawn(500)
		if(src)
			src.icon = turn(src.icon,270)
			if(src.Owner == "{NPC Zombies}")
				var/mob/Monsters/NPCZombie/Z = new
				Z.icon = src.icon
				Z.icon_state = src.icon_state
				if(src.Owner)
					var/mob/O = src.Owner
					Z.Owner = O
					Z.name = "{NPC} Zombie"
					O.UnitList += Z
				Z.Zombie()
				Z.LimbLoss()
				Z.overlays += /obj/Bloods/Zombie/
				Z.loc = src.loc
				range(8,src) << "<font color = teal>[src] begins to twitch, after a moment, they rise up from the dead and begin to walk!<br>"
				del src
			else
				var/mob/Monsters/Zombie/Z = new
				Z.icon = src.icon
				Z.icon_state = src.icon_state
				for(var/mob/O in world)
					if(O.ckey == src.Owner)
						Z.Owner = O
						Z.name = "([O]) Zombie"
						O.UnitList += Z
				Z.Zombie()
				Z.LimbLoss()

				Z.overlays += /obj/Bloods/Zombie/
				Z.loc = src.loc
				range(8,src) << "<font color = teal>[src] begins to twitch, after a moment, they rise up from the dead and begin to walk!<br>"
				Z.Owner << "<font color = teal>A Zombie has risen at [Z.x],[Z.y],[Z.z]<br>"
				del (src)
mob/proc/TurnVamp()
	if(src.CanKill)
		return
	if(src.InfectedBy)
		spawn(300)
			view() << "[src] starts to look sick."
			src.overlays += 'RedEye.dmi'

	if(src.InfectedBy)
		spawn(300)
			view() << "[src] turns into a vampire!"
			if(ismob(src.Owner))
				var/mob/S = src.Owner
				S.Selected.Remove(src)
				S.client.images -= src.Star
				S.UnitList -= src
				if(S.HasKing == 1)
					if(src.HasKing == 1)
						src.HasKing = 0
						S.HasKing = 0
				if(S.HasQueen == 1)
					if(src.HasQueen == 1)
						src.HasQueen = 0
						S.HasQueen = 0
			src.Owner << "[src] has turned into a vampire! [x],[y],[z]"
			var/mob/E = src.InfectedBy
			if(ismob(E.Owner))
				src.Owner = E.Owner
				if(ismob(E.Owner))
					var/mob/M = E.Owner
					M.UnitList += src
			if(E.CanBeSlaved == 1)
				if(src.CanBeSlaved == 0)
					src.RandomWalk()
				src.CanBeSlaved = 1
				src.Owner = "NPC Vampire"
			src.name = "{[src.Owner]} Vampire"
			if(src.Spider == 1)
				src.Spider = 0
				src.Vampire = 1
			if(src.Race == "Orc")
				src.Race = null
				src.Vampire = 1
			if(src.Goblin == 1)
				src.Goblin = 0
				src.Vampire = 1
			if(src.Kobold == 1)
				src.Kobold = 0
				src.Vampire = 1
			if(src.Svartalfar == 1)
				src.Svartalfar = 0
				src.Vampire = 1
			if(src.Ratmen == 1)
				src.Ratmen = 0
				src.Vampire = 1
			if(src.SandWorker == 1)
				src.SandWorker = 0
				src.Vampire = 1
			if(src.Dwarf == 1)
				src.Dwarf = 0
				src.Vampire = 1
				src.overlays -= 'Beards.dmi'
				src.overlays -= 'BlackBeard.dmi'
				src.overlays -= 'BrownBeard.dmi'
			if(src.Human == 1)
				src.Human = 0
				src.Vampire = 1
			if(src.Wolf == 1)
				src.Wolf = 0
				src.Vampire = 1
			if(src.Deer == 1)
				src.Deer = 0
				src.Vampire = 1
			if(src.Bug == 1)
				src.Bug = 0
				src.Vampire = 1
			if(src.LizardMan == 1)
				src.LizardMan = 0
				src.Vampire = 1
			src.UsesPoison = 1
			src.MakesBoneCraft = 1
			src.AM = 1
			src.VampPick = 1
			src.DieAge += 2500

obj/proc/TomatoDecay()
	spawn(19000)
	if(src.suffix == null)
		for(var/turf/t in view(0,src))
			if(t.icon_state == "FarmLand")
				if(t.HasPlantIn == 1)
					t.HasPlantIn = 0
		del(src)
	else
		src.TomatoDecay()
obj/proc/DeleteLimbs()
	spawn(1000)
	del(src)
obj/proc/ItemDecay()
	spawn(19000)
	if(src.suffix == null)
		del(src)
	else
		src.ItemDecay()
mob/proc/Infection(var/mob/InfectorOwner)
	if(src.Gargoyle == 0)
		if(src.NPCZombieStat == 0)
			if(src.ImmuneToDevourer == 0)
				src.Infects = 1
				spawn(500)
					if(src)
						src.Owner << "<font color = teal>[src] begins to look pale.<br>"
						var/Heal = prob(25 + src.Level)
						spawn(1000)
							if(src)
								if(Heal && src.ImmuneToDevourer == 0)
									src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them.<br>"
									src.Infects = 0
									return
								if(src.ImmuneToDevourer == 1)
									src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them due tot heir newfound immunity.<br>"
									src.Infects = 0
									return
								else
									src.Owner << "<font color = teal>[src] begins to gurgle and splutter blood everywhere, they become a Zombie!<br>"
									if(src.NPCZombieStat == 0)
										var/mob/Monsters/Zombie/Z = new
										Z.icon = src.icon
										Z.icon_state = src.icon_state
										Z.Zombie()
										if(src.loc != locate(0,0,0))
											Z.loc = src.loc
										else
											Z.loc = InfectorOwner.loc
										Z.Owner = InfectorOwner
										Z.Undead = 1
										Z.name = "([Z.Owner]) Zombie"
										InfectorOwner.UnitList += Z
										Z.LimbLoss()
										var/obj/Bloods/Zombie/O = new
										Z.overlays += O
										Z.Owner << "<font color = teal>A new infection was created at [src.x],[src.y],[src.z]<br>"
										for(var/obj/Items/I in src)
											I.loc = src.loc
											I.suffix = null
										del(src)
										return
			else
				return
		else
			return
	else
		return

mob/proc/NPCInfection()
	src.NPCZombieStat = 1
	src.Infects = 1
	if(src.ImmuneToDevourer == 0)
		spawn(500)
			if(src)
				view(src) << "<font color = teal>[src] begins to look pale.<br>"
				var/Heal = prob(30)
				if(src.CanBeSlaved == 1)
					Heal = prob(25)
				if(src.CanBeSlaved == 0)
					Heal = prob(75)
				spawn(1000)
					if(src)
						if(Heal || src.ImmuneToDevourer == 1)
							src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them.<br>"
							src.NPCZombieStat = 0
							src.Infects = 0
							var/Immunity = prob(10)
							if(Immunity)
								src.ImmuneToDevourer = 1
								src.Owner << "[src] has developed an immunity to this disease!"
							return
						else
							view(src) << "<font color = teal>[src] begins to gurgle and splutter blood everywhere, they become a Zombie!<br>"
							var/mob/Monsters/NPCZombie/Z = new
							Z.loc = src.loc
							Z.icon = src.icon
							Z.icon_state = src.icon_state
							Z.LimbLoss()
							Z.CanBeSlaved = 1
							Z.Zombie()
							Z.LimbLoss()
							var/obj/Bloods/Zombie/O = new
							Z.overlays += O
							for(var/obj/Items/I in src)
								I.loc = src.loc
								I.suffix = null
							del(src)
							return
	else
		return
mob/proc/Zombie()
	if(src)
		if(src.Owner)
			if(src.icon_state == "NoLeftArm")
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightArm")
				src.HasRightArm = 0
			if(src.icon_state == "NoLeftLeg")
				src.HasLeftLeg = 0
			if(src.icon_state == "NoRightLeg")
				src.HasRightLeg = 0
			if(src.icon_state == "NoLegs")
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArms")
				src.HasRightArm = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightLegNoLeftArm")
				src.HasRightLeg = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoLeftLegNoRightArm")
				src.HasLeftLeg = 0
				src.HasRightArm = 0
			if(src.icon_state == "NoRightArmNoRightLeg")
				src.HasRightArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "NoLeftArmNoLeftLeg")
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoRightArm")
				src.HasRightArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoLeftArm")
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoLeftLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoRightLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "None")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
mob/proc/BodyDecay()
	spawn(2000)
	if(src.suffix == null)
		del(src)
	else
		src.BodyDecay()
mob/proc/FishDecay()
	spawn(500)
		if(src.suffix == null)
			del(src)

obj/proc/BoneWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(1,2)
		src.WeaponDamageMax = rand(2,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(1,3)
		src.WeaponDamageMax = rand(3,4)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(2,4)
		src.WeaponDamageMax = rand(4,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(6,9)
		src.WeaponDamageMax = rand(9,16)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,11)
		src.WeaponDamageMax = rand(11,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(10,19)
		src.WeaponDamageMax = rand(19,22)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(22,26)
		src.WeaponDamageMax = rand(26,30)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(30,34)
		src.WeaponDamageMax = rand(34,38)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"

	if(src.CraftRank == "Supernatural Quality")
		src.WeaponDamageMin = rand(45,60)
		src.WeaponDamageMax = rand(60,75)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"



obj/proc/WoodDoorCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = rand(300,370)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = rand(380,400)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = rand(400,420)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = rand(500,550)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = rand(600,650)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = rand(700,750)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = rand(800,850)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = rand(900,1000)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
obj/proc/TrainCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = 99999999999999999999
		src.Content3 = 0.6
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = 999999999999999999999
		src.Content3 = 0.8
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.2
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.4
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.6
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.8
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = 999999999999999999999
		src.Content3 = 2
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"

obj/proc/MetalDoorCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = rand(400,500)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = rand(600,650)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = rand(700,750)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = rand(800,950)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = rand(1000,1050)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = rand(1100,1150)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = rand(1200,1250)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = rand(1300,1350)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
obj/proc/MetalWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(1,2)
		src.WeaponDamageMax = rand(2,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(1,3)
		src.WeaponDamageMax = rand(3,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(2,4)
		src.WeaponDamageMax = rand(4,6)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(6,10)
		src.WeaponDamageMax = rand(10,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,12)
		src.WeaponDamageMax = rand(12,18)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(10,20)
		src.WeaponDamageMax = rand(20,25)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(20,25)
		src.WeaponDamageMax = rand(26,30)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(30,35)
		src.WeaponDamageMax = rand(36,40)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"
obj/proc/AdamantiumWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(2,4)
		src.WeaponDamageMax = rand(4,8)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(3,7)
		src.WeaponDamageMax = rand(7,14)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(6,9)
		src.WeaponDamageMax = rand(9,15)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(14,24)
		src.WeaponDamageMax = rand(24,34)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(16,26)
		src.WeaponDamageMax = rand(26,36)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(20,40)
		src.WeaponDamageMax = rand(40,50)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(50,50)
		src.WeaponDamageMax = rand(50,50)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(105,110)
		src.WeaponDamageMax = rand(120,120)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"
obj/proc/MetalWeaponCraft2h()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(2,3)
		src.WeaponDamageMax = rand(3,5)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(4,7)
		src.WeaponDamageMax = rand(7,9)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(5,8)
		src.WeaponDamageMax = rand(8,10)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(12,15)
		src.WeaponDamageMax = rand(15,20)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(15,20)
		src.WeaponDamageMax = rand(20,25)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(20,25)
		src.WeaponDamageMax = rand(25,30)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(25,30)
		src.WeaponDamageMax = rand(31,35)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(35,40)
		src.WeaponDamageMax = rand(50,75)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"

obj/proc/GoldWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(2,3)
		src.WeaponDamageMax = rand(3,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(2,3)
		src.WeaponDamageMax = rand(3,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(3,4)
		src.WeaponDamageMax = rand(4,6)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(7,10)
		src.WeaponDamageMax = rand(10,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,12)
		src.WeaponDamageMax = rand(12,18)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(11,16)
		src.WeaponDamageMax = rand(16,20)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(17,21)
		src.WeaponDamageMax = rand(22,28)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(28,33)
		src.WeaponDamageMax = rand(33,44)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"

obj/proc/FurnitureCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(1,5)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(5,10)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(20,30)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(30,40)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(40,50)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(50,60)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(70,80)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(127,138)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
obj/proc/MetalArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,5)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,10)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(10,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"
		src.Defence = rand(17,20)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/AdamantiumArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,8)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(8,16)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(16,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(17,18)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(19,20)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(20,24)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(33,36)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/BoneArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,13)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"
		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/WoodArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,14)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"

	if(src.CraftRank == "Supernatural Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(20,25)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/LeatherArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,1)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,11)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(11,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Supernatural Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(20,25)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
mob/proc/Leave()
	if(src.Leave == 1)
		src.Owner << "[src] : I have to leave now, good bye."
		del(src)
	if(src.Leave == 0)
		src.Leave = 1
	spawn(24000) Leave()
mob/proc/ReturnHome2()
	if(src.Sleeping == 0)
		src.ReturningHome = 1
	spawn(1000) ReturnHome2()

mob/proc/ReturnHome()
	if(src.Sleeping == 0)
		src.ReturningHome = 1
	spawn(1000) ReturnHome()

mob/proc/Escort()

	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.InHole == 0)
		if(src.ReturningHome)
			if(src.loc == src.HomeLoc)
				src.ReturningHome = 0
				src.destination = null
				src.AttackTarget = null
		if(src.ReturningHome == 0)
			for(var/mob/Monsters/M in oview(6,src))
				if(M.destination == src)
					if(src.destination == null)
						src.destination = M
						src.AttackTarget = M
				if(src.Owner == M.Owner)
					for(var/mob/Monsters/S in oview(6,M))
						if(S.destination == M)
							if(src.AttackModeOn)
								if(src.destination == null)
									if(src.Sleeping == 0)
										if(S.Body == 0)
											if(S.Wagon == 0)
												if(S.Drill == 0)
													if(S.InHole == 0)
														src.destination = S
														src.AttackTarget = S
														Speed = 10

		if(src.ReturningHome)
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					src.destination = src.HomeLoc
					src.AttackTarget = null
	spawn(Speed) Escort()
mob/proc/MagicShoot()
	if(src.Alive == 0)
		return
	var/Speed = rand(250,1200)
	for(var/mob/Monsters/M in view(4,src))
		if(src.destination == null)
			if(src.Sleeping == 0)
				if(src.Owner == M.Owner)
					..()
				else
					if(M.Body == 0)
						if(M.Wagon == 0)
							if(M.Drill == 0)
								if(src.Race == "Lich")
									var/Spelltype = rand(1,3)
									if(Spelltype == 1)
										view(src) << "[src] fires a bolt of death energy into [M]!"
										M.BloodContent -= 50
										M.BloodLoss()
									if(Spelltype == 2)
										var/mob/Monsters/Skeleton/S = new(src.loc)
										S.Owner = "{NPC Undead}"
										S.name = "{NPC Undead} Skeleton"
										S.Agility += 1
										S.Strength += 1
										S.Defence += 1
										S.CanBeSlaved = 1
										S.RandomWalk()
									if(Spelltype == 3)
										var/WeaponType = rand(1,3)
										var/mob/Monsters/Skeleton/S = new
										S.loc = src.loc
										S.Owner = "{NPC Undead}"
										S.name = "{NPC Undead} Skeleton Lord"
										S.Agility += 10
										S.Strength += 10
										S.Defence += 5
										var/obj/Items/Armours/ChestPlates/MetalChestPlate/A1 = new(S)
										var/obj/Items/Armours/Legs/MetalLeggings/A2 = new(S)
										A1.Defence = rand(4,7)
										A2.Defence = rand(4,7)
										A1.name = "Rusty Chestplate - Normal Quality"
										A2.name = "Rusty Leggings - Normal Quality"
										A1.suffix = "(Equiped)"
										A2.suffix = "(Equiped)"
										S.overlays += A1.type
										S.overlays += A2.type
										S.Defence += A1.Defence
										S.Defence += A2.Defence
										S.WearingChest = 1
										S.WearingLegs = 1
										S.weight += A1.weight
										S.weight += A2.weight
										if(WeaponType == 1)
											var/obj/Items/Weapons/Swords/StraightSword/W1 = new()
											W1.loc = S
											W1.suffix = "(Equiped)"
											W1.name = "Rusty Sword - Average Quality"
											W1.WeaponDamageMin = rand(5,8)
											W1.WeaponDamageMax = rand(8,12)
											S.WeaponDamageMin += W1.WeaponDamageMin
											S.WeaponDamageMax += W1.WeaponDamageMax
											S.weight += W1.weight
											S.HoldingWeapon = "Sword"
											S.overlays += W1.type
										if(WeaponType == 2)
											var/obj/Items/Weapons/Maces/MetalMace/W1 = new()
											W1.loc = S
											W1.suffix = "(Equiped)"
											W1.name = "Rusty Mace - Average Quality"
											W1.WeaponDamageMin = rand(5,8)
											W1.WeaponDamageMax = rand(8,12)
											S.WeaponDamageMin += W1.WeaponDamageMin
											S.WeaponDamageMax += W1.WeaponDamageMax
											S.weight += W1.weight
											S.HoldingWeapon = "Mace"
											S.overlays += W1.type
										if(WeaponType == 3)
											var/obj/Items/Weapons/Axes/MetalOrcAxe/W1 = new()
											W1.loc = S
											W1.name = "Rusty Axe - Average Quality"
											W1.suffix = "(Equiped)"
											W1.WeaponDamageMin = rand(5,8)
											W1.WeaponDamageMax = rand(8,12)
											S.WeaponDamageMin += W1.WeaponDamageMin
											S.WeaponDamageMax += W1.WeaponDamageMax
											S.weight += W1.weight
											S.HoldingWeapon = "Sword"
											S.overlays += W1.type
										S.CanBeSlaved = 1
										S.RandomWalk()
	spawn(Speed)
		src.MagicShoot()
mob/proc/FOS()
	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.InHole == 0)
		if(src.loc == src.HomeLoc)
			src.ReturningHome = 0
			src.destination = null
		if(src.ReturningHome == 0)
			for(var/mob/Monsters/M in view(4,src))
				if(src.destination == null)
					if(src.Sleeping == 0)
						if(src.Owner == M.Owner)
							..()
						else
							if(M.Body == 0)
								if(M.Wagon == 0)
									if(M.Drill == 0)
										src.destination = M
										Speed = 10

		if(src.ReturningHome)
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					src.destination = src.HomeLoc
	spawn(Speed) FOS()
mob/proc/NPCAttack()
	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.loc == src.HomeLoc)
		src.ReturningHome = 0
		src.destination = null
		src.AttackTarget = null
	if(src.ReturningHome == 0)
		for(var/mob/Monsters/M in view(3,src))
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					if(src.Kobold)
						if(M.StoleFromKobolds)
							Speed = 10
							src.destination = M
							src.AttackTarget = M
					if(src.Owner == "{NPC Humans}")
						if(M.StoleFromHumans)
							Speed = 10
							src.destination = M
							src.AttackTarget = M
					if(src.Dwarf)
						if(M.StoleFromDwarfs)
							Speed = 10
							src.destination = M
							src.AttackTarget = M
					if(src.Goblin)
						if(M.StoleFromGoblins)
							Speed = 10
							src.destination = M
							src.AttackTarget = M
					if(M.destination == src)
						src.destination = M
						src.AttackTarget = M
						Speed = 10
	if(src.ReturningHome)
		if(src.InHole == 0)
			if(src.Sleeping == 0)
				src.destination = src.HomeLoc
	spawn(Speed) NPCAttack()






mob
	var
		list

			Selected



atom
	var
		HP
		MAXHP
		WeaponDamageMin = 0
		WeaponDamageMax = 0
		SavedMinDam = 0
		SavedMaxDam = 0
atom
	var
		grass
		weight = 0
		weightmax
