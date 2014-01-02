mob
	IsWood = 1

mob/proc/DestroyLeatherStation()
	for(var/mob/WorkShops/LeatherWorks/LW in view(3,src))
		if(LW.WorkShop == 1)
			del(LW)
mob/proc/DestroyCarpentryStation()
	for(var/mob/WorkShops/Carpentry/LW in view(3,src))
		if(LW.Carpentry == 1)
			del(LW)
mob/proc/DestroySmelterStation()
	for(var/mob/WorkShops/Smelters/LW in view(3,src))
		if(LW.Smelter == 1)
			del(LW)
mob/proc/DestroyForge()
	for(var/mob/WorkShops/Forge/LW in view(3,src))
		if(LW.Forge == 1)
			del(LW)
mob/proc/DestroyBone()
	for(var/mob/WorkShops/BoneCraft/LW in view(3,src))
		if(LW.BoneCraft == 1)
			del(LW)
mob/proc/DestroyPoison()
	for(var/mob/WorkShops/PoisonStation/LW in view(3,src))
		if(LW.Poison == 1)
			del(LW)
mob/proc/DestroyKit()
	for(var/mob/WorkShops/Kitchen/LW in view(3,src))
		if(LW.Kit == 1)
			del(LW)
mob/proc/DestroyGem()
	for(var/mob/WorkShops/GemCutter/LW in view(3,src))
		if(LW.IsGem == 1)
			del(LW)
mob/proc/DestroyMason()
	for(var/mob/WorkShops/Masonary/LW in view(3,src))
		if(LW.Mason == 1)
			del(LW)
mob/proc/DestroyGlass()
	for(var/mob/WorkShops/GlassForge/CF in view(3,src))
		if(CF.IsGlass == 1)
			del(CF)
mob/proc/DestroyPotion()
	for(var/mob/WorkShops/PotionStation/CF in view(3,src))
		if(CF.IsPW == 1)
			del(CF)
mob/proc/DestroyMelter()
	for(var/mob/WorkShops/Melter/CF in view(3,src))
		del(CF)
turf
	name = ""
obj

	DigAt
		icon = 'Cave.dmi'
		icon_state = "Dig"
		layer = 5
		Wagon = 1
mob
	WorkShops
		IsWood = 0
		WS = 1
		Forge
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					if(M.Infects == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyForge()
					if (Result == "Craft" && M.Plantman == 0)
						var/list/menu2 = new()
						if(M.Race == "Elf")
							menu2 += "Elven Shield"
						if(M.Race == "Orc")
							menu2 += "Metal OrcAxe"
							menu2 += "Metal OrcSword"
						if(M.Human == 1 || M.Dwarf)
							menu2 += "Metal Drill"
						menu2 += "Metal Spear Head"
						menu2 += "Metal Fence"
						menu2 += "Metal Cage"
						menu2 += "Metal Oven"
						menu2 += "Gold Oven"
						menu2 += "Silver Oven"
						menu2 += "Full Metal Armor"
						menu2 += "Metal ChestPlate"
						menu2 += "Metal Leggings"
						menu2 += "Metal Left Gauntlet"
						menu2 += "Metal Right Gauntlet"
						menu2 += "MetalNeckGuard"
						menu2 += "Metal Training Post"
						menu2 += "Metal Helmet"
						menu2 += "Metal Spear"
						menu2 += "Metal Buckler"
						menu2 += "Metal Chest"
						menu2 += "MetalSpade"
						menu2 += "Metal Flask"
						menu2 += "Metal Axe"
						menu2 += "Metal Bed"
						menu2 += "Metal Door"
						menu2 += "Metal Dagger"
						if(M.Dwarf == 1)
							menu2 += "Adamantium ChestPlate"
							menu2 += "Adamantium Leggings"
							menu2 += "Adamantium Left Gauntlet"
							menu2 += "Adamantium Right Gauntlet"
							menu2 += "Adamantium Buckler"
							menu2 += "Adamantium Sword"
							menu2 += "Adamantium Axe"
							menu2 += "Adamantium Mace"
							menu2 += "Adamantium Spear"
							menu2 += "Adamantium Helmet"
						if(M.MetalCraftingSkill >= 100)
							menu2 += "Soul Blade"
						if(M.Race != "Orc")
							menu2 += "MetalStraightSword"
							menu2 += "MetalGladius"
						menu2 += "Metal Bow"
						menu2 += "Metal Arrows"
						if(M.Race != "Orc")
							menu2 += "Gold Cage"
							menu2 += "Gold Coin"
							menu2 += "Gold Crown"
							menu2 += "Golden Throne"
							menu2 += "Silver Training Post"
							menu2 += "Silver Coin"
							menu2 += "Silver Arrows"
						for(var/obj/Items/gems/Diamond/R in M)
							if(M.Kobold == 0)
								menu2 += "Diamond Encrusted Metal ChestPlate"
								menu2 += "Diamond Encrusted Silver ChestPlate"
								menu2 += "Diamond Encrusted Metal Leggings"
								menu2 += "Diamond Encrusted Silver Leggings"
								menu2 += "Diamond Encrusted Metal Helmet"
								menu2 += "Diamond Encrusted Silver Helmet"
							if(M.Dwarf == 1)
								menu2 += "Diamond Encrusted Gold ChestPlate"
								menu2 += "Diamond Encrusted Gold Leggings"
								menu2 += "Diamond Encrusted Gold Helmet"
						for(var/obj/Items/gems/Emerald/R in M)
							if(M.Kobold == 0)
								menu2 += "Emerald Encrusted Metal ChestPlate"
								menu2 += "Emerald Encrusted Silver ChestPlate"
								menu2 += "Emerald Encrusted Metal Leggings"
								menu2 += "Emerald Encrusted Silver Leggings"
								menu2 += "Emerald Encrusted Metal Helmet"
								menu2 += "Emerald Encrusted Silver Helmet"
							if(M.Dwarf == 1)
								menu2 += "Emerald Encrusted Gold ChestPlate"
								menu2 += "Emerald Encrusted Gold Leggings"
								menu2 += "Emerald Encrusted Gold Helmet"
						for(var/obj/Items/gems/Ruby/R in M)
							if(M.Kobold == 0)
								menu2 += "Ruby Encrusted Metal ChestPlate"
								menu2 += "Ruby Encrusted Silver ChestPlate"
								menu2 += "Ruby Encrusted Metal Leggings"
								menu2 += "Ruby Encrusted Silver Leggings"
								menu2 += "Ruby Encrusted Metal Helmet"
								menu2 += "Ruby Encrusted Silver Helmet"
							if(M.Dwarf == 1)
								menu2 += "Ruby Encrusted Gold ChestPlate"
								menu2 += "Ruby Encrusted Gold Leggings"
								menu2 += "Ruby Encrusted Gold Helmet"
						if(M.Goblin == 0)
							if(M.Kobold == 0)
								menu2 += "Gold Spear"
								menu2 += "Gold Axe"
								menu2 += "Gold Dagger"
								menu2 += "Gold Mace"
								menu2 += "Gold Door"
								menu2 += "Gold Bed"
								menu2 += "Gold Training Post"
								menu2 += "Gold ChestPlate"
								menu2 += "Gold Leggings"
								menu2 += "Gold Helmet"
								menu2 += "Gold Buckler"
								menu2 += "Gold Chest"
								menu2 += "Golden Pillar"
								menu2 += "GoldStraightSword"
								menu2 += "GoldGladius"
								menu2 += "GoldLeftGauntlet"
								menu2 += "GoldRightGauntlet"
								menu2 += "GoldNeckGuard"
								menu2 += "Silver ChestPlate"
								menu2 += "Silver Chest"
								menu2 += "Silver Leggings"
								menu2 += "Silver Helmet"
								menu2 += "Silver Buckler"
								menu2 += "Silver Spear"
								menu2 += "Silver Axe"
								menu2 += "Silver Mace"
								menu2 += "Silver Dagger"
								menu2 += "Silver Sword"
								menu2 += "Silver Left Gauntlet"
								menu2 += "Silver Right Gauntlet"
								menu2 += "SilverNeckGuard"
						if(M.Kobold == 0)
							menu2 += "Metal Mace"
						menu2 += "Metal PickAxe"
						if(M.Goblin == 0)
							menu2 += "Gold PickAxe"
						if(M.Goblin == 1)
							menu2 += "Goblin Sword"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Elven Shield")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Armours/Shields/GoldBuckler/LB = new
									LB.IsElf = 1
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if(Result2 == "Soul Blade")
							if(M in range(1,src))
								for(var/obj/Items/Weapons/Swords/HellForgedSword/S1 in M)
									if(S1.suffix == "(Carrying)")
										for(var/obj/Items/Weapons/Maces/DemonMace/S2 in M)
											if(S2.suffix == "(Carrying)")
												for(var/obj/Items/Weapons/Daggers/HellForgedDagger/S3 in M)
													if(S3.suffix == "(Carrying)")
														for(var/obj/Items/Weapons/Spears/HellForgedSpear/S4 in M)
															if(S4.suffix == "(Carrying)")
																for(var/obj/Items/Weapons/Axes/HellAxe/S5 in M)
																	if(S5.suffix == "(Carrying)")
																		var/obj/Items/Weapons/Swords/SoulBlade/S6 = new
																		S6.loc = M.loc
																		S6.WeaponDamageMin = 100
																		S6.WeaponDamageMax = 120
																		for(var/turf/L in range(1,src))
																			if(L.icon_state == "Lava")
																				S6.WeaponDamageMin += 10
																				S6.WeaponDamageMax += 10
																				break
																		M.weight -= S1.weight
																		M.weight -= S2.weight
																		M.weight -= S3.weight
																		M.weight -= S4.weight
																		M.weight -= S5.weight
																		var/mob/Monsters/Wagon/W = new()
																		S1.loc = W
																		S2.loc = W
																		S3.loc = W
																		S4.loc = W
																		S5.loc = W
																		del W
																		return

						if (Result2 == "MetalNeckGuard")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/MetalNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Metal"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "Metal Oven")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Furniture/Ovens/Oven/LB = new
										LB.loc = M.loc
										LB.M = "Metal"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
						if (Result2 == "Gold Oven")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Furniture/Ovens/GoldOven/LB = new
										LB.loc = M.loc
										LB.M = "Gold"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
						if (Result2 == "Silver Oven")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Furniture/Ovens/SilverOven/LB = new
										LB.loc = M.loc
										LB.M = "Silver"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
						if (Result2 == "SilverNeckGuard")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/SilverNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Silver"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "GoldNeckGuard")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/GoldNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Gold"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "Golden Pillar")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M in range(1,src))
										var/obj/Items/Furniture/Pillars/GoldPillar/LB = new
										LB.loc = M.loc
										LB.M = "Gold"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "Silver Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Ingots/SilverBar/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/Ingots/SilverBar/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.MetalCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack == 1)
												for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
													if(L.suffix == "(Equiped)")
														if(L.Content <= 250)
															var/obj/Items/Arrows/SilverArrow/LB = new
															LB.loc = L
															var/obj/Items/Arrows/SilverArrow/LB2 = new
															LB2.loc = L
															var/obj/Items/Arrows/SilverArrow/LB3 = new
															LB3.loc = L
															var/obj/Items/Arrows/SilverArrow/LB4 = new
															LB4.loc = L
															var/obj/Items/Arrows/SilverArrow/LB5 = new
															LB5.loc = L
															var/obj/Items/Arrows/SilverArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/SilverArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/SilverArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/SilverArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/SilverArrow/LB10 = new
															LB10.loc = L
															M.MetalCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "The quiver has too many arrows in it."
															return
											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Metal Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Ingots/MetalIngot/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.MetalCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack == 1)
												for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
													if(L.suffix == "(Equiped)")
														if(L.Content <= 250)
															var/obj/Items/Arrows/MetalArrow/LB = new
															LB.loc = L
															var/obj/Items/Arrows/MetalArrow/LB2 = new
															LB2.loc = L
															var/obj/Items/Arrows/MetalArrow/LB3 = new
															LB3.loc = L
															var/obj/Items/Arrows/MetalArrow/LB4 = new
															LB4.loc = L
															var/obj/Items/Arrows/MetalArrow/LB5 = new
															LB5.loc = L
															var/obj/Items/Arrows/MetalArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/MetalArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/MetalArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/MetalArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/MetalArrow/LB10 = new
															LB10.loc = L
															M.MetalCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "The quiver has too many arrows in it."
															return

											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Metal Flask")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Shafts/MetalFlask/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Metal Drill")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Drill/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Gold Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/GoldChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Silver Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/SilverChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Metal Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/MetalChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "MetalSpade")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Shafts/Spade/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Spear Head")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Shafts/SpearHead/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Door")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/GoldDoor/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalDoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/GoldTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/MetalTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/SilverTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Door")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/MetalDoor/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalDoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Fence")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Fences/MetalFence/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalDoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Golden Throne")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Chairs/GoldenThrone/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Bed")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Beds/GoldBed/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Bed")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Beds/MetalBed/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Coin")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Coins/SilverCoin/LB = new
									LB.loc = M.loc
									LB.CoinContent = rand(50,100)
									LB.name = "Silver Coins {[LB.CoinContent]}"
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Coin")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Coins/GoldCoin/LB = new

									LB.loc = M.loc
									LB.CoinContent = rand(50,100)
									LB.name = "Gold Coins {[LB.CoinContent]}"
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return

						if (Result2 == "Metal Cage")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Traps/Cages/MetalCage/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Cage")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Traps/Cages/GoldCage/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Crown")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/Crown/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if(Result2 == "Diamond Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/DiamondMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Diamond Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/DiamondSilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Silver"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/EmeraldMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Emerald Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/EmeraldSilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/RubyMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/RubySilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/RubyGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/RubyMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/DiamondGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 15
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/RubyGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Helmets/EmeraldGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/ChestPlates/RubySilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										break
										return
						if (Result2 == "Metal Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/MetalRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Adamantium Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/AdamantiumRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Metal Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/MetalLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if(Result2 == "Adamantium Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/AdamantiumLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/SilverChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Adamantium ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/AdamantiumChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "GoldRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/GoldRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "GoldLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/GoldLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/GoldChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Diamond Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/DiamondGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/DiamondSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/DiamondMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/RubyMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/RubyGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/EmeraldMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/EmeraldGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/EmeraldSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Armours/Legs/RubySilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										for(var/turf/L in range(1,src))
											if(L.icon_state == "Lava")
												LB.Defence += 3
												break
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Dwarf == 1)
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/SilverLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/AdamantiumLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/GoldLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/SilverHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/AdamantiumHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/GoldHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/SilverRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/SilverLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Shields/SilverBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Gold Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Armours/Shields/GoldBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Metal Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Shields/MetalBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Shields/AdamantiumBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/MetalHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/MetalLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Dwarf == 1)
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/MetalChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Dark Legion Armor (5 ingots)")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
									var/obj/Items/Armours/ChestPlates/DarkLegionChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Ingots/MetalIngot/S2 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.MetalCraftingSkill += 1
										del(S2)
										break
									var/obj/Items/Armours/Legs/DarkLegionLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Ingots/MetalIngot/S3 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.MetalCraftingSkill += 1
										del(S3)
										break
									var/obj/Items/Armours/Helmets/DarkLegionHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Ingots/MetalIngot/S4 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.MetalCraftingSkill += 1
										del(S4)
										break
									var/obj/Items/Armours/LeftArms/DarkLegionLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Ingots/MetalIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Armours/RightArms/DarkLegionRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "Dragonlords of DM Armor (6 ingots)")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
									var/obj/Items/Armours/ChestPlates/DragonlordsofDMChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Ingots/MetalIngot/S2 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.MetalCraftingSkill += 1
										del(S2)
										break
									var/obj/Items/Armours/Legs/DragonlordsofDMLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Ingots/MetalIngot/S3 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.MetalCraftingSkill += 1
										del(S3)
										break
									var/obj/Items/Armours/Helmets/DragonlordsofDMHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Ingots/MetalIngot/S4 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.MetalCraftingSkill += 1
										del(S4)
										break
									var/obj/Items/Armours/LeftArms/DragonlordsofDMLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Ingots/MetalIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Armours/RightArms/DragonlordsofDMRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
								for(var/obj/Items/Ingots/MetalIngot/S6 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S6.weight
										M.MetalCraftingSkill += 1
										del(S6)
										break
									var/obj/Items/Armours/Shields/DragonlordsofDMBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.Defence = 21
									LB.name = "[LB.name] - [LB.CraftRank]"
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S6.weight
									LB.loc = M.loc
									del(S6)
									break
						if (Result2 == "Gold Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/GoldMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Full Metal Armor")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
									var/obj/Items/Armours/ChestPlates/MetalChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Ingots/MetalIngot/S2 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.MetalCraftingSkill += 1
										del(S2)
										break
									var/obj/Items/Armours/Legs/MetalLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Ingots/MetalIngot/S3 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.MetalCraftingSkill += 1
										del(S3)
										break
									var/obj/Items/Armours/Helmets/MetalHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Ingots/MetalIngot/S4 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.MetalCraftingSkill += 1
										del(S4)
										break
									var/obj/Items/Armours/LeftArms/MetalLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Ingots/MetalIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Armours/RightArms/MetalRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
								for(var/obj/Items/Ingots/MetalIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Armours/Shields/MetalBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.Defence += 3
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "Gold Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/GoldMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold PickAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Picks/GoldPickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/GoldAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									if(M.Dwarf == 1)
										LB.WeaponDamageMin += 1
										LB.WeaponDamageMax += 1
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/GoldDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/SilverSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/SilverDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if(Result2 == "Silver Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/SilverSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/SilverMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/SilverAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/GoldSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Bow")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Bows/MetalBow/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/MetalSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/MetalMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldGladius")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoldGladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalGladius")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/Gladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldStraightSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoldStraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalStraightSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/StraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/AdamantiumSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/AdamantiumDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/AdamantiumAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/AdamantiumMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/AdamantiumSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Adamantium"
									LB.AdamantiumWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									LB.name = "MetalOrcSword"
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Goblin Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal PickAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Picks/PickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/MetalDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/MetalOrcAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/MetalAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									if(M.Dwarf == 1)
										LB.WeaponDamageMin += 1
										LB.WeaponDamageMax += 1
									for(var/turf/L in range(1,src))
										if(L.icon_state == "Lava")
											LB.WeaponDamageMin += 10
											LB.WeaponDamageMax += 10
											break
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
		PotionStation
			name = "AlchemyStation"
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					if(M)
						var/list/menu = new()
						menu += "Craft"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Destroy")
							if(M in range(1,src))
								M.DestroyPotion()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Potion of Poison Immunity"
							menu2 += "Potion of Restoration"
							menu2 += "Potion of Internal Restoration"
							menu2 += "Potion of LongLife"
							menu2 += "Cure Vampirism"
							menu2 += "Potion of Vampirism"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Cure Vampirism")
								if(M in range(1,src))
									src.Content = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Seeds/Garlic/F in M)
										if(src.Content)
											var/fail
											fail = prob(M.PotionSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= F.weight
												del(F)
												M.PotionSkill += 0.5
												src.Content = null
												break
												return
											var/obj/P = src.Content
											P.IsPotion = 1
											P.IsEmpty = 0
											P.icon_state = "BluePotion"
											M.PotionSkill += 1
											P.name = "Vampirism Cure"
											M.weight -= F.weight
											src.Content = null
											del(F)
											break
											return
									usr << "You need a piece of garlic and an empty bottle"
							if (Result2 == "Potion of Poison Immunity")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/gems/Emerald/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/PoisonSporeSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "GreenPotion"
												M.PotionSkill += 1
												P.name = "Potion of Poison Immunity"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You a cut emerald, a poison spore plant seed, and an empty bottle"
							if (Result2 == "Potion of Vampirism")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Shafts/WoodenBucket/F in M)
										if(F.HasWater == "Blood")
											if(src.Content)
												src.Content2 = F
										else
											usr << "You don't have all of the ingredients."
											return
									for(var/obj/Items/Food/Meats/UnCookedMeat/T in M)
										if(src.Content)
											if(src.Content2)
												if(T.Content2 == "Demon")
													src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BloodPotion"
												M.PotionSkill += 1
												P.name = "Potion of Vampirism"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break

							if (Result2 == "Potion of LongLife")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/gems/Diamond/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Silks/SpiderSilk/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "RedPotion"
												M.PotionSkill += 1
												P.name = "Potion of LongLife"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a cut diamond, a clump of spider silk, and an empty bottle"

							if (Result2 == "Potion of Internal Restoration")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungases/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/TomatoSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BluePotion"
												M.PotionSkill += 1
												P.name = "Potion of Internal Restoration"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a piece of fungus, a tomato seed, and an empty bottle"
							if (Result2 == "Potion of Restoration")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungases/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/TreeSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BluePotion"
												M.PotionSkill += 1
												P.name = "Potion of Restoration"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a piece of fungus, a tree seed, and an empty bottle"

		PoisonStation
			name = "PoisonStation"
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					if(M.UsesPoison == 1)
						var/list/menu = new()
						menu += "Craft"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Destroy")
							if(M in range(1,src))
								M.DestroyPoison()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Extract Poison"
							menu2 += "Extract Toxic"
							if(M.Race == "Orc")
								menu2 += "Extract Strong Poison"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Extract Toxic")
								if(M in range(1,src))
									for(var/obj/Items/Glands/ToxicGland/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.PoisonSkill += 1
											break
											return
										var/obj/Items/Poisons/Toxic/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill *2
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
							if (Result2 == "Extract Strong Poison")
								if(M in range(1,src))
									for(var/obj/Items/Glands/PoisonRoots/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill*3
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									M.Owner << "You need poison spore plant roots to make this."
							if (Result2 == "Extract Poison")
								if(M in range(1,src))
									for(var/obj/Items/Glands/PoisonRoots/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									for(var/obj/Items/Glands/PoisonGland/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
		GemCutter
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyGem()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "CutEmerald"
						menu2 += "CutRuby"
						menu2 += "CutDiamond"
						for(var/obj/Items/gems/Rainbow/R in M)
							menu2 += "Rainbow Pearl Ring"
						for(var/obj/Items/gems/UnCutRainbow/R in M)
							menu2 += "CutRainbowPearl"
						menu2 += "FlawlessCutEmerald"
						menu2 += "FlawlessCutRuby"
						menu2 += "FlawlessCutDiamond"
						menu2 += "Silver Ruby Ring"
						menu2 += "Silver Diamond Ring"
						menu2 += "Silver Emerald Ring"
						menu2 += "Gold Ruby Ring"
						menu2 += "Gold Diamond Ring"
						menu2 += "Gold Emerald Ring"
						menu2 += "Plant Fibre Ring"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "CutEmerald")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutEmerald/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Emerald/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "CutRainbowPearl")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutRainbow/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Rainbow/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutEmerald")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutEmerald/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Emerald/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Emerald"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "CutRuby")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutRuby/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Ruby/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutRuby")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutRuby/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Ruby/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Ruby"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutDiamond")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutDiamond/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Diamond/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Diamond"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "CutDiamond")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutDiamond/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.JewlCraftingSkill+=2
										return
									var/obj/Items/gems/Diamond/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Silver Ruby Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/S in M)
									for(var/obj/Items/Ingots/SilverBar/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/RubyRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Ruby Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Silver Diamond Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/S in M)
									for(var/obj/Items/Ingots/SilverBar/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/DiamondRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Diamond Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Rainbow Pearl Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Rainbow/S in M)
									for(var/obj/Items/Ingots/AdamantiumIngot/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/RainbowRing/LB = new
										LB.loc = M.loc
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										return
							usr << "You need a cut rainbow stone and an adamantium ingot for this."
						if (Result2 == "Silver Emerald Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/S in M)
									for(var/obj/Items/Ingots/SilverBar/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/EmeraldRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Emerald Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Gold Ruby Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldBar/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/RubyRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Gold Diamond Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldBar/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/DiamondRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Gold Emerald Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldBar/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/EmeraldRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Plant Fibre Ring")
							if(M in range(1,src))
								for(var/obj/Items/Glands/PoisonRoots/S in M)
									for(var/obj/Items/Ingots/GoldBar/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/PlantFibreRing/LB = new
										LB.loc = M.loc
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
									return
		GlassForge
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyGlass()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Glass Bottle"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Glass Bottle")
							for(var/obj/Items/ores/Sand/S in M)
								var/fail
								fail = prob(M.SmeltingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									del(S)
									M.SmeltingSkill += 1
									break
									return
								var/obj/Items/Potions/EmptyBottle/E = new
								E.loc = M.loc
								M.weight -= S.weight
								del(S)
								M.SmeltingSkill += 1
								break
								return
		Smelters
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroySmelterStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Metal Ingot"
						menu2 += "Gold Bar"
						menu2 += "Silver Bar"
						if(M.Dwarf == 1)
							menu2 += "Adamantium Ingot"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Metal Ingot")
							if(M in range(1,src))
								for(var/obj/Items/ores/metal/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.SmeltingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Ingots/MetalIngot/LB = new
									LB.loc = M.loc
									M.SmeltingSkill += 0.5
									M.weight -= S.weight
									del(S)
						if (Result2 == "Gold Bar")
							if(M in range(1,src))
								for(var/obj/Items/ores/GoldNugget/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.SmeltingSkill += 1
										break
										return
									var/obj/Items/Ingots/GoldBar/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.SmeltingSkill += 0.5
									del(S)
						if (Result2 == "Silver Bar")
							if(M in range(1,src))
								for(var/obj/Items/ores/silver/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.SmeltingSkill += 1
										break
										return
									var/obj/Items/Ingots/SilverBar/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.SmeltingSkill += 0.5
									del(S)
						if (Result2 == "Adamantium Ingot")
							if(M in range(1,src))
								for(var/obj/Items/ores/Adamantium/S in M)
									var/fail
									fail = prob(M.SmeltingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.SmeltingSkill += 1
										break
										return
									var/obj/Items/Ingots/AdamantiumIngot/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.SmeltingSkill += 1.5
									del(S)
		CampFires
			GoodAltar
				icon = 'Cave.dmi'
				icon_state = "GoodAltar"
				weight = 100
				suffix = null
				HP = 200
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						var/list/menu = new()
						menu += "Pray"
						if(src.Content2 >= 150)
							menu += "Holy Shield"
						for(var/obj/Items/Shafts/MetalFlask/F in M)
							if(F.HasWater == "Water")
								menu += "Bless Flask of Water"
						for(var/obj/Items/Shafts/LeatherFlask/F in M)
							if(F.HasWater == "Water")
								menu += "Bless Flask of Water"
						if(usr.IsGoodGod == 1)
							menu += "Absorb Power"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if(Result == "Cancel")
							return
						if(Result == "Holy Shield")
							if(src.Content2 >= 150 && M.Shielded == 0 && M.Undead == 0 && M.Vampire == 0 && M.Infects == 0 && M.Unholy == 0)
								src.Content2 -= 150
								M.Defence += 25
								M.Shielded = 1
								M.ImmuneToMagic = 1
								M.overlays += 'HolyShield.dmi'
								view(usr) << "[src] covers [M] in a holy shield of light!"
								return
							else
								usr << "[src] either doesn't have 150 prayer points OR you are trying to cast on an unholy/shielded creature."
								return
						if(Result == "Bless Flask of Water")
							for(var/obj/Items/Shafts/LeatherFlask/F in M)
								if(F.HasWater == "Water")
									view(M) << "[M] blesses the flask of water with the power of the lords of light!"
									F.HasWater = "Holy"
									return
							for(var/obj/Items/Shafts/MetalFlask/F in M)
								if(F.HasWater == "Water")
									view(M) << "[M] blesses the flask of water with the power of the lords of light!"
									F.HasWater = "Holy"
									return
						if(Result == "Absorb Power")
							if(usr.IsGoodGod == 1)
								if(src.Owner == usr)
									view(usr) << "[usr] absorbs the worship power from the altar!"
									usr.WorshipPoints += src.Content2
									src.Content2 = 0
								else
									usr << "You do not own this altar!"
						if(Result == "Destroy")
							del(src)
							return
						if(Result == "Pray")
							if(M.Undead == 0 && M.Infects == 0 && M.Hunger >= 70)
								view(M) << "[M] prays to the [src]"
								src.Content2 += 15
								M.Hunger -= 70
								M.Tiredness -= 70
								if(src.Content2 >= 1000)
									usr.Race = "Good God"
									usr.verbs+=typesof(/GoodGod/verb/)
									usr.Done = 1
									usr.User = 1
									usr.Restart = 0
									usr.IsGoodGod = 1
									usr.sight = 30
									usr.icon = 'HolyShield.dmi'
									usr.WorshipPoints += 50
									usr << "Your loyalty to good has accended you to godness!"
							else
								usr << "Undead CANNOT pray to a good god!! Or you are too hungry."
							return

			NeutralAltar
				icon = 'Cave.dmi'
				icon_state = "NeutralAltar"
				weight = 100
				suffix = null
				HP = 200
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						var/list/menu = new()
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result == "Cancel")
							return
						if (Result == "Destroy")
							for(var/mob/S in world)
								if(S == src.Owner)
									S << "Your altar is being destroyed by [M]! You have 15 seconds!"
									M.Owner << "Altar will be destroyed in 15 seconds!"
									spawn(150)
										if(M)
											if(M in range(1,src))
												S << "One of your altars has been destroyed! [src.x],[src.y],[src.z]"
												S.WorshipPoints = -50000
												S << "All of your altars have been destroyed, you are dead!"
												del(src)
												return
											else
												S << "[M] has failed to destroy your altar."
			EvilAltar
				icon = 'Cave.dmi'
				icon_state = "EvilAltar"
				weight = 100
				HP = 200
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						var/list/menu = new()
						menu += "Sacrifice"
						if(src.Content2 >= 150)
							menu += "Unholy Vigor"
						for(var/obj/Items/Shafts/MetalFlask/F in M)
							if(F.HasWater == "Blood")
								menu += "Bless Flask of Blood"
						for(var/obj/Items/Shafts/LeatherFlask/F in M)
							if(F.HasWater == "Blood")
								menu += "Bless Flask of Blood"
						if(usr.IsEvilGod == 1)
							menu += "Absorb Power"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if(Result == "Cancel")
							return
						if(Result == "Destroy")
							del(src)
							return
						if(Result == "Bless Flask of Blood")
							for(var/obj/Items/Shafts/LeatherFlask/F in M)
								if(F.HasWater == "Blood")
									view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
									F.HasWater = "Unholy"
									return
							for(var/obj/Items/Shafts/MetalFlask/F in M)
								if(F.HasWater == "Blood")
									view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
									F.HasWater = "Unholy"
									return
						if(Result == "Unholy Vigor")
							if(src.Content2 >= 150 && M.Shielded == 0 && M.Unholy == 0)
								view(usr) << "[usr] fills [M] with unholy strength making their attacks much more damaging!"
								M.WeaponDamageMin += rand(10,15)
								M.WeaponDamageMax += rand(15,21)
								M.Unholy = 1
								M.ImmuneToTemperature = 1
								src.Content2 -= 150
							else
								usr << "[src] either doesn't have 150 worship points or that creature has been blessed by a good god, or you have already given it unholy vigor."
						if(Result == "Absorb Power")
							if(usr.IsEvilGod == 1)
								if(src.Owner == usr)
									view(usr) << "[usr] absorbs the worship power from the altar!"
									usr.WorshipPoints += src.Content2
									src.Content2 = 0
								else
									usr << "You do not own this altar!"
						if(Result == "Sacrifice")
							if(M in view(2,src))
								if(M.Race != "Mind Worm")
									usr << "[M] leaps into the flames of the dispicable altar and allows the dark tendrils to consume it."
									src.Content2 += M.Level*2
									src.Content2 += M.Strength + M.Agility / 2
									M.DeathType = "Sacrificed To Death"
									M.GoingToDie = 1
									M.Death()
									if(src.Content2 >= 1000)
										usr.Race = "Evil God"
										usr.verbs+=typesof(/EvilGod/verb/)
										usr.Done = 1
										usr.User = 1
										usr.Restart = 0
										usr.IsEvilGod = 1
										usr.sight = 30
										usr.icon = 'UnholyShield.dmi'
										usr.WorshipPoints += 50
										usr << "Your loyalty to evil has accended you to godness!"
									return

			Fire
				density = 1
				luminosity = 6
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "Fire"
				New()
					Heat()
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Cook"
					menu += "Tear all Meat from Corpses"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							del(src)
					if(Result == "Tear all Meat from Corpses")
						for(var/mob/Body/m in M)
							if(m in M)
								if(M in range(1,src))
									m.TearMeats()
					if (Result == "Cook")
						for(var/obj/Items/Food/Meats/UnCookedMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							CB.name = "Cooked [B.name]"
							CB.Content2 = B.Content2
							del(B)
		Kitchen
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Cook"
					menu += "Tear all Meat from Corpses"
					menu += "Make Cheese"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyKit()
					if(Result == "Tear all Meat from Corpses")
						for(var/mob/Body/m in M)
							if(m in M)
								if(M in range(1,src))
									m.TearMeats()
					if(Result == "Make Cheese")
						for(var/obj/Items/Shafts/WoodenBucket/B in M)
							if(B in M)
								if(M in range(1,src))
									if(B.HasWater == "Milk")
										var/obj/Items/Food/CookedMeats/Cheese/CB = new
										CB.loc = M.loc
										M.CookingSkill+=2
										CB.name = "[B.Content3] Cheese"
										B.HasWater = null
										B.Content3 = 0

					if (Result == "Cook")
						for(var/obj/Items/Food/Meats/UnCookedMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							CB.name = "Cooked [B.name]"
							del(B)
		Melter
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyMelter()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Melt All Weapons On Unit"
						menu2 += "Melt All Armours On Unit"
						menu2 += "Melt All Items Near By"
						if(M.Gremlin == 1)
							menu2 += "Full Gremlin Armor"
							menu2 += "Gremlin Chestplate"
							menu2 += "Gremlin Leggings"
							menu2 += "Gremlin Helmet"
							menu2 += "Gremlin Left Gauntlet"
							menu2 += "Gremlin Right Gauntlet"
							menu2 += "Gremlin Buckler"
							menu2 += "Gremlin Sword"
							menu2 += "Gremlin Mace"
							menu2 += "Gremlin Spear"
							menu2 += "Gremlin Training Post"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Gremlin Chestplate")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/ChestPlates/GremlinChestplate/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Gremlin Leggings")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Legs/GremlinLeggings/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
						if (Result2 == "Full Gremlin Armor")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Legs/GremlinLeggings/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/ChestPlates/GremlinChestplate/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Helmets/GremlinHelmet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/LeftArms/GremlinLeftGauntlet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/RightArms/GremlinRightGauntlet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Shields/GremlinBuckler/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
						if (Result2 == "Gremlin Helmet")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Helmets/GremlinHelmet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Gremlin Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/LeftArms/GremlinLeftGauntlet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Gremlin Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/RightArms/GremlinRightGauntlet/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Gremlin Buckler")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Armours/Shields/GremlinBuckler/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalArmourCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Defence += 10
											if(S.name == "Diamond")
												LB.Defence += 10
											if(S.name == "Bread")
												LB.Defence -= 10
											if(S.name == "Flour")
												LB.Defence -= 10
											if(S.name == "Bread Dough")
												LB.Defence -= 11
											if(S.name == "Cake Mix")
												LB.Defence -= 50
											if(S.name == "Ruby")
												LB.Defence += 5
											if(S.name == "UnCutRuby")
												LB.Defence += 5
											if(S.icon_state == "Meat")
												LB.Defence -= 6
											if(S.name == "Emerald")
												LB.Defence += 5
											if(S.name == "UnCutEmerald")
												LB.Defence += 5
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Defence += 15
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Defence += 25
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Gremlin Sword")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Weapons/Swords/GremlinSword/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalWeaponCraft()
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										if(S.name == "UnCutDiamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Diamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Bread")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Flour")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Bread Dough")
											LB.WeaponDamageMin -= 35
											LB.WeaponDamageMax -= 45
										if(S.name == "Cake Mix")
											LB.WeaponDamageMin -= 300
											LB.WeaponDamageMax -= 350
										if(S.name == "Ruby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutRuby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Meat")
											LB.WeaponDamageMin -= 10
											LB.WeaponDamageMax -= 25
										if(S.name == "Emerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutEmerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
											LB.WeaponDamageMin += 50
											LB.WeaponDamageMax += 75
										if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
											LB.WeaponDamageMin += 130
											LB.WeaponDamageMax += 155
										del(S)
										break
										return
						if (Result2 == "Gremlin Mace")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Weapons/Maces/GremlinMace/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalWeaponCraft()
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										if(S.name == "UnCutDiamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Diamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Bread")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Flour")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Bread Dough")
											LB.WeaponDamageMin -= 35
											LB.WeaponDamageMax -= 45
										if(S.name == "Cake Mix")
											LB.WeaponDamageMin -= 300
											LB.WeaponDamageMax -= 350
										if(S.name == "Ruby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutRuby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Meat")
											LB.WeaponDamageMin -= 10
											LB.WeaponDamageMax -= 25
										if(S.name == "Emerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutEmerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
											LB.WeaponDamageMin += 50
											LB.WeaponDamageMax += 75
										if(S.icon_state == "UCcutRainbowPearl" || S.icon_state == "RainbowPearl")
											LB.WeaponDamageMin += 130
											LB.WeaponDamageMax += 155
										del(S)
										break
										return
						if (Result2 == "Gremlin Spear")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Weapons/Spears/GremlinSpear/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.MetalWeaponCraft()
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										if(S.name == "UnCutDiamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Diamond")
											LB.WeaponDamageMin += 30
											LB.WeaponDamageMax += 35
										if(S.name == "Bread")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Flour")
											LB.WeaponDamageMin -= 30
											LB.WeaponDamageMax -= 35
										if(S.name == "Bread Dough")
											LB.WeaponDamageMin -= 35
											LB.WeaponDamageMax -= 45
										if(S.name == "Cake Mix")
											LB.WeaponDamageMin -= 300
											LB.WeaponDamageMax -= 350
										if(S.name == "Ruby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutRuby")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Meat")
											LB.WeaponDamageMin -= 10
											LB.WeaponDamageMax -= 25
										if(S.name == "Emerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.name == "UnCutEmerald")
											LB.WeaponDamageMin += 20
											LB.WeaponDamageMax += 25
										if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
											LB.WeaponDamageMin += 50
											LB.WeaponDamageMax += 75
										if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
											LB.WeaponDamageMin += 130
											LB.WeaponDamageMax += 155
										del(S)
										break
										return
						if (Result2 == "Gremlin Training Post")
							if(M in range(1,src))
								for(var/obj/Items/S in M)
									if(S.suffix == "(Carrying)")
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										var/obj/Items/Furniture/Posts/GremlinTrainingPost/LB = new
										if(M.BoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.BoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.BoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.BoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.BoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.BoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.BoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.BoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.M = S.name
										LB.TrainCraft()
										if(M)
											if(S.name == "UnCutDiamond")
												LB.Content3 += 0.2
											if(S.name == "Diamond")
												LB.Content3 += 0.2
											if(S.name == "Bread")
												LB.Content3 -= 0.2
											if(S.name == "Flour")
												LB.Content3 -= 0.2
											if(S.name == "Bread Dough")
												LB.Content3 -= 0.3
											if(S.name == "Cake Mix")
												LB.Content3 -= 4
											if(S.name == "Ruby")
												LB.Content3 += 0.1
											if(S.name == "UnCutRuby")
												LB.Content3 += 0.1
											if(S.icon_state == "Meat")
												LB.Content3 -= 0.15
											if(S.name == "Emerald")
												LB.Content3 += 0.1
											if(S.name == "UnCutEmerald")
												LB.Content3 += 0.1
											if(S.icon_state == "Adamantium Spear" || S.icon_state == "Adamantium Leggings" || S.icon_state == "Adamantium ChestPlate" || S.icon_state == "Adamantium Sword" || S.icon_state == "Adamantium Helmet" || S.icon_state == "AdamantiumLeftArm" || S.icon_state == "AdamantiumRightArm" || S.icon_state == "Adamantium Buckler" || S.icon_state == "Adamantium Axe" || S.icon_state == "Adamantium Mace" || S.icon_state == "Adamantium" || S.icon_state == "AdamantiumIngot")
												LB.Content3 += 1.5
											if(S.icon_state == "UnCutRainbowPearl" || S.icon_state == "RainbowPearl")
												LB.Content3 += 3
										M.BoneCraftingSkill += 0.25
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Melt All Weapons On Unit")
							var/choice = alert(usr, "This will destroy all NON-EQUIPED weapons on your unit, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								for(var/obj/Items/Weapons/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										del(W)
										var/EX = 0.5
										usr << "Done, [M] gains [EX] exp!"
										M.EXP += EX
						if (Result2 == "Melt All Armours On Unit")
							var/choice = alert(usr, "This will destroy all NON-EQUIPED armours on your unit, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								for(var/obj/Items/Armours/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										del(W)
										var/EX = 0.5
										usr << "Done, [M] gains [EX] exp!"
										M.EXP += EX
						if (Result2 == "Melt All Items Near By")
							var/choice = alert(usr, "This will destroy all near by items on the ground, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								for(var/obj/Items/W in view(1,src))
									if(W.suffix == null)
										if(W.Content3 == "Cage")
											usr << "Cant destroy cages, please remove it!"
											return
										if(W.Body == 0)
											del(W)
											var/EX = 0.5
											usr << "Done, [M] gains [EX] exp!"
											M.EXP += EX
		Masonary
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyMason()
					if (Result == "Craft")
						var/list/menu2 = new()
						if(M.Kobold == 0 && M.Human == 0 && M.Race != "Orc")
							menu2 += "Stone Pillar"
							menu2 += "Stone Door"
						if(M.Human == 1)
							menu2 += "Anti-Portal Stone"
						if(M.Dwarf == 1)
							if(M.StoneCraftingSkill >= 200)
								menu2 += "Stone Golem"
						menu2 += "Stone Fence"
						menu2 += "Stone Statue"
						menu2 += "Tomb Stone"
						if(M.Gargoyle == 1)
							if(M.Level >= 20)
								if(M.CreatedGargoyle == 0)
									menu2 += "Create Gargoyle"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Stone Golem")
							for(var/obj/Items/ores/stone/S in M)
								for(var/obj/Items/gems/Emerald/S2 in M)
									if(S2.Content == "Flawless")
										if(M.MagicalAptitude == 1)
											var/fail
											fail = prob(M.StoneCraftingSkill*3)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												del(S)
												M.StoneCraftingSkill += 1
												break
												return
											var/mob/Monsters/StoneGolem/G = new(M.loc)
											G.Owner = M.Owner
											usr.UnitList += G
											G.name = "{[usr]} Golem"
											M.StoneCraftingSkill += 1
											del(S)
											del(S2)
											return
								break
						if (Result2 == "Anti-Portal Stone")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									for(var/obj/Items/gems/Diamond/S2 in M)
										for(var/obj/Items/gems/Ruby/S3 in M)
											var/fail
											fail = prob(M.StoneCraftingSkill*3)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												del(S)
												M.StoneCraftingSkill += 1
												break
												return
											var/obj/Items/Furniture/Pillars/PortalStone/T = new
											T.loc = M.loc
											T.M = S
											M.weight -= S.weight
											M.weight -= S2.weight
											M.weight -= S3.weight
											M.StoneCraftingSkill += 1
											del(S)
											del(S2)
											del(S3)
											return
										break
									break
								usr << "You need a cut diamond, a cut ruby, and a stone to make this."
						if (Result2 == "Stone Statue")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Pillars/Statue/T = new
									T.icon = M.icon
									T.icon_state = M.icon_state
									T.overlays += M.overlays
									T.loc = M.loc
									T.M = S
									T.icon += rgb(150,150,150)
									T.dir = M.dir
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									T.desc = "This is a statue of [M] it is made from [S]."
									T.name = T.desc
									for(var/obj/F in T.overlays)
										F.icon += rgb(150,150,150)
									del(S)
									break
									return
						if (Result2 == "Stone Fence")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Fences/StoneFence/LB = new
									if(M.StoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.StoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.StoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.StoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.StoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.StoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.StoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Stone"
									LB.MetalDoorCraft()
									M.StoneCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Stone Door")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/StoneDoor/LB = new
									if(M.StoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.StoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.StoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.StoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.StoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.StoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.StoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Stone"
									LB.MetalDoorCraft()
									M.StoneCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Create Gargoyle")
							if(M in range(1,src))
								if(M.CreatedGargoyle == 0)
									for(var/obj/Items/ores/stone/S in M)
										var/fail
										fail = prob(M.StoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.StoneCraftingSkill += 1
											break
											return
										var/mob/Monsters/Gargoyle/G = new
										G.Owner = usr
										usr.UnitList += G
										G.loc = M.loc
										M.CreatedGargoyle = 1
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										view() << "[M] Has created a new gargoyle and cannot create another again."
										view() << "[M] uses a piece of their own soul to infuse the statue with life!"
										G.name = "([usr]) Gargoyle"
										del(S)
										break
										return
						if (Result2 == "Tomb Stone")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									var/obj/Items/Graves/TombStone/LB = new
									LB.loc = M.loc
									LB.M = S
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									del(S)
									break
									return
						if (Result2 == "Stone Pillar")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									if(M)
										var/obj/Items/Furniture/Pillars/DwarfPillar/LB = new
										LB.loc = M.loc
										LB.M = S
										M.weight -= S.weight
										if(M.StoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.StoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.StoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.StoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.StoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.StoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.StoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.StoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.StoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.StoneCraftingSkill += 1
										LB.M = "Stone"
										LB.FurnitureCraft()
										M.StoneCraftingSkill += 1
										del(S)
										break
										return


		BoneCraft
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyBone()
					if (Result == "Craft" && M.Plantman == 0)
						var/list/menu2 = new()
						if(M.Gremlin == 0)
							menu2 += "BoneSpear"
							if(M.Vampire == 1)
								menu2 += "BoneAxe"
								menu2 += "BoneHelmet"
								menu2 += "BoneChestPlate"
								menu2 += "BoneLeggings"
								menu2 += "BoneLeftGauntlet"
								menu2 += "BoneRightGauntlet"
								menu2 += "BoneCage"
								menu2 += "BoneDoor"
								menu2 += "BoneBuckler"
								menu2 += "Bone Throne"
								menu2 += "Bone Sword"
								menu2 += "Skull Mace"
								menu2 += "Bone Bow"
								menu2 += "Bone Arrows"
							if(M.UsesPoison == 1)
								menu2 += "Full Bone Armor"
								menu2 += "BoneAxe"
								menu2 += "BoneDagger"
								menu2 += "BoneHelmet"
								menu2 += "BoneChestPlate"
								menu2 += "BoneLeggings"
								menu2 += "BoneLeftGauntlet"
								menu2 += "BoneRightGauntlet"
								menu2 += "BoneCage"
								menu2 += "Bone Door"
								menu2 += "BoneBuckler"
								menu2 += "Bone Training Post"
								menu2 += "BoneCrown"
								menu2 += "Bone Throne"
								menu2 += "Bone Sword"
								menu2 += "Skull Mace"
								menu2 += "Bone Bow"
								menu2 += "Bone Arrows"
								if(Race != "Orc")
									menu2 += "LockPick"
									menu2 += "Full Chitin Armor"
									menu2 += "ChitinHelmet"
									menu2 += "ChitinChestPlate"
									menu2 += "ChitinLeggings"
									menu2 += "ChitinBuckler"
									menu2 += "ChitinLeftGauntlet"
									menu2 += "ChitinRightGauntlet"
									menu2 += "ChitinSpear"
									menu2 += "ChitinSword"
									menu2 += "ChitinAxe"
									menu2 += "ChitinDagger"
									menu2 += "ChitinMace"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Bone Throne")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
										return
									var/obj/Items/Furniture/Chairs/BoneThrone/LB = new
									LB.M = S.name
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/BoneTrainingPost/LB = new
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = LB
									LB.TrainCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "LockPick")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in view(1,M))
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Shafts/LockPick/LB = new
									LB.loc = M.loc
									LB.M = S
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "BoneBuckler")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Shields/BoneBuckler/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = S
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Bones/Bones/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
								for(var/obj/Items/Bones/Bones/S in M)
									if(M.CraftCount >= 1)
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										if(M.WearingBack == 1)
											for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
												if(L.suffix == "(Equiped)")
													if(L.Content <= 250)
														var/obj/Items/Arrows/BoneArrow/LB = new
														LB.loc = L
														var/obj/Items/Arrows/BoneArrow/LB2 = new
														LB2.loc = L
														var/obj/Items/Arrows/BoneArrow/LB3 = new
														LB3.loc = L
														var/obj/Items/Arrows/BoneArrow/LB4 = new
														LB4.loc = L
														var/obj/Items/Arrows/BoneArrow/LB5 = new
														LB5.loc = L
														var/obj/Items/Arrows/BoneArrow/LB6 = new
														LB6.loc = L
														var/obj/Items/Arrows/BoneArrow/LB7 = new
														LB7.loc = L
														var/obj/Items/Arrows/BoneArrow/LB8 = new
														LB8.loc = L
														var/obj/Items/Arrows/BoneArrow/LB9 = new
														LB9.loc = L
														var/obj/Items/Arrows/BoneArrow/LB10 = new
														LB10.loc = L
														M.BoneCraftingSkill += 1.5
														M.weight -= S.weight
														LB.Owner = M.Owner
														LB2.Owner = M.Owner
														LB3.Owner = M.Owner
														LB4.Owner = M.Owner
														LB5.Owner = M.Owner
														LB6.Owner = M.Owner
														LB7.Owner = M.Owner
														LB8.Owner = M.Owner
														LB9.Owner = M.Owner
														LB10.Owner = M.Owner
														L.Content += 10
														M.Owner << "Arrows placed in quiver!"
														M.CraftCount -= 1
														del(S)
													else
														M.Owner << "This quiver has too many arrows in it!"
														return
										else
											M.Owner << "[M] - I,ve got no quiver to put arrows in!"
											return
									else
										M.CraftCount = 0
										return

						if (Result2 == "BoneCage")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Traps/Cages/BoneCage/LB = new
									LB.M = S
									LB.desc = "This is a bone cage,it is made out of [LB.M], it can be used to capture creatures in"
									LB.FurnitureCraft()
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Bone Bow")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Bows/BoneBow/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneDagger")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Daggers/BoneDagger/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "BoneAxe")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Axes/BoneAxe/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "ChitinAxe")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Axes/ChitinAxe/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.GoldWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "ChitinMace")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Maces/ChitinMace/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.GoldWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "ChitinDagger")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Daggers/ChitinDagger/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.GoldWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Skull Mace")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Skull/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Maces/SkullMace/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Sword")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Swords/BoneSword/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneSpear")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Spears/BoneSpear/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinSpear")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Spears/ChitinSpear/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.GoldWeaponCraft()
									M.BoneCraftingSkill += 0.75
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinSword")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Weapons/Swords/ChitinSword/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.GoldWeaponCraft()
									M.BoneCraftingSkill += 0.75
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/LeftArms/ChitinLeftGauntlet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Legs/SupernaturalBoneLeggings/LB = new
									LB.M = S
									LB.Defence = 40
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Chestplate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/ChestPlates/SupernaturalBoneChestPlate/LB = new
									LB.M = S
									LB.Defence = 40
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Helmets/SupernaturalBoneHelmet/LB = new
									LB.M = S
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone LeftArm")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/LeftArms/SupernaturalBoneLeftGauntlet/LB = new
									LB.M = S
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone RightArm")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/RightArms/SupernaturalBoneRightGauntlet/LB = new
									LB.M = S
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/RightArms/ChitinRightGauntlet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinBuckler")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Shields/ChitinBuckler/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinLeggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Legs/ChitinLeggings/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/RightArms/BoneRightGauntlet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/LeftArms/BoneLeftGauntlet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneLeggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Legs/BoneLeggings/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/ChestPlates/ChitinChestPlate/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Full Chitin Armor")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
									var/obj/Items/Armours/ChestPlates/ChitinChestPlate/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Bones/Shell/S2 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.BoneCraftingSkill += 0.25
										del(S2)
										break
									var/obj/Items/Armours/Legs/ChitinLeggings/LB = new
									LB.M = S2
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Bones/Shell/S3 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.BoneCraftingSkill += 0.25
										del(S3)
										break
									var/obj/Items/Armours/LeftArms/ChitinLeftGauntlet/LB = new
									LB.M = S3
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Bones/Shell/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Armours/RightArms/ChitinRightGauntlet/LB = new
									LB.M = S4
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Shell/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Armours/Helmets/ChitinHelmet/LB = new
									LB.M = S5
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
								for(var/obj/Items/Bones/Shell/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Armours/Shields/ChitinBuckler/LB = new
									LB.M = S5
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "Full Bone Armor")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
									var/obj/Items/Armours/ChestPlates/BoneChestPlate/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Bones/Bones/S2 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.BoneCraftingSkill += 0.25
										del(S2)
										break
									var/obj/Items/Armours/Legs/BoneLeggings/LB = new
									LB.M = S2
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Bones/Bones/S3 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.BoneCraftingSkill += 0.25
										del(S3)
										break
									var/obj/Items/Armours/LeftArms/BoneLeftGauntlet/LB = new
									LB.M = S3
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Bones/Bones/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Armours/RightArms/BoneRightGauntlet/LB = new
									LB.M = S4
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Bones/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Armours/Shields/BoneBuckler/LB = new
									LB.M = S4
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Skull/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Armours/Helmets/BoneHelmet/LB = new
									LB.M = S5
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "BoneChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/ChestPlates/BoneChestPlate/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Door")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Furniture/Doors/BoneDoor/LB = new
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.MetalDoorCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinHelmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Helmets/ChitinHelmet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneCrown")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Helmets/BoneCrown/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneHelmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Skull/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Armours/Helmets/BoneHelmet/LB = new
									LB.M = S
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
		Carpentry
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyCarpentryStation()
					if (Result == "Craft" && M.Plantman == 0)
						var/list/menu2 = new()
						if(M.Shielded == 1)
							menu2 += "Holy Symbol"
						if(M.Unholy == 1)
							menu2 += "Unholy Symbol"
						menu2 += "Spear Shaft"
						menu2 += "Wooden Spike"
						if(M.MagicalAptitude == 1)
							menu2 += "Staff"
							menu2 += "Necromancer's Staff"
						menu2 += "Wooden Cage"
						menu2 += "Wooden Door"
						menu2 += "Wooden Fence"
						menu2 += "Wooden Spear"
						menu2 += "Wooden Chair"
						menu2 += "Wooden Bucket"
						if(M.LizardMan == 0)
							menu2 += "Wooden Spade"
						if(M.Race == "Elf")
							menu2 += "Full Wooden Armor"
							menu2 += "Wooden Pickaxe"
							menu2 += "Wooden Sword"
							menu2 += "Wooden Mace"
							menu2 += "Wooden Elf Spear"
							menu2 += "Wooden Elf Bow"
							menu2 += "Wooden Axe"
							menu2 += "Wooden Helmet"
							menu2 += "Wooden Chestplate"
							menu2 += "Wooden LeftArm"
							menu2 += "Wooden RightArm"
							menu2 += "Wooden Leggings"
						if(M.Human == 1)
							menu2 += "Trap Door"
						menu2 += "Wooden Wagon"
						menu2 += "Wooden Sign"
						menu2 += "Wooden Chest"
						menu2 += "Wooden Table"
						menu2 += "Wooden Training Post"
						menu2 += "Wooden Bow"
						menu2 += "Wooden Arrows"
						if(M.MagicalAptitude == 1 && M.NecromancySkill >= 1)
							menu2 += "Necromancy Book"
						if(M.Goblin == 0)
							if(M.Kobold == 0)
								if(M.Vampire == 0)
									if(M.LizardMan == 0)
										menu2 += "Wooden Bed"
						if(M.Kobold == 0)
							menu2 += "WoodenBuckler"
						if(M.LizardMan == 1)
							menu2 += "Lizardman Shield"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Necromancy Book")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									for(var/obj/Items/Shafts/WoodenBucket/S2 in M)
										if(S2.HasWater == "Water")
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												del(S)
												break
												M.WoodCraftingSkill += 0.5
												return
											var/obj/Items/Shafts/NecroBook/LB = new
											LB.Enchanted = 1
											LB.M = "Wood"
											M.WoodCraftingSkill += 0.5
											M.weight -= S.weight
											LB.loc = M.loc
											del(S)
											S2.HasWater = null
											return
								usr << "You need one piece of wood and one wooden bucket full of water to make this."
						if (Result2 == "Holy Symbol")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									for(var/obj/Items/gems/Diamond/S2 in M)
										var/fail
										fail = prob(M.WoodCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.WoodCraftingSkill += 0.5
											return
										var/obj/Items/Shafts/HolySymbol/LB = new
										LB.M = "Wood"
										M.WoodCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(S2)
										return
								usr << "You need one cut diamond and one piece of wood to craft this."
						if (Result2 == "Unholy Symbol")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									for(var/obj/Items/gems/Ruby/S2 in M)
										var/fail
										fail = prob(M.WoodCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.WoodCraftingSkill += 0.5
											return
										var/obj/Items/Shafts/UnholySymbol/LB = new
										LB.M = "Wood"
										M.WoodCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(S2)
										return
								usr << "You need one cut ruby and one piece of wood to craft this."
						if (Result2 == "Wooden Spear")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Spears/WoodenSpear/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Sword")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Swords/WoodenSword/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Pickaxe")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Picks/WoodenPickAxe/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Mace")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Maces/WoodenMace/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Axe")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Axes/WoodenAxe/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Elf Spear")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Spears/ElfSpear/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Elf Bow")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Bows/ElfBow/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									LB.WeaponDamageMin += 10
									LB.WeaponDamageMax += 15
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Chair")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Furniture/Chairs/WoodenChair/LB = new
									LB.M = "Wood"
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Staff")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.WoodCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/Staff/LB = new
									LB.loc = M.loc
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Necromancer's Staff")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									if(M in range(1,src))
										for(var/obj/Items/Shafts/LichSkull/S2 in M)
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.WoodCraftingSkill += 1
												del(S)
												del(S2)
												break
												return
											var/obj/Items/Weapons/Maces/NecroStaff/LB = new
											LB.loc = M.loc
											if(M.WoodCraftingSkill >= 90)
												LB.CraftRank = "Epic Quality"
											if(M.WoodCraftingSkill >= 100)
												LB.CraftRank = "Legendary Quality"
											if(M.WoodCraftingSkill <= 90)
												LB.CraftRank = "Epic Quality"
											if(M.WoodCraftingSkill <= 75)
												LB.CraftRank = "Masterful Quality"
											if(M.WoodCraftingSkill <= 60)
												LB.CraftRank = "Grand Quality"
											if(M.WoodCraftingSkill <= 50)
												LB.CraftRank = "Impressive Quality"
											if(M.WoodCraftingSkill <= 40)
												LB.CraftRank = "Quality"
											if(M.WoodCraftingSkill <= 30)
												LB.CraftRank = "Average Quality"
											if(M.WoodCraftingSkill <= 20)
												LB.CraftRank = "Poor Quality"
											LB.M = "Wood"
											LB.GoldWeaponCraft()
											M.WoodCraftingSkill += 1.5
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Wooden Bow")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Bows/WoodenBow/LB = new
									LB.M = S
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Elf Bow")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Weapons/Bows/ElfBow/LB = new
									LB.M = S
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Bucket")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill += 0.5
										break
										return
									var/obj/Items/Shafts/WoodenBucket/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Spade")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill += 0.5
										break
										return
									var/obj/Items/Shafts/WoodenSpade/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Table")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill+=1
										return
									var/obj/Items/Furniture/Tables/Table/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/woods/wood/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/woods/wood/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack == 1)
												for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
													if(L.suffix == "(Equiped)")
														if(L.Content <= 250)
															var/obj/Items/Arrows/WoodenArrow/LB = new
															LB.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB2 = new
															LB2.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB3 = new
															LB3.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB4 = new
															LB4.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB5 = new
															LB5.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB10 = new
															LB10.loc = L
															M.WoodCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "This quiver has too many arrows in it!"
															return
											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Spear Shaft")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill+=1
										return
									var/obj/Items/Shafts/SpearShaft/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Training Post")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Posts/WoodTrainingPost/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.M = S
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.TrainCraft()
									del(S)
									break
									return
						if (Result2 == "Wooden Chest")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/mob/Monsters/WoodenChest/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Wooden Spike")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill+=1
										return
									var/obj/Items/Traps/Spikes/WoodenSpike/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Sign")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Shafts/Sign/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Wagon")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/mob/Monsters/Wagon/LB = new
									LB.loc = M.loc
									LB.Owner = M.Owner
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Cage")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Traps/Cages/WoodenCage/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Door")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Doors/WoodenDoor/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodDoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Trap Door")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Doors/TrapDoor/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodDoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Fence")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Fences/WoodenFence/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodDoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Bed")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Beds/WoodenBed/LB = new
									LB.M = S.name
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Wand")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									for(var/obj/Items/gems/S2 in M)
										if(S2.suffix == "(Carrying)")
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												M.WoodCraftingSkill+=1
												break
												return
											var/obj/Items/Shafts/Wand/LB = new
											LB.M = S2.name
											if(M.WoodCraftingSkill >= 90)
												LB.CraftRank = "Epic Quality"
												LB.Content3 = 7
											if(M.WoodCraftingSkill >= 100)
												LB.CraftRank = "Legendary Quality"
												LB.Content3 = 10
											if(M.WoodCraftingSkill <= 90)
												LB.CraftRank = "Epic Quality"
												LB.Content3 = 7
											if(M.WoodCraftingSkill <= 75)
												LB.CraftRank = "Masterful Quality"
												LB.Content3 = 6
											if(M.WoodCraftingSkill <= 60)
												LB.CraftRank = "Grand Quality"
												LB.Content3 = 5
											if(M.WoodCraftingSkill <= 50)
												LB.CraftRank = "Impressive Quality"
												LB.Content3 = 4
											if(M.WoodCraftingSkill <= 40)
												LB.CraftRank = "Quality"
												LB.Content3 = 3
											if(M.WoodCraftingSkill <= 30)
												LB.CraftRank = "Average Quality"
												LB.Content3 = 2
											if(M.WoodCraftingSkill <= 20)
												LB.CraftRank = "Poor Quality"
												LB.Content3 = 1
											LB.FurnitureCraft()
											M.WoodCraftingSkill += 0.5
											M.weight -= S.weight
											M.weight -= S2.weight
											LB.loc = M.loc
											del(S)
											del(S2)
											break
											return
						if (Result2 == "WoodenBuckler")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Shields/WoodenBuckler/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Chestplate")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/ChestPlates/WoodenChestplate/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Full Wooden Armor")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/ChestPlates/WoodenChestplate/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Legs/WoodenLeggings/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Helmets/WoodenHelmet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/RightArms/WoodenRightGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/LeftArms/WoodenLeftGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Shields/WoodenBuckler/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
						if (Result2 == "Wooden RightArm")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/RightArms/WoodenRightGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden LeftArm")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/LeftArms/WoodenLeftGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Leggings")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Legs/WoodenLeggings/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Helmet")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Helmets/WoodenHelmet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.WoodArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Lizardman Shield")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Armours/Shields/LizardShield/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Wood"
									LB.MetalArmourCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return

		LeatherWorks
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyLeatherStation()
					if (Result == "Craft" && M.Plantman == 0)
						var/list/menu2 = new()
						menu2 += "Black Robe"
						menu2 += "Red Robe"
						menu2 += "White Robe"
						menu2 += "Black Hood"
						menu2 += "White Hood"
						menu2 += "Red Hat"
						menu2 += "Red Cape"
						menu2 += "Black Cape"
						menu2 += "White Cape"
						menu2 += "Rope"
						if(usr.Faction != "Player")
							menu2 += "Clan Cape"
						menu2 += "Leather Quiver"
						menu2 += "Leather Bed"
						menu2 += "Leather Leggings"
						menu2 += "Leather Left Glove"
						menu2 += "Leather Right Glove"
						menu2 += "Leather Top"
						menu2 += "Leather Helmet"
						menu2 += "Leather Flask"
						menu2 += "Demon Leather Top"
						menu2 += "Demon Leather Leggings"
						menu2 += "Demon Leather Helmet"
						menu2 += "Demon Leather Right Glove"
						menu2 += "Demon Leather Left Glove"
						menu2 += "Demon Leather Shield"
						menu2 += "Leather Sleeping Bag"
						menu2 += "Strip all Skin from Corpses"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if(Result2 == "Strip all Skin from Corpses")
							for(var/mob/Body/m in M)
								if(M && m)
									m.TearSkins()
						if (Result2 == "Leather Quiver")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Armours/Back/LeatherQuiver/LB = new
									LB.loc = M.loc
									LB.M = S
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.dir = NORTH
									del(S)
									break
									return
						if (Result2 == "Leather Flask")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Shafts/LeatherFlask/LB = new
									LB.loc = M.loc
									LB.M = S
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "Rope")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Traps/Cages/Rope/LB = new
									LB.loc = M.loc
									LB.M = S
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.FurnitureCraft()
									LB.icon_state = "RopeOff"
									del(S)
									break
									return
						if (Result2 == "Leather Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Helmets/LeatherHelmet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if(Result2 == "Demon Leather Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Armours/Helmets/DemonLeatherHelmet/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if(Result2 == "Demon Leather Shield")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Armours/Shields/DemonLeatherShield/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Black Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/ChestPlates/BlackRobe/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/ChestPlates/RedRobe/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/ChestPlates/WhiteRobe/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Clan Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/NeckGuards/TeamCape/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.icon_state = usr.Faction
									LB.name = "[usr.Faction] Cape"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Black Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/NeckGuards/BlackCape/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/NeckGuards/RedCape/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/NeckGuards/WhiteCape/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Hat")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Helmets/RedHat/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Black Hood")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Helmets/BlackHood/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Hood")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Helmets/WhiteHood/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Right Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/RightArms/LeatherRightGauntlet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Right Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Armours/RightArms/DemonLeatherRightGauntlet/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Left Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/LeftArms/LeatherLeftGauntlet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Left Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Armours/LeftArms/DemonLeatherLeftGauntlet/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Top")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/ChestPlates/LeatherChestPlate/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Top")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Armours/ChestPlates/DemonLeatherChestPlate/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Armours/Legs/LeatherLeggings/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Skins/Skin/S in M)
									if(S.Content2 == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.LeatherCraftingSkill += 1
											return
										var/obj/Items/Armours/Legs/DemonLeatherLeggings/LB = new
										LB.M = S
										if(M.LeatherCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.LeatherCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.LeatherCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.LeatherCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.LeatherCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.LeatherCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.LeatherCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.LeatherCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.Defence += LB.Defence/10
										LB.Defence += rand(1,4)
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Sleeping Bag")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Beds/SleepingBag/LB = new
									LB.M = S.name
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Bed")
							if(M in range(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Beds/LeatherBed/LB = new
									LB.M = S.name
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return


	Test
	Body
		density = 0
		Body = 1
		layer = 4
		DieAge = 1
		IsWood = 0
		weight = 40
		density = 0
		desc = "This is a body, it can be used as food or burial, or will provide bones."
		New()
			BodyDecay()
		DblClick()
			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.destination = null
					if(src.suffix == null)
						if(M.weight <= M.weightmax)
							src.loc = M
							src.suffix = "(Carrying)"
							M.weight += src.weight
							return
						else
							if(M.Wagon == 0)
								usr << "[M] : I cant Carry Too Much!"
							return
			for(var/mob/Monsters/M in usr.Selected)
				if(src)
					if(src.loc == M)
						if(src.suffix == "(Carrying)")
							if(src.Dead == 1)
								M.destination = null
								if(src in M)
									if(M.Wagon == 0)
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										for(var/obj/Items/Shafts/WoodenSpade/S in M)
											menu += "Bury"
										for(var/obj/Items/Shafts/Spade/S in M)
											menu += "Bury"
										if(M.Carn == 1)
											menu += "Tear Meat Off"
											menu += "Tear Skin Off"
										if(M.HoldingWeapon == "Dagger")
											menu += "Tear Meat Off"
											menu += "Tear Skin Off"
										if(src.icon != 'Cave.dmi' && src.Beatle == 0 && src.Bug == 0 && src.Deer == 0 && src.Mole == 0 && src.Wolf == 0 && src.Race != "Plant" && src.Race != "Plant2" && src.Race != "Mind Worm")
											if(M.Race == "Devourer")
												menu += "Incorporate Mass"
											if(M.Werepowers == 1)
												menu += "Devour"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											if(src)
												usr << src.desc
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												return
										if (Result == "Incorporate Mass")
											if(src.Beatle == 0 && src.Bug == 0 && src.Deer == 0 && src.Mole == 0 && src.Wolf == 0 && src.Race != "Plant" && src.Race != "Plant2" && src.Race != "Mind Worm")
												if(src.suffix == "(Carrying)")
													var/obj/A1 = src
													M.weight -= A1.weight
													M.EggContent += 1
													del A1
										if(Result == "Devour")
											if(M.Werepowers == 1)
												view(M) << "[M] devours [src] whole!"
												M.weight -= src.weight
												M.Hunger = 400
												M.Tiredness = 200
												if(M.MaxBloodContent < 325)
													M.MaxBloodContent += 1
												M.BloodContent = M.MaxBloodContent
												del src
										if (Result == "Bury")
											if(src in M)
												var/obj/Items/Graves/Grave/G = new
												G.loc = M.loc
												var/mob/A2 = src
												A2.loc = G
												M.weight -= src.weight
												A2.suffix = null
												A2.suffix = "(Burried)"
												return
										if (Result == "Tear Skin Off")
											if(src in M)
												src.TearSkins()
										if (Result == "Tear Meat Off")
											if(src in M)
												src.TearMeats()
	Monsters
		Bump(atom/m)
			if(src.Flying == 1)
				if(m.icon_state == "Lava")
					if(m.density == 1)
						spawn(src.Delay)
							src.loc = m
				if(m.CaveWater == 1)
					spawn(src.Delay)
						src.loc = m
				if(m.icon == 'Swamp.dmi')
					spawn(src.Delay)
						src.loc = m
				if(m.icon_state == "water")
					spawn(src.Delay)
						src.loc = m
			if(m == src.destination)
				if(m.Owner == src.Owner || src.density == 0)
					return
				else
					src.Combats()
				if(m)
					if(m.TP == 1)
						if(src.LoggedOut == 1)
							src.destination = null
							return
						flick("Dig",m)
						src.EXP += m.Content3
						src.Hunger -= 0.2
						src.DamageTypePost()
						if(m.HP <= 0)
							del(m)
						return
					if(src.Flying == 0)
						if(m.icon_state == "Lava")
							if(m.density == 1)
								if(src.IsWood && src.Gremlin == 0 && src.Gargoyle == 0)
									src.Owner << "[src] is Burning To Death!"
									src.Fire()
								if(src.Gremlin == 1 || src.Gargoyle == 1)
									flick("Dig",m)
									var/find
									find = prob(src.FishingSkill/10)
									if(find == 1)
										var/obj/Items/ores/stone/B = new
										B.loc = src.loc
										if(src.FishingSkill <= 120)
											src.FishingSkill += 0.3
										return
						if(m.CaveWater == 1)
							flick("Dig",m)
							var/find
							var/Rainbow = rand(1,3500)
							find = prob(src.FishingSkill/10)
							if(find == 1)
								var/mob/Body/B = new
								B.loc = src.loc
								B.icon = 'cave.dmi'
								B.icon_state = "CaveFish"
								B.name = "CaveFish"
								B.Dead = 1
								B.FishDecay()
								B.Fish = 1
								B.weight = 5
								if(src.FishingSkill <= 120)
									src.FishingSkill += 0.3
								return
							if(Rainbow == 1)
								if(RainbowsFound < 10)
									var/obj/Items/gems/UnCutRainbow/R = new
									R.loc = src
									src.weight += R.weight
									src.Owner << "<font color=cyan><font size=3>[src] has found a strange gem in the water."
									RainbowsFound += 1
									R.suffix = "(Carrying)"
						if(m.icon == 'Swamp.dmi')
							flick("Dig",m)
							var/find
							var/Rainbow = rand(1,3500)
							find = prob(src.FishingSkill/10)
							if(find == 1)
								var/TFish = prob(50)
								if(TFish == 1)
									var/mob/Body/B = new
									B.loc = src.loc
									B.icon = 'cave.dmi'
									B.icon_state = "TFish"
									B.name = "TropicalFish"
									B.Dead = 1
									B.FishDecay()
									B.Fish = 1
									B.weight = 5
									if(src.FishingSkill <= 120)
										src.FishingSkill += 0.3
									return
								if(TFish == 0)
									var/mob/Body/B = new
									B.loc = src.loc
									B.icon = 'cave.dmi'
									B.icon_state = "BlowFish"
									B.name = "BlowFish"
									B.Dead = 1
									B.FishDecay()
									B.Fish = 1
									B.weight = 5
									if(src.FishingSkill <= 120)
										src.FishingSkill += 0.3
									return
							if(Rainbow == 1)
								if(RainbowsFound < 10)
									var/obj/Items/gems/UnCutRainbow/R = new
									R.loc = src
									src.weight += R.weight
									src.Owner << "<font color=cyan><font size=3>[src] has found a strange gem in the water."
									RainbowsFound += 1
									R.suffix = "(Carrying)"
						if(m.icon_state == "water")
							flick("Dig",m)
							var/find
							var/Rainbow = rand(1,3500)
							find = prob(src.FishingSkill/10)
							src.WaterPoints += 0.25
							if(find == 1)
								var/mob/Body/B = new
								B.loc = src.loc
								B.icon = 'cave.dmi'
								B.icon_state = "Fish"
								B.name = "Fish"
								B.Dead = 1
								B.FishDecay()
								B.Fish = 1
								B.weight = 5
								if(src.FishingSkill <= 120)
									src.FishingSkill += 0.3
								return
							if(Rainbow == 1)
								if(RainbowsFound < 10)
									var/obj/Items/gems/UnCutRainbow/R = new
									R.loc = src
									src.weight += R.weight
									src.Owner << "<font color=cyan><font size=3>[src] has found a strange gem in the water."
									RainbowsFound += 1
									R.suffix = "(Carrying)"
							if(src.Gremlin == 1)
								var/GremCount = 0
								for(var/mob/K in world)
									if(K == src.Owner)
										for(var/mob/Monsters/XM in K.UnitList)
											if(XM.Gremlin == 1)
												GremCount += 1
								if(GremCount <= 24)
									var/GremClone = prob(0.125)
									if(GremClone == 1)
										var/mob/Monsters/PlayerGremlin/G = new()
										var/mob/K = src.Owner
										G.loc = src.loc
										G.name = src.name
										G.SwordSkill = src.SwordSkill
										G.SpearSkill = src.SpearSkill
										G.BoneCraftingSkill = src.BoneCraftingSkill
										G.UnArmedSkill = src.UnArmedSkill
										G.ShieldSkill = src.ShieldSkill
										G.ArmourSkill = src.ArmourSkill
										G.SneakingSkill = src.SneakingSkill
										G.weightmax = src.weightmax
										G.Strength = src.Strength
										G.Agility = src.Agility
										G.AxeSkill = src.AxeSkill
										G.MaceSkill = src.MaceSkill
										G.DaggerSkill = src.DaggerSkill
										G.EXP = src.EXPNeeded
										G.Intelligence = src.Intelligence
										G.OrganMaxHP = src.OrganMaxHP
										G.Owner = src.Owner
										K.UnitList += G
					if(src.Flying == 1)
						if(m.icon_state == "Lava")
							src.loc = m
						if(m.CaveWater == 1)
							src.loc = m
						if(m.icon == 'Swamp.dmi')
							src.loc = m
						if(m.icon_state == "water")
							flick("Dig",m)
							var/find
							find = prob(src.FishingSkill/10)
							src.WaterPoints += 0.25
							if(find == 1)
								var/mob/Body/B = new
								B.loc = src.loc
								B.icon = 'cave.dmi'
								B.icon_state = "Fish"
								B.name = "Fish"
								B.Dead = 1
								B.FishDecay()
								B.Fish = 1
								B.weight = 5
								if(src.FishingSkill <= 120)
									src.FishingSkill += 0.3
								return
					if(m.Tree == 1)
						if(src.UsesPicks == 0 || src.HoldingWeapon == "Axe" || src.Goblin == 1 || src.Werepowers == 1 || src.VampPick == 1)
							m.HP -= src.WoodCuttingSkill / 4
							src.EXP += 0.4
							src.WoodCuttingSkill += 0.15
							flick("Dig",m)
							if(m.HP <= 0)
								m.overlays = null
								m.overlays -= /obj/Trees/tree1x2
								m.overlays -= /obj/Trees/tree3x2
								m.overlays -= /obj/Trees/leaves3x2
								m.overlays -= /obj/Trees/leaves2x2
								m.overlays -= /obj/Trees/leaves1x2
								m.overlays -= /obj/Trees/leaves1x1
								m.overlays -= /obj/Trees/leaves2x1
								m.overlays -= /obj/Trees/leaves3x1
								m.IsWood = 0
								for(var/obj/DigAt/DD in view(1,src))
									if(DD.Owner == src)
										if(DD == src.DigTarget)
											src.DigTarget = null
											del(DD)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/Seeds/TreeSeed/TS2 = new
									TS2.loc = src.loc
									var/obj/Items/Seeds/TreeSeed/TS = new
									TS.loc = src.loc
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
									var/obj/Items/woods/wood/MET2 = new
									MET2.loc = src.loc
									if(src.LizardMan == 1 || src.Human == 1 || src.Race == "Elf")
										var/obj/Items/woods/wood/MET3 = new
										MET3.loc = src.loc
										var/obj/Items/woods/wood/MET4 = new
										MET4.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								if(m.Cactus == 1)
									m.icon_state = "Desert"
								if(m.Bamboo == 1)
									m.icon_state = "Marsh"
								if(m.Content3 == "PermTree")
									m.icon_state = "Snow"
								if(m.Content3 == "EvilTree")
									m.icon_state = "DeadGrass"
								if(m.Content3 == "HolyTree")
									m.icon_state = "GoodGrass"
								m.density = 0
								m.opacity = 0
							return
					if(m.CanDigAt == 1)
						if(src.UsesPicks == 0 || src.HasPick == 1 || src.VampPick == 1 || src.Werepowers == 1)
							src.EXP += 0.4
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							if(m.icon_state == "Elf Wall")
								if(src.Race != "Elf")
									var/Harm = prob(2)
									if(src.HasPick == 0)
										Harm = prob(6)
									if(Harm == 1)
										src.BloodContent -= rand(15,25)
										src.BloodLoss()
										src.RightArmHP -= 15
										src.LeftArmHP -= 15
							flick("Dig",m)
							if(m.HP <= 0)
								for(var/obj/ArrowSlit/K in m)
									m.overlays -= K
									m.opacity = 1
									del K
								for(var/obj/Tapestry/K in m)
									m.overlays -= K
									del K
								for(var/turf/T in view(1,m))
									if(T.CanFish)
										if(isturf(m))
											var/turf/H = m
											H.WaterFlood()
								for(var/turf/T in view(1,m))
									if(T.Content == "Lava")
										if(isturf(m))
											var/turf/H = m
											H.LavaFlood()
								for(var/obj/DigAt/DD in view(1,src))
									if(DD.Owner == src)
										if(DD == src.DigTarget)
											src.DigTarget = null
											del(DD)
								var/CI
								CI = prob(1)
								if(src.Spider == 1 || src.Dwarf == 1 || src.Kobold == 1)
									CI = 0
								if(CI == 1)
									view() << "Cave In!"
									for(var/turf/grounds/cellarfloor/CF in view(3,src))
										if(CF.density == 0)
											CF.T = prob(50)
										for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
											if(CF.T == 1)
												CF.T = 0
										if(CF.T == 1)
											CF.opacity = 1
											CF.density = 1
											CF.CanDigAt = 1
											CF.icon_state = "CaveWall"
											CF.HP = 200
											CF.T = 0
											CF.IsCave = 1
											CF.Cant = 1
											CF.text = "<font color=#999966>#"
											CF.Detailed = 0
									for(var/turf/grounds/cavefloor/CF in view(3,src))
										if(CF.density == 0)
											CF.T = prob(50)
										for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
											if(CF.T == 1)
												CF.T = 0
										if(CF.T == 1)
											CF.opacity = 1
											CF.density = 1
											CF.CanDigAt = 1
											CF.icon_state = "CaveWall"
											CF.HP = 200
											CF.T = 0
											CF.IsCave = 1
											CF.Detailed = 0
											CF.text = "<font color=#999966>#"
											if(CF.z == 1)
												var/obj/Support/Q = new
												Q.loc = locate(CF.x,CF.y,3)
												for(var/turf/T in view(0,Q))
													if(T.Supported == 1)
														T.Supported = 0
														T.icon_state = "DFloor"
														T.name = "Floor"
														T.density = 0
														T.Detailed = 0
														if(T.Content3 == "Peak")
															T.icon = 'Cave.dmi'
															T.icon_state = "Peak"
															T.name = "MountainPeak"
															m.text = "<font color=#999966>×"
														if(T.Content == "Sky")
															T.icon = 'Cave.dmi'
															T.icon_state = "Sky"
															T.name = "Sky"
															T.text = "<font color=#33FFFF>×"
												del(Q)
								var/E
								var/D
								var/EM
								var/R
								var/S
								var/AD
								var/G
								var/Wood
								var/Bone
								var/SIL
								var/BUG2
								var/BUG
								var/BUG3
								var/CAP
								if(m.IsWall == 0)
									E = prob(35)
									D = prob(1.5)
									EM = prob(0.75)
									BUG2 = prob(2)
									R = prob(0.75)
									S = prob(70)
									BUG3 = prob(2)
									BUG = prob(2)
									CAP = prob(3)
								if(m.IsWall == 1)
									if(m.icon_state == "WoodWall" || m.icon_state == "OrcWall" || m.icon_state == "TribalWall" || m.icon_state == "Elf Wall")
										Wood = prob(65)
									if(m.icon_state == "StoneWall" || m.icon_state == "DetailedWall" || m.icon_state == "GoblinWall" || m.icon_state == "StoneWall2" || m.icon_state == "SandWall" || m.icon_state == "IllithidWall")
										S = prob(65)
									if(m.icon_state == "BoneWall")
										Bone = prob(65)
								m.IsWall = 0
								if(BUG2 == 1)
									var/mob/Monsters/DeathBeatle/DB = new
									DB.loc = src.loc
									return
								if(src.Dwarf == 1)
									AD = prob(0.1)
									if(src.z == 4)
										AD = prob(0.2)
								if(m.icon_state == "AdaSpire")
									AD = prob(70)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
								if(src.Goblin == 1 && src.Level >= 20)
									EM = prob(1.25)
									R = prob(1.25)
									D = prob(2)
								if(m.icon_state == "AdamantiumOreVein")
									AD = prob(100)
								if(m.icon_state == "GoldOreVein")
									G = prob(100)
								if(m.icon_state == "SilverOreVein")
									SIL = prob(100)
								if(CAP == 1)
									var/mob/Monsters/TowerCap/SS = new
									SS.loc = src.loc
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(Wood == 1)
									var/obj/Items/woods/wood/SS = new
									SS.loc = src.loc
								if(Bone == 1)
									var/obj/Items/Bones/Bones/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(AD == 1)
									var/obj/Items/ores/Adamantium/AA = new
									AA.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
									var/obj/Items/gems/UnCutRuby/RE = new
									RE.loc = src.loc
								m.opacity = 0
								m.density = 0
								m.CanDigAt = 0
								m.Detailed = 0
								m.icon = 'cave.dmi'
								m.icon_state = m.OIcon
								m.text = "<font color=#999966>×"
								m.IsWood = 0
								if(m.Content3 == "Peak")
									m.icon_state = "Peak"
								if(m.Content == "Sky")
									m.icon_state = "Sky"
								if(m.z == 1)
									var/obj/Support/Q = new
									Q.loc = locate(m.x,m.y,3)
									for(var/turf/T in view(0,Q))
										if(T.Supported == 1)
											T.Supported = 0
											T.opacity = 0
											T.density = 0
											T.CanDigAt = 0
											T.Detailed = 0
											if(T.Content3 == "Peak")
												T.icon_state = "Peak"
												m.text = "<font color=#999966>×"
											if(T.Content == "Sky")
												T.icon_state = "Sky"
												m.text = "<font color=#33FFFF>×"
									del(Q)
							return
				return
			if(m)
				if(m.Owner == src.Owner && src.destination == m.loc)
					return
				else
					step_rand(src)

		TowerCap
			icon = 'Cave.dmi'
			icon_state = "TowerCap"
			IsTree = 1
			density = 1
			Humanoid = 0
			Intelligent = 0
			weightmax = 10
			SpecialUnit = 1
			DieAge = 25
			HP = 10
			CanKill = 1

		LizardEgg
			icon = 'LizardEgg.dmi'
			density = 1
			DieAge = 3000000
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			LizardMan = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
		Dragon
			icon = 'dragons.dmi'
			icon_state = "black"
			density = 1
			weightmax = 200
			Race = "Dragon"
			Gender = "Female"
			HP = 300
			MAXHP = 300
			Humanoid = 1
			AM = 1
			Carn = 1
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			Intelligent = 1
			ArmourSkill = 20
			SwordSkill = 20
			SneakingSkill = 0
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 4
			ImmuneToTemperature = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingRing = 1
			WearingHelmet = 1
			WearingCape = 1
			ImmunePoison = 1
			WearingBack = 1
			HoldingWeapon = "Claws"
			WearingShield = 1
			ButcherySkill = 5
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasWings = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			OrganMaxHP = 150

			OrganMaxHP = 150


			New()
				Age = 500
				WalkTo()
				Heal()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = 25
				usr.WeaponDamageMin = 20
				usr.WeaponDamageMax = 20
				Bleeding()
				Level()
				Hunger()
				Tiredness()
				AMBed()
				usr.DieAge = 5000
				Dig()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Devourer
			icon = 'Devourer.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 200
			Race = "Devourer"
			Gender = "None"
			HP = 300
			MAXHP = 300
			Humanoid = 1
			AM = 1
			Carn = 1
			Infects = 1
			EggContent = 0
			HumanParts = 1
			BloodContent = 400
			MaxBloodContent = 400
			Intelligent = 1
			ArmourSkill = 20
			SwordSkill = 20
			SneakingSkill = 0
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 4
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			WearingCape = 1
			ShieldSkill = 20
			ImmunePoison = 1
			WearingBack = 1
			HoldingWeapon = "Mace"
			WearingShield = 1
			ButcherySkill = 5
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 0

			HasRightLeg = 0

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "N/A"

			RightLeg = "N/A"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			OrganMaxHP = 150

			OrganMaxHP = 150

			New()
				Age = 2000
				WalkTo()
				Heal()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Intelligence = rand(1,2)
				usr.Defence = 25
				Bleeding()
				Undead = 1
				Level()
				usr.DieAge = 5000
				Dig()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		DevourerCacoon
			icon = 'Devourer.dmi'
			icon_state = "Cacoon"
			density = 1
			DieAge = 10
			WearingFullPlateHelm = 1
			Race = "Devourer"
			Humanoid = 1
			Strength = 1
			Agility = 1
			Defence = 1
			MAXHP = 100
			HP = 100
			New()
				spawn(1250)
					if(src)
						range(8,src) << "[src] begins to stir with life.<br>"
						spawn(1250)
							if(src)
								range(8,src) << "[src] hatches.<br>"
								src.Owner << "[src] hatched.<br>"
								var/mob/Monsters/Devourer/D = new
								var/mob/O = src.Owner
								O.UnitList += D
								D.Owner = src.Owner
								D.loc = src.loc
								D.name = "{[D.Owner]} Devourer"
								D.PillarPowerup()
								del(src)
		DevourerSpawnCacoon
			icon = 'Devourer.dmi'
			icon_state = "Cacoon2"
			density = 1
			DieAge = 10
			WearingFullPlateHelm = 1
			Race = "Devourer"
			Humanoid = 1
			Strength = 1
			Agility = 1
			Defence = 1
			MAXHP = 100
			HP = 100
			New()
				spawn(1250)
					if(src)
						range(8,src) << "[src] begins to stir with life.<br>"
						spawn(1250)
							if(src)
								range(8,src) << "[src] hatches.<br>"
								src.Owner << "[src] hatched.<br>"
								var/mob/Monsters/DevourerZombie/D = new
								var/mob/O = src.Owner
								O.UnitList += D
								D.Owner = src.Owner
								D.loc = src.loc
								D.name = "{[D.Owner]} Devourer Zombie"
								D.PillarPowerup()
								for(var/obj/Items/Shafts/EngineeredOrgan/E in src)
									if(E.Content2 == "Strength")
										D.Strength += 10
										D.WeaponDamageMin += 2
										D.WeaponDamageMax += 4
										D.weightmax += 25
									if(E.Content2 == "Agility")
										D.Agility += 10
										D.SneakingSkill += 5
										D.LockPickingSkill += 5
										D.Delay = 3
									if(E.Content2 == "Intelligence")
										D.Intelligence += 1
										D.EXPNeeded -= 15
									if(E.Content2 == "Resistance")
										D.ImmuneToMagic = 1
										D.ImmuneToTemperature = 1
										D.BlackPlague = 1
										D.BlackDeath = 1
										D.CommonCold = 1
										D.DieAge += D.DieAge/2
									if(E.Content2 == "Toughness")
										D.Defence += 5
										D.ArmourSkill += 5
										D.ShieldSkill += 5
									if(E.Content2 == "Climbing")
										D.AutoCliffClimb()
										D.CliffClimber = 1
									if(E.Content2 == "Chameleon")
										D.icon -= rgb(0,0,0,175)
										D.Sneak = 1
									if(E.Content2 == "Disguise")
										D.icon = pick('Human.dmi','Kobold.dmi','Goblins.dmi','LizardMan.dmi')
									if(E.Content2 == "Explosive")
										D.Content3 = "Explode"
									if(E.Content2 == "Acid")
										D.BloodAcidity += 10
									if(E.Content2 == "Claws")
										D.HoldingWeapon = "Claws"
										if(D.WeaponDamageMax <= 70)
											D.WeaponDamageMin += 15
											D.WeaponDamageMax += 20
										if(D.WeaponDamageMax > 70)
											D.WeaponDamageMin += 5
											D.WeaponDamageMax += 10
										D.ClawSkill += 25
								if(D.WeaponDamageMax >= 120)
									D.WeaponDamageMax = 120
								if(D.WeaponDamageMin >= 115)
									D.WeaponDamageMin = 115
								if(D.Defence >= 120)
									D.Defence = 120
								del(src)
		SpiderEgg
			icon = 'SpiderEgg.dmi'
			icon_state = "Egg"
			density = 1
			DieAge = 15
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			Spider = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
				usr.Age = 1
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(ismob(src.loc))
							var/mob/X = src.loc
							var/mob/Monsters/Spider/G = new
							G.loc = X.loc
							G.Owner = usr
							G.IsWarrior = 1
							G.Age = 1
							usr << "Egg hatched!"
							G.Birth()
							G.PillarPowerup()
							G.name = "{[G.Owner]}"
							usr.UnitList += G
							X.Owner << "A spider egg has hatched inside of [X], killing them!"
							X.GoingToDie = 1
							X.Killer = "[G]"
							X.DeathType = "having a spider egg hatch inside of them."
							X.Death()
							del src
						if(src.invisibility >= 101)
							del src
		DragonEgg
			icon = 'DragonEgg.dmi'
			icon_state = "Egg"
			density = 1
			DieAge = 15
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			Race = "Dragon"
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
				usr.Age = 1
		Mole
			icon = 'Mole.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			DieAge = 10
			Cantame = 1
			Humanoid = 1
			SpecialUnit = 1
			Mole = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP



		CaveSpider
			icon = 'Bugs.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			Poisonus = 1
			DieAge = 10
			Cantame = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			SpecialUnit = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP




		DeathBeatle
			icon = 'DeathBeatle.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			SpecialUnit = 1
			CanKill = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1

			Poisonus = 1
			Cantame = 1
			DieAge = 10
			Beatle = 1
			Humanoid = 0

			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(3,5)
				usr.Agility = rand(3,5)
				usr.Defence = rand(3,5)
				usr.MAXHP = rand(25,35)
				usr.HP = usr.MAXHP

		SilkWorm
			icon = 'Bugs.dmi'
			icon_state = "DoomWorm"
			density = 1
			weightmax = 10

			Bug = 1
			Poisonus = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,2)
				usr.Agility = rand(1,2)
				usr.Defence = rand(1,2)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP

		Wolf
			icon = 'Wolf.dmi'
			density = 1
			Wolf = 1
			DieAge = 35
			BloodContent = 300
			MaxBloodContent = 300
			Age = 1
			Cantame = 1
			Humanoid = 0
			Tame = 0
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = "Sword"
			Owner = "Wolves"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(10,20)
				usr.Agility = rand(5,10)
				Heal()
				usr.Defence = rand(5,10)
				usr.MAXHP = rand(50,150)
				usr.HP = usr.MAXHP
				WalkTo()
				Level()
				RanWalk()
				TurnOffAttack()
				Attacks()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		GrownPoisonSporePlant
			name = "PoisonSporePlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SneakingSkill = 500
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant2()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP

		PoisonSporePlant
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			SneakingSkill = 500
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant2()
		GrownCarnivorousPlant
			name = "CarnivorousPlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			SneakingSkill = 500
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant1()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP


		CarnivorousPlant
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			SneakingSkill = 500
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant1()
		Gremlin
			icon = 'Dwarf.dmi'
			density = 1
			weightmax = 100
			Race = "Gremlin"
			IsNPC = 1
			DieAge = 100
			SneakingSkill = 200
			Age = 1
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			WearingFullPlateHelm = 1
			Content = "CantBeCaged"
			New()
				usr.FindItems()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.Intelligence = rand(-1,-2)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
		Deer
			icon = 'Animal.dmi'
			density = 1
			weightmax = 100
			Deer = 1
			DieAge = 10
			Age = 1
			Cantame = 1
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I
				RanWalkPassive()
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		Troll
			icon = 'Troll.dmi'
			name = "{NPC Troll}"
			density = 1
			weightmax = 100
			DieAge = 5000
			Age = 50
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			IsTroll = 1
			Content = "CantBeCaged"
			CanBeSlaved = 1
			IsNPC = 1
			Carn = 1
			HP = 600
			MAXHP = 600
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = "Sword"
			Owner = "Trolls"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
			New()
				src.overlays += /obj/Troll/troll4x7
				src.overlays += /obj/Troll/troll1x7
				src.overlays += /obj/Troll/troll2x7
				src.overlays += /obj/Troll/troll3x7
				src.overlays += /obj/Troll/troll5x7
				src.overlays += /obj/Troll/troll6x7
				src.density = 1
				src.icon = 'Troll.dmi'
				src.icon_state = "Normal 7x7"
				usr.Strength = rand(100,150)
				usr.Agility = rand(1,5)
				Heal()
				usr.Defence = rand(20,50)
				usr.MAXHP = rand(1000,1500)
				usr.HP = usr.MAXHP
				Level()
				Bleeding()
				Heal()
				RandomWalk()
				TurnOffAttack()
				Combats()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
				usr.DieAge = rand(4500,5000)
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		NPC_FishMan

			icon = 'FishMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			Ratmen = 1
			Delay = 5
			MineingSkill = 45
			WoodCuttingSkill = 45
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			CanBeSlaved = 1
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 10
			User = 0
			SneakingSkill = 45
			UsesPoison = 1
			PoisonSkill = 45
			SkinningSkill = 15
			BoneCraftingSkill = 35
			ButcherySkill = 35
			UnArmedSkill = 20
			FishingSkill = 20
			MetalCraftingSkill = 5
			WoodCraftingSkill = 5
			SmeltingSkill = 5
			StoneCraftingSkill = 25
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 65

			WingHP = 65

			RightEyeHP = 65

			RightLungHP = 65

			LeftLungHP = 65

			SpleenHP = 65

			TeethHP = 65

			LeftArmHP = 65

			RightArmHP = 65

			LeftLegHP = 65

			RightLegHP = 65

			HeadHP = 65

			LeftEarHP = 65

			RightEarHP = 65

			GutsHP = 65

			StomachHP = 65

			LeftKidneyHP = 65

			RightKidneyHP = 65

			LiverHP = 65

			BrainHP = 65

			HeartHP = 65

			ThroatHP = 65

			NoseHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			New()
				var/M
				M = prob(40)
				Age = rand(5,10)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon_state = "Normal"
					usr.icon = 'FishMan.dmi'
				WalkTo()
				usr.Strength = rand(10,15)
				usr.Agility = rand(15,16)
				usr.Defence = rand(10,15)
				usr.Intelligence = rand(1,2)
				Hunger()
				Bleeding()
				Heal()
				RandomWalk()
				Combats()

				Level()
				Dig()
				usr.DieAge = rand(45,55)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		NPC_Fishman_Lord
			icon = 'FishMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 0
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Fishmen}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(25,40)
				usr.Agility = rand(20,30)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(1,2)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/ScaleLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/ScaleChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/ScalePlateHelmet/

				var/HasArmour = prob(50)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/ScaleLeggings/L = new
					var/obj/Items/Armours/ChestPlates/ScaleChestPlate/C = new
					var/obj/Items/Armours/Helmets/ScalePlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/ScaleLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/ScaleRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				WalkTo()
				NPCHumanName()
				usr.name = "[usr.name] Fishman Lord"
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHumanLord
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(2,4)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/GoldLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/GoldChestPlate/

				WalkTo()
				NPCHumanName()
				usr.name = "[usr.name] Human Noble"
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHumanVillager
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(1,2)
				usr.MAXHP = 100
				usr.WillJoin = prob(33)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				NPCHumanName()
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHuman3
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			ImmunePoison = 1
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(1,2)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/


				NPCHumanName()
				usr.WillJoin = prob(33)
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblin2
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			ImmunePoison = 1
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			Age = 18
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(1,2)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/


				NPCGoblinName()
				usr.WillJoin = prob(33)
				Bleeding()
				WalkTo()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHuman2
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			SellsPotion = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Human}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.Intelligence = rand(1,2)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCHumanName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				usr.IsTrader = prob(100)

				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblinTrader
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Age = 18
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			SellsPotion = 1
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"


			New()
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.Intelligence = rand(2,4)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCGoblinName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				usr.IsTrader = prob(100)
				Bleeding()
				ReturnHome()
				WalkTo()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblinKing
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			Age = 18
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				M = prob(100)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.Intelligence = rand(3,4)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCGoblinName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/SilverLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SilverChestPlate/
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.name = "[usr.name] Goblin King"
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		LichKing
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			name = "{NPC Undead} Lich Lord"
			Race = "Lich"
			density = 1
			weightmax = 150
			Undead = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 0
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Sword"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 110
			ShieldSkill = 150
			SwordSkill = 150
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			ImmuneToMagic = 1
			ImmuneToVampire = 1
			ImmuneToTemperature = 1
			Shielded = 1
			WearingShield = 1
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingLegs = 1
			WearingHelmet = 1
			Owner = "{NPC Undead}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			New()
				M = prob(100)
				Age = rand(1000,2000)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				usr.Strength = rand(115,120)
				usr.Agility = rand(115,120)
				usr.Defence = rand(200,250)
				usr.Intelligence = rand(115,120)
				usr.MAXHP = 990
				usr.WeaponDamageMin = 170
				usr.WeaponDamageMax = 240
				usr.Tiredness = 99999999999999
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/ChestPlates/NecroRobe/
				usr.overlays += /obj/Items/Armours/Helmets/BlackHood/
				usr.overlays += /obj/Items/Weapons/Maces/NecroStaff/
				var/obj/Items/Shafts/LichSkull/L = new()
				L.loc = usr
				L.suffix = "(Carrying)"
				var/obj/Items/Armours/ChestPlates/NecroRobe/G = new()
				G.loc = usr
				G.suffix = "(Carrying)"
				WalkTo()
				Bleeding()
				ReturnHome()
				MagicShoot()
				usr.DieAge = rand(9999999,99999999)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		ZephialKingOfBern
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			name = "Zephial : King of Bern"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 0
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Sword"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 110
			ShieldSkill = 150
			SwordSkill = 150
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			ImmuneToMagic = 1
			ImmuneToVampire = 1
			ImmuneToTemperature = 1
			Shielded = 1
			WearingShield = 1
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingLegs = 1
			WearingHelmet = 1
			Owner = "{NPC Goblins}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			New()
				M = prob(100)
				Age = rand(1000,2000)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				usr.Strength = rand(115,120)
				usr.Agility = rand(115,120)
				usr.Defence = rand(200,250)
				usr.Intelligence = rand(115,120)
				usr.MAXHP = 250
				usr.WeaponDamageMin = 170
				usr.WeaponDamageMax = 240
				usr.Tiredness = 99999999999999
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/ChestPlates/AdamantiumChestPlate/
				usr.overlays += /obj/Items/Armours/Legs/AdamantiumLeggings/
				usr.overlays += /obj/Items/Armours/Helmets/AdamantiumHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/AdamantiumLeftGauntlet/
				usr.overlays += /obj/Items/Armours/RightArms/AdamantiumRightGauntlet/
				usr.overlays += /obj/Items/Weapons/Swords/DestructionSword/
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(9999999,99999999)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		FortGoblin
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 40
			ShieldSkill = 30
			SpearSkill = 55
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblins}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			New()
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(15,20)
				usr.Agility = rand(5,20)
				usr.Defence = rand(35,50)
				usr.Intelligence = rand(8,12)
				usr.MAXHP = 250
				usr.WeaponDamageMin = 15
				usr.WeaponDamageMax = 35
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				NPCHumanName()
				usr.name = "[usr.name]"
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src

		NPCHuman
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1
			IsNPC = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 40
			ShieldSkill = 30
			SpearSkill = 55
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Demons}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			OrganMaxHP = 200

			New()
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,75)
				usr.Intelligence = rand(4,8)
				usr.MAXHP = 250
				usr.WeaponDamageMin = 35
				usr.WeaponDamageMax = 65
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.icon += rgb(125,0,0)
				usr.overlays += /obj/Items/Armours/Legs/SkornLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet
				usr.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/

				var/HasArmour = prob(20)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/SkornLeggings/L = new
					var/obj/Items/Armours/ChestPlates/SkornChestPlate/C = new
					var/obj/Items/Armours/Helmets/SkornPlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/SkornLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/SkornRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				NPCHumanName()
				usr.name = "[usr.name] Follower of Skorn"
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCSkorn
			icon = 'Human.dmi'
			icon_state = "Normal"
			name = "{NPC} Skorn Lord of Pain"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			WearingFullPlateHelm = 1
			IsSkorn = 1
			NPC = 1
			HammerSkill = 30
			SneakingSkill = 200
			AxeSkill = 30
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 45
			ShieldSkill = 45
			ButcherySkill = 30
			ArmourSkill = 40
			MaceSkill = 30
			SpearSkill = 60
			SkinningSkill = 30
			UnArmedSkill = 30
			StoneCraftingSkill = 40
			MetalCraftingSkill = 40
			SmeltingSkill = 40
			Owner = "{NPC Demons}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0




			LeftEyeHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200


			New()
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,100)
				usr.Intelligence = rand(4,8)
				usr.MAXHP = 300
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.icon += rgb(200,0,0)
				usr.WeaponDamageMin = 50
				usr.WeaponDamageMax = 100
				usr.overlays += /obj/Items/Armours/Legs/SkornLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet
				usr.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				var/HasArmour = prob(20)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/SkornLeggings/L = new
					var/obj/Items/Armours/ChestPlates/SkornChestPlate/C = new
					var/obj/Items/Armours/Helmets/SkornPlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/SkornLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/SkornRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				WalkTo()
				Bleeding()
				ReturnHome()
				Bleeding()
				usr.DieAge = rand(1500,2000)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		Guardstone
			icon = 'Book.dmi'
			icon_state = "Guardstone"
			density = 1
			weightmax = 25
			Race = "Guardstone"
			Humanoid = 1

			UsesPicks = 0
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			CantLoseLimbs = 1
			WearingFullPlateHelm = 1
			IsSkorn = 1
			NPC = 1
			HammerSkill = 30
			SneakingSkill = 200
			AxeSkill = 30
			Intelligent = 1
			HoldingWeapon = "Guardbolt"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 45
			ShieldSkill = 45
			ButcherySkill = 30
			ArmourSkill = 40
			MaceSkill = 30
			SpearSkill = 60
			SkinningSkill = 30
			UnArmedSkill = 30
			StoneCraftingSkill = 40
			MetalCraftingSkill = 40
			SmeltingSkill = 40
			Guardstone = 1
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0




			LeftEyeHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			New()
				Age = rand(20,30)
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,100)
				usr.MAXHP = 300
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.WeaponDamageMin = 50
				usr.WeaponDamageMax = 100
				Bleeding()
				TurretFire()

				usr.DieAge = rand(20000,20000)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		NPCDwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			name = "{NPC} Dwarf"
			density = 1
			weightmax = 150
			Dwarf = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Dwarf}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				usr.G = prob(33)
				usr.B = prob(33)
				usr.BB = prob(33)
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Intelligence = rand(1,2)
				usr.Defence = rand(100,150)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				NPCAttack()
				usr.IsTrader = prob(33)
				ReturnHome()
				usr.DieAge = rand(120,150)
				..()
				if(G == 1)
					usr.overlays += 'Beards.dmi'
				if(B == 1)
					usr.overlays += 'BlackBeard.dmi'
				if(BB == 1)
					usr.overlays += 'BrownBeard.dmi'
				if(BB == 0)
					if(B == 0)
						if(G == 0)
							usr.overlays += 'Beards.dmi'
							usr.G = 1
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M in range(1,src))
						if(M.Human == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail human, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Size matters not!")
										return
									if(Taunt == 1)
										alert("[src] : Try not to bump your head hehehe!")
										return
						if(M.Dwarf == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail fellow dwarf, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Are you a male or female? I really cant tell!")
										return
									if(Taunt == 1)
										alert("[src] : You look shorter than the average dwarf, you need more ale my friend!")
										return
						if(M.Goblin == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Ah a Goblin, you better whatch your step, you Goblins are known to be tricksy")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : wow! You Goblins are smart, I even heard you can count to ten!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
						if(M.Kobold == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Heh a Kobold hey, you better whatch your self, if your thinking of stealing any of our goods then you better think again my pointy eared friend")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : What do ya get when you cross a Kobold with a LockPick? Kboldy Locks!!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
					else
						if(M.Wagon == 0)
							M.destination = src


		SilverChest
			icon = 'Cave.dmi'
			icon_state = "Silver Chest"
			density = 0
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			CantKill = 1
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a silver chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I


			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		Drill
			icon = 'MetalObjects.dmi'
			icon_state = "Drill"
			CantKill = 1
			density = 0
			Drill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a drill, it can be used to extract ore from the ground.This type of drill can be placed in the ground and twisted around to dig with."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		GoldChest
			icon = 'Cave.dmi'
			icon_state = "Gold Chest"
			CantKill = 1
			density = 0
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a gold chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		MetalChest
			icon = 'Cave.dmi'
			icon_state = "Metal Chest"
			density = 0
			weightmax = 500
			CantKill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a metal chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		WoodenChest
			icon = 'Cave.dmi'
			icon_state = "Wooden Chest"
			density = 0
			CantKill = 1
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a wooden chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Wagon
			icon = 'Cave.dmi'
			icon_state = "Wagon"
			density = 0
			weightmax = 1000
			Wagon = 1
			CantKill = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			HasLeftLeg = 1
			Delay = 4
			HasRightLeg = 1
			Fainted = 0
			CanWalk = 1
			New()
				WalkTo()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		Elf
			icon = 'Elf.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 120
			MineingSkill = 0
			WoodCuttingSkill = 70
			Race = "Elf"
			Humanoid = 1
			UsesPicks = 1
			Carn = 1
			Sneak = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 45
			SwordSkill = 25
			AxeSkill = 5
			MaceSkill = 5
			PotionSkill = 10
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 40
			BloodContent = 300
			MaxBloodContent = 300
			UsesPoison = 1
			UnArmedSkill = 5
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			ForgingSkill = 5
			WoodCraftingSkill = 35
			MetalCraftingSkill = 5
			User = 0
			SkinningSkill = 15
			SmeltingSkill = 5
			ButcherySkill = 25
			LeatherCraftingSkill = 25
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 5
			SneakingSkill = 25
			LockPickingSkill = 25
			CookingSkill = 25
			CanFarm = 1
			FishingSkill = 25
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 110

			WingHP = 110

			RightEyeHP = 110

			RightLungHP = 110

			LeftLungHP = 110

			SpleenHP = 110

			TeethHP = 110

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 110

			LeftEarHP = 110

			RightEarHP = 110

			GutsHP = 110

			StomachHP = 110

			LeftKidneyHP = 110

			RightKidneyHP = 110

			LiverHP = 110

			BrainHP = 110

			HeartHP = 110

			ThroatHP = 110

			NoseHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'Female Elf.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(2,4)
				usr.Agility = rand(9,14)
				usr.Defence = rand(5,10)
				usr.Intelligence = rand(1,3)
				Hunger()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(1600,1700)
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star


		Human
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 110
			MineingSkill = 10
			WoodCuttingSkill = 20
			Human = 1
			Humanoid = 1
			UsesPicks = 1
			Carn = 0
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 10
			SwordSkill = 20
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 10
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			ForgingSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 15
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			CanFarm = 1
			FishingSkill = 25
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 110

			WingHP = 110

			RightEyeHP = 110

			RightLungHP = 110

			LeftLungHP = 110

			SpleenHP = 110

			TeethHP = 110

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 110

			LeftEarHP = 110

			RightEarHP = 110

			GutsHP = 110

			StomachHP = 110

			LeftKidneyHP = 110

			RightKidneyHP = 110

			LiverHP = 110

			BrainHP = 110

			HeartHP = 110

			ThroatHP = 110

			NoseHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			New()
				M = prob(50)
				usr.Black = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				if(M == 1)
					if(usr.Black == 1)
						usr.icon = 'HumanBlack.dmi'
						usr.icon_state = "Normal"
				else
					if(usr.Black == 1)
						usr.icon = 'FemaleHumanBlack.dmi'
						usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(5,10)
				usr.Agility = rand(7,11)
				usr.Defence = rand(4,9)
				usr.Intelligence = rand(1,2)
				Hunger()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(95,115)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		DevourerZombie
			icon = 'DevourerZombie.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 110
			MineingSkill = 10
			WoodCuttingSkill = 20
			Infects = 1
			Humanoid = 1
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 10
			SwordSkill = 10
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 10
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			ForgingSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 15
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			CanFarm = 1
			FishingSkill = 25
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 110

			WingHP = 110

			RightEyeHP = 110

			RightLungHP = 110

			LeftLungHP = 110

			SpleenHP = 110

			TeethHP = 110

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 110

			LeftEarHP = 110

			RightEarHP = 110

			GutsHP = 110

			StomachHP = 110

			LeftKidneyHP = 110

			RightKidneyHP = 110

			LiverHP = 110

			BrainHP = 110

			HeartHP = 110

			ThroatHP = 110

			NoseHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			New()
				Age = 1
				WalkTo()
				Bleeding()
				Gender = null
				usr.Strength = rand(5,10)
				usr.Agility = rand(7,11)
				usr.Defence = rand(4,9)
				usr.Intelligence = rand(0.5,1)
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(150,160)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Werewolf
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 110
			MineingSkill = 10
			WoodCuttingSkill = 20
			Werewolf = 1
			Human = 1
			Delay = 3
			UsesPicks = 1
			Humanoid = 1
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 10
			SwordSkill = 30
			Werepowers = 0
			MakesBoneCraft = 1
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			HP = 200
			AM = 1
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 30
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			ForgingSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 15
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			CanFarm = 1
			FishingSkill = 25
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 110

			WingHP = 110

			RightEyeHP = 110

			RightLungHP = 110

			LeftLungHP = 110

			SpleenHP = 110

			TeethHP = 110

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 110

			LeftEarHP = 110

			RightEarHP = 110

			GutsHP = 110

			StomachHP = 110

			LeftKidneyHP = 110

			RightKidneyHP = 110

			LiverHP = 110

			BrainHP = 110

			HeartHP = 110

			ThroatHP = 110

			NoseHP = 110

			OrganMaxHP = 110

			New()
				M = prob(50)
				Age = rand(20,25)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = rand(10,15)
				usr.Intelligence = rand(1,2)
				Hunger()
				Heal()
				WerewolfTransformation()

				Level()
				Dig()
				usr.DieAge = rand(120,130)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		OrcEscort

			icon = 'OrcMale.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Orc"

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			UsesPoison = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0





			New()
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCGoblinName()
				Leave()
				usr.name = "{Escort} Orc [usr.name]"
				usr.DieAge = rand(110,125)
				Escort()

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		Orc
			icon = 'OrcMale.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 15
			WoodCuttingSkill = 15
			Race = "Orc"
			Humanoid = 1
			UsesPicks = 1
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 15
			SwordSkill = 20
			AxeSkill = 30
			MaceSkill = 25
			PotionSkill = 0
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 0
			ArmourSkill = 20
			ForgingSkill = 15
			MakesBoneCraft = 1
			UsesPoison = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 20
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PoisonSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 130

			WingHP = 130

			RightEyeHP = 130

			RightLungHP = 130

			LeftLungHP = 130

			SpleenHP = 130

			TeethHP = 130

			LeftArmHP = 130

			RightArmHP = 130

			LeftLegHP = 130

			RightLegHP = 130

			HeadHP = 130

			LeftEarHP = 130

			RightEarHP = 130

			GutsHP = 130

			StomachHP = 130

			LeftKidneyHP = 130

			RightKidneyHP = 130

			LiverHP = 130

			BrainHP = 130

			HeartHP = 130

			ThroatHP = 130

			NoseHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			New()
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'OrcFemale.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(7,14)
				usr.Agility = rand(5,8)
				usr.Defence = rand(6,12)
				usr.Intelligence = rand(0.25,0.5)
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(110,125)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Illithid
			icon = 'Illithid.dmi'
			icon_state = "Normal"
			Race = "Illithid"
			density = 1
			weightmax = 65
			MineingSkill = 15
			WoodCuttingSkill = 15
			Illithid = 1
			Humanoid = 1
			UsesPicks = 0
			CantLoseLimbs = 1
			Carn = 1
			AM = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 20
			SwordSkill = 10
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 0
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 0
			ArmourSkill = 20
			ForgingSkill = 15
			MakesBoneCraft = 1
			UsesPoison = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 20
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PoisonSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 130

			WingHP = 130

			RightEyeHP = 130

			RightLungHP = 130

			LeftLungHP = 130

			SpleenHP = 130

			TeethHP = 130

			LeftArmHP = 130

			RightArmHP = 130

			LeftLegHP = 130

			RightLegHP = 130

			HeadHP = 130

			LeftEarHP = 130

			RightEarHP = 130

			GutsHP = 130

			StomachHP = 130

			LeftKidneyHP = 130

			RightKidneyHP = 130

			LiverHP = 130

			BrainHP = 130

			HeartHP = 130

			ThroatHP = 130

			NoseHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			New()
				WalkTo()
				Bleeding()
				usr.Strength = rand(2,5)
				usr.Agility = rand(5,8)
				usr.Defence = rand(2,5)
				usr.Intelligence = rand(4.5,6.5)
				usr.overlays += /obj/IllithidTentacles
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(270,300)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		MindWorm
			icon = 'MindWorm.dmi'
			Race = "Mind Worm"
			density = 1
			weightmax = 65
			MineingSkill = 15
			WoodCuttingSkill = 15
			Illithid = 1
			Humanoid = 1
			UsesPicks = 0
			CantLoseLimbs = 1
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 20
			SwordSkill = 10
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 0
			HoldingWeapon = 1
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 0
			ArmourSkill = 20
			ForgingSkill = 15
			MakesBoneCraft = 1
			UsesPoison = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 20
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PoisonSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 130

			WingHP = 130

			RightEyeHP = 130

			RightLungHP = 130

			LeftLungHP = 130

			SpleenHP = 130

			TeethHP = 130

			LeftArmHP = 130

			RightArmHP = 130

			LeftLegHP = 130

			RightLegHP = 130

			HeadHP = 130

			LeftEarHP = 130

			RightEarHP = 130

			GutsHP = 130

			StomachHP = 130

			LeftKidneyHP = 130

			RightKidneyHP = 130

			LiverHP = 130

			BrainHP = 130

			HeartHP = 130

			ThroatHP = 130

			NoseHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			New()
				WalkTo()
				Bleeding()
				usr.Strength = rand(1,2)
				usr.Agility = rand(1,2)
				usr.Defence = rand(1,2)
				usr.Intelligence = rand(5.5,6.5)
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(270,300)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star


		Parasite
			icon = 'Parasite.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 0
			MineingSkill = 0
			WoodCuttingSkill = 0
			Race = "Parasite"
			Humanoid = 0
			UsesPicks = 0
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 0
			SwordSkill = 0
			AxeSkill = 0
			MaceSkill = 0
			PotionSkill = 0
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 0
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 0
			ShieldSkill = 0
			JewlCraftingSkill = 0
			ArmourSkill = 0
			ForgingSkill = 0
			MakesBoneCraft = 0
			UsesPoison = 0
			WoodCraftingSkill = 0
			MetalCraftingSkill = 0
			User = 0
			SkinningSkill = 0
			SmeltingSkill = 0
			ButcherySkill = 0
			LeatherCraftingSkill = 0
			PoisonSkill = 0
			BoneCraftingSkill = 0
			StoneCraftingSkill = 0
			SneakingSkill = 0
			LockPickingSkill = 0
			CookingSkill = 0
			FishingSkill = 0
			HasLeftEye = 0

			HasRightEye = 0

			HasRightLung  = 0

			HasLeftLung  = 0

			HasSpleen  = 0

			HasTeeth  = 0

			CanSee = 1

			HasLeftArm  = 0

			HasRightArm = 0

			HasLeftLeg = 0

			HasRightLeg = 0

			HasHead = 0

			HasLeftEar = 0

			HasRightEar = 0

			HasGuts = 0

			HasStomach = 0

			HasLeftKidney = 0

			HasRightKidney = 0

			HasLiver = 0

			HasBrain = 0

			HasHeart = 0

			HasThroat = 0

			HasNose = 0

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Destroyed"

			LeftArm = "Destroyed"

			RightArm= "Destroyed"

			LeftLeg = "Destroyed"

			RightLeg = "Destroyed"

			Head= "Destroyed"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			LeftEyeHP = null

			WingHP = null

			RightEyeHP = null

			RightLungHP = null

			LeftLungHP = null

			SpleenHP = null

			TeethHP = null

			LeftArmHP = null

			RightArmHP = null

			LeftLegHP = null

			RightLegHP = null

			HeadHP = null

			LeftEarHP = null

			RightEarHP = null

			GutsHP = null

			StomachHP = null

			LeftKidneyHP = null

			RightKidneyHP = null

			LiverHP = null

			BrainHP = null

			HeartHP = null

			ThroatHP = null

			NoseHP = null

			OrganMaxHP = null

			OrganMaxHP = null

			OrganMaxHP = null

			OrganMaxHP = null

			New()
				WalkTo()
				usr.Strength = rand(7,14)
				usr.Agility = rand(5,8)
				usr.Defence = rand(6,12)
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(500,600)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		Dwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 130
			MineingSkill = 20
			WoodCuttingSkill = 20
			HumanParts = 1
			Dwarf = 1
			Humanoid = 1
			UsesPicks = 1
			BloodContent = 300
			MaxBloodContent = 300
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			BowSkill = 15
			AxeSkill = 20
			Intelligent = 1
			ArmourSkill = 40
			SneakingSkill = 10
			WearingLegs = 0
			ShieldSkill = 20
			User = 0
			ButcherySkill = 10
			MaceSkill = 25
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 30
			MetalCraftingSkill = 25
			HP = 200
			JewlCraftingSkill = 20
			MAXHP = 200
			SmeltingSkill = 25
			FishingSkill = 15
			LeatherCraftingSkill = 15
			CookingSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 125

			WingHP = 125

			RightEyeHP = 125

			RightLungHP = 125

			LeftLungHP = 125

			SpleenHP = 125

			TeethHP = 125

			LeftArmHP = 125

			RightArmHP = 125

			LeftLegHP = 125

			RightLegHP = 125

			HeadHP = 125

			LeftEarHP = 125

			RightEarHP = 125

			GutsHP = 125

			StomachHP = 125

			LeftKidneyHP = 125

			RightKidneyHP = 125

			LiverHP = 125

			BrainHP = 125

			HeartHP = 125

			ThroatHP = 125

			NoseHP = 125

			OrganMaxHP = 125

			OrganMaxHP = 125

			OrganMaxHP = 125

			OrganMaxHP = 125

			New()
				usr.G = prob(33)
				usr.B = prob(33)
				usr.BB = prob(33)
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
					if(G == 1)
						usr.overlays += 'Beards.dmi'
					if(B == 1)
						usr.overlays += 'BlackBeard.dmi'
					if(BB == 1)
						usr.overlays += 'BrownBeard.dmi'
					if(BB == 0)
						if(B == 0)
							if(G == 0)
								usr.overlays += 'Beards.dmi'
								usr.G = 1
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
					usr.G = 0
					usr.B = 0
					usr.BB = 0
				WalkTo()
				usr.Strength = rand(7,14)
				usr.Agility = rand(3,6)
				usr.Defence = rand(7,13)
				usr.Intelligence = rand(0.5,0.75)
				Hunger()
				Heal()
				Bleeding()
				Level()
				Dig()

				usr.DieAge = rand(120,150)
				Tiredness()
				Bed()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		PlayerGremlin
			icon = 'Dwarf.dmi'
			icon_state = null
			density = 1
			Race = "Gremlin"
			ImmuneToTemperature = 1
			weightmax = 95
			MineingSkill = 10
			WoodCuttingSkill = 10
			WearingFullPlateHelm = 1
			WearingRing = 1
			WearingCape = 1
			Gremlin = 1
			BowSkill = 20
			Humanoid = 1
			UsesPicks = 0
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 10
			ShieldSkill = 15
			SpearSkill = 20
			PoisonSkill = 30
			BoneCraftingSkill = 15
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 15
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 20
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 15
			JewlCraftingSkill = 15
			MetalCraftingSkill = 15
			WoodCraftingSkill = 10
			SmeltingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15
			CantLoseLimbs = 1
			BlackDeath = 1
			BlackPlague = 1
			CommonCold = 1

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 95

			WingHP = 95

			RightEyeHP = 95

			RightLungHP = 95

			LeftLungHP = 95

			SpleenHP = 95

			TeethHP = 95

			LeftArmHP = 95

			RightArmHP = 95

			LeftLegHP = 95

			RightLegHP = 95

			HeadHP = 95

			LeftEarHP = 95

			RightEarHP = 95

			GutsHP = 95

			StomachHP = 95

			LeftKidneyHP = 95

			RightKidneyHP = 95

			LiverHP = 95

			BrainHP = 95

			HeartHP = 95

			ThroatHP = 95

			NoseHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			New()
				for(var/obj/I in src)
					del I
				for(var/mob/K in src)
					del K
				src.weight = 0
				WalkTo()
				usr.Strength = rand(4,9)
				usr.Agility = rand(8,12)
				usr.Defence = rand(3,8)
				usr.Intelligence = rand(0.5,0.75)


				Hunger()
				Heal()
				Bleeding()
				Dig()
				usr.DieAge = rand(250,300)
				Tiredness()
				Level()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star


		Goblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			MineingSkill = 10
			WoodCuttingSkill = 10
			Goblin = 1
			BowSkill = 20
			Humanoid = 1
			UsesPicks = 1
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 10
			ShieldSkill = 15
			SpearSkill = 20
			PoisonSkill = 30
			BoneCraftingSkill = 15
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 15
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 20
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 15
			JewlCraftingSkill = 15
			MetalCraftingSkill = 15
			WoodCraftingSkill = 10
			SmeltingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 95

			WingHP = 95

			RightEyeHP = 95

			RightLungHP = 95

			LeftLungHP = 95

			SpleenHP = 95

			TeethHP = 95

			LeftArmHP = 95

			RightArmHP = 95

			LeftLegHP = 95

			RightLegHP = 95

			HeadHP = 95

			LeftEarHP = 95

			RightEarHP = 95

			GutsHP = 95

			StomachHP = 95

			LeftKidneyHP = 95

			RightKidneyHP = 95

			LiverHP = 95

			BrainHP = 95

			HeartHP = 95

			ThroatHP = 95

			NoseHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.icon = 'FemaleGoblin.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(4,9)
				usr.Agility = rand(8,12)
				usr.Defence = rand(3,8)
				usr.Intelligence = rand(0.5,0.75)


				Hunger()
				Heal()
				Bleeding()
				Dig()
				usr.DieAge = rand(110,120)
				Tiredness()
				Level()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		ElderBrain
			icon = 'ElderBrain.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			Illithid = 1
			Race = "Elder Brain"
			BowSkill = 20
			WearingCape = 1
			Humanoid = 1
			UsesPicks = 0
			CanDetail = 1
			CanBeCaged = 0
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			User = 0

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			CanWalk = 0

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 95

			WingHP = 95

			RightEyeHP = 95

			RightLungHP = 95

			LeftLungHP = 95

			SpleenHP = 95

			TeethHP = 95

			LeftArmHP = 95

			RightArmHP = 95

			LeftLegHP = 95

			RightLegHP = 95

			HeadHP = 95

			LeftEarHP = 95

			RightEarHP = 95

			GutsHP = 95

			StomachHP = 95

			LeftKidneyHP = 95

			RightKidneyHP = 95

			LiverHP = 95

			BrainHP = 95

			HeartHP = 95

			ThroatHP = 95

			NoseHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			New()
				Age = 45
				usr.Strength = rand(10,15)
				usr.Agility = rand(1,2)
				usr.Defence = rand(40,60)
				usr.Intelligence = rand(10,20)


				Heal()
				Dig()
				usr.DieAge = rand(4000,5000)
				Level()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star


		SandKing
			icon = 'Sandking.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			MineingSkill = 10
			WoodCuttingSkill = 10
			SandKing = 1
			BowSkill = 20
			WearingCape = 1
			Humanoid = 1
			UsesPicks = 0
			CanDetail = 1
			CanBeCaged = 0
			Carn = 1
			AM = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 10
			ShieldSkill = 15
			SpearSkill = 20
			PoisonSkill = 30
			BoneCraftingSkill = 15
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 15
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 20
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 15
			JewlCraftingSkill = 15
			MetalCraftingSkill = 15
			WoodCraftingSkill = 10
			SmeltingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			CanWalk = 0

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 95

			WingHP = 95

			RightEyeHP = 95

			RightLungHP = 95

			LeftLungHP = 95

			SpleenHP = 95

			TeethHP = 95

			LeftArmHP = 95

			RightArmHP = 95

			LeftLegHP = 95

			RightLegHP = 95

			HeadHP = 95

			LeftEarHP = 95

			RightEarHP = 95

			GutsHP = 95

			StomachHP = 95

			LeftKidneyHP = 95

			RightKidneyHP = 95

			LiverHP = 95

			BrainHP = 95

			HeartHP = 95

			ThroatHP = 95

			NoseHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			OrganMaxHP = 95

			New()
				Age = 45
				usr.Strength = rand(10,15)
				usr.Agility = rand(1,2)
				usr.Defence = rand(20,40)


				Hunger()
				Heal()
				Bleeding()
				Dig()
				usr.DieAge = rand(1000,2000)
				Level()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star


		LizardManEscort

			icon = 'LizardMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			LizardMan = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			MakesPoison = 1
			ImmunePoison = 1
			Alive =1
			HP = 300
			Escort = 1
			HasGland = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			PoisonDMG = 5
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1


			BleedType = null

			Stunned  = 0

			Fainted  = 0


			New()
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += 'LizardTail.dmi'
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				Leave()
				usr.name = "{Escort} LizardMan"
				usr.DieAge = rand(70,100)
				Escort()

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		LizardMan
			icon = 'LizardMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 10
			WoodCuttingSkill = 10
			LizardMan = 1
			BowSkill = 25
			Humanoid = 1
			UsesPicks = 0
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			HasGland = 1
			Intelligent = 1
			MakesPoison = 1
			ImmunePoison = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 15
			ShieldSkill = 20
			PoisonDMG = 5
			SpearSkill = 25
			PoisonSkill = 25
			BoneCraftingSkill = 20
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 20
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 15
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 20
			JewlCraftingSkill = 5
			MetalCraftingSkill = 10
			WoodCraftingSkill = 15
			SmeltingSkill = 10
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 115

			WingHP = 115

			RightEyeHP = 115

			RightLungHP = 115

			LeftLungHP = 115

			SpleenHP = 115

			TeethHP = 115

			LeftArmHP = 115

			RightArmHP = 115

			LeftLegHP = 115

			RightLegHP = 115

			HeadHP = 115

			LeftEarHP = 115

			RightEarHP = 115

			GutsHP = 115

			StomachHP = 115

			LeftKidneyHP = 115

			RightKidneyHP = 115

			LiverHP = 115

			BrainHP = 115

			HeartHP = 115

			ThroatHP = 115

			NoseHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon = 'LizardWoman.dmi'
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(6,11)
				usr.Agility = rand(8,12)
				usr.Defence = rand(9,12)
				usr.Intelligence = rand(0.25,0.5)
				usr.overlays += 'LizardTail.dmi'

				Hunger()
				Heal()
				Bleeding()
				Dig()
				Regen()
				usr.DieAge = rand(110,115)
				Tiredness()
				Level()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Frogmen
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 10
			WoodCuttingSkill = 10
			FrogMan = 1
			LizardMan = 0
			BowSkill = 25
			Humanoid = 1
			UsesPicks = 0
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			MakesPoison = 1
			ImmunePoison = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 15
			ShieldSkill = 20
			PoisonDMG = 5
			SpearSkill = 25
			PoisonSkill = 25
			BoneCraftingSkill = 20
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 20
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 15
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 20
			JewlCraftingSkill = 5
			MetalCraftingSkill = 10
			WoodCraftingSkill = 15
			SmeltingSkill = 10
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 115

			WingHP = 115

			RightEyeHP = 115

			RightLungHP = 115

			LeftLungHP = 115

			SpleenHP = 115

			TeethHP = 115

			LeftArmHP = 115

			RightArmHP = 115

			LeftLegHP = 115

			RightLegHP = 115

			HeadHP = 115

			LeftEarHP = 115

			RightEarHP = 115

			GutsHP = 115

			StomachHP = 115

			LeftKidneyHP = 115

			RightKidneyHP = 115

			LiverHP = 115

			BrainHP = 115

			HeartHP = 115

			ThroatHP = 115

			NoseHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			OrganMaxHP = 115

			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon = 'Female_FrogMan.dmi'
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(6,11)
				usr.Agility = rand(8,12)
				usr.Defence = rand(9,12)
				usr.Intelligence = rand(0.25,0.5)

				Hunger()
				Heal()
				Bleeding()
				Dig()
				usr.DieAge = rand(110,115)
				Tiredness()
				Level()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Naga
			icon = 'Naga.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 200
			MineingSkill = 5
			WoodCuttingSkill = 5
			Race = "Naga"
			Humanoid = 1
			UsesPicks = 0
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 30
			SwordSkill = 10
			AxeSkill = 0
			MaceSkill = 0
			PotionSkill = 0
			HP = 300
			MAXHP = 300
			HumanParts = 1
			BowSkill = 20
			BloodContent = 250
			MaxBloodContent = 250
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 10
			ArmourSkill = 10
			ForgingSkill = 5
			MakesBoneCraft = 1
			UsesPoison = 1
			WoodCraftingSkill = 5
			MetalCraftingSkill = 5
			User = 0
			SkinningSkill = 50
			SmeltingSkill = 0
			ButcherySkill = 50
			LeatherCraftingSkill = 50
			PoisonSkill = 50
			BoneCraftingSkill = 20
			StoneCraftingSkill = 5
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 50
			FishingSkill = 200
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 130

			WingHP = 130

			RightEyeHP = 130

			RightLungHP = 130

			LeftLungHP = 130

			SpleenHP = 130

			TeethHP = 130

			LeftArmHP = 130

			RightArmHP = 130

			LeftLegHP = 130

			RightLegHP = 130

			HeadHP = 130

			LeftEarHP = 130

			RightEarHP = 130

			GutsHP = 130

			StomachHP = 130

			LeftKidneyHP = 130

			RightKidneyHP = 130

			LiverHP = 130

			BrainHP = 130

			HeartHP = 130

			ThroatHP = 130

			NoseHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			OrganMaxHP = 130

			New()
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon = 'FemaleNaga.dmi'
					usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(10,20)
				usr.Agility = rand(20,25)
				usr.Defence = rand(6,12)
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(300,500)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		Ratman

			icon = 'Ratmen.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Ratmen = 1
			MineingSkill = 45
			WoodCuttingSkill = 45
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 10
			User = 0
			SneakingSkill = 45
			UsesPoison = 1
			PoisonSkill = 45
			SkinningSkill = 15
			BoneCraftingSkill = 35
			ButcherySkill = 35
			UnArmedSkill = 20
			FishingSkill = 20
			MetalCraftingSkill = 5
			WoodCraftingSkill = 5
			SmeltingSkill = 5
			StoneCraftingSkill = 25
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 65

			WingHP = 65

			RightEyeHP = 65

			RightLungHP = 65

			LeftLungHP = 65

			SpleenHP = 65

			TeethHP = 65

			LeftArmHP = 65

			RightArmHP = 65

			LeftLegHP = 65

			RightLegHP = 65

			HeadHP = 65

			LeftEarHP = 65

			RightEarHP = 65

			GutsHP = 65

			StomachHP = 65

			LeftKidneyHP = 65

			RightKidneyHP = 65

			LiverHP = 65

			BrainHP = 65

			HeartHP = 65

			ThroatHP = 65

			NoseHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			New()
				var/M
				M = prob(50)
				Age = rand(5,10)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon_state = "Normal"
					usr.icon = 'Ratwomen.dmi'
					usr.CantLoseLimbs = 1
				WalkTo()
				usr.Strength = rand(1,2)
				usr.Agility = rand(10,15)
				usr.Defence = rand(0,1)
				usr.Intelligence = rand(0.25,0.5)
				Hunger()
				Bleeding()
				Heal()
				Combats()

				Level()
				Dig()
				usr.DieAge = rand(40,50)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		NPCRatman

			icon = 'Ratmen.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			Ratmen = 1
			MineingSkill = 45
			WoodCuttingSkill = 45
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			CanBeSlaved = 1
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 10
			User = 0
			SneakingSkill = 45
			UsesPoison = 1
			PoisonSkill = 45
			SkinningSkill = 15
			BoneCraftingSkill = 35
			ButcherySkill = 35
			UnArmedSkill = 20
			FishingSkill = 20
			MetalCraftingSkill = 5
			WoodCraftingSkill = 5
			SmeltingSkill = 5
			StoneCraftingSkill = 25
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 65

			WingHP = 65

			RightEyeHP = 65

			RightLungHP = 65

			LeftLungHP = 65

			SpleenHP = 65

			TeethHP = 65

			LeftArmHP = 65

			RightArmHP = 65

			LeftLegHP = 65

			RightLegHP = 65

			HeadHP = 65

			LeftEarHP = 65

			RightEarHP = 65

			GutsHP = 65

			StomachHP = 65

			LeftKidneyHP = 65

			RightKidneyHP = 65

			LiverHP = 65

			BrainHP = 65

			HeartHP = 65

			ThroatHP = 65

			NoseHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			OrganMaxHP = 65

			New()
				var/M
				M = prob(40)
				Age = rand(5,10)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon_state = "Normal"
					usr.icon = 'Ratwomen.dmi'
					usr.CantLoseLimbs = 1
				WalkTo()
				usr.Strength = rand(2,4)
				usr.Agility = rand(15,16)
				usr.Defence = rand(2,3)
				usr.Intelligence = rand(0.25,0.5)
				Hunger()
				Bleeding()
				Heal()
				RandomWalk()
				Combats()

				Level()
				Dig()
				usr.DieAge = rand(45,55)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Svartalfar

			icon = 'Night Elf.dmi'
			icon_state = "Normal"
			density = 1
			AM = 1
			Unholy = 1
			weightmax = 200
			CanDetail = 1
			Svartalfar = 1
			HumanParts = 1
			MagicalAptitude = 1
			User = 0
			Humanoid = 1
			ImmunePoison = 1
			Carn = 1
			E = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			Intelligent = 1
			SpearSkill = 35
			MakesBoneCraft = 1
			HP = 405
			MAXHP = 405
			SwordSkill  = 35
			BloodContent = 300
			MaxBloodContent = 300
			AxeSkill  = 35
			MaceSkill  = 35
			HumanParts = 1
			UnArmedSkill  = 45
			BowSkill = 25
			ShieldSkill  = 35
			ArmourSkill  = 35
			ForgingSkill  = 35
			WingsOut = 1
			WoodCraftingSkill  = 35
			MetalCraftingSkill  = 35
			SkinningSkill  = 35
			SmeltingSkill  = 35
			ButcherySkill  = 35
			LeatherCraftingSkill  = 35
			PoisonSkill  = 35
			PotionSkill = 20
			BoneCraftingSkill  = 35
			StoneCraftingSkill  = 35
			SneakingSkill  = 35
			LockPickingSkill = 35
			JewlCraftingSkill = 35
			CookingSkill  = 35
			FishingSkill  = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 140

			WingHP = 140

			RightEyeHP = 140

			RightLungHP = 140

			LeftLungHP = 140

			SpleenHP = 140

			TeethHP = 140

			LeftArmHP = 140

			RightArmHP = 140

			LeftLegHP = 140

			RightLegHP = 140

			HeadHP = 140

			LeftEarHP = 140

			RightEarHP = 140

			GutsHP = 140

			StomachHP = 140

			LeftKidneyHP = 140

			RightKidneyHP = 140

			LiverHP = 140

			BrainHP = 140

			HeartHP = 140

			ThroatHP = 140

			NoseHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			New()

				Age = rand(10,20)

				WalkTo()
				usr.Strength = rand(7,9)
				usr.Agility = rand(14,20)
				usr.Defence = rand(15,18)
				usr.Intelligence = rand(4,6)
				Hunger()
				Bleeding()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(500,600)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Kobold

			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 85
			Kobold = 1
			Sneak = 0
			Kobo = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 25
			User = 0
			SneakingSkill = 25
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 15
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 15
			FishingSkill = 20
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.icon = 'FemaleKobold.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(4,8)
				usr.Agility = rand(9,13)
				usr.Defence = rand(2,6)
				usr.Intelligence = rand(0.1,0.2)
				Hunger()
				Bleeding()
				Heal()
				src.AutoCliffClimb()
				Level()
				Dig()
				usr.DieAge = rand(95,110)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Plantman

			icon = 'Plant monster.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			Plantman = 1
			MineingSkill = 10
			WoodCuttingSkill = 25
			Humanoid = 1
			BowSkill = 20
			BloodContent = 350
			MaxBloodContent = 350
			MakesBoneCraft = 0
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			HP = 200
			MAXHP = 200
			ImmuneToDevourer = 1
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 25
			User = 0
			Delay = 6
			SneakingSkill = 25
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 15
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 15
			FishingSkill = 20
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				var/M
				M = prob(50)
				Age = 1
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(25,30)
				usr.Agility = rand(25,30)
				usr.Defence = rand(25,30)
				Hunger()
				Bleeding()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(200,250)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Slither

			icon = 'Female Slither.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 145
			Kobold = 1
			Snakeperson = 1
			MineingSkill = 45
			WoodCuttingSkill = 45
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 10
			User = 0
			SneakingSkill = 45
			UsesPoison = 1
			PoisonSkill = 45
			HasGland = 1
			PoisonDMG = 10
			ImmunePoison = 1
			SkinningSkill = 15
			BoneCraftingSkill = 35
			ButcherySkill = 35
			UnArmedSkill = 45
			FishingSkill = 20
			MetalCraftingSkill = 5
			WoodCraftingSkill = 5
			SmeltingSkill = 5
			StoneCraftingSkill = 25
			WearingLegs = 1
			LeatherCraftingSkill = 20
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 0

			HasRightLeg = 0

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = null

			RightLeg = null

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = null

			RightLegHP = null

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = null

			OrganMaxHP = null

			New()
				var/M
				M = prob(50)
				Age = rand(20,40)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
					usr.HasLeftLeg = 1
					usr.HasRightLeg = 1
					usr.RightLegHP = 125
					usr.OrganMaxHP = 125
					usr.WearingLegs = 0
				if(M == 0)
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(15,18)
				usr.Agility = rand(15,18)
				usr.Defence = rand(2,6)
				Hunger()
				Bleeding()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(150,200)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Zombie
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Zombie"
			Humanoid = 1
			BowSkill = 0
			Infects = 1
			BloodContent = 250
			MaxBloodContent = 250
			MakesBoneCraft = 1
			Carn = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			HumanParts = 1
			SpearSkill = 0
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 0
			User = 0
			UnArmedSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 100

			WingHP = 100

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

			GutsHP = 100

			StomachHP = 100

			LeftKidneyHP = 100

			RightKidneyHP = 100

			LiverHP = 100

			BrainHP = 100

			HeartHP = 100

			ThroatHP = 100

			NoseHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			New()
				Age = 0
				WalkTo()
				usr.Strength = rand(5,10)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.Intelligence = rand(0.05,0.075)
				Bleeding()
				Heal()
				Level()
				Dig()
				usr.DieAge = 200
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		NecroZombie
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Zombie"
			Humanoid = 1
			BowSkill = 0
			Infects = 0
			BloodContent = 250
			MaxBloodContent = 250
			MakesBoneCraft = 1
			Carn = 1
			ButcherySkill = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			HumanParts = 1
			SpearSkill = 0
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 0
			User = 0
			UnArmedSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 100

			WingHP = 100

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

			GutsHP = 100

			StomachHP = 100

			LeftKidneyHP = 100

			RightKidneyHP = 100

			LiverHP = 100

			BrainHP = 100

			HeartHP = 100

			ThroatHP = 100

			NoseHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			New()
				Age = 0
				WalkTo()
				usr.Strength = rand(5,15)
				usr.Agility = rand(5,15)
				usr.Defence = rand(5,15)
				usr.Intelligence = rand(0.05,0.075)
				Bleeding()
				Heal()
				Level()
				Dig()
				usr.DieAge = 300
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		ParaZombie
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Parasite"
			Humanoid = 1
			BowSkill = 0
			Infects = 0
			BloodContent = 250
			MaxBloodContent = 250
			MakesBoneCraft = 1
			Carn = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			HumanParts = 1
			SpearSkill = 0
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 0
			User = 0
			UnArmedSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 100

			WingHP = 100

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

			GutsHP = 100

			StomachHP = 100

			LeftKidneyHP = 100

			RightKidneyHP = 100

			LiverHP = 100

			BrainHP = 100

			HeartHP = 100

			ThroatHP = 100

			NoseHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			OrganMaxHP = 100

			New()
				Age = 0
				WalkTo()
				usr.Strength = rand(5,15)
				usr.Agility = rand(5,15)
				usr.Defence = rand(5,15)
				Bleeding()
				Heal()
				Level()
				Dig()
				usr.DieAge = 300
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		KoboldEscort

			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Kobold = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0


			New()
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCKoboldName()
				Leave()
				usr.name = "{Escort} Kobold [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		HumanEscort

			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Human = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0

			New()
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCHumanName()
				Leave()
				usr.name = "{Escort} Human [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		DwarfEscort

			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Dwarf = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0

			New()
				usr.G = prob(33)
				usr.B = prob(33)
				usr.BB = prob(33)
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCHumanName()
				Leave()
				usr.name = "{Escort} Dwarf [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()
				..()
				if(G == 1)
					usr.overlays += 'Beards.dmi'
				if(B == 1)
					usr.overlays += 'BlackBeard.dmi'
				if(BB == 1)
					usr.overlays += 'BrownBeard.dmi'
				if(BB == 0)
					if(B == 0)
						if(G == 0)
							usr.overlays += 'Beards.dmi'
							usr.G = 1

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		GoblinEscort

			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0

			New()
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCGoblinName()
				Leave()
				usr.name = "{Escort} Goblin [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in range(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in range(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in range(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"

		Spider
			icon = 'SpiderWarriorYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungHunter = 1
			Humanoid = 1
			AM = 1
			Carn = 1
			WoodCraftingSkill = 25
			Intelligent = 1
			HP = 220
			MAXHP = 220
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			BloodContent = 320
			MaxBloodContent = 320
			WearingLegs = 1
			WearingHelmet = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingCape = 1
			HumanParts = 1
			WearingShield = 1
			UnArmedSkill = 1
			ArmourSkill = 20
			Gender = "Male"
			FishingSkill = 25
			Delay = 3
			User = 0
			ImmunePoison = 1
			WearingBack = 1
			PoisonSkill = 55
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			OrganMaxHP = 110

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(15,20)
				usr.Agility = rand(15,20)
				usr.Defence = rand(25,35)
				Hunger()
				Bleeding()
				AutoCliffClimb()
				Level()
				usr.DieAge = rand(130,150)
				STiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		HunterSpider
			icon = 'SpiderHunterYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungWarrior = 1
			Humanoid = 1
			AM = 1
			Carn = 1
			WoodCraftingSkill = 25
			FishingSkill = 10
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			ArmourSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			WearingBack = 1
			WearingLegs = 1
			WearingCape = 1
			WearingHelmet = 1
			Delay = 3
			HumanParts = 1
			UnArmedSkill = 1
			WearingShield = 1
			Gender = "Male"
			User = 0
			ImmunePoison = 1
			PoisonSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(3,6)
				usr.Agility = rand(8,11)
				usr.Defence = rand(4,7)
				Hunger()
				Bleeding()
				AutoCliffClimb()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		WorkerSpider
			icon = 'SpiderWorkerYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungWorker = 1
			Humanoid = 1
			AM = 1
			MineingSkill = 55
			UnArmedSkill = 1
			WoodCuttingSkill = 55
			Carn = 1
			WoodCraftingSkill = 55
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingCape = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			HumanParts = 1
			FishingSkill = 30
			WearingShield = 1
			WearingBack = 1
			Gender = "Female"
			Delay = 3
			User = 0
			ImmunePoison = 1
			ArmourSkill = 20
			PoisonSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(3,7)
				usr.Agility = rand(11,14)
				usr.Defence = rand(3,5)
				Hunger()
				Bleeding()
				AutoCliffClimb()
				Dig()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		FleshCrawler
			icon = 'Devourer.dmi'
			icon_state = "FleshCrawler"
			density = 1
			weightmax = 100
			Humanoid = 1
			AM = 1
			MineingSkill = 55
			WoodCuttingSkill = 55
			Carn = 1
			WoodCraftingSkill = 55
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 250
			CantLoseLimbs = 1
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingCape = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			HumanParts = 1
			WearingShield = 1
			WearingBack = 1
			Gender = "None"
			Delay = 3
			User = 0
			ImmunePoison = 1
			ArmourSkill = 20
			PoisonSkill = 50
			ButcherySkill = 10
			UnArmedSkill = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				Age = rand(20,60)
				WalkTo()
				Heal()
				usr.Strength = rand(10,15)
				usr.Agility = rand(10,15)
				usr.Defence = rand(15,25)
				Bleeding()
				Dig()
				Level()
				usr.DieAge = rand(900,1000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
				spawn(2000)
					src.Killer = "Rapid Decay"
					src.GoingToDie = 1
					src.Death()
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Bat
			icon = 'Bat.dmi'
			icon_state = "Normal"
			Race = "Bat"
			density = 1
			weightmax = 25
			Humanoid = 1
			AM = 1
			UsesPicks = 1
			Carn = 1
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Claws"
			Flying = 1
			AdventureMode = 1
			SneakingSkill = 60
			SkinningSkill = 10
			CantLoseLimbs = 1
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingCape = 1
			BloodContent = 150
			MaxBloodContent = 150
			WearingLegs = 1
			WearingHelmet = 1
			HumanParts = 1
			FishingSkill = 30
			WearingShield = 1
			WearingBack = 1
			Gender = "None"
			Delay = 3
			User = 0
			ArmourSkill = 20
			PoisonSkill = 50
			ButcherySkill = 10
			UnArmedSkill = 35
			ClawSkill = 15
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 35

			New()
				Age = rand(1,2)
				WalkTo()
				Heal()
				usr.Strength = rand(2,4)
				usr.Agility = rand(15,25)
				usr.Defence = rand(2,4)
				Bleeding()
				Dig()
				Level()
				usr.DieAge = rand(12,14)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		SandWarrior
			icon = 'SandSoldier.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Humanoid = 1
			AM = 1
			MineingSkill = 55
			WoodCuttingSkill = 55
			Carn = 1
			WoodCraftingSkill = 55
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			SkinningSkill = 10
			CantLoseLimbs = 1
			SandWorker = 1
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingCape = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			HumanParts = 1
			FishingSkill = 30
			WearingShield = 1
			WearingBack = 1
			Gender = "None"
			Delay = 3
			User = 0
			ImmunePoison = 1
			ArmourSkill = 20
			PoisonSkill = 50
			ButcherySkill = 10
			UnArmedSkill = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(10,15)
				usr.Agility = rand(10,15)
				usr.Defence = rand(15,25)
				Bleeding()
				Dig()
				Level()
				usr.DieAge = rand(900,1000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		SandHumanoid
			icon = 'Sand Humanoid.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Humanoid = 1
			AM = 1
			MineingSkill = 55
			WoodCuttingSkill = 55
			MetalCraftingSkill = 30
			SkinningSkill = 10
			SmeltingSkill = 30
			StoneCraftingSkill = 30
			Carn = 1
			WoodCraftingSkill = 55
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = 0
			SneakingSkill = 30
			SandWorker = 1
			BloodContent = 300
			MaxBloodContent = 300
			HumanParts = 1
			FishingSkill = 30
			Gender = "None"
			Delay = 3
			User = 0
			ImmunePoison = 1
			ArmourSkill = 20
			PoisonSkill = 50
			ButcherySkill = 10
			UnArmedSkill = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			OrganMaxHP = 85

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(10,15)
				usr.Agility = rand(10,15)
				usr.Defence = rand(15,25)
				usr.Intelligence = rand(0.25,0.5)
				Bleeding()
				Dig()
				Level()
				Hunger()
				usr.DieAge = rand(900,1000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Ant
			icon = 'Ant_Black_Worker.dmi'
			icon_state = "Normal"
			density = 1
			CantLoseLimbs = 1
			weightmax = 145
			Gender = null
			HP = 200
			MAXHP = 200
			WoodCraftingSkill = 75
			Humanoid = 1
			AM = 1
			MineingSkill = 55
			WoodCuttingSkill = 55
			Carn = 1
			HumanParts = 1
			BloodContent = 350
			MaxBloodContent = 350
			Intelligent = 1
			ArmourSkill = 25
			HoldingWeapon = "Sword"
			SneakingSkill = 65
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 3
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			WearingCape = 1
			ImmunePoison = 1
			WearingBack = 1
			WearingShield = 1
			PoisonSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 90

			WingHP = 90

			RightEyeHP = 90

			RightLungHP = 90

			LeftLungHP = 90

			SpleenHP = 90

			TeethHP = 90

			LeftArmHP = 90

			RightArmHP = 90

			LeftLegHP = 90

			RightLegHP = 90

			HeadHP = 90

			LeftEarHP = 90

			RightEarHP = 90

			GutsHP = 90

			StomachHP = 90

			LeftKidneyHP = 90

			RightKidneyHP = 90

			LiverHP = 90

			BrainHP = 90

			HeartHP = 90

			ThroatHP = 90

			NoseHP = 90

			OrganMaxHP = 120

			OrganMaxHP = 120

			OrganMaxHP = 120

			OrganMaxHP = 120


			New()
				Age = rand(20,30)

				WalkTo()
				Heal()
				usr.Strength = rand(10,20)
				usr.Agility = rand(15,20)
				usr.Defence = rand(35,45)
				Bleeding()
				Hunger()

				Level()
				usr.DieAge = rand(1000,2000)
				STiredness()
				Dig()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		SpiderQueen
			icon = 'SpiderQueenYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 145
			Spider = 1
			Gender = "Female"
			HP = 200
			MAXHP = 200
			WoodCraftingSkill = 75
			IsYoungQueen = 1
			Humanoid = 1
			AM = 1
			Queen = 1
			MineingSkill = 55
			WoodCuttingSkill = 55
			Carn = 1
			HumanParts = 1
			BloodContent = 350
			MaxBloodContent = 350
			Intelligent = 1
			ArmourSkill = 25
			HoldingWeapon = "Sword"
			SneakingSkill = 65
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 3
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			WearingCape = 1
			ImmunePoison = 1
			WearingBack = 1
			WearingShield = 1
			PoisonSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 90

			WingHP = 90

			RightEyeHP = 90

			RightLungHP = 90

			LeftLungHP = 90

			SpleenHP = 90

			TeethHP = 90

			LeftArmHP = 90

			RightArmHP = 90

			LeftLegHP = 90

			RightLegHP = 90

			HeadHP = 90

			LeftEarHP = 90

			RightEarHP = 90

			GutsHP = 90

			StomachHP = 90

			LeftKidneyHP = 90

			RightKidneyHP = 90

			LiverHP = 90

			BrainHP = 90

			HeartHP = 90

			ThroatHP = 90

			NoseHP = 90

			OrganMaxHP = 120

			OrganMaxHP = 120

			OrganMaxHP = 120

			OrganMaxHP = 120


			New()
				Age = rand(20,30)

				WalkTo()
				Heal()
				usr.Strength = rand(10,20)
				usr.Agility = rand(15,20)
				usr.Defence = rand(35,45)
				Bleeding()
				Hunger()
				AutoCliffClimb()
				Level()
				usr.DieAge = rand(1000,2000)
				STiredness()
				Dig()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		Vampire
			icon = 'Vampire.dmi'
			density = 1
			AM = 1
			weightmax = 200
			CanDetail = 1
			Vampire = 1
			HumanParts = 1
			User = 0
			Humanoid = 1
			ImmunePoison = 1
			Carn = 1
			E = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			Intelligent = 1
			SpearSkill = 35
			MakesBoneCraft = 1
			HP = 405
			MAXHP = 405
			SwordSkill  = 35
			BloodContent = 300
			MaxBloodContent = 300
			AxeSkill  = 35
			MaceSkill  = 35
			HumanParts = 1
			UnArmedSkill  = 45
			BowSkill = 25
			ShieldSkill  = 35
			ArmourSkill  = 35
			ForgingSkill  = 35
			WingsOut = 1
			WoodCraftingSkill  = 35
			MetalCraftingSkill  = 35
			SkinningSkill  = 35
			SmeltingSkill  = 35
			ButcherySkill  = 35
			LeatherCraftingSkill  = 35
			PoisonSkill  = 35
			BoneCraftingSkill  = 35
			StoneCraftingSkill  = 35
			SneakingSkill  = 35
			LockPickingSkill = 35
			JewlCraftingSkill = 35
			CookingSkill  = 35
			FishingSkill  = 35
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 140

			WingHP = 140

			RightEyeHP = 140

			RightLungHP = 140

			LeftLungHP = 140

			SpleenHP = 140

			TeethHP = 140

			LeftArmHP = 140

			RightArmHP = 140

			LeftLegHP = 140

			RightLegHP = 140

			HeadHP = 140

			LeftEarHP = 140

			RightEarHP = 140

			GutsHP = 140

			StomachHP = 140

			LeftKidneyHP = 140

			RightKidneyHP = 140

			LiverHP = 140

			BrainHP = 140

			HeartHP = 140

			ThroatHP = 140

			NoseHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140


			New()
				Age = rand(20,60)
				WalkTo()
				Bleeding()
				usr.Strength = rand(15,25)
				usr.Agility = rand(15,25)
				usr.Defence = rand(25,45)
				usr.Intelligence = rand(5,7)
				Hunger()
				Dig()
				Level()
				Heal()
				Bed()

				usr.DieAge = rand(4000,4250)
				Tiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		AngelOfDeath
			icon = 'Angel of Death.dmi'
			density = 1
			AM = 1
			weightmax = 400
			CanDetail = 1
			Race = "Angel of Death"
			HumanParts = 1
			User = 0
			Humanoid = 1
			Delay = 3
			ImmunePoison = 1
			ImmuneToTemperature = 1
			ImmuneToMagic = 1
			ImmuneToVampire = 1
			User = 2
			Carn = 1
			E = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			Intelligent = 1
			SpearSkill = 135
			MakesBoneCraft = 1
			HP = 405
			MAXHP = 405
			SwordSkill  = 135
			BloodContent = 325
			MagicalAptitude = 1
			MagicalConcentration = 50
			MagicalAnger = 25
			MagicalMind = 25
			MagicalWill = 25
			MaxMana = 250
			MaxBloodContent = 325
			AxeSkill  = 135
			MaceSkill  = 135
			HumanParts = 1
			UnArmedSkill  = 145
			BowSkill = 200
			ShieldSkill  = 135
			ArmourSkill  = 135
			ForgingSkill  = 135
			WingsOut = 0
			SneakingSkill = 150
			WoodCraftingSkill  = 135
			MetalCraftingSkill  = 135
			SkinningSkill  = 135
			SmeltingSkill  = 135
			ButcherySkill  = 135
			LeatherCraftingSkill  = 135
			PoisonSkill  = 135
			BoneCraftingSkill  = 135
			StoneCraftingSkill  = 135
			SneakingSkill  = 135
			LockPickingSkill = 135
			JewlCraftingSkill = 135
			CookingSkill  = 135
			FishingSkill  = 135
			DaggerSkill = 135

			HasWings = 1

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 240

			WingHP = 240

			RightEyeHP = 240

			RightLungHP = 240

			LeftLungHP = 240

			SpleenHP = 240

			TeethHP = 240

			LeftArmHP = 240

			RightArmHP = 240

			LeftLegHP = 240

			RightLegHP = 240

			HeadHP = 240

			LeftEarHP = 240

			RightEarHP = 240

			GutsHP = 240

			StomachHP = 240

			LeftKidneyHP = 240

			RightKidneyHP = 240

			LiverHP = 240

			BrainHP = 240

			HeartHP = 240

			ThroatHP = 240

			NoseHP = 240

			OrganMaxHP = 240


			New()
				Age = rand(20,30)
				WalkTo()
				Bleeding()
				usr.Strength = rand(25,35)
				usr.Agility = rand(25,35)
				usr.Defence = rand(35,55)
				usr.Intelligence = rand(25,40)
				Gender = "Female"
				Hunger()
				Dig()
				Level()
				Heal()
				Regen()
				Bed()

				usr.DieAge = rand(40000,42500)
				Tiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Avatar
			icon = null
			density = 0
			AM = 1
			weightmax = -50
			User = 0
			Carn = 1
			E = 1
			CantBeSummoned = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			Intelligent = 1
			WearingRightArm = 1
			WearingLeftArm = 1
			WearingFullPlateHelm = 1
			WearingHelmet = 1
			WearingChest = 1
			WearingLegs = 1
			IsMist = 1

			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			LeftEyeHP = 140

			WingHP = 140

			RightEyeHP = 140

			RightLungHP = 140

			LeftLungHP = 140

			SpleenHP = 140

			TeethHP = 140

			LeftArmHP = 140

			RightArmHP = 140

			LeftLegHP = 140

			RightLegHP = 140

			HeadHP = 140

			LeftEarHP = 140

			RightEarHP = 140

			GutsHP = 140

			StomachHP = 140

			LeftKidneyHP = 140

			RightKidneyHP = 140

			LiverHP = 140

			BrainHP = 140

			HeartHP = 140

			ThroatHP = 140

			NoseHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			OrganMaxHP = 140

			New()
				usr.DieAge = rand(70000,70000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I

		Gargoyle
			icon = 'Gargoyle.dmi'
			density = 1
			AM = 1
			weightmax = 160
			CanDetail = 1
			Gargoyle = 1
			HumanParts = 1
			User = 0
			IsWood = 0
			Humanoid = 1
			Running = 1
			Delay = 5

			Carn = 1
			E = 1
			Intelligent = 1
			ImmuneToMagic = 1
			ImmuneToTemperature = 1
			SpearSkill = 10
			HP = 400
			HasWings = 1
			MAXHP = 400
			SwordSkill  = 10
			Skinned = 1
			AxeSkill  = 10
			MaceSkill  = 10
			ImmunePoison = 1
			HumanParts = 1
			UnArmedSkill  = 50
			BowSkill = 10
			ShieldSkill  = 10
			WearingFullPlateHelm = 1
			ArmourSkill  = 10
			ForgingSkill  = 10
			WingsOut = 1
			WoodCraftingSkill  = 10
			MetalCraftingSkill  = 15
			SkinningSkill  = 10
			SmeltingSkill  = 15
			ButcherySkill  = 10
			LeatherCraftingSkill  = 10
			PoisonSkill  = 10
			BoneCraftingSkill  = 10
			StoneCraftingSkill  = 35
			SneakingSkill  = -10
			LockPickingSkill = 0
			JewlCraftingSkill = 35
			CookingSkill  = 0
			FishingSkill  = -10
			HasLeftEye = 1

			HasRightEye = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "None"

			LeftLung = "None"

			Spleen = "None"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "None"

			Stomach= "None"

			LeftKidney= "None"

			RightKidney= "None"

			Liver= "None"

			Brain= "None"

			Heart= "None"

			Throat= "None"

			Nose= "Good"

			LeftEyeHP = 155

			WingHP = 155

			RightEyeHP = 155

			TeethHP = 155

			LeftArmHP = 155

			RightArmHP = 155

			LeftLegHP = 155

			RightLegHP = 155

			HeadHP = 155

			LeftEarHP = 155

			RightEarHP = 155

			NoseHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			New()
				Age = rand(20,60)
				WalkTo()
				usr.Strength = rand(20,25)
				usr.Agility = rand(2,5)
				usr.Defence = rand(30,50)
				usr.Intelligence = rand(-5,-8)
				Dig()
				Level()
				Hunger()
				Tiredness()
				usr.DieAge = rand(2000,5000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		StoneGolem
			icon = 'StoneGolem.dmi'
			density = 1
			AM = 1
			weightmax = 160
			CanDetail = 1
			Guardstone = 1
			HumanParts = 1
			Dwarf = 1
			User = 0
			IsWood = 0
			Humanoid = 1
			Running = 1
			Delay = 6
			CantLoseLimbs = 1

			Carn = 1
			E = 1
			Intelligent = 1
			ImmuneToMagic = 1
			SpearSkill = 10
			HP = 400
			MAXHP = 400
			SwordSkill  = 10
			Skinned = 1
			AxeSkill  = 10
			MaceSkill  = 10
			ImmunePoison = 1
			HumanParts = 1
			UnArmedSkill  = 50
			BowSkill = 10
			ShieldSkill  = 10
			WearingFullPlateHelm = 1
			ArmourSkill  = 10
			ForgingSkill  = 10
			WoodCraftingSkill  = 10
			MetalCraftingSkill  = 15
			SkinningSkill  = 10
			SmeltingSkill  = 15
			ButcherySkill  = 10
			LeatherCraftingSkill  = 10
			PoisonSkill  = 10
			BoneCraftingSkill  = 10
			StoneCraftingSkill  = 35
			SneakingSkill  = -10
			LockPickingSkill = 0
			JewlCraftingSkill = 35
			CookingSkill  = 0
			FishingSkill  = -10
			HasLeftEye = 1

			HasRightEye = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "None"

			LeftLung = "None"

			Spleen = "None"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "None"

			Stomach= "None"

			LeftKidney= "None"

			RightKidney= "None"

			Liver= "None"

			Brain= "None"

			Heart= "None"

			Throat= "None"

			Nose= "Good"

			LeftEyeHP = 155

			WingHP = 155

			RightEyeHP = 155

			TeethHP = 155

			LeftArmHP = 155

			RightArmHP = 155

			LeftLegHP = 155

			RightLegHP = 155

			HeadHP = 155

			LeftEarHP = 155

			RightEarHP = 155

			NoseHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			OrganMaxHP = 155

			New()
				Age = rand(20,60)
				WalkTo()
				usr.Strength = rand(20,25)
				usr.Agility = rand(2,5)
				usr.Defence = rand(30,50)
				Dig()
				Level()
				usr.DieAge = rand(2000,5000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		DemonNPC
			icon = 'Demon.dmi'
			density = 1
			AM = 1
			Demon = 1
			IsWood = 0
			weightmax = 200
			CanDetail = 1
			HumanParts = 1
			User = 0
			Humanoid = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			CanBeSlaved = 1
			Carn = 1
			IsNPC = 1
			E = 1
			Intelligent = 1
			SpearSkill = 20
			HasWings = 1
			MakesBoneCraft = 1
			HP = 300
			MAXHP = 300
			SwordSkill  = 60
			BloodContent = 400
			MaxBloodContent = 400
			HoldingWeapon = "Sword"
			AxeSkill  = 20
			MaceSkill  = 20
			UnArmedSkill  = 30
			BowSkill = 15
			ShieldSkill  = 20
			name = "{NPC} Demon"
			ArmourSkill  = 35
			ForgingSkill  = 20
			WingsOut = 1
			WoodCraftingSkill  = 20
			MetalCraftingSkill  = 20
			SkinningSkill  = 20
			SmeltingSkill  = 20
			ButcherySkill  = 20
			LeatherCraftingSkill  = 20
			PoisonSkill  = 20
			BoneCraftingSkill  = 20
			StoneCraftingSkill  = 20
			SneakingSkill  = 125
			LockPickingSkill = 20
			JewlCraftingSkill = 20
			CookingSkill  = 20
			FishingSkill  = 25
			text = "<font color=red>&"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 250

			WingHP = 250

			RightEyeHP = 250

			RightLungHP = 250

			LeftLungHP = 250

			SpleenHP = 250

			TeethHP = 250

			LeftArmHP = 250

			RightArmHP = 250

			LeftLegHP = 250

			RightLegHP = 250

			HeadHP = 250

			LeftEarHP = 250

			RightEarHP = 250

			GutsHP = 250

			StomachHP = 250

			LeftKidneyHP = 250

			Owner = "{NPC Demons}"

			RightKidneyHP = 250

			LiverHP = 250

			BrainHP = 250

			HeartHP = 250

			ThroatHP = 250

			NoseHP = 250

			OrganMaxHP = 250

			OrganMaxHP = 250

			OrganMaxHP = 250

			OrganMaxHP = 250


			New()
				var/Weapon = rand(1,6)
				Age = rand(200,600)
				Gender = "None"
				usr.Strength = rand(50,60)
				usr.Intelligence = rand(4,8)
				usr.overlays += /obj/wing2/
				usr.Agility = rand(50,60)
				usr.Defence = rand(60,65)
				Dig()
				RandomWalk()
				ResetTarget()
				Heal()
				FlameAttack()
				Bleeding()
				usr.WeaponDamageMin = 50
				usr.WeaponDamageMax = 70
				usr.DieAge = rand(10000,12500)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
				if(Weapon == 1)
					var/DestructiveSword = prob(5)
					if(DestructiveSword == 1)
						var/obj/Items/Weapons/Swords/DestructionSword/S = new
						S.loc = usr
						S.suffix = "(Carrying)"
						S.WeaponDamageMin = 110
						S.WeaponDamageMax = 125
						S.name = "Sword of Destruction - Ungodly Quality"
						S.text = "<font color=purple>&"
						S.desc = "This amazing sword seems to be constructed from some sort of cold, living fire, it constantly attempts to escape your grasp whilst you hold it, it warms slightly with proximity to living targets..."
						usr.overlays += /obj/Items/Weapons/Swords/DestructionSword/
						usr.overlays += /obj/Items/Armours/Helmets/BoneCrown/
						usr.overlays += /obj/Items/Armours/Legs/SupernaturalBoneLeggings/
						usr.overlays += /obj/Items/Armours/ChestPlates/SupernaturalBoneChestPlate/
						usr.HoldingWeapon = "Sword"
						usr.name = "{NPC} Demon Lord"
						usr.Strength += 25
						usr.Agility += 25
						usr.Defence += 25
						usr.SneakingSkill = 200
						usr.WeaponDamageMax += 25
						usr.WearingChest = 1
						usr.WearingLegs = 1
						usr.WearingHelmet = 1
						usr.WearingLeftArm = 1
						usr.WearingRightArm = 1
						usr.SwordSkill = 150
					else
						var/obj/Items/Weapons/Swords/HellForgedSword/S = new
						S.loc = usr
						S.suffix = "(Carrying)"
						S.WeaponDamageMin = 77
						S.WeaponDamageMax = 88
						S.text = "<font color=purple>&"
						S.name = "Hell Forged Sword - Supernatural Quality"
						S.desc = "This strange blade is harder than steel, it is made from an unknown material, it irradiates a dangerous aura."
						usr.overlays += /obj/Items/Weapons/Swords/HellForgedSword/
						usr.HoldingWeapon = "Sword"
						usr.SwordSkill = 75
				if(Weapon == 2)
					var/obj/Items/Weapons/Maces/DemonMace/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 77
					S.WeaponDamageMax = 88
					S.text = "<font color=purple>&"
					S.name = "Hell Forged Mace - Supernatural Quality"
					S.desc = "This strange mace is harder than steel, it is made from an unknown material, it writhes and twists in your hand."
					usr.overlays += /obj/Items/Weapons/Maces/DemonMace/
					usr.HoldingWeapon = "Mace"
					usr.MaceSkill = 75
				if(Weapon == 3)
					var/obj/Items/Weapons/Spears/HellForgedSpear/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 77
					S.WeaponDamageMax = 88
					S.text = "<font color=purple>&"
					S.name = "Hell Forged Spear - Supernatural Quality"
					S.desc = "This strange spear is harder than steel, it is made from an unknown material, it probes the air with black, living tendrils."
					usr.overlays += /obj/Items/Weapons/Spears/HellForgedSpear/
					usr.HoldingWeapon = "Spear"
					usr.SpearSkill = 75
				if(Weapon == 4)
					var/obj/Items/Weapons/Axes/HellAxe/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 77
					S.WeaponDamageMax = 88
					S.text = "<font color=purple>&"
					S.name = "Hell Forged Axe - Supernatural Quality"
					S.desc = "This strange axe is harder than steel, it is made from an unknown material, it seems to drain the light from the air around with into some endless vortex."
					usr.overlays += /obj/Items/Weapons/Axes/HellAxe/
					usr.HoldingWeapon = "Axe"
					usr.AxeSkill = 75
				if(Weapon == 5)
					var/obj/Items/Weapons/Daggers/HellForgedDagger/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 60
					S.WeaponDamageMax = 70
					S.text = "<font color=purple>&"
					S.name = "Hell Forged Dagger - Supernatural Quality"
					S.desc = "This strange blade is harder than steel, it is made from an unknown material, it is deathly cold to the touch."
					usr.overlays += /obj/Items/Weapons/Daggers/HellForgedDagger/
					usr.HoldingWeapon = "Dagger"
					usr.DaggerSkill = 75
				if(Weapon == 6)
					var/obj/Items/Weapons/Bows/Hellbow/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 77
					S.WeaponDamageMax = 88
					S.text = "<font color=purple>&"
					S.name = "Hell Forged Bow - Supernatural Quality"
					S.desc = "This strange bow is harder than steel, it is made from an unknown material, it is extremely sharp and hot to the touch."
					usr.overlays += /obj/Items/Weapons/Bows/Hellbow/
					usr.HoldingWeapon = "Mace"
					usr.MaceSkill = 75

			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		DarkKnight
			icon = 'Skorn.dmi'
			density = 1
			weightmax = 500
			CanDetail = 1
			Human = 1
			HumanParts = 1
			Humanoid = 1
			Carn = 1
			E = 1

			Intelligent = 1
			SpearSkill = 80
			SwordSkill  = 80
			AxeSkill  = 80
			MaceSkill  = 80
			AxeSkill  = 80
			UnArmedSkill  = 80
			ShieldSkill  = 80
			ArmourSkill  = 80
			ForgingSkill  = 80
			WoodCraftingSkill  = 80
			MetalCraftingSkill  = 80
			SkinningSkill  = 80
			SmeltingSkill  = 80
			ButcherySkill  = 80
			LeatherCraftingSkill  = 80
			PoisonSkill  = 80
			BoneCraftingSkill  = 80
			StoneCraftingSkill  = 80
			SneakingSkill  = 80
			LockPickingSkill = 80
			JewlCraftingSkill = 80
			CookingSkill  = 80
			FishingSkill  = 80
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			LeftLegHP = 150

			RightLegHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			OrganMaxHP = 150

			OrganMaxHP = 150

			OrganMaxHP = 150

			OrganMaxHP = 150

			New()
				var/M
				M = prob(100)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(60,60)
				usr.Agility = rand(60,60)
				usr.Defence = rand(60,60)
				usr.MAXHP = rand(5000,10000)
				usr.HP = usr.MAXHP
				Level()
				usr.DieAge = rand(1000,12500)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		NPCGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			name = "{NPC} Goblin"
			density = 1
			weightmax = 100
			Goblin = 1
			Age = 18
			Humanoid = 1
			Carn = 1
			SpearSkill = 20

			Intelligent = 1
			DieAge = 100000000
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			NPC = 1
			UsesPoison = 1
			PoisonSkill = 10
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			Owner = "{NPC Goblin}"

			New()
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(12,14)
				usr.Agility = rand(12,15)
				usr.Defence = rand(6,7)
				usr.Intelligence = rand(0.25,0.5)
				usr.MAXHP = rand(75,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				WalkTo()
				ReturnHome()
				NPCAttack()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Wagon == 0)
						M.destination = src
		NPCKobold
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Kobold = 1

			HoldingWeapon = "Spear"
			Humanoid = 1
			Carn = 1
			SpearSkill = 20
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 10
			SkinningSkill = 10
			HumanParts = 1
			BoneCraftingSkill = 20
			ButcherySkill = 10
			CanBeSlaved = 1
			BloodContent = 200
			MaxBloodContent = 200
			UnArmedSkill = 10
			Owner = "{NPC Kobold}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"

			New()
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,7)
				usr.Defence = rand(5,7)
				usr.Intelligence = rand(0.25,0.5)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCKoboldName()
				usr.name = "{NPC} Kobold [usr.name]"
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		NPCZombie
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Infects = 1
			NPCZombieStat = 1

			Humanoid = 1
			Carn = 1
			SpearSkill = 20
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			UsesPoison = 1
			PoisonSkill = 10
			SkinningSkill = 10
			HumanParts = 1
			BoneCraftingSkill = 20
			ButcherySkill = 10
			CanBeSlaved = 1
			BloodContent = 200
			MaxBloodContent = 200
			UnArmedSkill = 10
			Owner = "{NPC Zombies}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"


			New()
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				var/obj/Bloods/Zombie/O = new
				usr.overlays += O
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,7)
				usr.Defence = rand(5,7)
				usr.Intelligence = rand(0.01,0.02)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(1000,2000)
				usr.name = "{NPC} Zombie"
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		FrogMan
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			FrogMan = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			Carn = 1
			Intelligent = 1
			CanBeSlaved = 1
			ButcherySkill = 10
			SneakingSkill = 20
			SpecialUnit = 1
			SkinningSkill = 10
			UsesPoison = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			ImmunePoison = 1
			UnArmedSkill = 10
			Owner = "{NPC FrogMen}"
			FishingSkill= 50
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"


			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.Intelligence = rand(0.025,0.05)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} FrogMan"
				WalkTo()
				Bleeding()
				FrogResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		FrogManChieftain
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			FrogMan = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			Carn = 1
			Intelligent = 1
			CanBeSlaved = 1
			SneakingSkill = 40
			SpecialUnit = 1
			UsesPoison = 1
			HumanParts = 1
			ButcherySkill = 10
			SkinningSkill = 10
			BloodContent = 200
			MaxBloodContent = 200
			ImmunePoison = 1
			UnArmedSkill = 10
			Owner = "{NPC FrogMen}"
			FishingSkill = 50
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"


			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
				usr.Strength = rand(10,17)
				usr.Agility = rand(10,20)
				usr.Defence = rand(10,20)
				usr.Intelligence = rand(0.25,0.5)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(120,150)
				usr.name = "{NPC} FrogManChieftain"
				WalkTo()
				Bleeding()
				FrogResetTarget()
				RandomWalk()
				usr.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
				usr.overlays += /obj/Items/Armours/Legs/BoneLeggings/
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		SkeletonLord
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			ImmunePoison = 1
			Fling = 1
			HoldingWeapon = "Sword"
			Carn = 1
			IsNPC = 1
			HP = 400
			Race = "Skeleton"
			SpecialUnit = 1
			Intelligent = 1
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 10
			Owner = "{NPC Undead}"

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			New()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = rand(10,20)
				usr.WeaponDamageMin = 25
				usr.WeaponDamageMax = 35
				usr.MAXHP = 75
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} SkeletonLord"
				WalkTo()
				ResetTarget()
				RanWalk()
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		SkeletonWarrior
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			Fling = 1
			Carn = 1
			IsNPC = 1
			SpecialUnit = 1
			Intelligent = 1
			Race = "Skeleton"
			ImmunePoison = 1
			HP = 300
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 30
			Owner = "{NPC Undead}"

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			New()
				usr.Strength = rand(10,15)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.WeaponDamageMin = 15
				usr.WeaponDamageMax = 25
				usr.MAXHP = 75
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} SkeletonWarrior"
				WalkTo()
				ResetTarget()
				RanWalk()
				Level()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star

		Skeleton
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			Fling = 1
			Carn = 1
			SpecialUnit = 1
			Intelligent = 1
			ButcherySkill = 1
			CanEat = 0
			Race = "PlayerSkeleton"
			ImmunePoison = 1
			HP = 500
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 35
			Owner = null

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			New()
				Age = rand(1,2)
				WalkTo()
				usr.Strength = rand(6,11)
				usr.Agility = rand(8,12)
				usr.Defence = rand(9,12)
				usr.Intelligence = rand(0.25,0.5)

				Dig()
				usr.DieAge = rand(500,900)
				Level()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star

		StrayGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

			Humanoid = 1
			Carn = 1
			CanBeSlaved = 1
			Intelligent = 1
			SneakingSkill = 20
			UsesPoison = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			SpearSkill = 10
			HoldingWeapon = "Spear"
			Owner = "{NPC Goblin}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0





			New()
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon = 'FemaleGoblin.dmi'
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.Intelligence = rand(0.025,0.05)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCGoblinName()
				WalkTo()
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		StrayHuman
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Human = 1

			Humanoid = 1
			Carn = 0
			CanBeSlaved = 1
			Intelligent = 1
			SneakingSkill = 20
			UsesPoison = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			SpearSkill = 10
			HoldingWeapon = "Sword"
			Owner = "{NPC Human}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0





			New()
				var/M
				M = prob(50)
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon = 'FemaleHuman.dmi'
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.Intelligence = rand(0.025,0.05)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCHumanName()
				WalkTo()
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		Manifestation
			icon = 'They.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

			Humanoid = 1
			ImmuneToTemperature = 1
			Carn = 1
			CanBeSlaved = 1
			Intelligent = 1
			SneakingSkill = 20
			UsesPoison = 1
			CantLoseLimbs = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			SwordSkill = 60
			HoldingWeapon = "Sword"
			Owner = null
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0


			New()
				M = prob(50)
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				usr.Strength = rand(25,30)
				usr.Agility = rand(25,30)
				usr.Defence = rand(25,30)
				usr.MAXHP = 300
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "Nether Manifestation"
				usr.Delay = 3
				WalkTo()
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star

