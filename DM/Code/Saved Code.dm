mob/verb/SpendYourPoints()
	if(usr.Points >= 1)
		var/list/menu4 = new
		menu4 += "Rares"
		menu4 += "Magic"
		menu4 += "Skill Scrolls"
		menu4 += "Cancel"
		var/Result = input("Buy What?","Choose", null) in menu4
		if(Result == "Cancel")
			return
		if(Result == "Rares")
			var/list/menu5 = new
			menu5 += "Gargoyles"
			menu5 += "Dragons"
			menu5 += "Illithids"
			menu5 += "Cancel"
			var/Result2 = input("Buy What?","Choose", null) in menu5
			if(Result2 == "Cancel")
				return
			if(Result2 == "Gargoyles")
				if("Gargoyle" in usr.Rares)
					usr << "You already have this rare."
					return
				if(usr.Points >= 1000)
					usr.Rares += "Gargoyle"
					usr << "Rare given."
					usr.Points -= 1000
			if(Result2 == "Dragons")
				if("Dragons" in usr.Rares)
					usr << "You already have this rare."
					return
				if(usr.Points >= 1000)
					usr.Rares += "Dragons"
					usr << "Rare given."
					usr.Points -= 1000
			if(Result2 == "Illithids")
				if("Illithids" in usr.Rares)
					usr << "You already have this rare."
					return
				if(usr.Points >= 1000)
					usr.Rares += "Illithids"
					usr << "Rare given."
					usr.Points -= 1000
		if(Result == "Magic")
			var/list/menu5 = new
			menu5 += "Make Selected Unit Mage"
			menu5 += "Cancel"
			var/Result2 = input("Buy What?","Choose", null) in menu5
			if(Result2 == "Cancel")
				return
			if(Result2 == "Make Selected Unit Mage")
				if(usr.Points >= 250)
					for(var/mob/Monsters/M in usr.Selected)
						if(M.MagicalAptitude == 0)
							M.MagicalAptitude = 1
							usr.Points -= 250
							usr << "[M] is now a mage."
							return
				else
					usr << "You need 250 points."
			if(Result2 == "Spawn Necromancy Book")
				if(usr.Points >= 2000)
					var/obj/Items/Shafts/NecroBook/N = new
					N.loc = usr.loc
					N.name = "Tome of Dark Thoughts"
					N.Enchanted = 1
					usr.Points -= 2000
				else
					usr << "You need 2000 points."
			if(Result2 == "Spawn Holy Book")
				if(usr.Points >= 2000)
					var/obj/Items/Shafts/HolyBook/N = new
					N.loc = usr.loc
					N.name = "Tome of Saints"
					N.Enchanted = 1
					usr.Points -= 2000
				else
					usr << "You need 2000 points."
			if(Result2 == "Spawn Chaos Book")
				if(usr.Points >= 3000)
					var/obj/Items/Shafts/ChaosBook/N = new
					N.loc = usr.loc
					N.name = "Tome of Random Mania"
					N.Enchanted = 1
					usr.Points -= 3000
				else
					usr << "You need 3000 points."
			if(Result2 == "Spawn Astral Book")
				if(usr.Points >= 3000)
					var/obj/Items/Shafts/AstralBook/N = new
					N.loc = usr.loc
					N.name = "Tome of Knowledge"
					N.Enchanted = 1
					usr.Points -= 3000
				else
					usr << "You need 3000 points."
		if(Result == "Weapons")
			var/list/menu5 = new
			menu5 += "Hellforged Axe"
			menu5 += "Hellforged Sword"
			menu5 += "Hellforged Mace"
			menu5 += "Hellforged Spear"
			menu5 += "Hellforged Bow"
			menu5 += "Hellforged Dagger"
			menu5 += "Cancel"
			var/Result2 = input("Buy What?","Choose", null) in menu5
			if(Result2 == "Cancel")
				return
			if(Result2 == "Hellforged Axe")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Axes/HellAxe/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 100
					H.WeaponDamageMax = 120
					H.name = "Hellforged Axe - Unholy Quality"
					usr.Points -= 250
				else
					usr << "This costs 250 points."
			if(Result2 == "Hellforged Sword")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Swords/HellForgedSword/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 100
					H.WeaponDamageMax = 120
					H.name = "Hellforged Sword - Unholy Quality"
					usr.Points -= 250
				else
					usr << "This costs 250 points."
			if(Result2 == "Hellforged Mace")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Maces/DemonMace/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 100
					H.WeaponDamageMax = 120
					H.name = "Hellforged Mace - Unholy Quality"
					usr.Points -= 250
				else
					usr << "This costs 250 points."
			if(Result2 == "Hellforged Spear")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Spears/HellForgedSpear/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 100
					H.WeaponDamageMax = 120
					H.name = "Hellforged Spear - Unholy Quality"
					usr.Points -= 250
				else
					usr << "This costs 250 points."
			if(Result2 == "Hellforged Bow")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Bows/Hellbow/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 30
					H.WeaponDamageMax = 35
					H.name = "Hellforged Bow - Unholy Quality"
					usr.Points -= 250
				else
					usr << "This costs 250 points."
			if(Result2 == "Hellforged Dagger")
				if(usr.Points >= 250)
					var/obj/Items/Weapons/Daggers/HellForgedDagger/H = new
					H.loc = usr.loc
					H.WeaponDamageMin = 30
					H.WeaponDamageMax = 35
					H.name = "Hellforged Bow - Unholy Quality"
					usr.Points -= 125
				else
					usr << "This costs 125 points."
		if(Result == "Skill Scrolls")
			var/list/menu5 = new
			menu5 += "Weapon Skills"
			menu5 += "MetalCrafting Skill"
			menu5 += "EXP Bonus!!!"
			menu5 += "Cancel"
			var/Result2 = input("Buy What?","Choose", null) in menu5
			if(Result2 == "Cancel")
				return
			if(Result2 == "Weapon Skills")
				if(usr.Points >= 500)
					var/obj/Items/Shafts/SkillScroll/S = new
					S.loc = usr.loc
					S.ScrollSwordSkill = 150
					S.ScrollAxeSkill = 150
					S.ScrollMaceSkill = 150
					S.name = "Battle Scroll"
					usr.Points -= 500
				else
					usr << "This costs 500 points"
			if(Result2 == "MetalCrafting Skill")
				if(usr.Points >= 250)
					var/obj/Items/Shafts/SkillScroll/S = new
					S.loc = usr.loc
					S.ScrollMetalCraftingSkill = 110
					S.name = "Crafting Scroll"
					usr.Points -= 500
				else
					usr << "This costs 250 points"
			if(Result2 == "EXP Bonus!!!")
				if(usr.Points >= 500)
					var/obj/Items/Shafts/SkillScroll/S = new
					S.loc = usr.loc
					S.ScrollEXP = 250
					S.name = "EXP Scroll"
					usr.Points -= 500
				else
					usr << "This costs 500 points"
	else
		usr << "You do not have enough points to spend"
	//	Spawn_Standard()
		//		set category="Clan"
		//		for(var/obj/Items/Shafts/Standard/S in world)
		//			if(S.Owner == usr.Faction)
		//				usr << "You already have a standard, dummy."
		//				return
		//		var/obj/Items/Shafts/Standard/S2 = new
		//		S2.loc = usr.loc
		//		S2.Owner = usr.Faction
		//		S2.icon_state = usr.Faction
		//		S2.name = "Standard of [usr.Faction]"
		//	Find_Your_Standard()
		//		set category="Clan"
		//		for(var/obj/Items/Shafts/Standard/S in world)
		//			if(S.Owner == usr.Faction)
		//				if(ismob(S.loc))
		//					var/mob/K = S.loc
		//					usr << "<b><font color=lime>[S] location [K.x],[K.y],[K.z], inside of [S.loc]"
		//				else
		//					usr << "<b><font color=lime>[S] location [S.x],[S.y],[S.z]."
		//	Find_Enemy_Standards()
		//		set category="Clan"
		//		for(var/obj/Items/Shafts/Standard/S in world)
		//			if(S.Owner != usr.Faction)
		//				if(ismob(S.loc))
		//					var/mob/K = S.loc
		//					usr << "<b><font color=blue>[S] location [K.x],[K.y],[K.z], inside of [S.loc]."
		//				else
		//					usr << "<b><font color=lime>[S] location [S.x],[S.y],[S.z]."
		//	Send_Points()
		//		set category="Clan"
		//		var/T = input("Pick Someone")as null|anything in Players
		//		if(!T)
		//			return
		//		else
		//			for(var/mob/M in Players)
		//				if(T == M)
		//					var/N = input("Amount?") as null|num
		//					if(N >= usr.Points)
		//						N = usr.Points
		//					if(N <= 0)
		//						N = 0
		//					M.Points += N
		//					usr.Points -= N
		//					M << "[usr] has sent you [N] points."
		//					usr << "You have sent [M] [N] points."
		//					return