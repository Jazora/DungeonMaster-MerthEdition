area
	Square1
	Square2
	Square3
	Square4
	Square5
	Square6
	Square7
	Square8
	Square9
	Square10
	Square11
	Square12
	Underground
	Sky
	Hell

turf
	MouseDrag(src)
		var/turf/S = src
		if(isturf(src))
			if(usr.Function == "Pyrokinesis")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Tiredness >= 0 && M.Race != "Mind Worm")
						if(S.IsWood == 1)
							if(M in range(8,S))
								if(S.OnFire == 0)
									for(var/mob/Monsters/M2 in view(0,S))
										return
									S.Fire()
									if(M.Race != "Elder Brain")
										M.Tiredness -= 75
									if(M.invisibility >= 1)
										M.invisibility = 0
										view(M) << "[M] becomes visible!"
									view(M) << "[M] uses their powers of pyrokinesis to set [S] ablaze!"
									return
							else
								M.Owner << "[M] is too far away to use their pyrokinesis"
					else
						M.Owner << "[M] cannot use pyrokinesis right now."
			if(usr.Function == "Forcefield")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Tiredness >= 0 && M.Race != "Mind Worm")
						if(M in range(8,S))
							for(var/mob/Monsters/M2 in view(0,S))
								return
							if(M.Race != "Elder Brain")
								M.destination = null
								M.Tiredness -= 10
								M.Tiredness += M.Intelligence / 50
							S.ForceField()
							return
						else
							M.Owner << "[M] is too far away to use their forcefield"
					else
						M.Owner << "[M] cannot use forcefield right now."
			if(usr.Function == "Telekinesis")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Tiredness >= 0 && M.Race != "Mind Worm")
						if(M in range(8,S))
							M.destination = null
							if(M.Race != "Elder Brain")
								M.Tiredness -= 5
								M.Tiredness += M.Intelligence / 25
								M.StopWalk()
							if(M.invisibility >= 1)
								M.invisibility = 0
								view(M) << "[M] becomes visible!"
							S.SparkleGlow()
							for(var/obj/Items/I in view(1,S))
								if(S.density == 0)
									if(M.Tiredness >= 0)
										I.loc = S
										for(var/mob/Monsters/M2 in S)
											if(M2.User == 0)
												view(M2) << "[I] flies into [M2]!"
												M2.BloodContent -= I.weight / 4
												M.EXP += 1
												if(M.Race != "Elder Brain")
													M.Tiredness -= I.weight / 10
												M2.BloodLoss()
												return
										if(M.Race != "Elder Brain")
											M.Tiredness -= I.weight / 10
							for(var/mob/Monsters/M2 in view(1,S))
								if(S.density == 1 && S.opacity == 1)
									if(M2.Race != "Elder Brain")
										var/Stunned = prob(30)
										var/DropWeapon = prob(7)
										var/DropShield = prob(7)
										view(M2) << "[M2] slams into [S]!"
										M.EXP += 1
										M.Intelligence += 0.001
										M2.StopWalk()
										M2.BloodContent -= 15
										M2.BloodContent -= M.Intelligence / 10
										M2.BloodLoss()
										if(Stunned == 1)
											M2.StunnedWalk()
										if(DropWeapon == 1)
											for(var/obj/Items/Weapons/W in M2)
												if(W.suffix == "(Equiped)")
													view(M2) << "[M2] loses hold of [W]!"
													M2.HoldingWeapon = 0
													M2.WeaponDamageMin -= W.WeaponDamageMin
													M2.WeaponDamageMax -= W.WeaponDamageMax
													M2.weight -= W.weight
													M2.RemoveAllWeapons()
													W.suffix = null
													W.loc = M.loc
										if(DropShield == 1)
											for(var/obj/Items/Armours/Shields/W in M2)
												if(W.suffix == "(Equiped)")
													view(M2) << "[M2] loses hold of [W]!"
													M2.WearingShield = 0
													M2.Defence -= W.Defence
													M2.weight -= W.weight
													M2.RemoveAllShields()
													W.suffix = null
													W.loc = M.loc
										return
								if(S.density == 0)
									for(var/mob/Monsters/M3 in view(1,S))
										if(M3 != M2)
											var/Stunned = prob(15)
											var/DropWeapon = prob(5)
											var/DropShield = prob(4)
											view(M2) << "[M2] slams into [M3]!"
											M.EXP += 1
											M.Intelligence += 0.002
											M2.StopWalk()
											M3.StopWalk()
											M2.BloodContent -= 15
											M3.BloodContent -= 15
											M2.BloodLoss()
											M3.BloodLoss()
											M2.loc = S
											if(Stunned == 1)
												M2.StunnedWalk()
												M3.StunnedWalk()
											if(DropWeapon == 1)
												for(var/obj/Items/Weapons/W in M2)
													if(W.suffix == "(Equiped)")
														view(M2) << "[M2] loses hold of [W]!"
														M2.HoldingWeapon = 0
														M2.WeaponDamageMin -= W.WeaponDamageMin
														M2.WeaponDamageMax -= W.WeaponDamageMax
														M2.weight -= W.weight
														M2.RemoveAllWeapons()
														W.suffix = null
														W.loc = M.loc
											if(DropShield == 1)
												for(var/obj/Items/Armours/Shields/W in M2)
													if(W.suffix == "(Equiped)")
														view(M2) << "[M2] loses hold of [W]!"
														M2.WearingShield = 0
														M2.Defence -= W.Defence
														M2.weight -= W.weight
														M2.RemoveAllShields()
														W.suffix = null
														W.loc = M.loc
											return
									if(M2.Race != "Elder Brain")
										M2.loc = S
										M2.StopWalk()
									return
						else
							M.Owner << "[M] is too far away to use their telekinesis"
					else
						M.Owner << "[M] cannot use telekinesis right now."
			if(usr.Function == "PlaceAutodig")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(S.CanDigAt == 1 || S.Tree == 1 || S.icon_state == "CaveWall" || S.icon_state == "SilverOreVein" || S.icon_state == "GoldOreVein" || S.icon_state == "AdamantiumOreVein")
						for(var/obj/DigAt/DD2 in S)
							return
						var/obj/DigAt/DD = new(S)
						DD.Owner = M
			if(usr.Function == "RemoveAutodig")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					for(var/obj/C in S)
						if(istype(C,/obj/DigAt/) && C.Owner == M)
							del(C)
			if(usr.Function == "PlaceWoodenOrcBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodOrcBridge"
										M.weight -= W.weight
										del(W)
										break
							if(S.Content == "Chasm")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodOrcBridge"
										S.Content = null
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "PlaceStoneBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/ores/stone/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									S.density = 0
									S.CanFish = 0
									S.isbridge = 1
									S.name = null
									S.Detailed = 1
									S.Cant = 1
									if(S.CaveWater == 1)
										S.CaveWater = 0
									S.icon = 'Cave.dmi'
									S.icon_state = "Bridge"
									S.text = "<font color=#909090>×"
									M.weight -= W.weight
									del(W)
									break
							if(S.Content == "Chasm")
								if(S.isbridge == 0)
									S.density = 0
									S.CanFish = 0
									S.isbridge = 1
									S.name = null
									S.Detailed = 1
									S.Cant = 1
									if(S.CaveWater == 1)
										S.CaveWater = 0
									S.icon = 'Cave.dmi'
									S.icon_state = "Bridge"
									S.text = "<font color=#909090>×"
									S.Content = null
									M.weight -= W.weight
									del(W)
									break
							if(S.Content3 == "Lava")
								if(S.isbridge == 0)
									S.density = 0
									S.isbridge = 1
									S.Cant = 1
									S.name = null
									S.icon = 'Cave.dmi'
									S.icon_state = "LavaBridge"
									S.text = "<font color=#660000>×"
									M.weight -= W.weight
									del(W)
									break
			if(usr.Function == "PlaceSilkBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Content3 == "Liquid")
							if(S.isbridge == 0)
								if(M.WebContent >= 25)
									if(M.Spider == 1)
										if(S.isbridge == 0)
											S.density = 0
											S.CanFish = 0
											S.name = null
											S.isbridge = 1
											S.icon = 'Spiders.dmi'
											S.icon_state = "Silk Bride"
											S.text = "<font color=#D8D8D8>×"
											M.WebContent -= 25
						if(S.Content == "Chasm")
							if(S.isbridge == 0)
								if(M.WebContent >= 25)
									if(M.Spider == 1)
										if(S.isbridge == 0)
											S.density = 0
											S.CanFish = 0
											S.name = null
											S.isbridge = 1
											S.icon = 'Spiders.dmi'
											S.icon_state = "Silk Bride"
											S.text = "<font color=#D8D8D8>×"
											S.Content = null
											M.WebContent -= 25
			if(usr.Function == "PlaceBoneBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/Bones/Bones/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Goblin == 1 || M.Ratmen == 1 || M.Kobold == 1 || M.Vampire == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "BoneBridge"
										S.text = "<font color=#C8C8C8>×"
										M.weight -= W.weight
										del(W)
										break
							if(S.Content == "Chasm")
								if(S.isbridge == 0)
									if(M.Goblin == 1 || M.Ratmen == 1 || M.Kobold == 1 || M.Vampire == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "BoneBridge"
										S.text = "<font color=#C8C8C8>×"
										M.weight -= W.weight
										S.Content = null
										del(W)
										break
			if(usr.Function == "PlaceTribalBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.LizardMan == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.name = null
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "TribalBridge"
										S.text = "<font color=#999966>×"
										M.weight -= W.weight
										del(W)
										break
							if(S.Content == "Chasm")
								if(S.isbridge == 0)
									if(M.LizardMan == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.name = null
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "TribalBridge"
										S.text = "<font color=#999966>×"
										S.Content = null
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "PlaceWoodenBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodBridge"
										S.text = "<font color=#999966>×"
										M.weight -= W.weight
										del(W)
										break
							if(S.Content == "Chasm")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodBridge"
										S.text = "<font color=#999966>×"
										S.Content = null
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "DestroyFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(S.Detailed == 1)
								if(S.isbridge == 1)
									if(S.GoesTo)
										usr << "No floor to destroy"
										return
									else
										S.CanFish = 1
										S.density = 1
										S.Detailed = 0
										S.isbridge = 0
										S.name = null
										S.IsWood = 0
										if(S.Content == "Swamp")
											S.icon = 'Swamp.dmi'
											S.icon_state = "water"
											S.name = "Swamp"
											S.text = "<font color=#33CC99>S"
										if(S.icon_state == "LavaBridge")
											S.icon_state = "Lava"
											S.name = "Magma"
											S.CanFish = 0
											S.text = "<font color=#FF3333>L"
										if(S.Content == "Water")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
											S.text = "<font color=#0000CC>W"
										if(S.Content == "CaveWater")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
											S.CaveWater = 1
											S.text = "<font color=#0000CC>W"
										return
								if(S.isbridge == 0)
									S.icon_state = "DFloor"
									S.name = "Floor"
									S.density = 0
									S.name = null
									S.Detailed = 0
									S.IsWood = 0
									if(S.Content3 == "Peak")
										S.icon = 'Cave.dmi'
										S.icon_state = "Peak"
										S.name = "MountainPeak"
										S.density = 0
										S.Detailed = 0
										S.text = "<font color=#999966>×"
									if(S.Content == "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = "Sky"
										S.name = "Sky"
										S.density = 0
										S.Detailed = 0
										S.text = "<font color=#66FFFF>×"
									if(S.z == 1)
										var/obj/Support/Q = new
										Q.loc = locate(S.x,S.y,3)
										for(var/turf/T in view(0,Q))
											if(T.Supported == 1)
												T.Supported = 0
												M.Owner << "Not Supported"
												T.icon_state = "DFloor"
												T.name = "Floor"
												T.density = 0
												T.Detailed = 0
												if(T.Content3 == "Peak")
													T.icon = 'Cave.dmi'
													T.icon_state = "Peak"
													T.name = "MountainPeak"
													T.text = "<font color=#999966>×"
												if(T.Content == "Sky")
													T.icon = 'Cave.dmi'
													T.icon_state = "Sky"
													T.name = "Sky"
													T.text = "<font color=#66FFFF>×"
										del(Q)
									return
			if(usr.Function == "PlaceOrcFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.Race == "Orc")
												S.icon_state = "OrcFloor"
												S.name = "OrcFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 1
												S.name = null
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "OrcFloor"
													S.name = "OrcFloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
										break
			if(usr.Function == "PlaceStoneFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								for(var/obj/Items/ores/stone/St in M)
									if(S.icon_state != "Sky")
										if(S.density == 0)
											S.icon_state = "DetailedFloor"
											S.name = "DetailedFloor"
											S.density = 0
											S.Detailed = 1
											S.text = "<font color=#888888>×"
											if(M.SandWorker == 1)
												S.icon_state = "SandFloor"
												S.text = "<font color=#CCCC33>×"
											if(M.Goblin == 1)
												S.icon_state = "GoblinFloor"
												S.text = "<font color=#383838>×"
											if(M.Illithid == 1)
												S.icon_state = "IllithidFloor"
												S.text = "<font color=#9966CC>×"
											if(S.z == 1)
												var/obj/Support/Q = new
												Q.loc = locate(S.x,S.y,3)
												for(var/turf/T in view(0,Q))
													if(T.Supported == 0)
														T.Supported = 1
												del(Q)
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon_state = "DetailedFloor"
												S.name = "DetailedFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												if(M.SandWorker == 1)
													S.icon_state = "SandFloor"
													S.text = "<font color=#CCCC33>×"
												if(M.Goblin == 1)
													S.icon_state = "GoblinFloor"
													S.text = "<font color=#383838>×"
												if(M.Illithid == 1)
													S.icon_state = "IllithidFloor"
													S.text = "<font color=#9966CC>×"
									break
			if(usr.Function == "PlaceTribalFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.LizardMan == 1)
												S.icon_state = "Tribal"
												S.name = "TribalFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 1
												S.text = "<font color=#99CC00>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "Tribal"
													S.name = "TribalFloor"
													S.density = 0
													S.Detailed = 1
													S.IsWood = 1
													S.text = "<font color=#99CC00>×"
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										break
			if(usr.Function == "PlaceDevourerFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									if(M.EggContent >= 1)
										if(S.icon_state != "Sky")
											if(M.Race == "Devourer")
												S.icon_state = "DevourerFloor"
												S.name = "DevourerFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 0
												S.text = "<font color=red>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "DevourerFloor"
													S.name = "DevourerFloor"
													S.density = 0
													S.Detailed = 1
													S.IsWood = 0
													S.text = "<font color=red>×"
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										break
			if(usr.Function == "PlaceBoneFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/Bones/Bones/B in M)
										if(S.icon_state != "Sky")
											if(M.Goblin == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Kobold == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Ratmen == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Vampire == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Svartalfar == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.LizardMan == 1)
												S.icon_state = "BoneFloor"
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "BoneFloor"
													S.name = "bonefloor"
													S.density = 0
													S.name = null
													S.Detailed = 1
													S.text = "<font color=#D0D0D0>×"
										break
			if(usr.Function == "PlaceWoodenFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.Human == 1)
												S.icon_state = "WoodFloor"
												S.name = "woodfloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.IsWood = 1
												S.text = "<font color=#999933>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Dwarf == 1)
												S.icon_state = "WoodFloor"
												S.name = "woodfloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												S.text = "<font color=#999933>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Goblin == 1)
												S.icon_state = "WoodFloor"
												S.name = "woodfloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												S.text = "<font color=#999933>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Svartalfar == 1)
												S.icon_state = "WoodFloor"
												S.name = "woodfloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												S.text = "<font color=#999933>×"
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "WoodFloor"
													S.name = "woodfloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
													S.text = "<font color=#999933>×"
										break
			if(usr.Function == "PlaceBoneWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Bones/Bones/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Kobold == 1 || M.LizardMan == 1 || M.Ratmen == 1 || M.Goblin == 1 || M.Vampire == 1 || M.Svartalfar == 1)
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.name = null
										S.opacity = 1
										S.IsWall = 1
										S.text = "<font color=#D8D8D8>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(M.Kobold == 1 || M.LizardMan == 1 || M.Ratmen == 1 || M.Goblin == 1 || M.Vampire == 1 || M.Svartalfar == 1)
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon_state = "Bone Wall"
												S.name = "Bone Wall"
												S.HP += 1500
												S.name = null
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.BoneCraftingSkill += 0.3
												S.density = 1
												S.opacity = 1
												S.IsWall = 1
												S.text = "<font color=#D8D8D8>#"
												M.weight -= W.weight
												del(W)
												break
			if(usr.Function == "PlaceSilkWall")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									if(S.icon_state != "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = "SilkWall2"
										S.name = "SilkWall"
										S.density = 1
										S.HP = 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.IsWall = 1
										S.IsWood = 1
										M.WebContent -= 25
										S.CanDigAt = 1
										S.opacity = 1
										S.text = "<font color=#E8E8E8>#"
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon = 'Cave.dmi'
												S.icon_state = "SilkWall2"
												S.name = "SilkWall"
												S.density = 1
												S.HP = 1000
												S.IsWood = 1
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.IsWall = 1
												M.WebContent -= 25
												S.CanDigAt = 1
												S.opacity = 1
												S.text = "<font color=#E8E8E8>#"
			if(usr.Function == "PlaceDevourerWall")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(M.Race == "Devourer")
								if(M.EggContent >= 0.25)
									if(S.icon_state != "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = pick("DevourerWall1","DevourerWall2","DevourerWall3","DevourerWall4")
										S.name = "DevourerWall"
										S.density = 1
										S.HP = 1100
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.IsWall = 1
										S.IsWood = 0
										M.EggContent -= 0.25
										S.CanDigAt = 1
										S.opacity = 1
										S.text = "<font color=red>#"
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon = 'Cave.dmi'
												S.icon_state = pick("DevourerWall1","DevourerWall2","DevourerWall3","DevourerWall4")
												S.name = "DevourerWall"
												S.density = 1
												S.HP = 1100
												S.IsWood = 0
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.IsWall = 1
												M.EggContent -= 0.25
												S.CanDigAt = 1
												S.opacity = 1
												S.text = "<font color=red>#"

			if(usr.Function == "PlaceOrcWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Race == "Orc")
										S.icon_state = "OrcWall"
										S.name = "OrcWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.name = null
										M.weight -= S.weight
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#CC9933>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "OrcWall"
											S.name = "OrcWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.name = null
											S.CanDigAt = 1
											M.weight -= S.weight
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWood = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#CC9933>#"
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceTribalWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.LizardMan == 1)
										S.icon_state = "TribalWall"
										S.name = "Tribal Wall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.name = null
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										S.Detailed = 1
										S.text = "<font color=#99CC66>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "TribalWall"
											S.name = "Tribal Wall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											S.name = null
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.IsWood = 1
											S.opacity = 1
											S.Detailed = 1
											S.text = "<font color=#99CC66>#"
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceSecretWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									S.icon_state = "CaveWall"
									S.name = "Mountain"
									S.HP += 1000
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.CanDigAt = 1
									M.StoneCraftingSkill += 1
									S.density = 1
									S.IsWall = 0
									S.opacity = 1
									S.name = null
									S.Detailed = 1
									S.text = "<font color=#999933>#"
									M.weight -= W.weight
									if(S.z == 1)
										var/obj/Support/Q = new
										Q.loc = locate(S.x,S.y,3)
										for(var/turf/T in view(0,Q))
											if(T.Supported == 0)
												T.Supported = 1

										del(Q)
									del(W)
									break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "CaveWall"
											S.name = "Mountain"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 0
											S.opacity = 1
											S.Detailed = 1
											S.name = null
											S.text = "<font color=#999933>#"
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceGemWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/gems/W in M)
						if(M.Race == "Golem")
							M.destination = null
							if(M in range(1,S))
								if(S.density == 0)
									if(S.icon_state != "Sky")
										S.icon_state = "CaveWall"
										S.name = "Gem Wall"
										S.HP += 7000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 0
										S.opacity = 1
										S.name = null
										S.Detailed = 1
										S.text = "<font color=#999933>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon_state = "CaveWall"
												S.name = "Gem Wall"
												S.HP += 7000
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.StoneCraftingSkill += 1
												S.density = 1
												S.IsWall = 0
												S.opacity = 1
												S.Detailed = 1
												S.name = null
												S.text = "<font color=#999933>#"
												M.weight -= W.weight
												del(W)
												break
			if(usr.Function == "PlaceStoneWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1)
										S.icon_state = "DetailedWall"
										S.name = "StoneWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666666>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Dwarf == 1)
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666666>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Goblin == 1)
										S.icon_state = "GoblinWall"
										S.name = "ObsidianWall"
										S.HP += 4500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#404040>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Illithid == 1)
										S.icon_state = "IllithidWall"
										S.name = "CrystalWall"
										S.HP += 4500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#990099>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.SandWorker == 1)
										S.icon_state = "SandWall"
										S.name = "Sand Wall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#CCCC33>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Vampire == 1)
										S.icon_state = "DetailedWall"
										S.name = "StoneWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666666>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Svartalfar == 1)
										S.icon_state = "DetailedWall"
										S.name = "StoneWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666666>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											if(M.Goblin == 0 && M.SandWorker == 0 && M.Illithid == 0)
												S.icon_state = "DetailedWall"
												S.name = "Stone Wall"
												S.HP += 3000
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.StoneCraftingSkill += 1
												S.density = 1
												S.IsWall = 1
												S.name = null
												S.opacity = 1
												S.text = "<font color=#666666>#"
												M.weight -= W.weight
												del(W)
												break
											if(M.Goblin == 1)
												S.icon_state = "GoblinWall"
												S.name = "Obsidian Wall"
												S.HP += 4500
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.StoneCraftingSkill += 1
												S.density = 1
												S.IsWall = 1
												S.opacity = 1
												S.text = "<font color=#404040>#"
												M.weight -= W.weight
												del(W)
												break
											if(M.SandWorker == 1)
												S.icon_state = "SandWall"
												S.name = "Sand Wall"
												S.HP += 3000
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.StoneCraftingSkill += 1
												S.density = 1
												S.IsWall = 1
												S.opacity = 1
												S.text = "<font color=#CCCC33>#"
												M.weight -= W.weight
												del(W)
												break
											if(M.Illithid == 1)
												S.icon_state = "IllithidWall"
												S.name = "Crystal Wall"
												S.HP += 3000
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.CanDigAt = 1
												M.StoneCraftingSkill += 1
												S.density = 1
												S.IsWall = 1
												S.opacity = 1
												S.text = "<font color=#CCCC33>#"
												M.weight -= W.weight
												del(W)
												break
			if(usr.Function == "PlaceBoneSpikes")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Kobold == 1 || M.Goblin == 1 || M.Ratmen == 1)
						for(var/obj/Items/Bones/Bones/W in M)
							M.destination = null
							if(M in range(1,S))
								for(var/mob/Monsters/X in range(0,S))
									if(X.Owner != M.Owner)
										M.Owner << "You can't place traps under someone else's unit."
										return
								for(var/obj/Items/Traps/X in range(0,S))
									M.Owner << "You can't place traps under other traps."
									return
								var/obj/Items/Traps/BST/L = new
								L.loc = S
								L.Owner = usr
								L.Hole = 1
								L.name = "Bone Spike Trap"
								M.BoneCraftingSkill += 1
								M.weight -= W.weight
								del W
								return
			if(usr.Function == "PlaceStoneFall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/W in M)
						M.destination = null
						if(M in range(1,S))
							for(var/mob/Monsters/X in range(0,S))
								if(X.Owner != M.Owner)
									M.Owner << "You can't place traps under someone else's unit."
									return
							for(var/obj/Items/Traps/X in range(0,S))
								M.Owner << "You can't place traps under other traps."
								return
							var/obj/Items/Traps/StoneTrap/L = new
							L.loc = S
							L.Owner = usr
							L.Hole = 1
							L.name = "Stonefall Trap"
							M.StoneCraftingSkill += 1
							M.weight -= W.weight
							del W
							return
			if(usr.Function == "DigChannel")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Shafts/Spade/W in M)
						if(M.Dwarf == 1)
							if(M in range(1,S))
								if(S.density == 0)
									for(var/turf/T in view(1,src))
										if(T.isbridge == 0)
											if(T.icon_state == "Lava")
												S.name = "Magma"
												S.icon = 'Lava.dmi'
												S.icon_state = "Lava"
												S.density = 1
												S.Content3 = "Lava"
												S.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
												return
											if(T.icon_state == "water")
												S.icon = 'water.dmi'
												S.icon_state = "water"
												S.CanFish = 1
												S.Detailed = 1
												S.Content3 = "Liquid"
												S.OIcon = "water"
												S.density = 1
												S.text = "<font color=#0000FF>WWWWW<font color=#0000CC>WWWWW"
												return
			if(usr.Function == "PlaceRibcage")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Kobold == 1 || M.Goblin == 1 || M.Ratmen == 1)
						for(var/obj/Items/Bones/Bones/W in M)
							M.destination = null
							if(M in range(1,S))
								for(var/mob/Monsters/X in range(0,S))
									if(X.Owner != M.Owner)
										M.Owner << "You can't place traps under someone else's unit."
										return
								for(var/obj/Items/Traps/X in range(0,S))
									M.Owner << "You can't place traps under other traps."
									return
								var/obj/Items/Traps/RibTrap/L = new
								L.loc = S
								L.Owner = usr
								L.Hole = 1
								L.name = "Ribcage Trap"
								M.BoneCraftingSkill += 1
								M.weight -= W.weight
								del W
								return
			if(usr.Function == "PlaceElfWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Race == "Elf")
										S.icon_state = "Elf Wall"
										S.name = "Elf Wall"
										S.HP += 700
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666600>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break

								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "Elf Wall"
											S.name = "Elf Wall"
											S.HP += 700
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											S.IsWood = 1
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#666600>#"
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceWoodenWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1 || M.Goblin == 1 || M.Dwarf == 1 || M.Svartalfar == 1)
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666600>#"
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break

								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "WoodWall"
											S.name = "WoodWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											S.IsWood = 1
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#666600>#"
											M.weight -= W.weight
											del(W)
											break
									else
										usr << "Your race can not build this!"




obj
	HUD
		icon = 'HUD2.dmi'
		layer = MOB_LAYER+10
		name = ""
		New(client/C)
			C.screen += src
			..()

		BottomRight
			icon_state = "BR"
		BottomLeft
			icon_state = "BL"
		TopRight
			icon_state = "TR"
		TopLeft
			icon_state = "TL"
		TopMiddle
			icon_state = "TM"
		BottomMiddle
			icon_state = "BM"
		LeftMiddle
			icon_state = "LM"
		RightMiddle
			icon_state = "RM"
		Middle
			icon_state = "M"
		Middle2
			icon_state = "M2"
		Text
			icon = 'txt.dmi'
		ClickDetail
			name = "DetailedWall"
			icon_state = "DetailedWall"
			text = "S"
			DblClick()
				usr.Detail()
				usr.Up = 0
				usr.Close()

		ClickDestroy
			name = "Destroy"
			icon_state = "Dest"
			text = "D"
			DblClick()
				usr.Function = "DestroyFloor"
				usr << "Click and drag to destroy floor<br>"
				usr.Close()

		Dec
			name = "Decoration"
			icon_state = "Dec"
			text = "W"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/W in view(0,M))
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
									usr.Up = 0
									usr.Close()
									return
					usr.Up = 0
					usr.Close()
		B
			name = "SilkBridge"
			icon_state = "B"
			text = "B"
			DblClick()
				usr.Function = "PlaceSilkBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		Cacoon
			name = "Cacoon"
			icon_state = "Cacoon"
			text = "C"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.WebContent >= 50)
						var/obj/Items/Traps/Cages/Cacoon/C = new
						C.loc = M.loc
						C.desc = "This is a cacoon, it is used by spiders to in-trap victims."
						M.WebContent -= 50
						usr.Up = 0
						usr.Close()
						return
					usr.Up = 0
					usr.Close()
		Post
			name = "Post"
			icon_state = "Post"
			text = "P"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						if(M.Spider == 1)
							if(M.WebContent >= 75)
								var/obj/Items/Furniture/Posts/SilkTrainingPost/P = new
								P.loc = M.loc
								M.WebContent -= 75
								M.weight -= W.weight
								if(M.WoodCraftingSkill >= 90)
									P.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill >= 100)
									P.CraftRank = "Legendary Quality"
								if(M.WoodCraftingSkill <= 90)
									P.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill <= 75)
									P.CraftRank = "Masterful Quality"
								if(M.WoodCraftingSkill <= 60)
									P.CraftRank = "Grand Quality"
								if(M.WoodCraftingSkill <= 50)
									P.CraftRank = "Impressive Quality"
								if(M.WoodCraftingSkill <= 40)
									P.CraftRank = "Quality"
								if(M.WoodCraftingSkill <= 30)
									P.CraftRank = "Average Quality"
								if(M.WoodCraftingSkill <= 20)
									P.CraftRank = "Poor Quality"
								P.HP = 999999999999999999999
								M.WoodCraftingSkill += 2
								P.TrainCraft()
								del(W)
								usr.Up = 0
								usr.Close()
								break
								return
					usr.Up = 0
					usr.Close()
		SilkWall
			name = "SilkWall"
			icon_state = "SilkWall"
			text = "W"
			DblClick()
				usr.Function = "PlaceSilkWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		Forcefield
			name = "Forcefield"
			icon_state = "ForcefieldP"
			text = "F"
			DblClick()
				usr.Function = "Forcefield"
				usr << "Click and drag to place forcefield<br>"
				usr.Close()
		Pyrokinesis
			name = "Pyrokinesis"
			icon_state = "PyrokinesisP"
			text = "P"
			DblClick()
				usr.Function = "Pyrokinesis"
				usr << "Click and drag to set fires<br>"
				usr.Close()
		Telekinesis
			name = "Telekinesis"
			icon_state = "TelekinesisP"
			text = "T"
			DblClick()
				usr.Function = "Telekinesis"
				usr << "Click and drag to use telekinesis<br>"
				usr.Close()
		Mindcontrol
			name = "Mindcontrol"
			icon_state = "MindcontrolP"
			text = "M"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Race != "Elder Brain")
						for(var/mob/Monsters/F in range(8,M))
							if(F == M.MagicTarget && F.Owner != M.Owner && F.Mole == 0 && F.IsTree == 0 && F.Humanoid == 1 && F.Race != "Gremlin" && F.Deer == 0)
								if(F.Undead == 0 && F.Vampire == 0 && F.Infects == 0 && F.Illithid == 0 && F.Gargoyle == 0 && F.Demon == 0 && F.Race != "Bat")
									if(M.Tiredness >= 0)
										if(M.invisibility >= 1)
											M.invisibility = 0
											view(M) << "[M] becomes visible!"
										var/MindDominate = prob(M.Intelligence * 3 - F.Intelligence * 4)
										if(F.CanBeSlaved == 1 || F.IsNPC == 1)
											MindDominate = 1
										if(MindDominate == 1 && F.Gargoyle == 0)
											for(var/mob/O in world)
												if(F.Owner == O)
													O.UnitList -= F
													O.Selected.Remove(F)
													O.client.images -= F.Star
											F.IsNPC = 0
											F.CanBeSlaved = 0
											F.Owner = usr
											M.Tiredness -= 50
											usr.UnitList += F
											view(M) << "[M] uses their mental powers to completely dominate [F]'s mind!"
											if(M.Race == "Mind Worm")
												M.Owner << "[M] dies from mind controlling [F]"
												M.DeathType = "Mind Controlling [F]"
												M.Killer = "[F]"
												M.GoingToDie = 1
												M.Death()
											usr.Close()
											return
										else
											view(M) << "[M] attempts to use their mental powers to dominate [F] but fails."
											M.Tiredness -= 25
											usr.Close()
											return
									else
										M.Owner << "[M] is too tired to do this."
								else
									M.Owner << "You cannot use this power on that creature"
				usr.Close()
		ReadMind
			name = "ReadMind"
			icon_state = "ReadMindP"
			text = "R"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1)
						for(var/mob/Monsters/F in view(8,M))
							if(F == M.MagicTarget)
								if(F.Undead == 0)
									if(F.icon_state != "TowerCap")
										var/list/menu2 = new()
										menu2 += "Read Speech Records"
										menu2 += "Read Action Records"
										menu2 += "View Inventory"
										menu2 += "View Statistics"
										menu2 += "View Skills"
										menu2 += "Mind Map"
										menu2 += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
										if(Result != "Cancel")
											F.Owner << "[F] can feel something probing at it's mind... looking for information."
											M.Owner << "[M] probes [F]'s mind, searching for information."
											..()
										if(Result == "Mind Map")
											M.TemporaryUnitTarget = F
											M.Owner << "[M] has memorized the structure of [F]'s mind and will be able to find them from any reasonable distance in the future."
										if(Result == "Read Speech Records")
											for(var/mob/O in world)
												if(O == F.Owner)
													var/html_doc="<head><title>Unit Chat</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Chat Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.ChatLog]"
													usr<<browse(html_doc,"window=ChatLog")
										if(Result == "Read Action Records")
											for(var/mob/O in world)
												if(O == F.Owner)
													var/html_doc="<head><title>Unit Emote</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Emote Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.EmoteLog]"
													usr<<browse(html_doc,"window=EmoteLog")
										if(Result == "View Inventory")
											for(var/obj/O in F)
												usr << "--<font color = silver>[O]"
										if(Result == "View Statistics")
											usr << "--<font color = silver><font size=4>{---[F.name]---}"
											usr << "--<font color = silver>[F.Strength] - Strength"
											usr << "--<font color = silver>[F.Agility] - Agility"
											usr << "--<font color = silver>[F.Intelligence] - Intelligence"
											usr << "--<font color = silver>[F.Defence] - Defence"
											usr << "--<font color = silver>[F.Age] - Age"
											usr << "--<font color = silver>[F.weight] - Weight"
											usr << "--<font color = silver>[F.weightmax] - Max Weight"
											usr << "--<font color = silver>[F.Tiredness] - Tiredness"
											usr << "--<font color = silver>[F.Hunger] - Hunger"
										if(Result == "View Skills")
											usr << "--<font color = silver><font size=4>{---[F.name]---}"
											usr << "--<font color = silver>[F.UnArmedSkill] - Unarmed Skill"
											usr << "--<font color = silver>[F.ClawSkill] - Claws Skill"
											usr << "--<font color = silver>[F.SwordSkill] - Sword Skill"
											usr << "--<font color = silver>[F.AxeSkill] - Axe Skill"
											usr << "--<font color = silver>[F.MaceSkill] - Mace Skill"
											usr << "--<font color = silver>[F.SpearSkill] - Spear Skill"
											usr << "--<font color = silver>[F.BowSkill] - Bow Skill"
											usr << "--<font color = silver>[F.ShieldSkill] - Shield Skill"
											usr << "--<font color = silver>[F.ArmourSkill] - ArmourSkill"
											usr << "--<font color = silver>[F.MetalCraftingSkill] - Metal Crafting Skill"
											usr << "--<font color = silver>[F.WoodCraftingSkill] - Wood Crafting Skill"
											usr << "--<font color = silver>[F.BoneCraftingSkill] - Bone Crafting Skill"
											usr << "--<font color = silver>[F.LeatherCraftingSkill] - Leather Crafting Skill"
											usr << "--<font color = silver>[F.StoneCraftingSkill] - Stone Crafting Skill"
											usr << "--<font color = silver>[F.JewlCraftingSkill] - Gem Crafting Skill"
											usr << "--<font color = silver>[F.PotionSkill] - Potion Crafting Skill"
											usr << "--<font color = silver>[F.FishingSkill] - Fishing Skill"
											usr << "--<font color = silver>[F.MineingSkill] - Mining Skill"
									else
										M.Owner << "You read the mind of the fungi and it's brainwaves are oddly humanoid, almost as if it's pondering it's existance as it grows in the cavern."
								else
									M.Owner << "You cannot use this power on that creature"
				usr.Close()
		Scrying
			name = "Scrying"
			icon_state = "ScryingP"
			text = "S"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Race == "Illithid")
						var/list/menu2 = new()
						menu2 += "Locate Active Minds"
						menu2 += "Locate Memorized Mind"
						menu2 += "Locate Living Creatures"
						menu2 += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
						if(Result != "Cancel")
							if(Result == "Locate Active Minds")
								M.Owner << "[M] is locating all non-illithid creatures with psychic abilities"
								for(var/mob/Monsters/K in world)
									if(K.Illithid == 1 && K.Race != "Elder Brain" && K.Race != "Mind Worm" && K.Race != "Illithid")
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
							if(Result == "Locate Memorized Mind")
								for(var/mob/Monsters/K in world)
									if(K == M.TemporaryUnitTarget)
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
							if(Result == "Locate Living Creatures")
								for(var/mob/Monsters/K in range(40,M))
									if(K.Undead == 0 && K.Gargoyle == 0 && K.Race != "Illithid" && K.Race != "Mind Worm" && K.Race != "Elder Brain" && K.Mole == 0 && K.icon != 'Cave.dmi' && K.Deer == 0)
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
					else
						M.Owner << "Only full illithids can do this"
				usr.Close()
		CreateOrgan
			name = "CreateOrgan"
			icon_state = "DevourerOrgan"
			text = "O"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Devourer")
						if(M.EggContent >= 1)
							var/list/menu2 = new()
							menu2 += "Reinforced Flesh"
							menu2 += "Enhanced Muscle Structure"
							menu2 += "Efficient Nerve Centre"
							menu2 += "Expanded Skull"
							menu2 += "Symbiotic Cancerous Cells"
							menu2 += "Organic Climbing Hooks"
							menu2 += "Sharpened Finger Bones"
							menu2 += "Chromatophore Laced Skin"
							menu2 += "Internal Hydrogen Bladder"
							menu2 += "Toxic Marrow"
							menu2 += "Alternate Facial Construction"
							menu2 += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
							if(Result != "Cancel" && M.EggContent >= 2)
								var/obj/Items/Shafts/EngineeredOrgan/E = new()
								E.loc = M
								E.suffix = "(Carrying)"
								M.EggContent -= 2
								if(Result == "Reinforced Flesh")
									E.Content2 = "Toughness"
								if(Result == "Enhanced Muscle Structure")
									E.Content2 = "Strength"
								if(Result == "Efficient Nerve Centre")
									E.Content2 = "Agility"
								if(Result == "Expanded Skull")
									E.Content2 = "Intelligence"
								if(Result == "Symbiotic Cancerous Cells")
									E.Content2 = "Resistance"
								if(Result == "Organic Climbing Hooks")
									E.Content2 = "Climbing"
								if(Result == "Sharpened Finger Bones")
									E.Content2 = "Claws"
								if(Result == "Chromatophore Laced Skin")
									E.Content2 = "Chameleon"
								if(Result == "Internal Hydrogen Bladder")
									E.Content2 = "Explosive"
								if(Result == "Toxic Marrow")
									E.Content2 = "Acid"
								if(Result == "Alternate Facial Construction")
									E.Content2 = "Disguise"
								E.name = "Organ - [Result]"
							usr.Close()
						else
							usr << "Your devourer does not have enough bodies stored, you require 2 bodies for this."
					else
						usr << "One or more of the units you have selected is not a devourer"
						return
		ImproveDevourer
			name = "ImproveDevourer"
			icon_state = "Devourer"
			text = "I"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Devourer")
						if(M.EggContent >= 5)
							var/list/menu2 = new()
							menu2 += "Hardened Casing"
							if(M.Delay >= 4)
								menu2 += "Enhanced Motile Tendrils"
							if(M.HoldingWeapon == "Mace")
								menu2 += "Sharpened Tool Stalks"
							if(M.CliffClimber == 0)
								menu2 += "Adhesive Slime Glands"
							menu2 += "Concentration Enhancing Hormonal Gland"
							menu2 += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
							if(Result != "Cancel" && M.EggContent >= 5)
								if(Result == "Hardened Casing")
									M.EggContent -= 5
									M.Defence += 3
								if(Result == "Enhanced Motile Tendrils")
									if(M.Delay == 4)
										M.Delay = 3
										M.EggContent -= 5
								if(Result ==  "Sharpened Tool Stalks")
									if(M.HoldingWeapon == "Mace")
										M.HoldingWeapon = "Sword"
										M.WeaponDamageMin += 10
										M.WeaponDamageMax += 12
										M.EggContent -= 5
								if(Result == "Adhesive Slime Glands")
									if(M.CliffClimber == 0)
										M.CliffClimber = 1
										M.EggContent -= 5
										M.AutoCliffClimb()
								if(Result == "Concentration Enhancing Hormonal Gland")
									M.Intelligence += 1
									M.EggContent -= 5
							else
								usr << "You need 5 bodies stored to do this."
							usr.Close()
						else
							usr << "Your devourer does not have any bodies stored."
					else
						usr << "One or more of the units you have selected is not a devourer"
						return
		BuiltInBonecraft
			name = "Bonecraft"
			icon_state = "DevourerBonecraft"
			text = "B"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race != "Devourer")
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "BoneSpear"
						menu2 += "Full Bone Armor"
						menu2 += "BoneAxe"
						menu2 += "BoneDagger"
						menu2 += "BoneHelmet"
						menu2 += "BoneChestPlate"
						menu2 += "BoneLeggings"
						menu2 += "BoneLeftGauntlet"
						menu2 += "BoneRightGauntlet"
						menu2 += "Bone Door"
						menu2 += "BoneBuckler"
						menu2 += "Bone Training Post"
						menu2 += "Bone Throne"
						menu2 += "Bone Sword"
						menu2 += "Skull Mace"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Bone Throne")
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
						if (Result2 == "BoneDagger")
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
								M.BoneCraftingSkill += 0.25
								M.weight -= S.weight
								LB.loc = M.loc
								del(S)
								break
								return
						if (Result2 == "Skull Mace")
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
						if (Result2 == "BoneRightGauntlet")
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
						if (Result2 == "Full Bone Armor")
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
						if (Result2 == "BoneHelmet")
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
		CreateZombieCacoon
			name = "CreateZombieCacoon"
			icon_state = "DevourerZombie"
			text = "Z"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Devourer")
						if(M.EggContent >= 2)
							M.EggContent -= 2
							var/obj/Items/Shafts/PortableDevourerCacoon/C = new
							C.loc = M
							C.suffix = "(Carrying)"
							usr.Close()
						else
							usr << "Your devourer does not have enough bodies stored."
					else
						usr << "One or more of the units you have selected is not a devourer"
						return
		Warp
			name = "Warp"
			icon_state = "WarpP"
			text = "W"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Illithid == 1 && M.Race != "Mind Worm")
						var/list/menu2 = new()
						menu2 += "Self"
						menu2 += "Other"
						menu2 += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
						if(Result == "Cancel")
							..()
						if(Result == "Self")
							var/X = rand(-10,10)
							var/Y = rand(-10,10)
							var/minus = prob(50)
							if(minus == 1)
								X -= M.Intelligence
								Y -= M.Intelligence
							if(minus == 0)
								X += M.Intelligence
								Y += M.Intelligence
							view(M) << "[M] uses their powers of the mind to fold space and create a interdimensional portal!"
							M.x += X
							M.y += Y
							for(var/turf/T in range(0,M))
								if(T.density == 1)
									M.Owner << "[M] slams into [T]!"
									M.BloodContent -= 25
									M.BloodLoss()
						if(Result == "Other")
							for(var/mob/Monsters/K in view(8,M))
								if(K == M.MagicTarget)
									if(M.Level >= 30)
										if(K.Mutated == 0)
											if(K.Wagon == 0 && K.Gargoyle == 0)
												view(M) << "[M] begins to shape [K]'s very being with the powers of their mind..."
												var/list/menu3 = new()
												menu3 += "Create Mutation - Claws"
												menu3 += "Create Mutation - Thick Skin"
												menu3 += "Create Mutation - Slow Metabolism"
												menu3 += "Create Mutation - Weak Bones"
												menu3 += "Create Mutation - Strong Bones"
												menu3 += "Create Mutation - Unlock Mind"
												menu3 += "Create Mutation - Phaser"
												menu3 += "Create Mutation - Chameleon"
												menu3 += "Create Mutation - Shadowfiend"
												menu3 += "Create Mutation - Solar Powered"
												menu3 += "Create Mutation - Lycanthropy - Wolf"
												menu3 += "Create Mutation - Acidic Blood"
												menu3 += "Create Mutation - Explosive Organs"
												menu3 += "Cancel"
												var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu3
												if(Result2 == "Cancel")
													..()
												if(Result2 == "Create Mutation - Claws")
													if(K.HoldingWeapon == 0)
														K.HoldingWeapon = "Claws"
														K.WeaponDamageMin += 35
														K.WeaponDamageMax += 40
														K.ClawSkill += 100
														K.Mutated = 1
												if(Result2 == "Create Mutation - Thick Skin")
													K.Defence += 15
													K.Mutated = 1
												if(Result2 == "Create Mutation - Slow Metabolism")
													if(K.ColdBlooded == 0)
														K.ColdBlooded = 1
														K.DieAge += K.DieAge / 4
														K.Mutated = 1
												if(Result2 == "Create Mutation - Weak Bones")
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.Intelligence += 1
													K.Mutated = 1
												if(Result2 == "Create Mutation - Strong Bones")
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.Mutated = 1
												if(Result2 == "Create Mutation - Unlock Mind")
													if(K.Illithid == 0)
														K.Illithid = 1
														K.Intelligence += (K.Intelligence/10)
														K.Mutated = 1
												if(Result2 == "Create Mutation - Phaser")
													K.RandomBlink()
													K.Mutated = 1
												if(Result2 == "Create Mutation - Chameleon")
													K.icon -= rgb(0,0,0,175)
													K.Mutated = 1
													K.Sneak = 1
												if(Result2 == "Create Mutation - Shadowfiend")
													K.icon -= rgb(200,200,200)
													K.Shadowfiend = 1
													if(night == 1)
														K.Defence += 25
												if(Result2 == "Create Mutation - Solar Powered")
													K.SolarPowered()
													K.Mutated = 1
												if(Result2 == "Create Mutation - Lycanthropy - Wolf")
													K.Werewolf = 1
													K.Mutated = 1
													K.WerewolfTransformation()
												if(Result2 == "Create Mutation - Acidic Blood")
													K.Mutated = 1
													K.BloodAcidity = 25
												if(Result2 == "Create Mutation - Explosive Organs")
													K.Mutated = 1
													K.Content3 = "Explode"
												if(Result2 != "Cancel")
													view(M) << "[M] has changed [K] with [Result2]"
											else
												M.Owner << "This creature cannot be mutated."
										else
											M.Owner << "[K] is already mutated."
									else
										M.Owner << "[M] isn't level 30 yet"
				usr.Close()

		Lair
			name = "Lair"
			icon_state = "Silk"
			text = "L"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.CanBreed == 1)
						if(M.Spider == 0)
							usr.Up = 0
							usr.Close()
							return
						if(M.WebContent >= 200)
							M.WebContent -= 200
							M.LaysAdvancedEggs = 1
							for(var/turf/T in view(2,M))
								if(T.density == 0)
									T.icon = 'Cave.dmi'
									T.icon_state = "SilkWall"
									T.Detailed = 1
					usr.Up = 0
					usr.Close()
		Walls
			name = "Walls"
			icon_state = "Walls"
			text = "W"
			DblClick()
				usr.Walls()
		Floors
			name = "Floors"
			icon_state = "Floors"
			text = "F"
			DblClick()
				usr.Floors()
		MindPowersPage2
			icon_state = "ArrowRight"
			DblClick()
		Bridges
			name = "Bridges"
			icon_state = "Bridge"
			text = "B"
			DblClick()
				usr.Bridge()
		SpiderTrap
			name = "Pit"
			icon_state = "Trap"
			text = "P"
			DblClick()
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
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
						usr.Up = 0
						usr.Close()
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
							usr.Up = 0
							usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						if(M.WebContent >= 50)
							M.CreatePit()
							M.WebContent -= 50
							usr.Up = 0
							usr.Close()

		Traps
			name = "Traps"
			icon_state = "Trap"
			text = "T"
			DblClick()
				usr.Traps()
		ClickCacoonTrap
			name = "CacoonTrap"
			icon_state = "DevourerCacoonTrap"
			text = "C"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a cacoon trap, it will release monsters to attack anyone who walks near it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Race == "Devourer")
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							if(M.EggContent >= 2)
								M.CreateCacoonTrap()
								M.EggContent -= 2
								break
					usr.Up = 0
					usr.Close()
		ClickBSTTrap
			name = "Bonespikes"
			icon_state = "BST"
			text = "B"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a rib spike trap, it will hurt anyone who walks over it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 1 || M.Goblin == 1 || M.Ratmen == 1)
							for(var/obj/Items/Bones/Bones/W in M)
								usr.Function = "PlaceBoneSpikes"
								usr << "Click and drag to place bonespikes"
								usr.Up = 0
								usr.Close()
								return
							usr << "You need bones to place bonespikes."
					usr.Up = 0
					usr.Close()
		ClickRibTrap
			name = "Ribtrap"
			icon_state = "RibTrap"
			text = "R"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a rib trap, it will crush anyone who walks into it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 1 || M.Goblin == 1 || M.Ratmen == 1)
							for(var/obj/Items/Bones/Bones/W in M)
								usr.Function = "PlaceRibcage"
								usr << "Click and drag to place ribcages"
								usr.Up = 0
								usr.Close()
								return
							usr << "You need bones to place bonespikes."
					usr.Up = 0
					usr.Close()
		ClickStoneFall
			name = "Stonefall"
			icon_state = "StoneFall"
			text = "S"
			DblClick()
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
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/ores/stone/W in M)
							usr.Function = "PlaceStoneFall"
							usr << "Click and drag to place stonefalls"
							usr.Up = 0
							usr.Close()
							return
					usr.Up = 0
					usr.Close()
		ClickTraps
			name = "Pit"
			icon_state = "Trap"
			text = "P"
			DblClick()
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
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly, or even add some posion to it")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
					usr.Up = 0
					usr.Close()
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							usr.Up = 0
							usr.Close()
							return
						if(M.LizardMan == 0)
							for(var/obj/Items/ores/stone/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
						if(M.LizardMan == 1)
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		Stairs
			name = "Stairs"
			icon_state = "Stairs"
			text = "S"
			DblClick()
				usr.Stairs()
		SpiderStairs
			name = "Stairs"
			icon_state = "SpiderStairs"
			text = "S"
			DblClick()
				usr.Stairs()
		ClickStair2
			name = "Stairs"
			icon_state = "BambooStairs"
			text = "S"
			DblClick()
				for(var/mob/Monsters/A in usr.Selected)
					var/list/menu13 = new()
					for(var/obj/Items/woods/wood/s in A)
						menu13 += "Down"
						menu13 += "Up"
					menu13 += "Cancel"
					var/Result13 = input("What Action Will You Choose?", "Choose", null) in menu13
					if (Result13 != "Cancel")
						..()
					if (Result13 == "Up")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/woods/wood/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Sky == 1)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs2"
													W.Detailed = 1
													W.Content3 = null
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,3)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												W.text = "<"
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,1)
															usr.loc = M.loc
															return
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Content3 = null
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,1)
														W2.text = ">"

												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 1)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs2"
													W.Detailed = 1
													W.Content3 = null
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,W.z-1)
												W.text = "<"
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,M.z+1)
															usr.loc = M.loc
															return
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Content3 = null
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z+1)
														W2.text = ">"

												M.weight -= S.weight
												del(S)
						for(var/turf/ST in range(0,M))
							if(ST.GoesTo == null)
								usr << "Building this requires one piece of wood."
								break
						usr.Close()
					if (Result13 == "Down")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/woods/wood/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Content3 == "Peak")
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs"
													W.Content3 = null
												W.GoesTo = locate(W.x,W.y,1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs2"
															W2.Detailed = 1
															W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Content3 = null
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,3)
												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 0)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs"
													W.Content3 = null
												W.GoesTo = locate(W.x,W.y,W.z+1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs2"
															W2.Detailed = 1
															W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Content3 = null
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
												M.weight -= S.weight
												del(S)
						for(var/turf/ST in range(0,M))
							if(ST.GoesTo == null)
								usr << "Building this requires one piece of wood."
								break
						usr.Close()
		ClickStair
			name = "Stairs"
			icon_state = "Stairs"
			text = "S"
			DblClick()
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
							if(M.z != 4 && M.z != 3)
								for(var/obj/Items/ores/stone/S in M)
									for(var/turf/W in view(0,M))
										if(W.density == 0)
											if(M.z == 1)
												if(W.GoesTo == null)
													if(M.Kobold == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Race == "Orc")
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Goblin == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "GoblinUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.LizardMan == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Spider == 1)
														W.overlays += /obj/SpiderUp/
														W.Detailed = 1
													if(M.LizardMan == 0)
														if(M.Kobold == 0)
															if(M.Race != "Orc")
																if(M.Spider == 0)
																	if(M.Goblin == 0)
																		W.icon = 'Cave.dmi'
																		W.icon_state = "Up"
																		W.Detailed = 1
																		W.isbridge = 1
													W.GoesTo = locate(W.x,W.y,3)
													W.Content3 = null
													for(var/mob/Monsters/Wagon/E in view(1,M))
														E.loc = W.GoesTo
													M.loc = W.GoesTo
													usr.loc = M.loc
													for(var/turf/grounds/W2 in view(0,M))
														if(W2.GoesTo == null)
															if(W2.Detailed == 1)
																M.Owner << "You cant make stairs through a solid floor!"
																W.GoesTo = null
																M.loc = locate(M.x,M.y,1)
																usr.loc = M.loc
																return
															if(M.Kobold == 1)
																W2.overlays += /obj/Hole/
															if(M.LizardMan == 1)
																W2.overlays += /obj/Hole/
															if(M.Spider == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "SpiderStairs"
															if(M.Goblin == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "GoblinStairs"
															if(M.LizardMan == 0)
																if(M.Kobold == 0)
																	if(M.Spider == 0)
																		if(M.Goblin == 0)
																			W2.icon = 'Cave.dmi'
																			W2.icon_state = "Stairs"
															W2.density = 0
															W2.CanDigAt = 0
															W2.opacity = 0
															W2.Detailed = 1
															W2.isbridge = 1
															W2.Content3 = null
															W2.Cant = 1
															W2.GoesTo = locate(W2.x,W2.y,1)

													M.weight -= S.weight
													del(S)
											if(M.z == 2)
												if(W.GoesTo == null)
													if(M.Kobold == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Goblin == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "GoblinUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Race == "Orc")
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.LizardMan == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "KoboldUp"
														W.Detailed = 1
														W.isbridge = 1
													if(M.Spider == 1)
														W.overlays += /obj/SpiderUp/
														W.Detailed = 1
														if(W.icon_state == "CaveWall")
															W.icon_state = "CaveFloor"
													if(M.LizardMan == 0)
														if(M.Kobold == 0)
															if(M.Race != "Orc")
																if(M.Spider == 0)
																	if(M.Goblin == 1)
																		W.icon = 'Cave.dmi'
																		W.icon_state = "Up"
																		W.Detailed = 1
																		W.isbridge = 1
													W.GoesTo = locate(W.x,W.y,1)
													W.Content3 = null
													for(var/mob/Monsters/Wagon/E in view(1,M))
														E.loc = W.GoesTo
													M.loc = W.GoesTo
													usr.loc = M.loc
													for(var/turf/grounds/W2 in view(0,M))
														if(W2.GoesTo == null)
															if(W2.Detailed == 1)
																M.Owner << "You cant make stairs through a solid floor!"
																W.GoesTo = null
																M.loc = locate(M.x,M.y,2)
																usr.loc = M.loc
																return
															if(M.Kobold == 1)
																W2.overlays += /obj/Hole/
															if(M.LizardMan == 1)
																W2.overlays += /obj/Hole/
															if(M.Spider == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "SpiderStairs"
															if(M.Goblin == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "GoblinStairs"
															if(M.LizardMan == 0)
																if(M.Kobold == 0)
																	if(M.Spider == 0)
																		if(M.Goblin == 0)
																			W2.icon = 'Cave.dmi'
																			W2.icon_state = "Stairs"
															W2.density = 0
															W2.CanDigAt = 0
															W2.opacity = 0
															W2.Content3 = null
															W2.Detailed = 1
															W2.isbridge = 1
															W2.Cant = 1
															W2.GoesTo = locate(W2.x,W2.y,2)

													M.weight -= S.weight
													del(S)
							else
								M.Owner << "You can't build up stairs here."
						for(var/turf/ST in range(0,M))
							if(ST.GoesTo == null)
								usr << "Building this requires one piece of stone."
								break
						usr.Close()
					if(Result13 == "Down")
						for(var/mob/Monsters/M in usr.Selected)
							if(M.z != 4 && M.z != 2)
								for(var/obj/Items/ores/stone/S in M)
									for(var/turf/W in view(0,M))
										if(W.density == 0)
											if(W.z == 3)
												if(W.GoesTo == null)
													if(M.Kobold == 1)
														W.overlays += /obj/Hole/
													if(M.LizardMan == 1)
														W.overlays += /obj/Hole/
													if(M.Spider == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "SpiderStairs"
													if(M.Goblin == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "GoblinStairs"
													if(M.Vampire == 1)
														if(night == 0)
														else
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
													if(M.Svartalfar == 1)
														if(night == 0)
														else
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
													if(M.LizardMan == 0)
														if(M.Kobold == 0)
															if(M.Vampire == 0)
																if(M.Spider == 0)
																	if(M.Goblin == 0)
																		W.icon = 'Cave.dmi'
																		W.icon_state = "Stairs"
													W.GoesTo = locate(W.x,W.y,1)
													W.Content3 = null
													for(var/mob/Monsters/Wagon/E in view(1,M))
														E.loc = W.GoesTo
													M.loc = W.GoesTo
													usr.loc = M.loc
													for(var/turf/grounds/W2 in view(0,M))
														if(W2.GoesTo == null)
															if(M.Kobold == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "KoboldUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.Goblin == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "GoblinUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.LizardMan == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "KoboldUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.Spider == 1)
																W2.overlays += /obj/SpiderUp/
															if(M.LizardMan == 0)
																if(M.Kobold == 0)
																	if(M.Spider == 0)
																		if(M.Goblin == 0)
																			W2.icon = 'Cave.dmi'
																			W2.icon_state = "Up"
																			W2.Detailed = 1
																			W2.isbridge = 1
															W2.density = 0
															W2.CanDigAt = 0
															W2.opacity = 0
															W2.Content3 = null
															W2.isbridge = 1
															W2.Detailed = 1
															W2.Cant = 1
															W2.GoesTo = locate(W2.x,W2.y,3)
													M.weight -= S.weight
													del(S)
											if(W.z == 1)
												if(W.GoesTo == null)
													if(M.Kobold == 1)
														W.overlays += /obj/Hole/
													if(M.LizardMan == 1)
														W.overlays += /obj/Hole/
													if(M.Vampire == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "Stairs"
													if(M.Svartalfar == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "Stairs"
													if(M.Spider == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "SpiderStairs"
													if(M.Goblin == 1)
														W.icon = 'Cave.dmi'
														W.icon_state = "GoblinStairs"
													if(M.LizardMan == 0)
														if(M.Kobold == 0)
															if(M.Vampire == 0)
																if(M.Spider == 0)
																	if(M.Goblin == 0)
																		W.icon = 'Cave.dmi'
																		W.icon_state = "Stairs"
													W.GoesTo = locate(W.x,W.y,2)
													W.Content3 = null
													for(var/mob/Monsters/Wagon/E in view(1,M))
														E.loc = W.GoesTo
													M.loc = W.GoesTo
													usr.loc = M.loc
													for(var/turf/grounds/W2 in view(0,M))
														if(W2.GoesTo == null)
															if(M.Kobold == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "KoboldUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.Goblin == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "GoblinUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.LizardMan == 1)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "KoboldUp"
																W2.Detailed = 1
																W2.isbridge = 1
															if(M.Spider == 1)
																W2.overlays += /obj/SpiderUp/
																if(W2.icon_state == "CaveWall")
																	W2.icon_state = "CaveFloor"
															if(M.LizardMan == 0)
																if(M.Kobold == 0)
																	if(M.Goblin == 0)
																		if(M.Spider == 0)
																			W2.icon = 'Cave.dmi'
																			W2.icon_state = "Up"
																			W2.Detailed = 1
																			W2.isbridge = 1
															W2.density = 0
															W2.CanDigAt = 0
															W2.opacity = 0
															W2.Content3 = null
															W2.isbridge = 1
															W2.Detailed = 1
															W2.Cant = 1
															W2.GoesTo = locate(W2.x,W2.y,1)
													M.weight -= S.weight
													del(S)
							else
								M.Owner << "You can't build down stairs here."
						for(var/turf/ST in range(0,M))
							if(ST.GoesTo == null)
								usr << "Building this requires one piece of stone."
								break
						usr.Close()
		Stations
			name = "Stations"
			icon_state = "Station"
			text = "C"
			DblClick()
				usr.Stations()
		ClickFarm
			name = "Farming"
			icon_state = "Farming"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Shafts/Spade/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.icon_state == "Grass")
								W.icon = 'Cave.dmi'
								W.icon_state = "FarmLand"
								W.name = "FarmLand"
								W.Detailed = 1
					for(var/obj/Items/Shafts/WoodenSpade/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.icon_state == "Grass")
								W.icon = 'Cave.dmi'
								W.icon_state = "FarmLand"
								W.name = "FarmLand"
								W.Detailed = 1
					usr.Close()
		Farming
			name = "Farming"
			icon_state = "Farming"
			DblClick()
				usr.FarmLand()
		ClickTribalBridge
			name = "Tribal Bridge"
			icon_state = "TribalBridge"
			DblClick()
				usr.Function = "PlaceTribalBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickBoneBridge
			name = "Bone Bridge"
			icon_state = "BoneBridge"
			DblClick()
				usr.Function = "PlaceBoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodBridge
			name = "Wooden Bridge"
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodOrcBridge
			name = "Orc Bridge"
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickStoneBridge
			name = "Stone Bridge"
			icon_state = "Bridge"
			DblClick()
				usr.Function = "PlaceStoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickSecretWall
			name = "Secret Wall"
			icon_state = "Secret"
			DblClick()
				usr.Function = "PlaceSecretWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickTribalWall
			name = "Tribal Wall"
			icon_state = "TribalWall"
			DblClick()
				usr.Function = "PlaceTribalWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickOrcWall
			name = "Orc Wall"
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceOrcWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickElfWall
			name = "Elf Wall"
			icon = 'Cave.dmi'
			icon_state = "Elf Wall"
			DblClick()
				usr.Function = "PlaceElfWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickArrowSlit
			icon = 'Cave.dmi'
			name = "Arrow Slit"
			icon_state = "ArrowSlit"
			DblClick()
				usr.Function = "PlaceArrowSlit"
				usr << "Click to place arrow slits<br>"
				usr.Close()
		ClickDevourerWall
			name = "DevourerWall"
			icon = 'Cave.dmi'
			icon_state = "DevourerWall2"
			DblClick()
				usr.Function = "PlaceDevourerWall"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickWoodWall
			name = "Wooden Wall"
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceWoodenWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickStoneWall
			name = "Stone Wall"
			icon_state = "StoneWalls"
			DblClick()
				usr.Function = "PlaceStoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickBoneWall
			name = "Bone Wall"
			icon_state = "BoneWall"
			DblClick()
				usr.Function = "PlaceBoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickOrcFloor
			name = "Orc Floor"
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceOrcFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickWoodFloor
			name = "Wooden Floor"
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceWoodenFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()

		ClickFire
			name = "Campfire"
			icon_state = "Fire"
			DblClick()
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a camp fire, it can be used to cook with, it will also provide heat during winter.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							var/mob/WorkShops/CampFires/Fire/F = new
							F.loc = M.loc
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickGem
			name = "Gem Station"
			icon_state = "Gem"
			DblClick()
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
						if(M.Kobold == 0)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/ores/stone/W in M)
								M.CreateGem()
								M.weight -= W.weight
								del(W)
								break
					usr.Close()
		ClickMelt
			name = "Melter Station"
			icon_state = "Melt"
			DblClick()
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a melter station, it can be used to destroy un-used items.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMelter()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickMas
			name = "Masonry Station"
			icon_state = "Mas"
			DblClick()
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

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMasonary()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickLet
			name = "Leather Station"
			icon_state = "Let"
			DblClick()
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

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateWorkShopLeather()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickKit
			name = "Kitchen"
			icon_state = "Kit"
			DblClick()
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
						if(M.Carn == 0)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/woods/wood/W in M)
								M.CreateKit()
								M.weight -= W.weight
								del(W)
								break
						else
							usr << "That race does not need to cook food!"
					usr.Close()
		ClickBone
			name = "Bonecrafting Station"
			icon_state = "Bone"
			DblClick()
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
							usr.Close()
							return
						if (Result7 == "Create")
							for(var/mob/Monsters/M in usr.Selected)
								for(var/mob/WorkShops/LW in view(1,M))

									return
								for(var/obj/Items/woods/wood/W in M)
									M.CreateBone()
									M.weight -= W.weight
									del(W)
									break
							usr.Close()
		ClickGlass
			name = "Glassmaking Station"
			icon_state = "Glass"
			DblClick()
				for(var/mob/Monsters/S in usr.Selected)
					var/list/menu3 = new()
					if(S.Goblin == 1)
						menu3 += "Create"
					if(S.Human == 1)
						menu3 += "Create"
					if(S.Svartalfar == 1)
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

								usr.Close()
								return
							for(var/obj/Items/ores/stone/W in M)
								M.CreateGlass()
								M.weight -= W.weight
								del(W)
								break
						usr.Close()
		ClickSmelt
			name = "Smelter Station"
			icon_state = "Smelt"
			DblClick()
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

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateSmelter()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickForge
			name = "Metalcrafting Station"
			icon_state = "Forge"
			DblClick()
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

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateForge()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickCarp
			name = "Carpentry Station"
			icon_state = "Carp"
			DblClick()
				var/list/menu4 = new()
				menu4 += "Create"
				menu4 += "Info"
				menu4 += "Cancel"
				var/Result4 = input("What Action Will You Choose?", "Choose", null) in menu4
				if (Result4 != "Cancel")
					..()
				if (Result4 == "Info")
					alert("This is a carpentry crafting station, it can be used to make lots of items from wood")
					return
				if (Result4 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateCarpentry()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickPotion
			name = "Potion Station"
			icon_state = "Potion"
			DblClick()
				var/list/menu33 = new()
				menu33 += "Create"
				menu33 += "Info"
				menu33 += "Cancel"
				var/Result33 = input("What Action Will You Choose?", "Choose", null) in menu33
				if (Result33 != "Cancel")
					..()
				if (Result33 == "Info")
					alert("This is a potion station, it can be used to make various potions.")
					return
				if (Result33 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePotion()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickPos
			name = "Poison Station"
			icon_state = "Pos"
			DblClick()
				var/list/menu8 = new()
				menu8 += "Create"
				menu8 += "Info"
				menu8 += "Cancel"
				var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
				if (Result8 != "Cancel")
					..()
				if (Result8 == "Info")
					alert("This is a posion extraction station, it can be used to extract posion from glands")
					return
				if (Result8 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.UsesPoison == 1)
							for(var/mob/WorkShops/LW in view(1,M))
								usr.Close()
								return
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePoison()
								M.weight -= W.weight
								del(W)
								break
					usr.Close()
		ClickStoneFloor
			name = "Stone Floor"
			icon_state = "StoneFloor"
			DblClick()
				usr.Function = "PlaceStoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickTribalFloor
			name = "Tribal Floor"
			icon_state = "Tribal"
			DblClick()
				usr.Function = "PlaceTribalFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickDevourerFloor
			name = "Devourer Floor"
			icon_state = "DevourerFloor"
			DblClick()
				usr.Function = "PlaceDevourerFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickBoneFloor
			name = "Bone Floor"
			icon_state = "BoneFloor"
			DblClick()
				usr.Function = "PlaceBoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickDigChannel
			name = "Dig Channel"
			icon_state = "Channel"
			DblClick()
				usr.Function = "DigChannel"
				usr << "Click and drag to dig channels for liquids<br>"
				usr.Close()





turf
	grounds


		Entered()
			if(usr)
				if(src.Content3 == "Liquid")
					usr.OnFire = 0
					usr.IsWood = 0
					usr.Fuel = 100
					usr.Safe()
				if(src.icon_state == "water")
					if(src.CaveWater == 0)
						if(src.Detailed == 0)
							if(usr.Vampire == 1 || usr.Svartalfar == 1)
								if(night == 0)
									if(usr.DayWalker == 0)
										if(usr.NotInLight == 0)
											if(usr.Svartalfar == 1)
												usr.Mana = -5
											if(usr.Vampire == 1)
												usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
												usr.HP -= 50
												usr.SunLight()
												if(usr)
													if(usr.HP <= 0)
														usr.Freeze = 1
														usr.Fire()
														spawn(2)
															usr.GoingToDie = 1
															usr.Killer = "The Sun"
															usr.DeathType = "Burned To Death"
															usr.Death()
														return
				if(src.icon_state == "Peak")
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.Svartalfar == 1)
										usr.Mana = -5
									if(usr.Vampire == 1)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
												usr.Fire()
												spawn(2)
													usr.GoingToDie = 1
													usr.Killer = "The Sun"
													usr.DeathType = "Burned To Death"
													usr.Death()
												return
				if(src.icon_state == "Sky")
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										if(usr.Svartalfar == 1)
											usr.Mana = -5
										if(usr.Vampire == 1)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													usr.Fire()
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
				if(src.icon_state == "Grass")
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										if(usr.Svartalfar == 1)
											usr.Mana = -5
										if(usr.Vampire == 1)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													usr.Fire()
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
				if(src.icon_state == "GoodGrass")
					if(usr.Race == "Dragon")
						usr.GoldPoints += 1
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Infects == 1 || usr.Undead == 1 || usr.Unholy == 1 || usr.Svartalfar == 1 || usr.Demon == 1)
							if(usr.DayWalker == 0)
								usr.Owner << "<b><font color=red> [usr] walks onto the blessed land and is burned badly!!"
								usr.HP -= 25
								if(usr.Vampire == 1)
									if(night == 0)
										usr.HP -= 50
								usr.SunLight()
								if(usr)
									if(usr.HP <= 0)
										usr.Freeze = 1
										spawn(2)
											usr.GoingToDie = 1
											usr.Killer = "Holy Energy"
											usr.DeathType = "Smited to Death"
											usr.Death()
										return
						if(usr.IsEvilGod == 1)
							for(var/turf/grounds/GG in range(25,usr))
								if(GG.icon_state != "GoodGrass")
									usr.loc = locate(GG.x,GG.y,GG.z)
									usr << "You can't view or affect Blessed Land"
									return
				if(src.icon_state == "DeadGrass")
					if(usr.Race == "Dragon")
						usr.DarkPoints += 1
					if(src.Detailed == 0)
						if(usr.Shielded == 0 && usr.User == 0 && usr.Undead == 0 && usr.Infects == 0 && usr.Vampire == 0 && usr.Svartalfar == 0 && usr.Demon == 0)
							if(usr.DayWalker == 0)
								usr.HP -= 1
								if(usr.Human == 1 && usr.Level >= 40)
									usr.Coldness -= 0.25
								else
									usr.Coldness -= 0.5
								if(usr)
									if(usr.HP <= 0)
										usr.Freeze = 1
										spawn(2)
											usr.GoingToDie = 1
											usr.Killer = "Unholy Energy"
											usr.DeathType = "Cursed To Death"
											usr.Death()
										return
						if(usr.IsGoodGod == 1)
							for(var/turf/grounds/GG in range(25,usr))
								if(GG.icon_state != "DeadGrass")
									usr.loc = locate(GG.x,GG.y,GG.z)
									usr << "You can't view or affect Corrupted Land"
									return
				if(src.icon_state == "NeutralTurf")
					if(usr.IsGoodGod == 1 || usr.IsEvilGod == 1)
						for(var/turf/grounds/GG in range(25,usr))
							if(GG.icon_state != "NeutralTurf")
								usr.loc = locate(GG.x,GG.y,GG.z)
								usr << "You can't view or affect Neutral Land"
								return
				if(src.icon_state == "Marsh")
					if(usr.Race == "Dragon")
						usr.PoisonPoints += 1
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0 && usr.ImmuneToTemperature == 0 && usr.Svartalfar == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 0.5
								if(usr.LizardMan == 1)
									usr.Coldness -= 0
								else
									if(usr.Human == 1 && usr.Level >= 40)
										usr.Coldness -= 0.25
									else
										usr.Coldness -= 0.3
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										if(usr.Svartalfar == 1)
											usr.Mana = -5
										if(usr.Vampire == 1)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													usr.Fire()
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
					if(usr.Coldness <= -100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "The heat damages [usr]"
								usr.HP -= 50
								if(usr.Demon == 1)
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										usr.GoingToDie = 1
										usr.Killer = "The Sun"
										usr.DeathType = "Heat Stroke"
										usr.Death()
									return
				if(src.icon_state == "HellFloor")
					if(usr.Race == "Dragon")
						if(usr.IceDrake == 0)
							usr.FirePoints += 1
					if(usr.Undead == 0)
						if(usr.Vampire == 0 && usr.ImmuneToTemperature == 0 && usr.Svartalfar == 0 && usr.Demon == 0 && usr.HalfDemon == 0 && usr.FireDrake == 0)
							if(usr.Kobold == 1)
								usr.Coldness -= 1.5
							if(usr.LizardMan == 1)
								usr.Coldness -= 0.6
							if(usr.Race == "Orc")
								usr.Coldness -= 1
							if(usr.LizardMan == 0)
								if(usr.Kobold == 0)
									if(usr.Race != "Orc")
										if(usr.Human == 1 && usr.Level >= 40)
											usr.Coldness -= 0.5
										else
											usr.Coldness -= 1
					if(usr.Coldness <= -100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "The heat damages [usr]"
								usr.HP -= 50
								if(usr.Demon == 1)
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										usr.GoingToDie = 1
										usr.Killer = "The Sun"
										usr.DeathType = "Heat Stroke"
										usr.Death()
									return
				if(src.icon_state == "Desert")
					if(usr.Race == "Dragon")
						usr.SandPoints += 1
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0 && usr.ImmuneToTemperature == 0 && usr.Svartalfar == 0 && usr.SandDrake == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 1
								if(usr.LizardMan == 1)
									usr.Coldness -= 0.3
								if(usr.Race == "Orc")
									usr.Coldness -= 0.8
								if(usr.LizardMan == 0)
									if(usr.Kobold == 0)
										if(usr.Race != "Orc")
											if(usr.Human == 1 && usr.Level >= 40)
												usr.Coldness -= 0.25
											else
												usr.Coldness -= 0.5
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										if(usr.Svartalfar == 1)
											usr.Mana = -5
										if(usr.Vampire == 1)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													usr.Fire()
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
					if(usr.Coldness <= -100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								if(night == 0)
									usr.destination = null
									usr.Owner << "The heat damages [usr]"
									usr.HP -= 50
									if(usr.Demon == 1)
										..()
									if(usr.HP <= 0)
										usr.Freeze = 1
										spawn(2)
											usr.GoingToDie = 1
											usr.Killer = "The Sun"
											usr.DeathType = "Heat Stroke"
											usr.Death()
										return

				if(src.icon_state == "Snow")
					if(usr.Race == "Dragon")
						if(usr.FireDrake == 0)
							usr.IcePoints += 1
					if(usr.OnFire == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0 && usr.ImmuneToTemperature == 0 && usr.Svartalfar == 0 && usr.IceDrake == 0)
								if(usr.WearingChest == 1 && night == 0)
									if(usr.Race != "Orc")
										if(usr.Human == 1 && usr.Level >= 40)
											usr.Coldness -= 0.05
										else
											usr.Coldness += 0.1
								if(usr.WearingChest == 0 && night == 0)
									if(usr.Kobold == 1)
										usr.Coldness += 0.1
									if(usr.LizardMan == 1)
										usr.Coldness += 0.8
									if(usr.Dwarf == 1)
										usr.Coldness += 0.1
									if(usr.Race == "Orc")
										usr.Coldness += 0
									if(usr.Wolf == 1)
										usr.Coldness += 0.1
									if(usr.NPC == 1)
										usr.Coldness += 0.1
									if(usr.Kobold == 0)
										if(usr.Dwarf == 0)
											if(usr.Race != "Orc")
												if(usr.Human == 1 && usr.Level >= 40)
													usr.Coldness -= 0.25
												else
													usr.Coldness += 0.5
								if(usr.WearingChest == 1 && night == 1)
									if(usr.Race != "Orc")
										if(usr.Human == 1 && usr.Level >= 40)
											usr.Coldness -= 0.1
										else
											usr.Coldness += 0.2
								if(usr.WearingChest == 0 && night == 1)
									if(usr.Kobold == 1)
										usr.Coldness += 0.2
									if(usr.LizardMan == 1)
										usr.Coldness += 1.5
									if(usr.Dwarf == 1)
										usr.Coldness += 0.2
									if(usr.Race == "Orc")
										usr.Coldness += 0.1
									if(usr.Wolf == 1)
										usr.Coldness += 0.2
									if(usr.NPC == 1)
										usr.Coldness += 0.2
									if(usr.Kobold == 0)
										if(usr.Dwarf == 0)
											if(usr.Race != "Orc")
												if(usr.Human == 1 && usr.Level >= 40)
													usr.Coldness -= 0.5
												else
													usr.Coldness += 1
					if(usr.Coldness >= 100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "[usr] starts to get frost bite!"
								usr.HP -=50
								if(usr.Demon == 1)
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										if(usr)
											usr.GoingToDie = 1
											usr.Killer = "The Cold"
											usr.DeathType = "Froze To Death"
											usr.Death()
									return
					if(src.Detailed == 0)
						if(usr.Vampire == 1 || usr.Svartalfar == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										if(usr.Svartalfar == 1)
											usr.Mana = -5
										if(usr.Vampire == 1)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													usr.Fire()
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
				if(src.icon_state == "Bridge")
					if(usr.Vampire == 1)
						if(usr.density == 1)
							return
				if(src.icon_state == "BoneFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "Tribal")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "WoodFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "DetailedFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "GoblinFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "SandFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "DFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.CanDigAt == 0)
					usr.Underground = 1
				if(src.icon_state == "CaveFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.CanDigAt == 0)
					usr.Underground = 1
				if(src.icon_state == "water")
					if(src.CaveWater == 0)
						if(src.IsCave == 1)
							usr.Underground = 0
							usr.SunSafe = 0
				if(src.icon_state == "Desert")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
				if(src.icon_state == "Snow")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
				if(src.icon_state == "Grass")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
						usr.Coldness -= 1
						if(usr.Coldness <= 0)
							usr.Coldness = 0
				if(src.icon_state == "Marsh")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
						usr.Coldness -= 1
						if(usr.Coldness <= 0)
							usr.Coldness = 0
				if(src.Cant == 1)
					..()
				if(src.GoesTo)
					var/G = 0
					var/mob/Monsters/Avatar/A = new
					A.loc = src.GoesTo
					for(var/obj/Items/Furniture/Doors/TrapDoor/T in range(0,A))
						if(T.icon_state == "ClosedTrapDoor")
							G = 1
					for(var/obj/Items/Furniture/Doors/TrapDoor/T in src)
						if(T.icon_state == "ClosedTrapDoor")
							G = 1
					if(G == 0)
						usr.loc = src.GoesTo
						for(var/mob/M in view(1,src))
							if(M.Using == usr)
								M.loc = usr.loc

						for(var/mob/Monsters/Wagon/M in view(1,src))
							M.loc = src.GoesTo
						for(var/mob/Monsters/M in view(1,src))
							if(M.Tame == 1)
								M.loc = src.GoesTo
						usr.destination = null
					del A




		desert
			name = "desert"
			icon = 'Cave.dmi'
			icon_state = "Desert"
			PermSnow = 1
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Desert"
			text = "<font color=#FFFF66>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner




			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)

		snow
			name = "snow"
			icon = 'Cave.dmi'
			icon_state = "Snow"
			PermSnow = 1
			Content3 = "CanClimb"
			OIcon = "Snow"
			Sky = 1
			text = "<font color=#F8F8F8>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)

							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner


			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)



		marsh
			name = "marsh"
			icon = 'Cave.dmi'
			icon_state = "Marsh"
			Sky = 1
			Content = "Marsh"
			Content3 = "CanClimb"
			OIcon = "Marsh"
			text = "<font color=#00CC66>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			New()
				var/P = rand(1,16)
				if(P == 1)
					src.icon_state = "Marsh"
				if(P == 2)
					src.icon_state = "Tropical1"
				if(P == 3)
					src.icon_state = "Tropical2"
				if(P == 4)
					src.icon_state = "Tropical3"
				if(P == 5)
					src.icon_state = "Marsh"
				if(P == 6)
					src.icon_state = "Tropical4"
				if(P == 7)
					src.icon_state = "Marsh"
				if(P == 8)
					src.icon_state = "Marsh"
				if(P == 9)
					src.icon_state = "Marsh"
				if(P == 10)
					src.icon_state = "Marsh"
				if(P == 11)
					src.icon_state = "Marsh"
				if(P == 12)
					src.icon_state = "Marsh"
				if(P == 13)
					src.icon_state = "Marsh"
				if(P == 14)
					src.icon_state = "Marsh"
				if(P == 15)
					src.icon_state = "Marsh"
				if(P == 16)
					src.icon_state = "Tropical5"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)
		grass
			name = "grass"
			icon = 'Cave.dmi'
			icon_state = "Grass"
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Grass"
			text = "<font color=#33CC33>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)

		deadgrass
			name = "dead grass"
			icon = 'Cave.dmi'
			icon_state = "DeadGrass"
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "DeadGrass"
			text = "<font color=#003333>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)
		goodgrass
			name = "flowery grass"
			icon = 'Cave.dmi'
			icon_state = "GoodGrass"
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "GoodGrass"
			text = "<font color=#66FF00>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)

		cavefloor2
			name = "cavefloor"
			icon = 'Cave.dmi'
			icon_state = "CaveFloor"
			OIcon = "CaveFloor"
			CanDigAt = 0
			Sky = 1
			text = "<font color=#999933>×"
			Entered()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 1
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
		neutralturf
			name = "neutralground"
			icon = 'Cave.dmi'
			icon_state = "NeutralTurf"
			OIcon = "NeutralTurf"
			CanDigAt = 0
			Sky = 1
			text = "<font color=#808080>×"
			Entered()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 1
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
		NPCWindows
			icon = 'Cave.dmi'
			icon_state = "NPCWindow"
			density = 1
			CanDigAt = 1
			HP = 400
		NPCWindows2
			icon = 'Cave.dmi'
			icon_state = "NPCWindow2"
			density = 1
			CanDigAt = 1
			HP = 400
		WoodWall
			name = "Wooden Wall"
			icon = 'Cave.dmi'
			icon_state = "WoodWall"
			density = 1
			IsWood = 1
			CanDigAt = 1
			IsWall = 1
			HP = 8000
			OIcon = "Grass"
			text = "<font color=#999900>#"
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)
		DetailedFloor
			name = "stone floor"
			icon = 'Cave.dmi'
			icon_state = "DetailedFloor"
			CanDigAt = 0
			text = "<font color=#808080>×"
		Stairs
			Down
				TombStairsDown
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(805,790,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsDown2
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(904,787,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsDown3
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(979,788,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				JailStairsDown
					icon = 'Cave.dmi'
					icon_state = "Stairs"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						for(var/mob/M in world)
							if(M == m.Owner)
								if(M.GM == 1)
									m.loc = locate(459,813,2)
									m.destination = null
									for(var/mob/D in view(1,src))
										if(m.Owner == D)
											D.loc = m.loc
				GoblinStairsDown
					icon = 'Cave.dmi'
					icon_state = "Stairs"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(832,221,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc

			Up
				TombStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(805,789,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsUp2
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(904,787,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsUp3
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(979,788,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				GoblinStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(832,221,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				JailStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						for(var/mob/M in world)
							if(M == m.Owner)
								if(M.GM == 1)
									m.loc = locate(459,813,1)
									m.destination = null
									for(var/mob/D in view(1,src))
										if(m.Owner == D)
											D.loc = m.loc
		cellarfloor
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			IsCave = 1
			Cant = 1
			OIcon = "CaveFloor"
			text = "<font color=#999933>#"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							M.DigTarget = null
							del(D)

							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M


			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)

		NoDig
			name = "Impenetrible Mountain"
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			HP = 1000000
			opacity = 1
			Cant = 0
			Sky = 1
			text = "<font color=#999933>#"
		hellfloor
			name = "hellfloor"
			icon = 'Cave.dmi'
			icon_state = "HellFloor"
			Cant = 1
			OIcon = "HellFloor"
			text = "<font color=#990033>×"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return

				return(1)
		hellcliff
			name = "HellCliff"
			icon = 'Cave.dmi'
			icon_state = "HellCliff"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			Cant = 1
			IsCave = 1
			OIcon = "CaveFloor"
			text = "<font color=#999933>#"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M

			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0

		cavefloor
			name = "Mountain"
			icon = 'OreVeins.dmi'
			icon_state = "CaveWall"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			Cant = 0
			Sky = 1
			IsCave = 1
			OIcon = "CaveFloor"
			text = "<font color=#999966>#"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M
			New()
				var/P = rand(1,300)
				if(P >= 285)
					src.icon_state = "SilverOreVein"
				if(P >= 295)
					src.icon_state = "GoldOreVein"
				if(P == 300)
					src.icon_state = "AdamantiumOreVein"
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0



		DetailedWall2
			name = "DetailedWall"
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			HP = 300000
			IsWall = 1
			opacity = 1
			text = "<font color=##888888>#"
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)

		Tomb
			icon = 'Tomb.bmp'
			density = 1
			opacity = 0
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)

		OrcWall
			name = "Orc Wall"
			icon = 'Cave.dmi'
			icon_state = "OrcWall"
			density = 1
			CanDigAt = 1
			IsWall = 1
			HP = 3000000
			OIcon = "Snow"
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)
		DetailedWall
			name = "DetailedWall"
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			IsWall = 1
			HP = 3000000
			opacity = 1
			text = "<font color=#888888>#"
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					if(m.density == 0)
						m.destination = null
					return
				return(1)
		WoodFloor
			name = "wood floor"
			icon = 'Cave.dmi'
			IsWood = 1
			icon_state = "WoodFloor"
			OIcon = "Grass"
			text = "<font color=#666633>w"
		Chasm
			name = "Chasm"
			icon = 'Cave.dmi'
			icon_state = "Chasm"
			Content = "Chasm"
			text = "<font color=#181818>×"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				else
					if(ismob(m))
						var/mob/A = m
						if(A.Flying == 1)
							return(1)
					if(m.density == 0)
						return(1)
					else if(src.Content == "Chasm")
						var/F = prob(33)
						if(F)
							m.Owner << "[m] falls down a large chasm!<br>"
							view() << "[m] falls down a large chasm!<br>"
							del(m)
						else
							m.Owner << "[m] almost falls down a chasm!<br>"
							view() << "[m] almost falls down a chasm!<br>"
						return
					else
						return(1)
		Sky
			name = "Sky"
			icon = 'Cave.dmi'
			icon_state = "Sky"
			Content3 = "Peak"
			Content = "Sky"
			OIcon = "Sky"
			text = "<font color=#33FFFF>×"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							return
					if(src.Detailed)
						return(1)
					if(ismob(m))
						var/mob/A = m
						if(A.density == 1 && A.Flying == 0)
							var/LL = prob(50)
							if(A.Spider == 1 || A.Kobold == 1 || A.CliffClimber == 1 || A.Illithid == 1 || A.Werewolf == 1)
								LL = 0
							if(LL == 1)
								if(A.HasLeftLeg == 1)
									A.LeftLegHP = 10
									A.LeftLeg  = "Mangled"
									A.BloodContent -= 25
									A.BloodLoss()
									view(A) << "<b><font color=red>[A] falls and mangles their left leg!<br>"
									if(A.RightLegHP <= 10)
										A.CanWalk = 0
							var/RL = prob(50)
							if(A.Spider == 1 || A.Kobold == 1 || A.CliffClimber == 1 || A.Illithid == 1 || A.Werewolf == 1)
								RL = 0
							if(RL == 1)
								if(A.HasRightLeg == 1)
									A.RightLegHP = 10
									A.RightLeg  = "Mangled"
									A.BloodContent -= 25
									A.BloodLoss()
									view(A) << "<b><font color=red>[A] falls and mangles their right leg!<br>"
									if(A.LeftLegHP <= 10)
										A.CanWalk = 0
							A.loc = locate(src.x,src.y,1)
							if(RL == 1)
								view(A) << "<b><font color=red>[A] falls and mangles their right leg!<br>"
							if(LL == 1)
								view(A) << "<b><font color=red>[A] falls and mangles their left leg!<br>"

						else
							return(1)
					if(isobj(m))
						var/obj/O = m
						if(O.density == 1)
							O.loc = locate(src.x,src.y,1)
						else
							return(1)
		MountainPeak
			icon = 'Cave.dmi'
			icon_state = "Peak"
			name = "peak"
			Content3 = "Peak"
			OIcon = "Peak"
			text = "<font color=#CC9900>×"
		OrcFloor
			icon = 'Cave.dmi'
			icon_state = "OrcFloor"
			OIcon = "Snow"
			text = "<font color=#CC9900>×"
		lavas
			Content3 = "Lava"
			lava
				name = "Lava"
				icon = 'Lava.dmi'
				icon_state = "Lava"
				density = 1
				Cant = 1
				Content = "Lava"
				text = "<font color=#FF0000>L"

		Trees
			density = 1
			layer = 4
			opacity = 1
			HP = 250
			Sky = 1
			name = "Tree"
			text = "<font color=#99FF00>T"

			Tree1
				icon = 'plants.dmi'
				icon_state = "tree 2x1"
				Tree = 1
				IsWood = 1
				OIcon = "Grass"
				text = "<font color=#99FF00>T"
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
					src.overlays += /obj/Trees/leaves3x2
					src.overlays += /obj/Trees/leaves2x2
					src.overlays += /obj/Trees/leaves1x2
					src.overlays += /obj/Trees/leaves1x1
					src.overlays += /obj/Trees/leaves2x1
					src.overlays += /obj/Trees/leaves3x1
					src.density = 1
					src.icon = 'plants.dmi'
					src.icon_state = "tree 2x1"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			GoodTree
				icon = 'plants.dmi'
				icon_state = "GoodTree"
				Tree = 1
				IsWood = 1
				OIcon = "GoodGrass"
				Content3 = "GoodTree"
				text = "<font color=#99FF00>T"
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
					src.overlays += /obj/Trees/leaves3x2
					src.overlays += /obj/Trees/leaves2x2
					src.overlays += /obj/Trees/leaves1x2
					src.overlays += /obj/Trees/leaves1x1
					src.overlays += /obj/Trees/leaves2x1
					src.overlays += /obj/Trees/leaves3x1
					src.density = 1
					src.icon = 'plants.dmi'
					src.icon_state = "GoodTree"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			TundraTree
				icon = 'plants.dmi'
				icon_state = "PermSnow"
				Tree = 1
				Content3 = "PermTree"
				OIcon = "Snow"
				IsWood = 1
				text = "<font color=#F8F8F8>T"
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			DeadTree
				icon = 'plants.dmi'
				icon_state = "DeadGrassTree"
				Tree = 1
				Content3 = "EvilTree"
				OIcon = "DeadGrass"
				IsWood = 1
				name = "Dead Tree"
				text = "<font color=#505050>T"
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Bamboo
				icon = 'Cave.dmi'
				icon_state = "Bamboo"
				Tree = 1
				Bamboo = 1
				name = "Bamboo"
				Content = "Marsh"
				IsWood = 1
				OIcon = "Marsh"
				text = "<font color=#99FF00>B"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Cactus
				icon = 'Cave.dmi'
				icon_state = "Cactus"
				Tree = 1
				Cactus = 1
				name = "Cactus"
				OIcon = "Desert"
				text = "<font color=#99FF00>C"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Tree2
				icon = 'Trees.dmi'
				icon_state = "1"
			Tree3
				icon = 'Trees.dmi'
				icon_state = "1"
		DesertWater
			Content3 = "Liquid"
			icon = 'water.dmi'
			icon_state = "water"
			density = 1
			CanFish = 1
			Detailed = 1
			OIcon = "water"
			text = "<font color=#0000CC>W"

		waters
			Content3 = "Liquid"
			swamp
				name = "Swamp"
				icon = 'Swamp.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				Detailed = 1
				Content = "Swamp"
				OIcon = "Swamp"
				text = "<font color=#00CC99>S"


			water
				name = "Water"
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				Detailed = 1
				Content = "Water"
				OIcon = "water"
				text = "<font color=#0000CC>W"

			underwater
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				CaveWater = 1
				Detailed = 1
				Content = "CaveWater"
				OIcon = "water"
				text = "<font color=#0000CC>W"


obj/proc/Delete()
	spawn(750)
	del(src)
obj
	Support

	night
		icon = 'Night.dmi'
		layer = 5
	Hole
		icon = 'Cave.dmi'
		icon_state = "Hole2"
	SpiderUp
		icon = 'Cave.dmi'
		icon_state = "SpiderUp"
	preg
		icon = 'Cave.dmi'
		icon_state = "preg"
	miss
		icon = 'fx.dmi'
		icon_state = "Miss"
		layer = 5
	dodge
		icon = 'fx.dmi'
		icon_state = "Dodge"
		layer = 5
	block
		icon = 'fx.dmi'
		icon_state = "Block"
		layer = 5
	netherray
		icon = 'fx.dmi'
		icon_state = "NetherRay"
		layer = 5
	frozen
		icon = 'ColoredEyes.dmi'
		icon_state = "BlueHaze"
		layer = 5
	ragequitcape
		icon = 'Robe.dmi'
		icon_state = "Ragequit"
		layer = 5
	supermariococape
		icon = 'Robe.dmi'
		icon_state = "Super Mario Co."
		layer = 5
	ragnarokcape
		icon = 'Robe.dmi'
		icon_state = "Ragnarok"
		layer = 5
	darklegioncape
		icon = 'Robe.dmi'
		icon_state = "Dark Legion"
		layer = 5
	communistscape
		icon = 'Robe.dmi'
		icon_state = "Communists"
		layer = 5
	legionoflostcape
		icon = 'Robe.dmi'
		icon_state = "Legion of Lost"
		layer = 5
	lordsoftimecape
		icon = 'Robe.dmi'
		icon_state = "Lords of Time"
		layer = 5
	conclaveofthefallensoulscape
		icon = 'Robe.dmi'
		icon_state = "Conclave of the Fallen Souls"
		layer = 5
	dragonlordsofdmcape
		icon = 'Robe.dmi'
		icon_state = "Dragonlords of DM"
		layer = 5
	skyknightscape
		icon = 'Robe.dmi'
		icon_state = "Sky Knights"
		layer = 5
	pandoracape
		icon = 'Robe.dmi'
		icon_state = "Allure of the Pandora"
		layer = 5
	thesagesclawscape
		icon = 'Robe.dmi'
		icon_state = "The Sage's Claws"
		layer = 5
	axisofterrorcape
		icon = 'Robe.dmi'
		icon_state = "Axis of Terror"
		layer = 5
	vipercape
		icon = 'Robe.dmi'
		icon_state = "Viper"
		layer = 5
	Tapestry
		icon = 'Tapestries.dmi'
		icon_state = null
		layer = 5
	ArrowSlit
		icon = 'Cave.dmi'
		icon_state = "ArrowSlit"
		layer = 5
	Lightning
		icon = 'FX.dmi'
		icon_state = "Lightning"
		layer = 5
	CliffChecker
		density = 0
		IsMist = 1
	shockwave
		icon = 'FX.dmi'
		icon_state = "Shockwave"
		layer = 5
		density = 0
		IsMist = 1
	IllithidTentacles
		icon = 'Book.dmi'
		icon_state = "Illithid Tentacles"
		layer = 6
	sparkle
		icon = 'Book.dmi'
		icon_state = "SparkleGlow"
		layer = 8
	darkshadow
		icon = 'Book.dmi'
		icon_state = "Darkshadow"
		layer = 8
	firestorm
		icon = 'Book.dmi'
		icon_state = "Firestorm"
		layer = 8
	forcefield
		icon = 'Book.dmi'
		icon_state = "Forcefield"
		layer = 8
	sleepbubble
		icon = 'dragons.dmi'
		icon_state = "Sleep"
		layer = 5
	wing1
		icon = 'Wings.dmi'
		layer = 5
	wing2
		icon = 'Wings2.dmi'
		layer = 5
	wing3
		icon = 'Wings3.dmi'
		layer = 5
	wing4
		icon = 'Wings4.dmi'
		layer = 5
	blueeye
		icon = 'ColoredEyes.dmi'
		icon_state = "Blue"
		layer = 5
	greeneye
		icon = 'ColoredEyes.dmi'
		icon_state = "Yellow"
		layer = 5
	yelloweye
		icon = 'ColoredEyes.dmi'
		icon_state = "Green"
		layer = 5
	redeye
		icon = 'ColoredEyes.dmi'
		icon_state = "Red"
		layer = 5
	wing3
		icon = 'Wings3.dmi'
		layer = 5
	SkornBase
	Portal
		layer = 5
		Content = 4
		icon = 'Cave.dmi'
		icon_state = "Portal"
	AstralPortal
		layer = 5
		Content = 4
		icon = 'Blood.dmi'
		icon_state = "AstralBurst"
		text = "<font color=blue>@<b><font color=cyan>@"
		DblClick()

			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.loc = src.GoesTo
	Spire
		layer = 5
		Content = 4
		icon = 'Book.dmi'
		icon_state = "Spire"
		DblClick()

			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.loc = src.GoesTo
	PowerupPillar
		layer = 5
		Content = 4
		Content2 = "PillarFaction"
		icon = 'Book.dmi'
		icon_state = "Pillar1"
		DblClick()
			var/mob/Monsters/Avatar/A = new()
			A.loc = src.loc
			A.z = 3
			var/mob/Monsters/Avatar/A2 = new()
			A2.loc = src.loc
			A2.z = 2
			for(var/mob/M in world)
				if(src.Content2 == M.Faction)
					for(var/mob/Monsters/X in M.UnitList)
						if(X in range(20,src))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
						if(X in range(20,A))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
						if(X in range(20,A2))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
			for(var/mob/Monsters/M in usr.Selected)
				if(src in range(1,M))
					world << "<b><font color=silver><font size=3>[src] has been captured by [usr.Faction] at [src.x],[src.y],[src.z]"
					src.Content2 = usr.Faction
					del A
					del A2
					return
			del A
			del A2
	Savepoint
		layer = 5
		Content = 4
		icon = 'Book.dmi'
		icon_state = "Savepoint"
		New()
			src.Runelist = list()
	PermPortal1
		name = "Portal"
		layer = 5
		Content = 4
		icon = 'Cave.dmi'
		icon_state = "Portal"
		New()
			Portal()
	PermPortal2
		name = "Portal"
		layer = 5
		Content = 1
		icon = 'Cave.dmi'
		icon_state = "Portal"
		New()
			Portal()
	Crown
		icon = 'Cave.dmi'
		icon_state = "Crown"
	Crypt
		icon = 'Cave.dmi'
		icon_state = "Tomb"
		density = 1
	Deadness
		icon = 'Cave.dmi'
		icon_state = "Deadness"
		name = "Human Corpse"

	Deadness2
		icon = 'Cave.dmi'
		icon_state = "Deadness2"
		name = "Human Corpse"
	WingsVampire
		icon = 'Wings.dmi'
		icon_state = "Wings"
	WSoverlays
		Forge
			icon = 'buildings.dmi'
			icon_state = "Forge"
			layer = 5
		Smelter
			icon = 'buildings.dmi'
			icon_state = "Smelter"
			layer = 5
		Carpentry
			icon = 'buildings.dmi'
			icon_state = "Carpenters"
			layer = 5
		Masonary
			icon = 'buildings.dmi'
			icon_state = "Masonry"
			layer = 5
		Poison
			icon = 'buildings.dmi'
			icon_state = "Poison"
			layer = 5
		Bone
			icon = 'buildings.dmi'
			icon_state = "Bonecraft"
			layer = 5
		Leather
			icon = 'buildings.dmi'
			icon_state = "Leather"
			layer = 5
		Kitchen
			icon = 'buildings.dmi'
			icon_state = "Kitchen"
			layer = 5
		Gem
			icon = 'buildings.dmi'
			icon_state = "Gem"
			layer = 5
	PermBloods
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			text = "<font color=red>~"

		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			text = "<font color=red>~"

			New()
				AcidSpray()

	Bloods

		DevourerRight
			icon = 'Devourer.dmi'
			icon_state = "Right"
		DevourerRightTop
			icon = 'Devourer.dmi'
			icon_state = "RightTop"
		DevourerLeftTop
			icon = 'Devourer.dmi'
			icon_state = "LeftTop"
		Zombie
			icon = 'Blood.dmi'
			icon_state = "Zombie"
			layer = 5
		BlackBlight
			icon = 'Blood.dmi'
			icon_state = "BlackBlight"
			layer = 5
		Infection
			icon = 'Blood.dmi'
			icon_state = "Infection"
			layer = 5
		PurpleGoo
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "PurpleGoo"
			text = "<font color=#FF00FF>~"
			New()
				AcidSpray()
				Delete()
		AcidGoo
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "AcidGoo"
			text = "<font color=lime>~"
			New()
				AcidSpray()
				Delete()
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood5
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "5"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()

	Attacks
		Spears
			MetalSpear
				icon = 'Spear.dmi'
				icon_state = "Attack"
	Items
		layer = 4

		Skins
			New()
				ItemDecay()
			IsSkin = 1
			Skin
				icon = 'Skins.dmi'
				icon_state = "FrogSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return


		Bridge
			icon = 'Cave.dmi'
			icon_state = "Bridge"
			weight = 0
			suffix = null
			layer = 4
		GemOverlays
			Ruby
				RubyChest
					icon = 'GemItems.dmi'
					icon_state = "RubyChest"

		Silks
			SpiderSilk
				icon = 'Spiders.dmi'
				icon_state = "Silk"
				weight = 10
				suffix = null
				desc = "This is spider silk, it is supprisingly strong and very rare."
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
		Armours
			Shields
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Equip"
								menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
										var/obj/A2 = src
										M.WearingShield = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0 && M.HoldingOffHandWeapon == 0)
									if(src in M)
										if(M.ShieldSkill >= src.Skill)
											if(M.CanUseLeftArm == 1)
												if(M.WearingShield == 0)
													if(src.Content2 == "SmallArmor")
														if(M.Gremlin == 1)
															var/obj/A = src
															M.WearingShield = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.overlays += src.type
															M.Defence += A.Defence
													if(M.Gremlin == 0)
														if(src.Content2 != "SmallArmor")
															var/obj/A = src
															M.WearingShield = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.overlays += src.type
															M.Defence += A.Defence
											else
												usr << "[M] has a crippled arm!"
										else
											usr << "Not enough skill to use!"
				MarineBuckler
					icon = 'Marine.dmi'
					icon_state = "Marine Buckler"
					weight = 30
					suffix = null
					layer = 4

				DemonLeatherShield
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherShield"
					Content2 = "Demon"
					weight = 30
					suffix = null
					layer = 4

				SilverBuckler
					icon = 'SilverItems.dmi'
					icon_state = "Silver Buckler"
					weight = 30
					Silver = 1
					suffix = null
					layer = 4

				GoldBuckler
					icon = 'GoldItems.dmi'
					icon_state = "Gold Buckler"
					weight = 30
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "Shield"

				GremlinBuckler
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Gremlin Buckler"
					weight = 15
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				MetalBuckler
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Buckler"
					weight = 30
					suffix = null
					layer = 4

				DragonlordsofDMBuckler
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Buckler"
					weight = 30
					suffix = null
					layer = 4

				PandoraBuckler
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraBuckler"
					weight = 30
					suffix = null
					layer = 4

				AdamantiumBuckler
					icon = 'MetalObjects.dmi'
					icon_state = "AdamantiumBuckler"
					weight = 30
					suffix = null
					layer = 4

				LizardShield
					icon = 'MetalObjects.dmi'
					icon_state = "LizShield"
					weight = 20
					suffix = null
					layer = 4

				ChitinBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Buckler"
					weight = 10
					suffix = null
					layer = 4

				BoneBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Bone Buckler"
					weight = 10
					suffix = null
					layer = 4

				WoodenBuckler
					icon = 'GoblinBuckler.dmi'
					icon_state = "poor"
					weight = 10
					suffix = null
					layer = 4

			Legs

				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Equip"
								menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										var/obj/A2 = src
										M.WearingLegs = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0)
									if(src in M)
										if(M.ArmourSkill >= src.Skill)
											if(M.WearingLegs == 0)
												if(M.CanWalk == 1)
													if(M.Gremlin == 0 && src.icon != 'Gremlin Equipment.dmi')
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += src.type
													if(M.Gremlin == 1 && src.icon == 'Gremlin Equipment.dmi')
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += src.type
										else
											usr << "Not enough skill to use!"
				LeatherLeggings
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeggings"
					weight = 5
					suffix = null
					layer = 4

				WoodenLeggings
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Leggings"
					weight = 5
					suffix = null
					layer = 4

				GremlinLeggings
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Leggings"
					weight = 5
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				DemonLeatherLeggings
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherLeggings"
					Content2 = "Demon"
					weight = 5
					suffix = null
					layer = 4

				SilverLeggings
					icon = 'SilverItems.dmi'
					icon_state = "Silver Leggings"
					weight = 30
					Silver = 1
					suffix = null
					layer = 4

				RubyMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalRubyLeggings"
					weight = 35
					suffix = null
					layer = 4

				RubySilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverRubyLeggings"
					weight = 35
					suffix = null
					layer = 4

				EmeraldMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4

				EmeraldSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4

				DiamondMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4

				DiamondSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4

				DiamondGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4

				EmeraldGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4

				RubyGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldRubyLeggings"
					weight = 35
					suffix = null
					layer = 4

				GoldLeggings
					icon = 'GoldItems.dmi'
					icon_state = "Gold Leggings"
					weight = 30
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "Leggings"

				DragonlordsofDMLeggings
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Leggings"
					weight = 30
					suffix = null
					layer = 4

				DarkLegionLeggings
					icon = 'Clan Armor.dmi'
					icon_state = "Dark Legion Leggings"
					weight = 30
					suffix = null
					layer = 4

				ViperLeggings
					icon = 'Clan Armor.dmi'
					icon_state = "Viper Leggings"
					weight = 30
					suffix = null
					layer = 4

				PandoraLeggings
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraLegs"
					weight = 30
					suffix = null
					layer = 4

				LegionOfLostLeggings
					icon = 'Clan Armor.dmi'
					icon_state = "LegionOfLostLegs"
					weight = 30
					suffix = null
					layer = 4

				MetalLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Leggings"
					weight = 30
					suffix = null
					layer = 4

				DragoonLeggings
					icon = 'TrimmedMetal.dmi'
					icon_state = "Gold Trimmed Leggings"
					weight = 30
					suffix = null
					layer = 4

				GladiatorMetalLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Bronze Leggings"
					weight = 30
					suffix = null
					layer = 4

				AdamantiumLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Leggings"
					weight = 0
					suffix = null
					layer = 4

				ChitinLeggings
					icon = 'BoneItems.dmi'
					icon_state = "ChitinLeggings"
					weight = 10
					suffix = null
					layer = 4

				MarineLeggings
					icon = 'Marine.dmi'
					icon_state = "Metal Leggings"
					weight = 10
					suffix = null
					name = "Marine Leggings"
					layer = 4
					desc = "This armour is unknown."
					New()
						Defence = rand(15,30)

				ScaleLeggings
					icon = 'Scale Armour.dmi'
					icon_state = "C-Legs"
					weight = 10
					suffix = null
					name = "Scale Leggings"
					layer = 4
					desc = "This armour was created by the strong and might fishmen, for hundreds of years this has been their original armour of use."
					New()
						Defence = rand(15,30)

				SkornLeggings
					icon = 'SkornArmour.dmi'
					icon_state = "SLegs"
					weight = 10
					suffix = null
					name = "Skorn Leggings - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of hundreds, its defence is godly, its craftmanship un-holy, it is made from an unknown material and was forged by demons."
					New()
						Defence = rand(20,30)

				BoneLeggings
					icon = 'BoneItems.dmi'
					icon_state = "BoneLeggings"
					weight = 10
					suffix = null
					layer = 4

				SupernaturalBoneLeggings
					icon = 'Superbone.dmi'
					icon_state = "leggings"
					weight = 10
					suffix = null
					layer = 4

			RightArms
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Equip"
								menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										var/obj/A2 = src
										M.WearingRightArm = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0)
									if(src in M)
										if(M.HasRightArm == 1)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingRightArm == 0)
													if(M.HasRightArm == 1)
														if(usr.Gremlin == 0 && src.icon != 'Gremlin Equipment.dmi')
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += src.type
														if(usr.Gremlin == 1 && src.icon == 'Gremlin Equipment.dmi')
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += src.type
											else
												usr << "Not enough skill to use!"

				GremlinRightGauntlet
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Right Gauntlet"
					weight = 7
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				GoldRightGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GRightArm"
					weight = 7
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "RightBrace"

				DragoonRightGauntlet
					icon = 'TrimmedMetal.dmi'
					icon_state = "Gold Trimmed Right Gauntlet"
					weight = 7
					suffix = null
					layer = 4

				ChitinRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CRightArm"
					weight = 5
					suffix = null
					layer = 4

				WoodenRightGauntlet
					icon = 'WoodItems.dmi'
					icon_state = "Wooden RightArm"
					weight = 5
					suffix = null
					layer = 4

				LeatherRightGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherRight"
					weight = 2
					suffix = null
					layer = 4

				DemonLeatherRightGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherRight"
					Content2 = "Demon"
					weight = 2
					suffix = null
					layer = 4

				BoneRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BRightArm"
					weight = 5
					suffix = null
					layer = 4

				SupernaturalBoneRightGauntlet
					icon = 'Superbone.dmi'
					icon_state = "rightarm"
					weight = 5
					suffix = null
					layer = 4

				SilverRightGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverRight"
					weight = 5
					Silver = 1
					suffix = null
					layer = 4

				DragonlordsofDMRightGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Right Gauntlet"
					weight = 3
					suffix = null
					layer = 4

				DarkLegionRightGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Dark Legion Right Gauntlet"
					weight = 3
					suffix = null
					layer = 4

				ViperRightGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Viper Right Gauntlet"
					weight = 3
					suffix = null
					layer = 4

				PandoraRightGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraRightArm"
					weight = 3
					suffix = null
					layer = 4

				LegionOfLostRightGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "LegionOfLostRightArm"
					weight = 3
					suffix = null
					layer = 4

				MetalRightGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MRightArm"
					weight = 5
					suffix = null
					layer = 4

				AdamantiumRightGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "AdamantiumRightArm"
					weight = 0
					suffix = null
					layer = 4

				ScaleRightGauntlet
					icon = 'Scale Armour.dmi'
					icon_state = "Right Gaunlet"
					name = "Scale Gauntlet"
					weight = 5
					suffix = null
					layer = 4
					desc = ""
					New()
						Defence = rand(5,20)

				MarineRightGauntlet
					icon = 'Marine.dmi'
					icon_state = "MRightArm"
					name = "Marine Gauntlet"
					weight = 5
					suffix = null
					layer = 4
					desc = "This armour is unknown."
					New()
						Defence = rand(30,50)

				SkornRightGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SRightArm"
					name = "Skorn Gauntlet - UnHoly"
					weight = 5
					suffix = null
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(10,15)

			LeftArms
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Equip"
								menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										var/obj/A2 = src
										M.WearingLeftArm = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0)
									if(src in M)
										if(M.HasLeftArm == 1)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLeftArm == 0)
													if(M.HasLeftArm == 1)
														if(M.Gremlin == 1 && src.icon == 'Gremlin Equipment.dmi')
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += src.type
														if(M.Gremlin == 0 && src.icon != 'Gremlin Equipment.dmi')
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += src.type
											else
												usr << "Not enough skill to use!"

				GremlinLeftGauntlet
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Left Gauntlet"
					weight = 7
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				GoldLeftGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GLeftArm"
					weight = 7
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "LeftBrace"

				DragoonLeftGauntlet
					icon = 'TrimmedMetal.dmi'
					icon_state = "Gold Trimmed Left Gauntlet"
					weight = 7
					suffix = null
					layer = 4

				ChitinLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CLeftArm"
					weight = 5
					suffix = null
					layer = 4

				WoodenLeftGauntlet
					icon = 'WoodItems.dmi'
					icon_state = "Wooden LeftArm"
					weight = 5
					suffix = null
					layer = 4

				BoneLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BLeftArm"
					weight = 5
					suffix = null
					layer = 4

				SupernaturalBoneLeftGauntlet
					icon = 'Superbone.dmi'
					icon_state = "leftarm"
					weight = 5
					suffix = null
					layer = 4

				LeatherLeftGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeft"
					weight = 2
					suffix = null
					layer = 4

				DemonLeatherLeftGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherLeft"
					Content2 = "Demon"
					weight = 2
					suffix = null
					layer = 4

				SilverLeftGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverLeft"
					weight = 5
					Silver = 1
					suffix = null
					layer = 4

				MetalLeftGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MLeftArm"
					weight = 5
					suffix = null
					layer = 4

				ViperLeftGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Viper Left Gauntlet"
					weight = 5
					suffix = null
					layer = 4

				PandoraLeftGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraLeftArm"
					weight = 5
					suffix = null
					layer = 4

				LegionOfLostLeftGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "LegionOfLostLeftArm"
					weight = 5
					suffix = null
					layer = 4

				DragonlordsofDMLeftGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Left Gauntlet"
					weight = 5
					suffix = null
					layer = 4

				DarkLegionLeftGauntlet
					icon = 'Clan Armor.dmi'
					icon_state = "Dark Legion Left Gauntlet"
					weight = 5
					suffix = null
					layer = 4

				AdamantiumLeftGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "AdamantiumLeftArm"
					weight = 0
					suffix = null
					layer = 4

				ScaleLeftGauntlet
					icon = 'Scale Armour.dmi'
					icon_state = "Let Gaunlet"
					weight = 5
					suffix = null
					name = "Scale Gauntlet"
					layer = 4
					desc = ""
					New()
						Defence = rand(15,20)

				MarineLeftGauntlet
					icon = 'Marine.dmi'
					icon_state = "MLeftArm"
					weight = 5
					suffix = null
					name = "Marine Gauntlet"
					layer = 4
					desc = "This armour is unknown."
					New()
						Defence = rand(30,50)

				SkornLeftGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SLeftArm"
					weight = 5
					suffix = null
					name = "Skorn Gauntlet - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(10,15)

			Back

				LeatherQuiver
					icon = 'Quiver.dmi'
					name = "Leather Quiver"
					weight = 5
					dir = SOUTH
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							if(src)
								M.destination = null
								if(src in M)

									if(M.Wagon == 0)


										var/obj/A15= src
										A15.loc = M
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "CheckContents"
										menu += "DropContents"
										menu += "Equip"
										menu += "Un-Equip"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											usr << src.desc
										if (Result == "CheckContents")
											usr << "This quiver has [src.Content] Arrows in it<br>"
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												if(A1.Content3 == 0)
													A1.DeleteItem()
												return
										if (Result == "DropContents")
											for(var/obj/Items/Arrows/A in src)
												A.loc = M.loc
												src.Content -= 1
										if (Result == "Un-Equip")
											if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
												var/obj/A2 = src
												M.WearingBack = 0
												A2.loc = M
												A2.dir = NORTH
												A2.suffix = "(Carrying)"
												M.overlays -= /obj/Items/Armours/Back/LeatherQuiver/
										if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
											if(src in M)
												if(M.ShieldSkill >= src.Skill)
													if(M.Crippled == 0)
														if(M.WearingBack == 0)
															var/obj/A = src
															M.WearingBack = 1
															A.dir = null
															A.loc = M
															A.suffix = "(Equiped)"
															M.overlays += /obj/Items/Armours/Back/LeatherQuiver/

													else
														usr << "[M] has crippled arms!"
												else
													usr << "Not enough skill to use!"
			ChestPlates

				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Equip"
								menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
										var/obj/A2 = src
										M.WearingChest = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0)
									if(src in M)
										if(M.ArmourSkill >= src.Skill)
											if(M.WearingChest == 0)
												if(src.icon == 'Gremlin Equipment.dmi')
													if(M.Gremlin == 1)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += src.type
												else if(M.Gremlin == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += src.type
										else
											usr << "Not enough skill to use!"
				LeatherChestPlate
					icon = 'LeatherItems.dmi'
					icon_state = "Leather ChestPlate"
					name = "Leather Top"
					weight = 5
					suffix = null
					layer = 4

				GremlinChestplate
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Chestplate"
					name = "Gremlin Chestplate"
					weight = 5
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				WoodenChestplate
					icon = 'WoodItems.dmi'
					icon_state = "Wooden ChestPlate"
					weight = 5
					suffix = null
					layer = 4

				Vault101Jumpsuit
					icon = 'MetalObjects.dmi'
					icon_state = "Vault101"
					name = "Vault 101 Jumpsuit"
					weight = 5
					suffix = null
					layer = 4

				BCoat
					icon = 'MetalObjects.dmi'
					icon_state = "Coat"
					name = "Brown Trenchcoat"
					weight = 5
					suffix = null
					layer = 4

				MustardCoat
					icon = 'MetalObjects.dmi'
					icon_state = "MustardCoat"
					name = "Mustard Trenchcoat"
					weight = 5
					suffix = null
					layer = 4

				BlackCoat
					icon = 'MetalObjects.dmi'
					icon_state = "BlackCoat"
					name = "Black Trenchcoat"
					weight = 5
					suffix = null
					layer = 4

				DemonLeatherChestPlate
					icon = 'LeatherItems.dmi'
					icon_state = "Demon Leather ChestPlate"
					Content2 = "Demon"
					name = "Demon Leather Top"
					weight = 5
					suffix = null
					layer = 4

				BlackRobe
					icon = 'Robe.dmi'
					icon_state = "BlackRobe"
					name = "Magician's Robe"
					weight = 5
					suffix = null
					layer = 4

				ShaperRobe
					icon = 'Robe.dmi'
					icon_state = "ShaperRobe"
					name = "Shaper Robe"
					weight = 5
					suffix = null
					layer = 4

				ChaosRobe
					icon = 'Robe.dmi'
					icon_state = "ChaosRobe"
					name = "Chaos Robe"
					weight = 5
					suffix = null
					layer = 4

				AstralRobe
					icon = 'Robe.dmi'
					icon_state = "AstralRobe"
					name = "Astral Robe"
					weight = 5
					suffix = null
					layer = 4

				RedRobe
					icon = 'Robe.dmi'
					icon_state = "RedRobe"
					name = "Magician's Robe"
					weight = 5
					suffix = null
					layer = 4

				NecroRobe
					icon = 'Robe.dmi'
					icon_state = "NecroRobe"
					name = "Necromancer's Robe"
					weight = 5
					suffix = null
					layer = 4

				WhiteRobe
					icon = 'Robe.dmi'
					icon_state = "WhiteRobe"
					name = "Priest's Robe"
					weight = 5
					suffix = null
					layer = 4


				SilverChestPlate
					icon = 'SilverItems.dmi'
					icon_state = "Silver ChestPlate"
					weight = 30
					Silver = 1
					suffix = null
					layer = 4

				GoldChestPlate
					icon = 'GoldItems.dmi'
					icon_state = "Gold ChestPlate"
					weight = 30
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "ChestPlate"

				EmeraldMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestEmerald"
					weight = 30
					suffix = null
					layer = 4

				EmeraldSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestEmerald"
					weight = 30
					suffix = null
					layer = 4

				DiamondMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestDiamond"
					weight = 30
					suffix = null
					layer = 4

				DiamondSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestDiamond"
					weight = 30
					suffix = null
					layer = 4

				DiamondGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestDiamond"
					weight = 30
					suffix = null
					layer = 4

				EmeraldGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestEmerald"
					weight = 30
					suffix = null
					layer = 4

				RubyGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestRuby"
					weight = 35
					suffix = null
					layer = 4

				RubySilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestRuby"
					weight = 35
					suffix = null
					layer = 4

				RubyMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestRuby"
					weight = 35
					suffix = null
					layer = 4

				DragonlordsofDMChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Chestplate"
					weight = 20
					suffix = null
					layer = 4

				PandoraChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraChest"
					weight = 20
					suffix = null
					layer = 4

				DarkLegionChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "Dark Legion Chestplate"
					weight = 20
					suffix = null
					layer = 4

				ViperChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "Viper Chestplate"
					weight = 20
					suffix = null
					layer = 4

				PandoraChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraChest"
					weight = 20
					suffix = null
					layer = 4

				LegionOfLostChestPlate
					icon = 'Clan Armor.dmi'
					icon_state = "LegionOfLostChest"
					weight = 20
					suffix = null
					layer = 4

				MetalChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Metal ChestPlate"
					weight = 30
					suffix = null
					layer = 4

				DragoonChestPlate
					icon = 'TrimmedMetal.dmi'
					icon_state = "Gold Trimmed Chestplate"
					weight = 30
					suffix = null
					layer = 4

				GladiatorMetalChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Bronze ChestPlate"
					weight = 30
					suffix = null
					layer = 4

				AdamantiumChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium ChestPlate"
					weight = 0
					suffix = null
					layer = 4

				ChitinChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "ChitinChestPlate"
					weight = 10
					suffix = null
					layer = 4

				MarineChestPlate
					icon = 'Marine.dmi'
					icon_state = "Metal ChestPlate"
					weight = 10
					suffix = null
					name = "Marine ChestPlate"
					layer = 4
					desc = "This armour is tainted with the blood of many, it is made from an unknown material, its defence is godly, its craftmanship is un-holy, it was forged by demons"
					New()
						Defence = rand(55,65)

				ScaleChestPlate
					icon = 'Scale Armour.dmi'
					icon_state = "C-Plate"
					weight = 10
					suffix = null
					name = "Scale ChestPlate"
					layer = 4
					desc = "This armour "
					New()
						Defence = rand(15,35)

				SkornChestPlate
					icon = 'SkornArmour.dmi'
					icon_state = "SChest"
					weight = 10
					suffix = null
					name = "Skorn ChestPlate - UnHoly"
					layer = 4
					desc = "This armour is tainted with the blood of many, it is made from an unknown material, its defence is godly, its craftmanship is un-holy, it was forged by demons"
					New()
						Defence = rand(20,45)

				BoneChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "Bone ChestPlate"
					weight = 10
					suffix = null
					layer = 4

				SupernaturalBoneChestPlate
					icon = 'Superbone.dmi'
					icon_state = "chest"
					weight = 10
					suffix = null
					layer = 4

			NeckGuards
				MarineNeckguard
					icon = 'Marine.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/MarineNeckguard/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/MarineNeckguard/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				GoldNeckGuard
					icon = 'GoldItems.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				TeamCape
					icon = 'Robe.dmi'
					icon_state = "BlackCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if(Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											if(src.icon_state == "Dragonlords of DM")
												M.overlays -= /obj/dragonlordsofdmcape
											if(src.icon_state == "The Sage's Claws")
												M.overlays -= /obj/thesagesclawscape
											if(src.icon_state == "Axis of Terror")
												M.overlays -= /obj/axisofterrorcape
											if(src.icon_state == "Viper")
												M.overlays -= /obj/vipercape
											if(src.icon_state == "Super Mario Co.")
												M.overlays -= /obj/supermariococape
											if(src.icon_state == "Ragequit")
												M.overlays -= /obj/ragequitcape
											if(src.icon_state == "Ragnarok")
												M.overlays -= /obj/ragnarokcape
											if(src.icon_state == "Legion of Lost")
												M.overlays -= /obj/legionoflostcape
											if(src.icon_state == "Conclave of the Fallen Souls")
												M.overlays -= /obj/conclaveofthefallensoulscape
											if(src.icon_state == "Lords of Time")
												M.overlays -= /obj/lordsoftimecape
											if(src.icon_state == "Dark Legion")
												M.overlays -= /obj/darklegioncape
											if(src.icon_state == "Sky Knights")
												M.overlays -= /obj/skyknightscape
											if(src.icon_state == "Communists")
												M.overlays -= /obj/communistscape
											if(src.icon_state == "Allure of the Pandora")
												M.overlays -= /obj/pandoracape
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if(Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													if(src.icon_state == "Dragonlords of DM")
														M.overlays += /obj/dragonlordsofdmcape
													if(src.icon_state == "The Sage's Claws")
														M.overlays += /obj/thesagesclawscape
													if(src.icon_state == "Axis of Terror")
														M.overlays += /obj/axisofterrorcape
													if(src.icon_state == "Viper")
														M.overlays += /obj/vipercape
													if(src.icon_state == "Super Mario Co.")
														M.overlays += /obj/supermariococape
													if(src.icon_state == "Ragequit")
														M.overlays += /obj/ragequitcape
													if(src.icon_state == "Ragnarok")
														M.overlays += /obj/ragnarokcape
													if(src.icon_state == "Legion of Lost")
														M.overlays += /obj/legionoflostcape
													if(src.icon_state == "Conclave of the Fallen Souls")
														M.overlays += /obj/conclaveofthefallensoulscape
													if(src.icon_state == "Lords of Time")
														M.overlays += /obj/lordsoftimecape
													if(src.icon_state == "Dark Legion")
														M.overlays += /obj/darklegioncape
													if(src.icon_state == "Sky Knights")
														M.overlays += /obj/skyknightscape
													if(src.icon_state == "Communists")
														M.overlays += /obj/communistscape
													if(src.icon_state == "Allure of the Pandora")
														M.overlays += /obj/pandoracape
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				BlackCape
					icon = 'Robe.dmi'
					icon_state = "BlackCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if(Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/BlackCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if(Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/BlackCape/
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				AstralCape
					icon = 'Robe.dmi'
					icon_state = "AstralCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/AstralCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/AstralCape/
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				NecroCape
					icon = 'Robe.dmi'
					icon_state = "NecroCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/NecroCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/NecroCape/
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				ChaosCape
					icon = 'Robe.dmi'
					icon_state = "ChaosCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/ChaosCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/ChaosCape/
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				RedCape
					icon = 'Robe.dmi'
					icon_state = "RedCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/RedCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/RedCape/
													M.Defence += src.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				WhiteCape
					icon = 'Robe.dmi'
					icon_state = "WhiteCape"
					weight = 10
					suffix = null
					IsCape = 1
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingCape = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/WhiteCape/
											M.Defence -= src.Defence
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingCape == 0)
													var/obj/A = src
													M.WearingCape = 1
													M.overlays += /obj/Items/Armours/NeckGuards/WhiteCape/
													M.Defence += A.Defence
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				SilverNeckGuard
					icon = 'SilverItems.dmi'
					icon_state = "Guard"
					Silver = 1
					weight = 10
					suffix = null
					layer = 4
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src.Silver == 1)
								if(M.Vampire == 1 || M.Werewolf == 1)
									if(src in view(1,M))
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										return
									if(src in M)
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
											M.BloodContent -= 5
											M.BloodLoss()
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"

											else
												usr << "Not enough skill to use!"
				MetalNeckGuard
					icon = 'MetalObjects.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"

									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"


											else
												usr << "Not enough skill to use!"
			Helmets
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src.Silver == 1)
							if(M.Vampire == 1 || M.Werewolf == 1)
								if(src in view(1,M))
									view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
									M.BloodContent -= 5
									M.BloodLoss()
									return
								if(src in M)
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									src.loc = M
									src.suffix = "(Carrying)"
									M.weight += src.weight
									return
								else
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A16 = src
								A16.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Content2 != "Crown")
									menu += "Equip"
									menu += "Un-Equip"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << "This is a [src] it looks like it will provide [src.Defence] defence it is made of [src.M]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										if(A1.Content3 == 0)
											A1.DeleteItem()
										return
								if (Result == "Un-Equip")
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										var/obj/A2 = src
										M.WearingHelmet = 0
										A2.loc = M
										A2.suffix = "(Carrying)"
										M.overlays -= src.type
										M.Defence -= A2.Defence
								if (Result == "Equip" && M.Werepowers == 0)
									if(src in M)
										if(M.ArmourSkill >= src.Skill)
											if(M.WearingHelmet == 0)
												if(M.Gremlin == 1 && src.icon == 'Gremlin Equipment.dmi')
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += src.type
												if(M.Gremlin == 0 && src.icon != 'Gremlin Equipment.dmi')
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += src.type
										else
											usr << "Not enough skill to use!"
				BoneCrown
					icon = 'RoyalItems.dmi'
					icon_state = "BoneCrown"
					weight = 10
					Content2 = "Crown"
					suffix = null
					layer = 4


				Crown
					icon = 'GoldItems.dmi'
					icon_state = "Crown"
					weight = 10
					Content2 = "Crown"
					suffix = null
					layer = 4

				GremlinHelmet
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Helmet"
					weight = 10
					Content2 = "SmallArmor"
					suffix = null
					layer = 4

				LeatherHelmet
					icon = 'LeatherItems.dmi'
					icon_state = "Leather Helmet"
					weight = 10
					suffix = null
					layer = 4

				WoodenHelmet
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Helmet"
					weight = 10
					suffix = null
					layer = 4

				CoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "CoatHat"
					weight = 10
					suffix = null
					layer = 4

				MustardCoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "MustardCoatHat"
					weight = 10
					suffix = null
					layer = 4

				DarkMask
					icon = 'MetalObjects.dmi'
					icon_state = "DarkMask"
					weight = 10
					suffix = null
					layer = 4

				BlackCoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "BlackCoatHat"
					weight = 10
					suffix = null
					layer = 4

				DemonLeatherHelmet
					icon = 'LeatherItems.dmi'
					icon_state = "Demon Leather Helmet"
					Content2 = "Demon"
					weight = 10
					suffix = null
					layer = 4

				BlackHood
					icon = 'Robe.dmi'
					icon_state = "BlackHood"
					weight = 10
					suffix = null
					layer = 4

				ShaperHood
					icon = 'Robe.dmi'
					icon_state = "ShaperHood"
					weight = 10
					suffix = null
					layer = 4

				ChaosHood
					icon = 'Robe.dmi'
					icon_state = "ChaosHood"
					weight = 10
					suffix = null
					layer = 4

				RedHat
					icon = 'Robe.dmi'
					icon_state = "RedHat"
					weight = 10
					suffix = null
					layer = 4

				AstralHat
					icon = 'Robe.dmi'
					icon_state = "AstralHat"
					weight = 10
					suffix = null
					layer = 4

				WhiteHood
					icon = 'Robe.dmi'
					icon_state = "WhiteHood"
					weight = 10
					suffix = null
					layer = 4

				SilverHelmet
					icon = 'SilverItems.dmi'
					icon_state = "Silver Helmet"
					weight = 20
					Silver = 1
					suffix = null
					layer = 4

				DragoonHelmet
					icon = 'TrimmedMetal.dmi'
					icon_state = "Gold Trimmed Helmet"
					weight = 30
					suffix = null
					layer = 4

				GoldHelmet
					icon = 'GoldItems.dmi'
					icon_state = "Gold Helmet"
					weight = 30
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "Helmet"

				DiamondMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Metal Helmet"
					weight = 35
					suffix = null
					layer = 4

				DiamondSilverHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Silver Helmet"
					weight = 35
					Silver = 1
					suffix = null
					layer = 4

				EmeraldSilverHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Silver Helmet"
					weight = 35
					Silver = 1
					suffix = null
					layer = 4

				RubySilverHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Silver Helmet"
					weight = 35
					Silver = 1
					suffix = null
					layer = 4

				EmeraldGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Gold Helmet"
					weight = 35
					suffix = null
					layer = 4

				DiamondGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Gold Helmet"
					weight = 35
					suffix = null
					layer = 4

				RubyGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Gold Helmet"
					weight = 35
					suffix = null
					layer = 4

				EmeraldMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Metal Helmet"
					weight = 35
					suffix = null
					layer = 4

				RubyMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Metal Helmet"
					weight = 35
					suffix = null
					layer = 4

				MetalHelmet
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Helmet"
					weight = 30
					suffix = null
					layer = 4

				ViperHelmet
					icon = 'Clan Armor.dmi'
					icon_state = "Viper Helmet"
					weight = 30
					suffix = null
					layer = 4

				PandoraHelmet
					icon = 'Clan Armor.dmi'
					icon_state = "PandoraHelmet"
					weight = 30
					suffix = null
					layer = 4

				LegionOfLostHelmet
					icon = 'Clan Armor.dmi'
					icon_state = "LegionOfLostHelmet"
					weight = 30
					suffix = null
					layer = 4

				DragonlordsofDMHelmet
					icon = 'Clan Armor.dmi'
					icon_state = "Dragonlords of DM Helmet"
					weight = 30
					suffix = null
					layer = 4

				DarkLegionHelmet
					icon = 'Clan Armor.dmi'
					icon_state = "Dark Legion Helmet"
					weight = 30
					suffix = null
					layer = 4

				AdamantiumHelmet
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Helmet"
					weight = 0
					suffix = null
					layer = 4

				GladiatorMetalHelmet
					icon = 'MetalObjects.dmi'
					icon_state = "Bronze Helmet"
					weight = 30
					suffix = null
					layer = 4

				ChitinHelmet
					icon = 'BoneItems.dmi'
					icon_state = "ChitinHelmet"
					weight = 10
					suffix = null
					layer = 4

				ScalePlateHelmet
					icon = 'Scale Armour.dmi'
					icon_state = "Helm"
					weight = 10
					suffix = null
					name = "Scale Helmet"
					layer = 4
					desc = ""
					New()
						Defence = rand(14,24)

				MarinePlateHelmet
					icon = 'Marine.dmi'
					icon_state = "Metal Helmet"
					weight = 10
					suffix = null
					name = "Marine Plate Helmet"
					layer = 4
					desc = "This helmet is unknown."
					New()
						Defence = rand(50,65)

				SkornPlateHelmet
					icon = 'SkornArmour.dmi'
					icon_state = "SHelmet"
					weight = 10
					suffix = null
					name = "Skorn Plate Helmet - UnHoly"
					layer = 4
					desc = "This helmet is tainted with the death of hundreds, it is made out of an unknown material, its craftmanship is un-holy, its defence is godly. It was forged by demons."
					New()
						Defence = rand(20,30)

				BoneHelmet
					icon = 'Cave.dmi'
					icon_state = "Bone Helmet"
					weight = 10
					suffix = null
					layer = 4

				SupernaturalBoneHelmet
					icon = 'Superbone.dmi'
					icon_state = "helmet"
					weight = 10
					suffix = null
					layer = 4

		Weapons


			Swords
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Sword")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellSword")
																	if(M.SwordSkill >= 150)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Sliced into delightful salami by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = "Sword"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = "Sword"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				GoldGladius
					icon = 'GoldItems.dmi'
					icon_state = "Gold Gladius"
					weight = 30
					suffix = null
					layer = 4

				Pistol
					icon = 'MetalObjects.dmi'
					icon_state = "Pistol"
					weight = 30
					suffix = null
					layer = 4

				BoltActionRifle
					icon = 'MetalObjects.dmi'
					icon_state = "Rifle"
					weight = 30
					suffix = null
					layer = 4

				Mesmetron
					icon = 'MetalObjects.dmi'
					icon_state = "Mesmetron"
					weight = 30
					suffix = null
					layer = 4

				Gladius
					icon = 'MetalObjects.dmi'
					icon_state = "Gladius"
					weight = 20
					suffix = null
					layer = 4

				DestructionSword
					icon = 'MetalObjects.dmi'
					icon_state = "FireSword"
					weight = 20
					suffix = null
					layer = 4

				AdamantiumSword
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Sword"
					weight = 20
					suffix = null
					layer = 4

				SoulBlade
					icon = 'MetalObjects.dmi'
					icon_state = "SoulBlade"
					name = "Soul Eater"
					weight = 20
					suffix = null
					layer = 4

				GoldStraightSword
					icon = 'GoldItems.dmi'
					icon_state = "Gold Sword"
					weight = 30
					suffix = null
					layer = 4

				GoldStraightSword
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Sword"
					weight = 10
					suffix = null
					layer = 4

				GremlinSword
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Gremlin Sword"
					weight = 30
					suffix = null
					layer = 4

				Lightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "Saber"
					weight = 30
					suffix = null
					layer = 4

				BlueLightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "Blue"
					weight = 30
					suffix = null
					layer = 4

				RedLightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "RedSaber"
					weight = 30
					suffix = null
					layer = 4

				HellForgedSword
					icon = 'DemonicItems.dmi'
					icon_state = "HellSword"
					weight = 50
					suffix = null
					layer = 4
					text = "<font color=red>&"
					New()
						CursedItem()

				StraightSword
					icon = 'MetalObjects.dmi'
					icon_state = "Sword"
					weight = 25
					suffix = null
					layer = 4

				WoodenSword
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Sword"
					weight = 12
					suffix = null
					layer = 4

				SilverSword
					icon = 'SilverItems.dmi'
					icon_state = "Silver Sword"
					Silver = 1
					weight = 25
					suffix = null
					layer = 4

				BoneSword
					icon = 'BoneItems.dmi'
					icon_state = "BoneSword"
					weight = 20
					suffix = null
					layer = 4

				ChitinSword
					icon = 'BoneItems.dmi'
					icon_state = "ChitinSword"
					weight = 20
					suffix = null
					layer = 4

				GoblinSword
					icon = 'GoblinSword.dmi'
					icon_state = "Swords"
					weight = 25
					suffix = null
					layer = 4

				HolySword
					icon = 'HolyItems.dmi'
					icon_state = "HolySword"
					weight = 25
					Silver = 1
					suffix = null
					text = "<font color=yellow>HS"
					layer = 4

			Daggers
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Sword")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellSword")
																	if(M.DaggerSkill >= 150)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Assassinated with karabwakinaki poison by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = "Dagger"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = "Dagger"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				GoldDagger
					icon = 'GoldItems.dmi'
					icon_state = "Gold Dagger"
					weight = 15
					suffix = null
					layer = 4

				MetalDagger
					icon = 'Cave.dmi'
					icon_state = "Metal Dagger"
					weight = 10
					suffix = null
					layer = 4

				SilverDagger
					icon = 'Cave.dmi'
					icon_state = "Silver Dagger"
					weight = 10
					suffix = null
					Silver = 1
					layer = 4

				BoneDagger
					icon = 'BoneItems.dmi'
					icon_state = "BoneDagger"
					weight = 10
					suffix = null
					layer = 4

				ChitinDagger
					icon = 'BoneItems.dmi'
					icon_state = "ChitinDagger"
					weight = 10
					suffix = null
					layer = 4

				AdamantiumDagger
					icon = 'MetalObjects.dmi'
					icon_state = "AdamantiumDagger"
					weight = 0
					suffix = null
					layer = 4

				HellForgedDagger
					icon = 'DemonicItems.dmi'
					icon_state = "HellDagger"
					weight = 15
					suffix = null
					text = "<font color=red>&"
					layer = 4
					New()
						CursedItem()

			Maces
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									if(src.icon_state == "NecroStaff")
										menu += "Raise Skeleton"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return
									if (Result == "Raise Skeleton")
										if(M.Mana >= 15)
											for(var/obj/Items/Bones/Skull/B in range())
												var/mob/Monsters/Skeleton/Z = new
												view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the bones!"
												Z.icon = 'Skeleton.dmi'
												Z.icon_state = "Normal"
												Z.loc = B.loc
												Z.Owner = usr
												Z.name = "[M.name]'s Skeleton"
												Z.LimbLoss()
												usr.UnitList += Z
												Z.Undead = 1
												M.Mana -= 15
												M.Hunger -= 25
												M.NecromancySkill += 0.25
												Z.PillarPowerup()
												Z.EXP += M.NecromancySkill * 2
												del(B)
												return
										else
											usr << "[M] needs 15 mana to do this."
									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Mace")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellMace")
																	if(M.MaceSkill >= 150)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Violently bludgeoned to death by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = "Mace"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = "Mace"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				GoldMace
					icon = 'GoldItems.dmi'
					icon_state = "GoldMace"
					weight = 30
					suffix = null
					layer = 4

				GremlinMace
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Gremlin Mace"
					weight = 10
					suffix = null
					layer = 4

				SilverMace
					icon = 'SilverItems.dmi'
					icon_state = "Silver Mace"
					weight = 25
					Silver = 1
					suffix = null
					layer = 4

				WoodenMace
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Mace"
					weight = 10
					suffix = null
					layer = 4

				SkullMace
					icon = 'BoneItems.dmi'
					icon_state = "Bone Mace"
					weight = 20
					suffix = null
					layer = 4

				ChitinMace
					icon = 'BoneItems.dmi'
					icon_state = "ChitinMace"
					weight = 20
					suffix = null
					layer = 4

				Staff
					icon = 'MetalObjects.dmi'
					icon_state = "MageStaff"
					weight = 20
					suffix = null
					layer = 4

				AstralStaff
					icon = 'MetalObjects.dmi'
					icon_state = "AstralStaff"
					weight = 20
					suffix = null
					layer = 4

				NecroStaff
					icon = 'MetalObjects.dmi'
					icon_state = "NecroStaff"
					weight = 20
					suffix = null
					layer = 4

				MetalMace
					icon = 'MetalObjects.dmi'
					icon_state = "Mace"
					weight = 25
					suffix = null
					layer = 4

				AdamantiumMace
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Mace"
					weight = 25
					suffix = null
					layer = 4

				DemonMace
					icon = 'MetalObjects.dmi'
					icon_state = "HellMace"
					weight = 25
					suffix = null
					layer = 4
					text = "<font color=red>&"

			Bows
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A19 = src
									A19.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
											M.BowOn = 0
									if (Result == "Equip" && M.Werepowers == 0 && M.Gremlin == 0)
										if(src in M)
											if(M.CanUseRightArm == 1)
												if(M.HoldingWeapon == 0)
													if(src.icon_state == "HellMace")
														if(M.BowSkill >= 200)
															..()
														else
															M.GoingToDie = 1
															M.Killer = "[src]"
															M.DeathType = "being used as a pincussion by an Evil Spirit"
															M.Death()
															view() << "[M] tries to wield [src] but it rejects them! the bow fades away"
													M.HoldingWeapon = "Bow"
													src.loc = M
													src.suffix = "(Equiped)"
													M.overlays += src.type
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
													M.BowOn = 0
				WoodenBow
					icon = 'WoodItems.dmi'
					icon_state = "WoodBow"
					weight = 20
					suffix = null
					layer = 4

				ElfBow
					icon = 'WoodItems.dmi'
					icon_state = "Elf Bow"
					weight = 20
					suffix = null
					layer = 4

				MetalBow
					icon = 'MetalObjects.dmi'
					icon_state = "MetalBow"
					weight = 25
					suffix = null
					layer = 4

				Hellbow
					icon = 'MetalObjects.dmi'
					icon_state = "HellBow"
					weight = 25
					suffix = null
					layer = 4
					text = "<font color=red>&"

				BoneBow
					icon = 'BoneItems.dmi'
					icon_state = "BoneBow"
					weight = 20
					suffix = null
					layer = 4

			Axes
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Axe")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellAxe")
																	if(M.AxeSkill >= 150)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Torn into ribbons by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = "Axe"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = "Axe"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				GoldAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Axe"
					weight = 30
					suffix = null
					layer = 4

				BoneAxe
					icon = 'BoneItems.dmi'
					icon_state = "BoneAxe"
					weight = 20
					suffix = null
					layer = 4

				WoodenAxe
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Axe"
					weight = 20
					suffix = null
					layer = 4

				BoneAxe
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Axe"
					weight = 20
					suffix = null
					layer = 4

				ChitinAxe
					icon = 'BoneItems.dmi'
					icon_state = "ChitinAxe"
					weight = 20
					suffix = null
					layer = 4

				MetalOrcAxe
					icon = 'MetalObjects.dmi'
					icon_state = "MetalOrcAxe"
					weight = 25
					suffix = null
					layer = 4

				SilverAxe
					icon = 'SilverItems.dmi'
					icon_state = "Silver Axe"
					weight = 25
					Silver = 1
					suffix = null
					layer = 4

				AdamantiumAxe
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Axe"
					weight = 25
					suffix = null
					layer = 4

				HellAxe
					icon = 'MetalObjects.dmi'
					icon_state = "HellAxe"
					weight = 25
					suffix = null
					layer = 4
					text = "<font color=red>&"

				MetalAxe
					icon = 'Cave.dmi'
					icon_state = "Axe"
					weight = 25
					suffix = null
					layer = 4

			Picks
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0 && M.Gremlin == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											M.HasPick = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Pickaxe")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellPick")
																	if(M.MineingSkill >= 250)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Being stripmined by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = 1
																M.HasPick = 1
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = 1
																M.HasPick = 1
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				GoldPickAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Pick"
					weight = 30
					suffix = null
					layer = 4

				PickAxe
					icon = 'Cave.dmi'
					icon_state = "Metal Pick"
					weight = 25
					suffix = null
					layer = 4

				WoodenPickAxe
					icon = 'WoodItems.dmi'
					icon_state = "Wooden Pick"
					weight = 10
					suffix = null
					layer = 4

			Spears
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(M.Wagon == 0)
									var/obj/A20 = src
									A20.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << "This is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.HoldingWeapon = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= src.type
											M.WeaponDamageMin -= A2.WeaponDamageMin
											M.WeaponDamageMax -= A2.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.SwordSkill >= src.Skill)
												if(M.CanUseRightArm == 1)
													if(M.HoldingWeapon == 0)
														if(src.icon_state != "Gremlin Spear")
															if(M.Gremlin == 0)
																if(src.icon_state == "HellSpear")
																	if(M.SpearSkill >= 150)
																		..()
																	else
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "Repeatedly jabbed to death by an Evil Spirit"
																		M.Death()
																var/obj/A = src
																M.HoldingWeapon = "Spear"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax
														else if(M.Gremlin == 1)
															if(M)
																var/obj/A = src
																M.HoldingWeapon = "Spear"
																A.loc = M
																A.suffix = "(Equiped)"
																M.overlays += src.type
																M.WeaponDamageMin += A.WeaponDamageMin
																M.WeaponDamageMax += A.WeaponDamageMax

											else
												usr << "Not enough skill to use!"
				MarineSpear
					icon = 'Marine.dmi'
					icon_state = "Marine Spear"
					weight = 25
					suffix = null
					layer = 4

				SilverSpear
					icon = 'SilverItems.dmi'
					icon_state = "Silver Spear"
					weight = 25
					Silver = 1
					suffix = null
					layer = 4

				GoldSpear
					icon = 'GoldItems.dmi'
					icon_state = "Gold Spear"
					weight = 30
					suffix = null
					layer = 4
					New()
						if(IsElf == 1)
							icon = 'ElfArmour.dmi'
							icon_state = "Spear"

				GremlinSpear
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Gremlin Spear"
					weight = 25
					suffix = null
					layer = 4


				MetalSpear
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Spear"
					weight = 25
					suffix = null
					layer = 4

				AdamantiumSpear
					icon = 'MetalObjects.dmi'
					icon_state = "Adamantium Spear"
					weight = 25
					suffix = null
					layer = 4

				HellForgedSpear
					icon = 'DemonicItems.dmi'
					icon_state = "HellSpear"
					weight = 25
					suffix = null
					layer = 4
					text = "<font color=red>&"

				ChitinSpear
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Spear"
					weight = 10
					suffix = null
					layer = 4

				WoodenSpear
					icon = 'WoodItems.dmi'
					icon_state = "Wood Spear"
					weight = 15
					suffix = null
					layer = 4

				ElfSpear
					icon = 'WoodItems.dmi'
					icon_state = "Elf Spear"
					weight = 10
					suffix = null
					layer = 4

				BoneSpear
					icon = 'BoneSpear.dmi'
					icon_state = "Poor"
					weight = 15
					suffix = null
					layer = 4

				Spear
					icon = 'Spear.dmi'
					icon_state = "Poor"
					weight = 20
					suffix = null
					layer = 4

		Traps
			IsTrap = 1
			Cages
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
									usr << "[M] : I Cant Carry Too Much!"
									return
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A4 = src
								A4.loc = M
								var/list/menu = new()
								if(M.density == 1)
									menu += "Drop"
									menu += "Inspect"
									for(var/mob/Monsters/Q in src)
										if(Q.Cantame == 1)
											menu += "Tame"
										if(Q.CanBeSlaved == 1 && Q.Demon == 0)
											menu += "Enslave"
										if(Q.CanBeCaged == 1)
											menu += "Un-Enslave"
										if(M.IsMatureQueen == 1)
											menu += "Lay Eggs In"
										menu += "Contents"
										menu += "TakeItems"
										menu += "Release"
									menu += "Capture"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Contents")
									for(var/mob/Monsters/A in src)
										usr << "[A] - [A.Gender]"
								if (Result == "TakeItems")
									for(var/mob/Monsters/A in src)
										for(var/obj/O in A)
											O.loc = M.loc
											A.weight -= O.weight
											A.WearingShield = 0
											A.WearingChest = 0
											A.WearingHelmet = 0
											A.HoldingWeapon = 0
											A.WearingLeftArm = 0
											A.WearingRightArm = 0
											A.WearingBack = 0
											A.WearingFullPlateHelm = 0
											if(O.suffix == "(Equiped)")
												if(O.Defence)
													A.Defence -= O.Defence
											A.WearingLegs = 0
											O.suffix = null
											A.overlays = null
											if(A.LizardMan)
												A.overlays += 'LizardTail.dmi'
											if(A.Demon == 1)
												A.overlays += /obj/wing2/
											if(A.Race == "Gargoyle")
												A.overlays += /obj/wing3/
											if(A.Vampire)
												if(A.WingsOut)
													A.overlays += /obj/wing1/
											if(A.Gender == "Male")
												if(A.G == 1)
													A.overlays += 'Beards.dmi'
												if(A.B == 1)
													A.overlays += 'BlackBeard.dmi'
												if(A.BB == 1)
													A.overlays += 'BrownBeard.dmi'
								if (Result == "Un-Enslave")
									for(var/mob/Monsters/A in src)
										var/mob/F = A.Owner
										F.UnitList -= A
										A.Owner = null
										A.CanBeSlaved = 1
										view() << "[A] has been un-enslaved!"
										A.name = "Ex-Slave"
										A.loc = M.loc
										A.Content3 = null
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										A.InHole = 0
										A.Caged = 0
								if (Result == "Enslave")
									for(var/mob/Monsters/A in src)
										for(var/mob/XXX in world)
											if(XXX == A.Owner)
												XXX.UnitList -= A
										var/mob/O = M.Owner
										O.UnitList += A
										A.Owner = M.Owner
										A.CanBeSlaved = 0
										A.Content3 = "Tamed"
										view() << "[A] has been enslaved!"
										A.name = "{[M.Owner]}"
										A.loc = M.loc
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										A.InHole = 0
										A.CanBeCaged = 1
										A.OnGuard = 0
										A.PatrolPoint1 = null
										A.PatrolPoint2 = null
										A.HomeLoc = null
										A.Target = null
										A.IsNPC = 0
										A.Level()
										A.Hunger()
										A.Heal()
										A.Dig()
										A.Tiredness()
										A.Bed()
										A.Caged = 0
								if (Result == "Capture")
									for(var/mob/Monsters/C in oview(1,M))
										if(src.HasPersonIn == 0)
											if(M.CanBeCaged == 0)
												if(C.Wagon == 0)
													if(C.Content == "CantBeCaged")
														usr << "That creature can't be caged"
														return
													if(src.icon_state != "RopeOff")
														if(C.InHole == 1 || C.Fainted == 1 || C.Wolf == 1 || C.Deer == 1 || C.Mole == 1 || C.Bug == 1 || C.Beatle == 1 || C.CanBeCaged == 1)
															for(var/obj/Items/Traps/PitTrap/P in oview(1,M))
																if(C.loc == P.loc)
																	if(P.HasPersonIn == 1)
																		del(P)
															var/Escape = prob(C.Level - M.Level)
															if(M.Spider == 1)
																var/Sp = M.Level + 10
																Escape = prob(C.Level - Sp)
															if(Escape == 0)
																for(var/obj/Items/Shafts/Standard/ST in C)
																	ST.suffix = null
																	ST.loc = C.loc
																C.destination = null
																M.destination = null
																C.loc = src
																src.HasPersonIn = 1
																C.OnGuard = 0
																C.HomeLoc = null
																C.PatrolPoint1 = null
																C.PatrolPoint2 = null
																C.Target = null
																view() << "<b><font color=red>[C] is loaded into [src]"
																src.underlays += C
																C.BleedType = null
																C.BloodContent = C.MaxBloodContent
																C.Caged = 1
																if(ismob(C.Owner))
																	var/mob/S = C.Owner
																	if(S.Selected.Find(C))
																		S.Selected.Remove(C)
																		S.client.images -= C.Star
															else if(Escape == 1)
																C.InHole = 0
																view() << "[M] attempts to load [C] into a cage but they escape and climb out of the pit!"
																return
													else
														if(C.InHole == 1 || C.Fainted == 1 || C.CanBeCaged == 1)
															for(var/obj/Items/Traps/PitTrap/P in oview(1,M))
																if(C.loc == P.loc)
																	if(P.HasPersonIn == 1)
																		del(P)
															C.Owner << "[M] ties [C] up."
															M.Owner << "[M] ties [C] up."
															C.CanWalk = 0
															C.InHole = 0
															C.overlays += src.type
															C.Content2 = "Tied"
															M.weight -= src.weight
															del src


								if (Result == "Tame")
									for(var/mob/Monsters/C in src)
										C.loc = M.loc
										view() << "<b><font color=red>[C] is tamed by [M]"
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										C.name = "{[M.Owner]}"
										C.Tame = 1
										C.Cantame = 0
										C.destination = M
										C.InHole = 0
										C.WalkTo()
										C.CanBuild = 0
										C.Owner = C.OldOwner
										C.OldOwner = null
										C.Caged = 0
										if(C.Wolf == 1)
											C.Owner = M.Owner
										if(C.Mole == 1)
											C.Owner = M.Owner
										if(C.Deer == 1)
											C.Owner = M.Owner
										if(C.Bug == 1)
											C.Owner = M.Owner
										if(C.Beatle == 1)
											C.Owner = M.Owner
										var/mob/F = M.Owner
										F.UnitList += C
								if (Result == "Lay Eggs In")
									for(var/mob/Monsters/C in src)
										for(var/mob/Monsters/SpiderEgg/X in C)
											M.Owner << "[C] already has a spider egg inside of it."
											return
										var/mob/Monsters/SpiderEgg/X = new()
										X.loc = C
										X.invisibility = 101
										X.Owner = M.Owner
										X.DieAge = 90000
										X.name = "[C.name] Spider Egg"
										M.WebContent -= 25
										usr.UnitList += X
										usr << "[M] lays an egg into [C], doubleclick the egg once you release [C] at any time to initiate hatching."
								if (Result == "Release")
									for(var/mob/Monsters/C in src)
										C.loc = M.loc
										view() << "<b><font color=red>[C] is released from [src] by [M]"
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										if(C.OldOwner)
											C.Owner = C.OldOwner
											C.OldOwner = null
										C.InHole = 0
										C.Caged = 0
				Content3 = "Cage"
				GoldCage
					icon = 'GoldItems.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a gold cage, it can be used to capture creatures in"

				MetalCage
					icon = 'MetalObjects.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a metal cage, it can be used to capture creatures in"

				Cacoon
					icon = 'Spiders.dmi'
					icon_state = "Cage"
					weight = 25
					suffix = null

				BoneCage
					icon = 'BoneItems.dmi'
					icon_state = "Cage"
					weight = 40
					suffix = null

				Rope
					icon = 'Cave.dmi'
					icon_state = "Rope"
					weight = 10
					suffix = null
					desc = "This is a piece of rope used for tying up unfortunate victims."

				WoodenCage
					icon = 'Cave.dmi'
					icon_state = "Cage"
					weight = 40
					suffix = null
					desc = "This is a wooden cage, it can be used to capture creatures in"

			PitTrap
				icon = 'Cave.dmi'
				icon_state = "Hole"
				CantKill = 1
				New()
					PitTrap()
			BST
				icon = 'Cave.dmi'
				icon_state = "BST"
				New()
					BSTTrap()
			CacoonTrap
				icon = 'Devourer.dmi'
				icon_state = "TinyCacoon"
				New()
					CacoonTrap()
			RibTrap
				icon = 'Cave.dmi'
				icon_state = "RibTrap"
				New()
					RibTrap()
			StoneTrap
				icon = 'Cave.dmi'
				icon_state = "FallTrap"
				New()
					StoneTrap()
			Spikes
				WoodenSpike
					icon = 'Cave.dmi'
					icon_state = "Spike"
					weight = 5
					suffix = null
					desc = "This is a wooden spike, it can be combined with a pit to create a spike pit"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
		Shafts
			Twigs
				icon = 'Cave.dmi'
				icon_state = "Twigs"
				weight = 2
				suffix = null
				desc = "These are twigs, they can be used to create paper and other items."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
			HolySymbol
				icon = 'Book.dmi'
				icon_state = "HolySymbol"
				weight = 2
				suffix = null
				desc = "This is a holy symbol, units carrying one are immune to most effects of an evil god."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
			UnholySymbol
				icon = 'Book.dmi'
				icon_state = "UnholySymbol"
				weight = 2
				suffix = null
				desc = "This is a unholy symbol, units carrying one are immune to most effects of a good god."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
			LichSkull
				icon = 'Book.dmi'
				icon_state = "NecromancerSkull"
				name = "Lich Skull"
				weight = 2
				suffix = null
				desc = "This is the still 'living' skull of an evil lich..."
				Content3 = "NPC"
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								if(M.MagicalAptitude == 1 && M.NecromancySkill == 0)
									menu += "Absorb The Skulls Power"
								menu += "Destroy"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Absorb The Skulls Power")
									usr << "You adsorb the power of the skull, causing the skull to turn to dust."
									M.NecromancySkill = 1
									del src
								if(Result == "Destroy")
									if(src in M)
										for(var/mob/M2 in Players2)
											var/GG = get_dir(M2,M)
											M2 << "You hear evil chanting coming from the [GG]"
									else
										return
									spawn(600)
										if(src in M)
											for(var/mob/M2 in Players2)
												var/GG = get_dir(M2,M)
												M2 << "You hear evil chanting coming from the [GG]"
										else
											return
										spawn(600)
											if(src in M)
												for(var/mob/M2 in Players2)
													var/GG = get_dir(M2,M)
													M2 << "You hear evil chanting coming from the [GG]"
											else
												return
											spawn(600)
												if(src in M)
													for(var/mob/M2 in Players2)
														var/GG = get_dir(M2,M)
														M2 << "You hear evil chanting coming from the [GG]"
												else
													return
												spawn(600)
													if(src in M)
														M.weight -= src.weight
														for(var/obj/Items/Graves/UndeadSpawner/U in world)
															del U
														world << "The lich skull has been destroyed."
														del src
			HolyWater
				icon = 'Cave.dmi'
				icon_state = "Holy Water"
				name = "Holy Water"
				weight = 2
				suffix = null
				desc = "This is a bottle of holy water which can be used to combat evil creatures"
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Throw At Closest Evil Creature"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Throw At Closest Evil Creature")
									for(var/mob/Monsters/L in view(2,M))
										if(L.Undead == 1 || L.Vampire == 1 || L.Infects == 1)
											view(M) << "[M] throws the bottle of holy water at [L], it shatters and sprays the creature with glowing water filled with the essence of divinity!!!"
											view(L) << "[L] is hit and damaged severely by the water!"
											L.BloodContent -= 50
											L.BloodLoss()
											L.HP -= 25
											M.weight -= src.weight
											del src
										else if(L.Gargoyle == 1)
											view(M) << "[M] throws the bottle of holy water at the gargoyle, it breaks into millions of pieces as the gargoyle's skin cracks slightly where the water touched it!"
											L.Owner << "You have lost 15 defence points!!"
											M.weight -= src.weight
											del src
			ChristmasPresent
				icon = 'Book.dmi'
				icon_state = "ChristmasBox"
				name = "Box"
				weight = 2
				suffix = null
				desc = "This is a box! You wonder what's inside! (Random)."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Open"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Open")
									var/Book1 = prob(5)
									var/Book2 = prob(5)
									var/Book3 = prob(5)
									var/Book4 = prob(5)
									var/Book5 = prob(5)
									var/Skorn = prob(5)
									var/EvilDemon = prob(15)
									var/Frogman = prob(15)
									if(Book1)
										var/obj/Items/Shafts/NecroBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
									else if(Book2)
										var/obj/Items/Shafts/DestructionBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
									else if(Book3)
										var/obj/Items/Shafts/ChaosBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
										return
									else if(Book4)
										var/obj/Items/Shafts/HolyBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
									else if(Book5)
										var/obj/Items/Shafts/AstralBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
									else if(Skorn)
										var/mob/Monsters/NPCSkorn/B = new
										B.loc = M.loc
										view() << "[M] opens the box and Skorn, The Lord Of Pain, jumps out!"
									else if(EvilDemon)
										var/mob/Monsters/DemonNPC/B = new
										B.loc = M.loc
										view() << "[M] opens the box and a GIANT DEMON jumps out!"
									else if(Frogman)
										var/mob/Monsters/FrogMan/B = new
										B.loc = M.loc
										view() << "[M] opens the box and a big, green, smiling frogman jumps out and attacks!"
									else
										var/obj/Items/Potions/LifePotion/B = new
										B.loc = M.loc
										view() << "[M] opens the box and pulls out a Long Life Potion!"
									M.weight -= src.weight
									del src
			Bullet
				icon = 'Book.dmi'
				icon_state = "Bullet"
				ItemBullets = 10
				name = "10 Bullets"
				weight = 2
				suffix = null
				desc = "These are 10 bullets, press Load to add them to your bullet total."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Load"
								menu += "Combine"
								menu += "Drop"
								menu += "Inspect"
								if(usr.GM == 1)
									menu += "Set Bullet Content - GM"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if(Result != "Cancel")
									..()
								if(Result == "Inspect")
									usr << src.desc
								if(Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if(Result == "Set Bullet Content - GM")
									var/T = input("Amount?")as null|num
									if(!T)
										..()
									else
										src.ItemBullets = T
										src.name = "[src.ItemBullets] Bullets"
										src.desc = "These are [src.ItemBullets] bullets, press Load to add them to your bullet total."
										return
								if(Result == "Load")
									if(M.Bullets <= 10)
										for(var/obj/Items/Weapons/Swords/Pistol/P in M)
											if(P.suffix == "(Equiped)")
												view(M) << "[M] loads the pistol"
										for(var/obj/Items/Weapons/Swords/BoltActionRifle/B in M)
											if(B.suffix == "(Equiped)")
												view(M) << "[M] loads the rifle"
										M.Bullets += src.ItemBullets
										if(M.Bullets >= 10)
											src.ItemBullets = M.Bullets - 10
											M.Bullets = 10
											src.name = "[src.ItemBullets] Bullets"
											src.desc = "These are [src.ItemBullets] bullets, press Load to add them to your bullet total."
										if(M.ItemBullets <= 0)
											M.weight -= src.weight
											del src
									else
										M.Owner << "Can't load any more bullets at the moment, you already have 10."
								if(Result == "Combine")
									src.ItmID = rand(1,70000)
									for(var/obj/Items/Shafts/Bullet/B in M)
										B.ItmID = rand(1,70000)
										if(B.ItmID != src.ItmID)
											src.ItemBullets += B.ItemBullets
											M.Owner << "Bullets combined into one stack."
											src.name = "[src.ItemBullets] Bullets"
											src.desc = "These are [src.ItemBullets] bullets, press Load to add them to your bullet total."
											M.weight -= B.weight
											del B
								if (Result == "Split")
									if(src.suffix == "(Carrying)")
										if(src)
											if(M.weight <= M.weightmax)
												if(src.ItemBullets >= 2)
													if(src.suffix == "(Carrying)")
														var/N = input("Amount")as null|num
														if(!N)
															return
														if(N >= src.ItemBullets)
															return
														if(N <= 0)
															return
														var/obj/Items/Shafts/Bullet/B = new
														B.ItemBullets = N
														src.ItemBullets -= N
														B.loc = M
														M.weight += B.weight
														B.suffix = "(Carrying)"
														B.name = "[B.ItemBullets] Bullets"
														src.name = "[src.ItemBullets] Bullets"
														B.desc = "These are [B.ItemBullets] bullets, press Load to add them to your bullet total."
														src.desc = "These are [src.ItemBullets] bullets, press Load to add them to your bullet total."
														return
			EvilChristmasPresent
				icon = 'Book.dmi'
				icon_state = "ChristmasBox"
				name = "Box"
				weight = 2
				suffix = null
				desc = "This is a box! You wonder what's inside! (Random)."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Open"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Open")
									var/Book1 = prob(5)
									var/Skorn = prob(15)
									var/EvilDemon = prob(20)
									var/SkeletonLord = prob(30)
									var/UnholyEyes = prob(30)
									if(Book1)
										var/obj/Items/Shafts/UnholyBook/B = new
										B.loc = M.loc
										view() << "[M] opens the box and grabs their present"
									else if(Skorn)
										var/mob/Monsters/NPCSkorn/B = new
										B.loc = M.loc
										view() << "[M] opens the box and Skorn, The Lord Of Pain, jumps out!"
									else if(EvilDemon)
										var/mob/Monsters/DemonNPC/B = new
										B.loc = M.loc
										view() << "[M] opens the box and a giant demon jumps out!"
									else if(SkeletonLord)
										var/mob/Monsters/FrogManChieftain/B = new
										B.loc = M.loc
										view() << "[M] opens the box and a frogman chieftan jumps out and attacks!"
									else
										var/mob/Monsters/NPCKobold/B = new
										B.loc = M.loc
										view() << "[M] opens the box and pulls out a hungry kobold."
									if(UnholyEyes)
										M.overlays += 'RedEye.dmi'
										view() << "[M] is possessed by an evil spirit that flew out of the box!"
										M.Defence += 5
										M.EXPNeeded -= 10
										M.Undead = 1
									M.weight -= src.weight
									del src
			Wand
				icon = 'Book.dmi'
				icon_state = "Wand"
				weight = 2
				suffix = null
				desc = "This is a (Possibly) magic wand, zap it to use the (possible) enchantment."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Rename"
								if(src.Enchanted == 0)
									menu += "EnVrage"
								if(src.Enchanted == 1)
									menu += "Zap"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Rename")
									var/T = input("Name wand here") as null|text
									if(!T)
										..()
									else
										src.name = "Wand of [Safe_Guard(T)]"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Zap")
									if("Innu" in src.Runelist)
										if("Kal" in src.Runelist || "Numex" in src.Runelist || "Summus" in src.Runelist)
											var/randt = rand(1,4)
											if(randt == 1)
												src.Target = M
											if(randt == 2)
												src.Target = M.MagicTarget
												if(M.MagicTarget in view(6,M))
													..()
												else
													M.Owner << "Target something first dumbass."
													return
												if(M.MagicTarget == M)
													M.Owner << "You can't target yourself with this wand."
											if(randt == 3)
												for(var/obj/Items/I in view(M))
													src.Target = I
											if(randt == 4)
												for(var/turf/T in view(M))
													src.Target = T
										else
											src.Target = M
									if("Kal" in src.Runelist)
										if("Innu" in src.Runelist || "Numex" in src.Runelist || "Summus" in src.Runelist)
											var/randt = rand(1,4)
											if(randt == 1)
												src.Target = M
											if(randt == 2)
												src.Target = M.MagicTarget
												if(M.MagicTarget in view(6,M))
													..()
												else
													M.Owner << "Target something first dumbass."
													return
												if(M.MagicTarget == M)
													M.Owner << "You can't target yourself with this wand."
											if(randt == 3)
												for(var/obj/Items/I in view(M))
													src.Target = I
											if(randt == 4)
												for(var/turf/T in view(M))
													src.Target = T
										else
											src.Target = M.MagicTarget
											if(M.MagicTarget in view(6,M))
												..()
											else
												M.Owner << "Target something first dumbass."
												return
											if(M.MagicTarget == M)
												M.Owner << "You can't target yourself with this wand."
												return
									if("Numex" in src.Runelist)
										if("Innu" in src.Runelist || "Numex" in src.Runelist || "Summus" in src.Runelist)
											var/randt = rand(1,4)
											if(randt == 1)
												src.Target = M
											if(randt == 2)
												src.Target = M.MagicTarget
												if(M.MagicTarget in view(6,M))
													..()
												else
													M.Owner << "Target something first dumbass."
													return
												if(M.MagicTarget == M)
													M.Owner << "You can't target yourself with this wand."
											if(randt == 3)
												for(var/obj/Items/I in view(M))
													src.Target = I
											if(randt == 4)
												for(var/turf/T in view(M))
													src.Target = T
										else
											for(var/turf/T in view(M))
												src.Target = T
									if("Summus" in src.Runelist)
										if("Innu" in src.Runelist || "Numex" in src.Runelist || "Summus" in src.Runelist)
											var/randt = rand(1,4)
											if(randt == 1)
												src.Target = M
											if(randt == 2)
												src.Target = M.MagicTarget
												if(M.MagicTarget in view(6,M))
													..()
												else
													M.Owner << "Target something first dumbass."
													return
												if(M.MagicTarget == M)
													M.Owner << "You can't target yourself with this wand."
											if(randt == 3)
												for(var/obj/Items/I in view(M))
													src.Target = I
											if(randt == 4)
												for(var/turf/T in view(M))
													src.Target = T
										else
											for(var/obj/Items/I in view(M))
												src.Target = I
									if(src.Content3 >= 1)
										src.Content3 -= 1
										view(M) << "[M] zaps [src]"
										if("Xhis" in src.Runelist)
											if("Dagra" in src.Runelist)
												if("Vrag" in src.Runelist)
													if("Voidus" in src.Runelist)
														var/EvilHappenings = rand(1,7)
														if(EvilHappenings == 1)
															view(M) << "[M] is sucked into the abyss by an unfortunate accident of fate!"
															del M
														if(EvilHappenings == 2)
															view(M) << "[src] explodes in a gigantic fireball of doom and engulfs everything near [M]!"
															for(var/mob/Monsters/K in view(1,M))
																K.Fire()
															for(var/turf/grounds/G in view(3,M))
																G.Firestorm()
														if(EvilHappenings == 3)
															view(M) << "A portal of terrible doom slashes open in front of [M], sucking them in and spewing out armies of hell!"
															var/mob/Monsters/DemonNPC/D1 = new
															var/mob/Monsters/DemonNPC/D2 = new
															var/mob/Monsters/DemonNPC/D3 = new
															var/mob/Monsters/DemonNPC/D4 = new
															var/mob/Monsters/DemonNPC/D5 = new
															D1.loc = M.loc
															D2.loc = M.loc
															D3.loc = M.loc
															D4.loc = M.loc
															D5.loc = M.loc
															M.loc = locate(M.x,M.y,4)
															var/mob/Monsters/DemonNPC/D6 = new
															var/mob/Monsters/DemonNPC/D7 = new
															D6.loc = M.loc
															D7.loc = M.loc
														if(EvilHappenings == 4)
															view(M) << "[M] goes completely insane from horrifying visions and goes berserk!"
															M.CanBeSlaved = 1
															M.Owner = "{NPC Demons}"
															M.overlays += 'RedEye.dmi'
															M.RandomWalk()
															usr.UnitList -= M
															usr.Selected.Remove(M)
															usr.client.images -= M.Star
														if(EvilHappenings == 5)
															var/type = rand(1,4)
															view(M) << "[M] undergoes a terrible metamorphosis into a small animal..."
															var/mob/Monsters/Mole/X = new
															X.loc = M.loc
															if(type == 1)
																X.icon = 'Animal.dmi'
																X.icon_state = "Normal"
																X.Mole = 0
																X.Deer = 1
															if(type == 2)
																X.icon = 'Bugs.dmi'
																X.icon_state = "Normal"
																X.Mole = 0
																X.Bug = 1
															if(type == 3)
																X.icon = 'DeathBeatle.dmi'
																X.icon_state = "Normal"
																X.Mole = 0
																X.Beatle = 1
															for(var/obj/I in M)
																I.suffix = "(Carrying)"
																I.loc = X
															X.name = M.name
															del(M)
														if(EvilHappenings == 6)
															for(var/mob/Monsters/K in usr.UnitList)
																K.GoingToDie = 1
																K.Killer = src
																K.DeathType = "Reverse Genocide"
																K.Death()
														if(EvilHappenings == 7)
															for(var/turf/grounds/G in view(8,M))
																G.MeteorStrike()
															world << "A meteor has struck at [M.x],[M.y],[M.z]!!!!"
										if("Xhis" in src.Runelist)
											if("Nuel" in src.Runelist)
												if("Chinx" in src.Runelist)
													if("Nurn" in src.Runelist)
														var/fail = 0
														if(fail == 1 || usr.key == "SsNefis")
															var/list/menu666 = new()
															menu666 += "Humans"
															menu666 += "Goblins"
															menu666 += "Dwarfs"
															menu666 += "Kobolds"
															menu666 += "Orcs"
															menu666 += "Lizardmen"
															menu666 += "Vampires"
															menu666 += "Werewolves"
															menu666 += "Dragons"
															menu666 += "Illithids"
															menu666 += "Spiders"
															menu666 += "Svartalfars"
															menu666 += "Demons / Half Demons"
															menu666 += "Cancel"
															var/Result2 = input(M.Owner, "What Race Will you Genocide?", "Choose", null) in menu666
															if(Result2 == "Cancel")
																world << "<b><font size=4>[M] has killed itself to avoid genociding a race!"
																M.GoingToDie = 1
																M.Killer = M
																M.DeathType = "Refusing to Genocide"
																M.Death()
															if(Result2 == "Humans")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Human == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Goblins")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Goblin == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Kobolds")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Kobold == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Orcs")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/Orc/K in world)
																	K.GoingToDie = 1
																	K.Killer = M
																	K.DeathType = "being Genocided"
																	K.Death()
															if(Result2 == "Dwarfs")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Dwarf == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Lizardmen")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.LizardMan == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Vampires")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Vampire == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Werewolves")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Werewolf == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Dragons")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/Dragon/K in world)
																	K.GoingToDie = 1
																	K.Killer = M
																	K.DeathType = "being Genocided"
																	K.Death()
															if(Result2 == "Illithids")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Illithid == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Spiders")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Spider == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Svartalfars")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Svartalfar == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															if(Result2 == "Demons / Half Demons")
																world << "<b><font color=red><font size=4>[usr] has genocided all [Result2]!!!"
																for(var/mob/Monsters/K in world)
																	if(K.Demon == 1 || K.HalfDemon == 1)
																		K.GoingToDie = 1
																		K.Killer = M
																		K.DeathType = "being Genocided"
																		K.Death()
															M.weight -= src.weight
															del src
														else
															var/EvilHappenings = rand(1,7)
															if(EvilHappenings == 1)
																view(M) << "[M] is sucked into the abyss by an unfortunate accident of fate!"
																del M
															if(EvilHappenings == 2)
																view(M) << "[src] explodes in a gigantic fireball of doom and engulfs everything near [M]!"
																for(var/mob/Monsters/K in view(1,M))
																	K.Fire()
																for(var/turf/grounds/G in view(3,M))
																	G.Firestorm()
															if(EvilHappenings == 3)
																view(M) << "A portal of terrible doom slashes open in front of [M], sucking them in and spewing out armies of hell!"
																var/mob/Monsters/DemonNPC/D1 = new
																var/mob/Monsters/DemonNPC/D2 = new
																var/mob/Monsters/DemonNPC/D3 = new
																var/mob/Monsters/DemonNPC/D4 = new
																var/mob/Monsters/DemonNPC/D5 = new
																D1.loc = M.loc
																D2.loc = M.loc
																D3.loc = M.loc
																D4.loc = M.loc
																D5.loc = M.loc
																M.loc = locate(M.x,M.y,4)
																var/mob/Monsters/DemonNPC/D6 = new
																var/mob/Monsters/DemonNPC/D7 = new
																D6.loc = M.loc
																D7.loc = M.loc
															if(EvilHappenings == 4)
																view(M) << "[M] goes completely insane from horrifying visions and goes berserk!"
																M.CanBeSlaved = 1
																M.Owner = "{NPC Demons}"
																M.overlays += 'RedEye.dmi'
																M.RandomWalk()
																usr.UnitList -= M
																usr.Selected.Remove(M)
																usr.client.images -= M.Star
															if(EvilHappenings == 5)
																var/type = rand(1,4)
																view(M) << "[M] undergoes a terrible metamorphosis into a small animal..."
																var/mob/Monsters/Mole/X = new
																X.loc = M.loc
																if(type == 1)
																	X.icon = 'Animal.dmi'
																	X.icon_state = "Normal"
																	X.Mole = 0
																	X.Deer = 1
																if(type == 2)
																	X.icon = 'Bugs.dmi'
																	X.icon_state = "Normal"
																	X.Mole = 0
																	X.Bug = 1
																if(type == 3)
																	X.icon = 'DeathBeatle.dmi'
																	X.icon_state = "Normal"
																	X.Mole = 0
																	X.Beatle = 1
																for(var/obj/I in M)
																	I.suffix = "(Carrying)"
																	I.loc = X
																X.name = M.name
																del(M)
															if(EvilHappenings == 6)
																for(var/mob/Monsters/K in usr.UnitList)
																	K.GoingToDie = 1
																	K.Killer = src
																	K.DeathType = "Reverse Genocide"
																	K.Death()
															if(EvilHappenings == 7)
																for(var/turf/grounds/G in view(8,M))
																	G.MeteorStrike()
																world << "A meteor has struck at [M.x],[M.y],[M.z]!!!!"
										if("Vrag" in src.Runelist)
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													B.Hunger -= 200
											M.Hunger -= 50
										if("Voidus" in src.Runelist)
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													if("Nuel" in src.Runelist)
														B.weight += rand(1,100)
													if("Gakrul" in src.Runelist)
														B.weight -= rand(1,100)
										if("Xhis" in src.Runelist)
											if("Xhis" in src.Runelist)
												var/EvilHappenings = rand(1,6)
												if(EvilHappenings == 1)
													view(M) << "[M] is sucked into the abyss by an unfortunate accident of fate!"
													del M
												if(EvilHappenings == 2)
													view(M) << "[src] explodes in a gigantic fireball of doom and engulfs everything near [M]!"
													M.Fire()
													for(var/turf/grounds/G in view(3,M))
														G.Firestorm()
												if(EvilHappenings == 3)
													view(M) << "A portal of terrible doom slashes open in front of [M], sucking them in and spewing out armies of hell!"
													var/mob/Monsters/DemonNPC/D1 = new
													var/mob/Monsters/DemonNPC/D2 = new
													var/mob/Monsters/DemonNPC/D3 = new
													var/mob/Monsters/DemonNPC/D4 = new
													var/mob/Monsters/DemonNPC/D5 = new
													D1.loc = M.loc
													D2.loc = M.loc
													D3.loc = M.loc
													D4.loc = M.loc
													D5.loc = M.loc
													M.loc = locate(M.x,M.y,4)
													var/mob/Monsters/DemonNPC/D6 = new
													var/mob/Monsters/DemonNPC/D7 = new
													D6.loc = M.loc
													D7.loc = M.loc
												if(EvilHappenings == 4)
													view(M) << "[M] goes completely insane from horrifying visions and goes berserk!"
													M.CanBeSlaved = 1
													M.Owner = "{NPC Demons}"
													M.overlays += 'RedEye.dmi'
													M.RandomWalk()
													usr.UnitList -= M
													usr.Selected.Remove(M)
													usr.client.images -= M.Star
												if(EvilHappenings == 5)
													var/type = rand(1,4)
													view(M) << "[M] undergoes a terrible metamorphosis into a small animal..."
													var/mob/Monsters/Mole/X = new
													X.loc = M.loc
													if(type == 1)
														X.icon = 'Animal.dmi'
														X.icon_state = "Normal"
														X.Mole = 0
														X.Deer = 1
													if(type == 2)
														X.icon = 'Bugs.dmi'
														X.icon_state = "Normal"
														X.Mole = 0
														X.Bug = 1
													if(type == 3)
														X.icon = 'DeathBeatle.dmi'
														X.icon_state = "Normal"
														X.Mole = 0
														X.Beatle = 1
													for(var/obj/I in M)
														I.suffix = "(Carrying)"
														I.loc = X
													X.name = M.name
													del(M)
										if("Nefis" in src.Runelist)
											for(var/mob/Monsters/L in view(M))
												if(L == src.Target)
													var/msg = pick("Are you feeling strange today?","Do you like apple pudding?","Xhis is the best rune for you.","Fuck you, I hate you, I never want to speak to you again!","I'm gay.","What is the capital of Paris?","I like squishy animals.","http://www.youtube.com/watch?v=bigKbTtDkk4","I like pineapple assrapes","Dungeon Master sucks, I'm quitting.","I hate SsNefis, he's a fucking faggot.","Death to the non-believers!","Fear the Cheese Golem.","Lolwtfbbwrawr.","Snoopie and the Red Baron fight again! This time in a PIZZA DEATHMATCH!","Watch out for the teenage mutant ninja cockroaches!","I'm afraid of the Spanish Inquisition, I think they're outside my house.","I WILL NEVER LOVE YOU!","I just watched this great movie on the Sci-Fi channel about alien cow rapers.","Pirates vs. Ninjas vs. Clowns, Who wins?","You're going to tell me the combo later?","Can I have a rare plz.","plz","rare plz.","how 2 mak vamp pot","How do u make the werwolf ring?","I like feeding my pet pig ham sammiches.","I eat dead people.","I'm actually a member of a top secret criminal investigation agency, you have been under surveilance for months, we finally have enough evidence to WTFPWN you, scumbag.","[M.Owner]! YOU FUCKING FUCKER! WHY DID YOU DO THAT!? I HATE YOU!","Do you like dancing accompanied by drugs, hip hop music, and naked hippos?","I like blueberries.","I'm allergic to smartness.","We are the last of the survivors of the nuclear holocaust, I fear that I will have to eat you to survive.","I think Runescape is better than WoW.","Nethack sucks.","Runescape sucks.","You suck.","I suck.","I'm a transvestite.")
													var/K = pick(Players)
													L.Owner<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[K];action=PM>[K]</a>:</font color> [html_encode(msg)]"
										if("Krex" in src.Runelist)
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													for(var/obj/Items/Shafts/Wand/S in B)
														S.Content3 = 0
													for(var/obj/Items/K in B)
														if(K.Enchanted == 1)
															K.Enchanted = 0
													B.Mana = 0
													B.MaxMana = 0
													view(B) << "[B] has been drained of all magic!"
										if("Nuel" in src.Runelist && "Gakrul" in src.Runelist)
											view(M) << "[src] creates a strange rift in time and space, firing deadly sparks in all directs and completely consuming everything [M] is holding!"
											for(var/mob/X in view(M))
												var/Hit = prob(50)
												if(Hit == 1)
													view(X) << "[X] is hit by a spark!"
													X.BloodContent -= 40
													X.BloodLoss()
											for(var/obj/I in M)
												if(I.suffix == "(Carrying)")
													M.weight -= I.weight
													del I
										if("Paes" in src.Runelist)
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													if("Nuel" in src.Runelist)
														view(B) << "[B]'s stats have been drained!"
														B.Strength -= 5
														B.Agility -= 5
														B.Intelligence -= 1
														B.Defence -= 5
														B.SaveToggle1 = 0
													if("Gakrul" in src.Runelist)
														if(B.SaveToggle1 == 0)
															view(B) << "[B]'s stats have been boosted!"
															B.Strength += 5
															B.Agility += 5
															B.Intelligence += 1
															B.Defence += 5
															B.SaveToggle1 = 1
										if("Lork" in src.Runelist)
											for(var/turf/B in view(M))
												if(B == src.Target)
													var/Possession = prob(5)
													if(Possession == 1)
														view(M) << "[M] has created an evil spirit of rage which possesses them!!!"
														M.CanBeSlaved = 1
														M.RandomWalk()
														M.overlays += 'RedEye.dmi'
														usr.UnitList -= M
														usr.Selected.Remove(M)
														usr.client.images -= M.Star
													else
														var/mob/X = pick(/mob/Monsters)
														new X(B.loc)
														X.loc = B
														if("Nuel" in src.Runelist || "Gakrul" in src.Runelist)
															if("Nuel" in src.Runelist)
																if(X.CanBeSlaved == 0)
																	view(M) << "[M] has created a hostile [X]!!!"
																	X.CanBeSlaved = 1
																	X.SneakingSkill = 125
																	X.RandomWalk()
															if("Gakrul" in src.Runelist)
																var/Dangerous = prob(75)
																if(Dangerous == 1)
																	if(X.CanBeSlaved == 0)
																		view(M) << "[M] has created a hostile [X]!!!"
																		X.CanBeSlaved = 1
																		X.SneakingSkill = 55
																		X.RandomWalk()
																else
																	X.CanBeSlaved = 0
																	X.IsNPC = 0
																	X.Owner = usr
																	usr.UnitList += X
																	view(M) << "[M] has created a friendly [X]!!!"
														else
															if(X.CanBeSlaved == 0)
																view(M) << "[M] has created a hostile [X]!!!"
																X.CanBeSlaved = 1
																X.SneakingSkill = 125
																X.RandomWalk()
											for(var/mob/B in view(M))
												if(B == src.Target)
													var/mob/MMM = B.Owner
													var/mob/X = pick(/mob/Monsters/Dwarf,/mob/Monsters/Gremlin,/mob/Monsters/NPC_Fishman_Lord,/mob/Monsters/NPCZombie,/mob/Monsters/Vampire,/mob/Monsters/Skeleton,/mob/Monsters/Orc,/mob/Monsters/CarnivorousPlant,/mob/Monsters/LizardMan,/mob/Monsters/Illithid,/mob/Monsters/Kobold,/mob/Monsters/Human,/mob/Monsters/Goblin,/mob/Monsters/DemonNPC,/mob/Monsters/Dragon,/mob/Monsters/FrogMan,/mob/Monsters/SpiderQueen,/mob/Monsters/Naga,/mob/Monsters/Gargoyle,/mob/Monsters/Werewolf)
													X.loc = B.loc
													view(B) << "[B] has been polymorphed into a [X]!"
													X.weightmax = B.weightmax
													X.weight = B.weight
													X.Strength = B.Strength
													X.Agility = B.Agility
													X.Intelligence = B.Intelligence
													X.MetalCraftingSkill = B.MetalCraftingSkill
													X.SwordSkill = B.SwordSkill
													X.ClawSkill = B.ClawSkill
													X.MaceSkill = B.MaceSkill
													X.BowSkill = B.BowSkill
													X.SpearSkill = B.SpearSkill
													X.ArmourSkill = B.ArmourSkill
													X.ShieldSkill = B.ShieldSkill
													X.MineingSkill = B.MineingSkill
													X.JewlCraftingSkill = B.JewlCraftingSkill
													X.PotionSkill = B.PotionSkill
													X.FishingSkill = B.FishingSkill
													X.SmeltingSkill = B.SmeltingSkill
													X.CookingSkill = B.CookingSkill
													X.LeatherCraftingSkill = B.LeatherCraftingSkill
													X.WoodCraftingSkill = B.WoodCraftingSkill
													X.BoneCraftingSkill = B.BoneCraftingSkill
													X.BuildingSkill = B.BuildingSkill
													X.PoisonSkill = B.PoisonSkill
													X.StoneCraftingSkill = B.StoneCraftingSkill
													X.MagicalAnger = B.MagicalAnger
													X.Mana = B.Mana
													X.MaxMana = B.MaxMana
													X.MagicalConcentration = B.MagicalConcentration
													X.MagicalWill = B.MagicalWill
													X.MagicalMind = B.MagicalMind
													X.Owner = B.Owner
													X.name = B.name
													X.Born = B.Born
													X.Mum = B.Mum
													X.Dad = B.Dad
													X.Gender = B.Gender
													X.Age = B.Age
													X.DieAge = B.DieAge
													MMM.UnitList += X
													for(var/obj/O in B)
														O.suffix = "(Carrying)"
														O.loc = X
													del B
													new X(B.loc)
										if("Dagra" in src.Runelist)
											if("Nuel" in src.Runelist)
												for(var/mob/Monsters/B in view(M))
													if(B == src.Target)
														var/Explode = prob(src.Content3 * 10)
														if(Explode == 1)
															B.icon = 'Blood.dmi'
															flick("LaserShot",B)
															view() << "[src] fires a ray of death at [B]!"
															B.Fire()

														else
															view(M) << "[src] implodes into a dark vortex of doom and sucks everything nearby into it!"
															for(var/turf/G in view(1,M))
																G.Darkshadow()
															for(var/mob/Monsters/K in view(0,M))
																K.GoingToDie = 1
																K.Killer = "[M]"
																K.DeathType = "being sucked into a dark void created by a wand"
																K.Death()
										if("Nurm" in src.Runelist)
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													if("Nuel" in src.Runelist)
														view(B) << "[B] is hit with a cone of force and knocked around!"
														B.x += rand(-4,4)
														B.y += rand(-4,4)
														B.BloodContent-= 15
														B.BloodLoss()
														for(var/turf/grounds/G in view(1,B))
															if(G.density == 1)
																view(B) << "[B] flies into [G] and is stunned!"
																B.BloodContent -= 30
																B.StunnedWalk()
																B.BloodLoss()
													if("Gakrul" in src.Runelist)
														if("Paes" in src.Runelist)
															var/X = input(B.Owner, "X Coordinate")as num
															var/Y = input(B.Owner, "X Coordinate")as num
															var/Z = input(B.Owner, "X Coordinate")as num
															B.Owner << "[B] phases instantly to a spot you chose!"
															B.x = X
															B.y = Y
															B.z = Z
														else
															B.Owner << "[B] is randomly phased through the dimensions by the wand zap!"
															B.x = rand(1,999)
															B.y = rand(1,999)
															B.z = rand(1,4)
															M.Owner << "[B] has been teleported to [B.x],[B.y],[B.z].!"
										if("Dipop" in src.Runelist)
											if("Dagra" in src.Runelist)
												view(M) << "[src] fizzles and sparks before exploding in a shower of harmless sparks!"
												for(var/turf/T in range(1,M))
													T.SparkleGlow()
												M.weight -= src.weight
												del src
												return
											for(var/obj/B in view(M))
												if(B == src.Target)
													if("Nuel" in src.Runelist)
														if(B.Enchanted == 0)
															B.Defence -= 5
															B.WeaponDamageMin -= 15
															B.WeaponDamageMax -= 15
															B.Enchanted = 1
															view(B) << "[B] seems to rust a bit..."
													if("Gakrul" in src.Runelist)
														if(B.Enchanted == 0)
															B.Defence += 5
															B.WeaponDamageMin -= 5
															B.WeaponDamageMax -= 5
															B.Enchanted = 1
															view(B) << "[B] seems to glow a bit..."
											for(var/turf/B in view(M))
												if(B == src.Target)
													view(M) << "[src] zaps at [src.Target], showering it with a spray of light that has no effect."
											for(var/mob/Monsters/B in view(M))
												if(B == src.Target)
													if("Nuel" in src.Runelist)
														B.HP -= 5
														B.BloodContent -= 15
														B.BloodLoss()
														B.Enchanted = 1
														view(B) << "[B] is zapped with [src] and recieves minor damage from a shower of sparks!"
													if("Gakrul" in src.Runelist)
														var/Fullheal = prob(src.CR)
														B.HP += 5
														B.BloodContent += 50
														B.CanSee = 1
														B.Enchanted = 1
														if(Fullheal == 1)
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
															M.CanSee = 1
															M.BloodContent = M.MaxBloodContent
															M.BleedType = null
															M.LimbLoss()
															view(B) << "[B] is zapped with [src] and fully heals!."
														else
															view(B) << "[B] is zapped with [src] and begins to look healthier."
									else
										view(M) << "[src] fizzles and pops, it has no charges left."
										M.weight -= src.weight
										del src
										return
								if (Result == "EnVrage")
									var/list/menu4 = new()
									menu4 += "Nuel"
									menu4 += "Innu"
									menu4 += "Vrag"
									menu4 += "Dipop"
									menu4 += "Lork"
									menu4 += "Xhis"
									menu4 += "Paes"
									menu4 += "Gakrul"
									menu4 += "Nurn"
									menu4 += "Yern"
									menu4 += "Nurm"
									menu4 += "Summus"
									menu4 += "Nefis"
									menu4 += "Ners"
									menu4 += "Ra"
									menu4 += "Numex"
									menu4 += "Krex"
									menu4 += "Kal"
									menu4 += "Dars"
									menu4 += "Chinx"
									menu4 += "Dagra"
									menu4 += "Voidus"
									menu4 += "Cancel"
									if("Nuel" in src.Runelist)
										menu4 -= "Nuel"
									if("Innu" in src.Runelist)
										menu4 -= "Innu"
									if("Dipop" in src.Runelist)
										menu4 -= "Dipop"
									if("Lork" in src.Runelist)
										menu4 -= "Lork"
									if("Paes" in src.Runelist)
										menu4 -= "Paes"
									if("Gakrul" in src.Runelist)
										menu4 -= "Gakrul"
									if("Nurm" in src.Runelist)
										menu4 -= "Nurm"
									if("Summus" in src.Runelist)
										menu4 -= "Summus"
									if("Yern" in src.Runelist)
										menu4 -= "Yern"
									if("Ners" in src.Runelist)
										menu4 -= "Ners"
									if("Ra" in src.Runelist)
										menu4 -= "Ra"
									if("Numex" in src.Runelist)
										menu4 -= "Numex"
									if("Krex" in src.Runelist)
										menu4 -= "Krex"
									if("Kal" in src.Runelist)
										menu4 -= "Kal"
									if("Dagra" in src.Runelist)
										menu4 -= "Dagra"
									if("Voidus" in src.Runelist)
										menu4 -= "Voidus"
									if("Chinx" in src.Runelist)
										menu4 -= "Chinx"
									if("Dars" in src.Runelist)
										menu4 -= "Dars"
									if("Xhis" in src.Runelist)
										menu4 -= "Xhis"
									if("Vrag" in src.Runelist)
										menu4 -= "Vrag"
									if("Nurn" in src.Runelist)
										menu4 -= "Nurn"
									if("Nefis" in src.Runelist)
										menu4 -= "Nefis"
									if(src.Content <= 3)
										var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu4
										if(Result2 == "Cancel")
											return
										if(Result2 == "Innu")
											src.Content += 1
											src.Runelist += "Innu"
										if(Result2 == "Nuel")
											src.Content += 1
											src.Runelist += "Nuel"
										if(Result2 == "Dipop")
											src.Content += 1
											src.Runelist += "Dipop"
										if(Result2 == "Lork")
											src.Content += 1
											src.Runelist += "Lork"
										if(Result2 == "Paes")
											src.Content += 1
											src.Runelist += "Paes"
										if(Result2 == "Gakrul")
											src.Content += 1
											src.Runelist += "Gakrul"
										if(Result2 == "Nurm")
											src.Content += 1
											src.Runelist += "Nurm"
										if(Result2 == "Summus")
											src.Content += 1
											src.Runelist += "Summus"
										if(Result2 == "Yern")
											src.Content += 1
											src.Runelist += "Yern"
											src.Runelist += pick("Summus","Nurm","Gakrul","Paes","Lork","Dipop","Nuel","Ners","Ra","Numex","Krex","Kal","Dagra","Nurn","Vrag","Xhis","Xhis","Xhis","Dars","Chinx","Voidus","Nefis")
										if(Result2 == "Ners")
											src.Content += 1
											src.Runelist += "Ners"
										if(Result2 == "Ra")
											src.Content += 1
											src.Runelist += "Ra"
										if(Result2 == "Numex")
											src.Content += 1
											src.Runelist += "Numex"
										if(Result2 == "Krex")
											src.Content += 1
											src.Runelist += "Krex"
										if(Result2 == "Kal")
											src.Content += 1
											src.Runelist += "Kal"
										if(Result2 == "Dagra")
											src.Content += 1
											src.Runelist += "Dagra"
										if(Result2 == "Nurn")
											src.Content += 1
											src.Runelist += "Nurn"
										if(Result2 == "Vrag")
											src.Content += 1
											src.Runelist += "Vrag"
										if(Result2 == "Xhis")
											src.Content += 1
											src.Runelist += "Xhis"
										if(Result2 == "Dars")
											src.Content += 1
											src.Runelist += "Dars"
										if(Result2 == "Chinx")
											src.Content += 1
											src.Runelist += "Chinx"
										if(Result2 == "Voidus")
											src.Content += 1
											src.Runelist += "Voidus"
										if(Result2 == "Nefis")
											src.Content += 1
											src.Runelist += "Nefis"
										M.Owner << "[Result2] has been enVraged on [src]."
										if(src.Content == 4)
											src.Enchanted = 1
											M.Owner << "[src] has been fully enVraged."
									else
										M.Owner << "[src] has already been fully enVraged."
				New()
					src.Runelist=list()
			MagicScroll
				icon = 'Book.dmi'
				icon_state = "Scroll"
				weight = 2
				suffix = null
				desc = "An empty scroll."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Svartalfar == 1 && src.Content2 == 0)
									menu += "Write Magic"
								if(M.Intelligence >= 10 && M.MagicalAptitude == 1)
									menu += "Write Magic"
								if(src.Content2 != 0 && M.Intelligence >= 1)
									menu += "Cast"
								if(src.Content2 != 0 && M.Intelligence < 1)
									menu += "[M]'s too stupid to read"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if(Result == "[M]'s too stupid to read")
									M.Owner << pick("[M] gnaws on the paper and tears it to shreds!","[M] sits down and draws stupid scribbles all over the paper and ruins it!","[M] sets the paper on fire and watches it burn","[M] uses the scroll to wipe dirt off of it's face.","[M] thinks the scroll is a treasure map but is confused about the difDipopent X's marking the spots, so it throws it away.")
									M.weight -= src.weight
									del src
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Cast")
									if (src.Content2 == "Nether Travel")
										view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
										M.loc = locate(M.x,M.y,4)
										M.weight -= src.weight
										del src
									if (src.Content2 == "Teleportation")
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
										for(var/turf/T in view(0,M))
											if(T.density == 1 && T.opacity == 1)
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
											M.weight -= src.weight
											del src
									if (src.Content2 == "Nether Return")
										M.loc = locate(M.x,M.y,1)
										view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
										M.weight -= src.weight
										del src
									if (src.Content2 == "Furious Manifestation")
										if(M.DelayedSummoning == 0 && src)
											var/mob/Monsters/Manifestation/F = new()
											F.loc = M.loc
											F.Owner = M.Owner
											F.WeaponDamageMin = M.Intelligence*2
											F.WeaponDamageMax = (M.Intelligence*2) + 2
											F.name = "Furious Manifestation"
											view(M) << "[M] summons a shadow from the nether plane!!"
											M.DelayedSummoning = 1
											spawn(50)
												M.DelayedSummoning = 0
											spawn(150)
												del F
											M.weight -= src.weight
											del src
										else
											M.Owner << "Wait a few seconds to summon another!"
									if (src.Content2 == "Nether Manifestation")
										if(M.DelayedSummoning == 0 && src)
											if(M.NetherManCount <= 4)
												var/mob/Monsters/Manifestation/F = new()
												F.loc = M.loc
												F.Owner = M.Owner
												F.WeaponDamageMin = M.Intelligence*2
												F.WeaponDamageMax = (M.Intelligence*2) + 2
												F.name = "{[usr]} Nether Manifestation"
												F.MagicalConcentration = 40
												F.MagicalAptitude = 1
												F.CanBeSlaved = 0
												M.DieAge -= 5
												M.NetherManCount += 1
												M.weight -= src.weight
												usr.UnitList += F
												M.DelayedSummoning = 1
												spawn(400)
													M.DelayedSummoning = 0
												M.weight -= src.weight
												del src
											else
												M.Owner << "You can make a maximum of 4 of these!"
										else
											M.Owner << "Wait 40 seconds between summonings of these!"
									if (src.Content2 == "Nether Ray")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												if(MM.User == 0)
													view(M) << "[M] fires a beam of pure nether enegry at [MM]!"
													missile(/obj/netherray,M,MM)
													MM.RightArmHP -= M.Intelligence*2
													MM.LeftArmHP -= M.Intelligence*2
													MM.RightLegHP -= M.Intelligence*2
													MM.LeftLegHP -= M.Intelligence*2
													MM.BloodContent -= M.Intelligence*3
													MM.BloodLoss()
													MM.LimbLoss()
													M.weight -= src.weight
													del src
									if (src.Content2 == "Damage Mind")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
												MM.EXP = 0
												MM.SwordSkill -= M.Intelligence/2
												MM.AxeSkill -= M.Intelligence/2
												MM.MaceSkill -= M.Intelligence/2
												MM.MetalCraftingSkill -= M.Intelligence/2
												MM.LeatherCraftingSkill -= M.Intelligence/2
												MM.MagicalConcentration -= M.Intelligence/2
												MM.MagicalAnger -= M.Intelligence/2
												MM.MagicalWill -= M.Intelligence/2
												MM.UnArmedSkill -= M.Intelligence/2
												M.weight -= src.weight
												del src
									if (src.Content2 == "Steal Thoughts")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
												MM.EXP = 0
												MM.SwordSkill -= M.Intelligence/2
												MM.AxeSkill -= M.Intelligence/2
												MM.MaceSkill -= M.Intelligence/2
												MM.MetalCraftingSkill -= M.Intelligence/2
												MM.LeatherCraftingSkill -= M.Intelligence/2
												MM.MagicalConcentration -= M.Intelligence/2
												MM.MagicalAnger -= M.Intelligence/2
												MM.MagicalWill -= M.Intelligence/2
												MM.UnArmedSkill -= M.Intelligence/2
												M.EXP += M.Intelligence*3
												M.SwordSkill += M.Intelligence/2
												M.AxeSkill += M.Intelligence/2
												M.MaceSkill += M.Intelligence/2
												M.MetalCraftingSkill += M.Intelligence/2
												M.LeatherCraftingSkill += M.Intelligence/2
												if(MM.MagicalAptitude == 1)
													if(M.MagicalConcentration <= 50)
														M.MagicalConcentration += M.Intelligence/2
													if(M.MagicalWill <= 50)
														M.MagicalWill += M.Intelligence/2
													if(M.MagicalAnger <= 50)
														M.MagicalAnger += M.Intelligence/2
												M.UnArmedSkill += M.Intelligence/2
												M.weight -= src.weight
												del src
									if (src.Content2 == "Insanity")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
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
													M.weight -= src.weight
													del src
													return
									if (src.Content2 == "Nether Alteration")
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
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
										if(Result3 == "Nether")
											for(var/mob/Monsters/MM in view(4,usr))
												if(MM.Owner != usr)
													usr << "You can't use this on someone elses units."
													return
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
										if(Result3 == "Snow")
											for(var/mob/Monsters/MM in view(4,usr))
												if(MM.Owner != usr)
													usr << "You can't use this on someone elses units."
													return
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
										if(Result3 == "Desert")
											for(var/mob/Monsters/MM in view(4,usr))
												if(MM.Owner != usr)
													usr << "You can't use this on someone elses units."
													return
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
										if(Result3 == "Hell")
											for(var/mob/Monsters/MM in view(4,usr))
												if(MM.Owner != usr)
													usr << "You can't use this on someone elses units."
													return
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
										if(Result3 == "Mountains")
											for(var/mob/Monsters/MM in view(4,usr))
												if(MM.Owner != usr)
													usr << "You can't use this on someone elses units."
													return
											if(M in range(100,usr) && src)
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
												M.weight -= src.weight
												del src
											else
												usr << "[M] needs to be within 100 spaces of the target to use this!"
												return
									if (src.Content2 == "Willful Alteration")
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
										if(Result3 == "Grass" && src)
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
											M.weight -= src.weight
											del src
										if(Result3 == "Snow" && src)
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
											M.weight -= src.weight
											del src
										if(Result3 == "Desert" && src)
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
											M.weight -= src.weight
											del src
										if(Result3 == "Hell" && src)
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
											M.weight -= src.weight
											del src
										if(Result3 == "Mountains" && src)
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
											M.weight -= src.weight
											del src
									if (src.Content2 == "Destructive Alteration")
										for(var/mob/Monsters/MK in range(4,usr))
											if(MK.Owner != usr)
												usr << "You can't cast this directly on a unit."
												return
										var/list/menu3 = new()
										menu3 += "Lava"
										menu3 += "Water"
										menu3 += "Cancel"
										var/Result3 = input("Do What?", "Choose", null) in menu3
										if (Result3 != "Cancel")
											..()
										if(Result3 == "Lava" && src)
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
											M.weight -= src.weight
											del src
										if(Result3 == "Water" && src)
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
											M.weight -= src.weight
											del src
								if (Result == "Write Magic")
									var/list/menu2 = new()
									menu2 += "Cancel"
									if(M.MagicalConcentration >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Nether Travel"
										menu2 += "Nether Return"
										if(M.MagicalWill >= 20)
											menu2 += "Nether Alteration"
										if(M.MagicalAnger >= 25)
											menu2 += "Nether Ray"
									if(M.MagicalWill >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Willful Alteration"
									if(M.MagicalAnger >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Furious Manifestation"
										if(M.MagicalWill >= 25)
											menu2 += "Destructive Alteration"
										if(M.MagicalConcentration >= 25)
											menu2 += "Nether Manifestation"
									if(M.MagicalMind >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Insanity"
										if(M.MagicalAnger >= 20)
											menu2 += "Damage Mind"
											if(M.MagicalConcentration >= 25)
												menu2 += "Steal Thoughts"
										if(M.MagicalWill >= 25)
											menu2 += "Teleportation"
									var/Result2 = input("Do What?", "Choose", null) in menu2
									if (Result2 != "Cancel")
										..()
									if (Result2 == "Nether Travel")
										if(M.Mana >= 10 - M.MagicalConcentration / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 10 - M.MagicalConcentration / 10
										else
											M.Owner << "You need [10 - M.Mana] more mana."
									if (Result2 == "Teleportation")
										if(M.Mana >= 80 - M.MagicalWill / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 80 - M.MagicalWill / 10
										else
											M.Owner << "You need [80 - M.Mana] more mana."
									if (Result2 == "Nether Return")
										if(M.Mana >= 10 - M.MagicalConcentration / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 10
										else
											M.Owner << "You need [10 - M.Mana] more mana."
									if (Result2 == "Furious Manifestation")
										if(M.Mana >= M.MagicalAnger)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalAnger
										else
											M.Owner << "You need [M.MagicalAnger - M.Mana] more mana."
									if (Result2 == "Nether Manifestation")
										if(M.Mana >= M.MagicalConcentration * 3)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalConcentration * 3
										else
											M.Owner << "You need [M.MagicalConcentration * 3 - M.Mana] more mana."
									if (Result2 == "Nether Ray")
										if(M.Mana >= M.MagicalAnger)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalAnger
										else
											M.Owner << "You need [M.MagicalAnger - M.Mana] more mana."
									if (Result2 == "Damage Mind")
										if(M.Mana >= M.MagicalMind / 2)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalMind / 2
										else
											M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
									if (Result2 == "Steal Thoughts")
										if(M.Mana >= M.MagicalMind * 2)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalMind * 2
										else
											M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
									if (Result2 == "Insanity")
										if(M.Mana >= 25)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 25
											return
										else
											M.Owner << "You need [25 - M.Mana] more mana."
									if (Result2 == "Nether Alteration")
										if(M.Mana >= 30)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 30
										else
											M.Owner << "You need [30 - M.Mana] more mana."
									if (Result2 == "Willful Alteration")
										if(M.Mana >= 50)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 50
										else
											M.Owner << "You need [50 - M.Mana] more mana."
									if (Result2 == "Destructive Alteration")
										if(M.Mana >= 100)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 100
										else
											M.Owner << "You need [100 - M.Mana] more mana."
			SkillScroll
				icon = 'Book.dmi'
				icon_state = "SkillScroll"
				weight = 2
				suffix = null
				desc = "This Scroll Will Let A Unit Learn the written Skill."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Learn Skill"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
								if (Result == "Learn Skill")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										if(M.SwordSkill <= A1.ScrollSwordSkill)
											M.SwordSkill = A1.ScrollSwordSkill
										if(M.AxeSkill <= A1.ScrollAxeSkill)
											M.AxeSkill = A1.ScrollAxeSkill
										if(M.MetalCraftingSkill <= A1.ScrollMetalCraftingSkill)
											M.MetalCraftingSkill = A1.ScrollMetalCraftingSkill
										if(M.WoodCraftingSkill <= A1.ScrollWoodCraftingSkill)
											M.WoodCraftingSkill = A1.ScrollWoodCraftingSkill
										if(M.MaceSkill <= A1.ScrollMaceSkill)
											M.MaceSkill = A1.ScrollMaceSkill
										if(M.MineingSkill <= A1.ScrollMineingSkill)
											M.MineingSkill = A1.ScrollMineingSkill
										if(M.LeatherCraftingSkill <= A1.ScrollLeatherCraftingSkill)
											M.LeatherCraftingSkill = A1.ScrollLeatherCraftingSkill
										M.EXPNeeded -= A1.ScrollEXP
										view() << "[M] reads the scroll, possibly learning something if the writer was more knowledgable than [M]... The scroll disintigrates and dissappears when [M] finishes reading it."
										M.weight -= A1.weight
										del A1
										return
			Sign
				icon = 'Cave.dmi'
				icon_state = "sign"
				weight = 5
				suffix = null
				desc = "This is a sign post, use it to put warnings and other messages on."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			MetalFlask
				icon = 'LeatherItems.dmi'
				icon_state = "Flask"
				weight = 5
				suffix = null
				desc = "This is a metal flask, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										if(src.HasWater != "Unholy" && src.HasWater != "Holy")
											menu += "Drink"
										else
											menu += "Bless Equipped Weapon"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 20
										V.BloodLoss()
										V.Death()
										return
									src.Coldness = 0
								if(Result == "Bless Equipped Weapon")
									for(var/obj/Items/Weapons/W in M)
										if(W.suffix == "(Equiped)" && W.Content3 == 0)
											if(src.HasWater == "Unholy")
												W.name = "[W.name] - Cursed"
												W.Content3 = "Cursed"
											if(src.HasWater == "Holy")
												W.name = "[W.name] - Blessed"
												W.Content3 = "Blessed"
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			WoodenBucket
				icon = 'WoodItems.dmi'
				icon_state = "Bucket"
				weight = 7
				suffix = null
				desc = "This is a wooden bucket, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
									if(V.Gender == "Female")
										if(V.Spider == 0 && V.Bug == 0 && V.Beatle == 0 && V.LizardMan == 0)
											menu += "Milk"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										menu += "Drink"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 20
										V.BloodLoss()
										V.Death()
										return
									src.Coldness = 0
								if (Result == "Milk")
									for(var/mob/Monsters/V in oview(1,M))
										if(V.Gender == "Female")
											if(V.Spider == 0 && V.Bug == 0 && V.Beatle == 0 && V.LizardMan == 0)
												if(V.Hunger >= 25)
													var/GG = 0
													src.HasWater = "Milk"
													if(V.Race == "Dragon")
														GG = "Dragon"
													if(V.Race == "Elf")
														GG = "Elf"
													if(V.Race == "Orc")
														GG = "Orc"
													if(V.Race == "Gremlin")
														GG = "Gremlin"
													if(V.Demon == 1)
														GG = "Demon"
													if(V.Mole == 1)
														GG = "Mole"
													if(V.FrogMan == 1)
														GG = "Frogman"
													if(V.Infects == 1)
														GG = "Zombie"
													if(V.Ratmen == 1)
														GG = "Ratman"
													if(V.Werepowers == 1)
														GG = "Werewolf"
													if(V.Wolf == 1)
														GG = "Wolf"
													if(V.Vampire == 1)
														GG = "Vampire"
													if(V.Deer == 1)
														GG = "Deer"
													if(V.Human == 1)
														GG = "Human"
													if(V.Goblin == 1)
														GG = "Goblin"
													if(V.Kobold == 1)
														GG = "Kobold"
													if(V.Dwarf == 1)
														GG = "Dwarf"
													src.Content3 = GG
													if(src.Content3 == 0)
														src.Content3 = "Unknown"
													V.Hunger -= 10
													view() << "[M] grabs [V] and milks her"
													return
												else
													usr << "[V] is too hungry!"
									src.Coldness = 0
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(src.HasWater == "Milk")
										M.Owner << "[M] drinks [src.Content3] milk from [src]"
										M.Hunger += 10
										if(M.Hunger >= 100)
											M.Hunger = 100
										src.HasWater = null
										src.Content3 = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			LeatherFlask
				icon = 'LeatherItems.dmi'
				icon_state = "Flask"
				weight = 5
				suffix = null
				desc = "This is a leather flask, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										if(src.HasWater != "Unholy" && src.HasWater != "Holy")
											menu += "Drink"
										else
											menu += "Bless Equipped Weapon"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 20
										V.BloodLoss()
										V.Death()
										return
									src.Coldness = 0
								if(Result == "Bless Equipped Weapon")
									for(var/obj/Items/Weapons/W in M)
										if(W.suffix == "(Equiped)" && W.Content3 == 0)
											if(src.HasWater == "Unholy")
												W.name = "[W.name] - Cursed"
												W.Content3 = "Cursed"
											if(src.HasWater == "Holy")
												W.name = "[W.name] - Blessed"
												W.Content3 = "Blessed"
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			LockPick
				icon = 'Cave.dmi'
				icon_state = "LockPick"
				weight = 5
				suffix = null
				desc = "This is a lockpick, it can be used to open locked doors and chests, it will break if you fail to lockpick an item"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DoorKey
				icon = 'MetalObjects.dmi'
				icon_state = "Key"
				weight = 5
				suffix = null
				desc = "This is a key, it opens a door and is attuned to a door"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			TeleportationScroll
				icon = 'Book.dmi'
				icon_state = "SpellScroll"
				weight = 5
				suffix = null
				desc = "This scroll holds a spell that will be used up after you cast it.."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Teleport"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Teleport")
									var/X = M.icon
									var/Z = M.icon_state
									M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
									M.icon = 'Blood.dmi'
									M.icon_state = "AstralBurst"
									view() << "A glowing blue portal snaps into existance and [M] steps through it!"
									M.Tiredness -= 30
									spawn(10)
										M.icon = X
										M.icon_state = Z
										del src
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Standard
				icon = 'Standards.dmi'
				icon_state = "Generic"
				Content2 = "Standard"
				weight = 5
				suffix = null
				desc = "This is a standard marked to a certain clan, anyone can hold it to slowly recieve points for their clan."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									if(M.Wagon == 0)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "You can't put these inside chests/wagons."
								else
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				New()
					src.StandardGeneratePoints()

			Lodestone
				icon = 'Book.dmi'
				icon_state = "Lodestone"
				weight = 5
				suffix = null
				desc = "This is a lodestone marked to a certain location, any unit can use it to transport themselves there."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Teleport"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Teleport")
									var/X = M.icon
									M.x = src.LodestoneX; M.y = src.LodestoneY; M.z = src.LodestoneZ; if(M.client) M.client.eye = M;
									M.icon = 'Blood.dmi'
									flick("AstralBurst",M)
									view() << "[M] uses a lodestone to transport itself to this destination!"
									spawn(10)
										M.icon = X
										M.weight -= src.weight
										del src
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			SpireCrystal
				icon = 'Book.dmi'
				icon_state = "SpireCrystal"
				name = "Spire Crystal"
				weight = 5
				suffix = null
				desc = "This is a spire crystal, any unit can use it to place a spire to transport between two places of that god's territory."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Place Crystal"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Place Crystal")
									for(var/turf/grounds/G in view(0,usr))
										if(G.NeutralGodOwner == src.NeutralGodOwner)
											..()
										else
											usr << "You can only place these on the territory of the god that created them."
											return
									for(var/turf/grounds/G in view(0,M))
										if(G.NeutralGodOwner == src.NeutralGodOwner)
											..()
										else
											usr << "You can only place these on the territory of the god that created them."
											return
									var/obj/Spire/Port = new
									var/obj/Spire/Port2 = new
									Port.loc = M.loc
									Port.GoesTo = usr.loc
									Port2.loc = usr.loc
									Port2.GoesTo = M.loc
									view() << "Someone has created a spire with this location as the destination!!!"
									M.weight -= src.weight
									del src
									return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			ViralCrystal
				icon = 'Book.dmi'
				icon_state = "ViralCrystal"
				name = "Viral Crystal"
				weight = 5
				suffix = null
				desc = "This is a viral crystal marked to a certain neutral god, any unit can use it to spread that god's territory."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Place Crystal"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Place Crystal")
									var/turf/grounds/neutralturf/item = new (M.loc)
									item=item
									item.NeutralGodOwner = src.NeutralGodOwner
									if(M.z == 1)
										item.Sky = 1
									if(M.z == 2)
										item.Sky = 1
									if(M.z == 3)
										item.Content3 = "Peak"
									if(M.z == 4)
										item.Cant = 1
									M.weight -= src.weight
									del src
									return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			KillScroll
				icon = 'Book.dmi'
				icon_state = "SpellScroll"
				weight = 5
				suffix = null
				desc = "This scroll holds a spell that will be used up after you cast it.."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Kill"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Kill")
									for(var/mob/Monsters/T in oview(5,M))
										if(M.MagicTarget == T)
											T.icon = 'Blood.dmi'
											flick("LaserShot",T)
											view() << "[M] fires a ray of death at [T] killing it instantly!"
											spawn(10)
											del T
											del src
											return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			SpearHead
				icon = 'Cave.dmi'
				icon_state = "SpearHead"
				weight = 5
				suffix = null
				desc = "This is a spear head, it can be combined with a spear shaft to create a spear"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			WoodenSpade
				icon = 'Cave.dmi'
				icon_state = "Spade"
				weight = 5
				suffix = null
				desc = "This is a spade, it can be used to bury the dead or make farm land"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/obj/Items/Shafts/WoodenSpade/SP in M)
									for(var/turf/grounds/D in view(0,M))
										if(D.icon_state == "Desert")
											menu += "Dig Up Sand"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Dig Up Sand")
									if(M.weight <= M.weightmax)
										var/obj/Items/ores/Sand/S = new
										S.loc = M
										S.suffix = "(Carrying)"
										M.weight += S.weight
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			NecroBook
				icon = 'Book.dmi'
				icon_state = "Necromancer"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book seems to radiate an aura of pure malice, At the beginning there is a set of instructions: Raise Zombie: Creates an Undead Servant from a rotten corpse, :Raise Skeleton: Creates a Servant From a Skull, Dread Bolt: Fires a bolt of death at the nearest enemy, draining your own lifeforce to do so"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1 && M.NecromancySkill >= 1)
									menu += "Practice"
									if(M.NecromancySkill >= 5)
										menu += "Raise Zombie"
										menu += "Raise Skeleton"
										menu += "Dread Bolt"
									if(M.NecromancySkill >= 15)
										menu += "Raise Zombie II"
										menu += "Raise Skeleton II"
										menu += "Dread Bolt II"
										menu -= "Raise Zombie"
										menu -= "Raise Skeleton"
										menu -= "Dread Bolt"
									if(M.NecromancySkill >= 30)
										menu += "Raise Zombie III"
										menu += "Raise Skeleton III"
										menu += "Dread Bolt III"
										menu -= "Raise Zombie II"
										menu -= "Raise Skeleton II"
										menu -= "Dread Bolt II"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.NecromancySkill += 0.25
										M.Tiredness -= 45
										view() << "[M] opens the necromancy book and begins to practice a spell."
										M.PracticeSkill = 1
										spawn(100)
											M.PracticeSkill = 0
											M.Owner << "[M] has finished practicing and now has [M.NecromancySkill] Necromancy skill."
									else
										M.Owner << "[M] is already practicing a spell!"
								if (Result == "Raise Zombie")
									for(var/mob/Body/B in range())
										if (B.icon != "DeathBeatle.dmi")
											if (B.icon_state != "TFish")
												if (B.icon_state != "BlowFish")
													if (B.icon_state != "Fish")
														if (B.icon_state != "CaveFish")
															view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the putrid remains!"
															var/mob/Monsters/NecroZombie/Z = new
															Z.icon = B.icon
															Z.icon_state = B.icon_state
															Z.icon = turn(Z.icon,270)
															Z.Zombie()
															Z.loc = B.loc
															Z.Owner = usr
															Z.name = "[M]'s Zombie"
															Z.LimbLoss()
															Z.Undead = 1
															usr.UnitList += Z
															var/obj/Bloods/Zombie/O = new
															Z.overlays += O
															M.Tiredness -= 50
															M.Hunger -= 25
															M.NecromancySkill += 0.10
															del(B)
								if (Result == "Raise Zombie II")
									for(var/mob/Body/B in range())
										if (B.icon != "DeathBeatle.dmi")
											if (B.icon_state != "TFish")
												if (B.icon_state != "BlowFish")
													if (B.icon_state != "Fish")
														if (B.icon_state != "CaveFish")
															view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the putrid remains!"
															var/mob/Monsters/NecroZombie/Z = new
															Z.icon = B.icon
															Z.icon_state = B.icon_state
															Z.icon = turn(Z.icon,270)
															Z.Zombie()
															Z.EXPNeeded -= 100
															Z.Strength += 3
															Z.loc = B.loc
															Z.Owner = usr
															Z.name = "[M]'s Zombie"
															Z.LimbLoss()
															Z.Undead = 1
															usr.UnitList += Z
															var/obj/Bloods/Zombie/O = new
															Z.overlays += O
															M.Tiredness -= 35
															M.Hunger -= 20
															M.NecromancySkill += 0.10
															del(B)
								if (Result == "Raise Zombie III")
									for(var/mob/Body/B in range())
										if (B.icon != "DeathBeatle.dmi")
											if (B.icon_state != "TFish")
												if (B.icon_state != "BlowFish")
													if (B.icon_state != "Fish")
														if (B.icon_state != "CaveFish")
															view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the putrid remains!"
															var/mob/Monsters/NecroZombie/Z = new
															Z.icon = B.icon
															Z.icon_state = B.icon_state
															Z.icon = turn(Z.icon,270)
															Z.Zombie()
															Z.EXPNeeded -= 200
															Z.Strength += 10
															Z.loc = B.loc
															Z.Owner = usr
															Z.name = "[M]'s Zombie"
															Z.LimbLoss()
															Z.Undead = 1
															usr.UnitList += Z
															var/obj/Bloods/Zombie/O = new
															Z.overlays += O
															M.Tiredness -= 20
															M.Hunger -= 10
															M.NecromancySkill += 0.25
															del(B)
									return
								if (Result == "Raise Skeleton")
									for(var/obj/Items/Bones/Skull/B in range())
										var/mob/Monsters/Skeleton/Z = new
										view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the bones!"
										Z.icon = 'Skeleton.dmi'
										Z.icon_state = "Normal"
										Z.loc = B.loc
										Z.Owner = usr
										Z.name = "[M.name]'s Skeleton"
										Z.LimbLoss()
										usr.UnitList += Z
										Z.Undead = 1
										M.Tiredness -= 50
										M.Hunger -= 25
										M.NecromancySkill += 0.25
										del(B)
										return
								if (Result == "Raise Skeleton II")
									for(var/obj/Items/Bones/Skull/B in range())
										var/mob/Monsters/Skeleton/Z = new
										view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the bones!"
										Z.icon = 'Skeleton.dmi'
										Z.icon_state = "Normal"
										Z.loc = B.loc
										Z.EXPNeeded -= 100
										Z.Agility += 3
										Z.Owner = usr
										Z.name = "[M.name]'s Skeleton"
										Z.LimbLoss()
										usr.UnitList += Z
										Z.Undead = 1
										M.Tiredness -= 35
										M.Hunger -= 20
										M.NecromancySkill += 0.25
										del(B)
										return
								if (Result == "Raise Skeleton III")
									for(var/obj/Items/Bones/Skull/B in range())
										var/mob/Monsters/Skeleton/Z = new
										view() << "[M.name] fires a bolt of death energy into [B], raising an evil creature from the bones!"
										Z.icon = 'Skeleton.dmi'
										Z.icon_state = "Normal"
										Z.loc = B.loc
										Z.EXPNeeded -= 200
										Z.Agility += 10
										Z.Owner = usr
										Z.name = "[M]'s Skeleton"
										Z.LimbLoss()
										usr.UnitList += Z
										Z.Undead = 1
										M.Tiredness -= 20
										M.Hunger -= 10
										M.NecromancySkill += 0.25
										del(B)
										return
								if (Result == "Dread Bolt")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view(M) << "[M] fires a bolt of death energy into [V]!"
											view(M) << "[M] feels some of its lifeforce drained away by the bolt and becomes tired!"
											V.BloodContent -= 50
											V.BloodLoss()
											V.HP -= 25
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 25
											M.BloodContent -= 5
											M.BloodLoss()
											M.NecromancySkill += 0.25
											return
								if (Result == "Dread Bolt II")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view(M) << "[M] fires a bolt of death energy into [V]!"
											view(M) << "[M] feels some of its lifeforce drained away by the bolt and becomes tired!"
											V.BloodContent -= 75
											V.BloodLoss()
											V.HP -= 35
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 20
											M.BloodContent -= 5
											M.BloodLoss()
											M.NecromancySkill += 0.25
											return
								if (Result == "Dread Bolt III")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] fires a bolt of death energy into [V]!"
											V.BloodContent -= 75
											V.BloodLoss()
											V.HP -= 35
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.NecromancySkill += 0.25
											return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			MobileSandKing
				icon = 'Book.dmi'
				icon_state = "MobileSand"
				weight = 5
				suffix = null
				desc = "You can hear the sand king inside this caccoon, scratching against the inside with its slimy tendrils"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Release Sand King"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Release Sand King")
									if(src in M)
										var/mob/Monsters/SandKing/King = new
										King.loc = M.loc
										King.Owner = usr
										King.name = "{[usr]} Sand King"
										King.Age = 200
										King.SandKing2 = 1
										King.SandKing3 = 1
										King.SandKing4 = 1
										King.Hunger = 50
										for(var/obj/G in src)
											G.loc = King
											G.suffix = "(Carrying)"
											King.weight += G.weight
										usr.UnitList += King
										view() << "[M] places a small, yellow caccoon, with streaks of dark green, on the ground, The caccoon starts to crack, shake, and make a loud popping sound as a blobbish creature with no legs and a gaping mouth filled with tendrils escapes from it!"
										for(var/obj/Items/Shafts/MobileSandKing/Sand in M)
											M.weight -= Sand.weight
											del Sand
											break
									else
										usr << "Please do not try to release multiple sandkings from the same caccon, it does not work."
			EngineeredOrgan
				icon = 'Devourer.dmi'
				icon_state = "Organ"
				weight = 0
				NoDropOnDeath = 1
				suffix = null
				desc = "This disgusting organ appears to be alive and functioning, it is impossible to determine the original owner..."
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
			PortableDevourerCacoon
				icon = 'Devourer.dmi'
				icon_state = "Cacoon2"
				weight = 0
				name = "Dormant Cacoon"
				NoDropOnDeath = 1
				suffix = null
				desc = "The devourer is storing an unimaginable monstrosity in this pod constructed of reeking flesh, ready to be released upon the world at any time."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Inspect"
								menu += "Initiate Incubation"
								menu += "Add Organ"
								menu += "Remove Organ"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Initiate Incubation")
									if(src in M)
										var/mob/Monsters/DevourerSpawnCacoon/DCC = new
										DCC.loc = M.loc
										DCC.Owner = usr
										DCC.name = "{[usr]} Incubating Cacoon"
										for(var/obj/G in src)
											G.loc = DCC
										usr.UnitList += DCC
										view() << "[M] expells a putrid bag of rotting flesh and bones which promptly attaches itself to the nearest surface"
										M.weight -= src.weight
										del src
								if(Result == "Add Organ")
									if(src in M)
										var/list/menu2 = new
										for(var/obj/Items/Shafts/EngineeredOrgan/E in M)
											menu2 += E
										menu2 += "None"
										var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
										if(Result2 != "None")
											var/obj/I = Result2
											M.weight -= I.weight
											I.loc = src
								if(Result == "Remove Organ")
									if(src in M)
										var/list/menu2 = new
										for(var/obj/Items/Shafts/EngineeredOrgan/E in src)
											menu2 += E
										menu2 += "None"
										var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
										if(Result2 != "None")
											var/obj/I = Result2
											M.weight += I.weight
											I.loc = M
			DemonBook
				icon = 'Book.dmi'
				icon_state = "DemonBook"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book gives off a faint hint of brimstone and causes you to think of blood and doom."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1)
									menu += "Summon Demon"
									menu += "Unholy Transformation"
									menu += "Gate"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Summon Demon")
									var/One = prob(50)
									if(One)
										view() << "[M] waves its arms in strange patterns whilst a set of red runes floats into the air, [M] then claps it's hands and the runes fly into the air above [M]'s head and form a temporary gate to hell from which a demon escapes!"
										var/mob/Monsters/DemonNPC/Z = new
										Z.loc = M.loc
										Z.Owner = usr
										Z.name = "[M]'s Demon"
										usr.UnitList += Z
										Z.overlays += /obj/wing2/
										M.Tiredness -= 50
										M.Hunger -= 50
									else
										view() << "[M] waves its arms in strange patterns whilst a set of red runes floats into the air, [M] then claps it's hands and the runes explode in midair, showering fiery death down on [M]"
										M.BloodContent -= 75
										M.BloodLoss()
										M.Owner << "<b><font color=red>[M] is bleeding!!"
									return
								if (Result == "Unholy Transformation")
									if(M.Race != "Demon")
										if(M.Demon == 0)
											M.Owner << "[M] is possessed by demonic forces!"
											M.TurnDemon()
											M.Strength += 5
											M.Defence += 5
											M.EXPNeeded -= 25
											M.Demon = 1
									return
								if (Result == "Gate")
									var/choice2 = alert(usr, "Are you sure you want to sacrifice your unit and create a hell portal?", "Choose", "No", "Yes", null)
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
											P.loc = M.loc
											P.suffix = "Stuck"
											world<<"<b><font color=yellow>The land starts to shake as a strange rift in time and space tears open, creating a way to hell its self!-[M.x],[M.y],[M.z]"
											P.Spawn()
											var/obj/Portal/P2 = new
											P2.loc = locate(P.x,P.y,4)
											P2.suffix = "Stuck"
											P2.Content = P.z
											P2.Portal()
											view() << "[M] chants slowly... then rapidly flings a group of black sigils into the dirt, and is instantly consumed by a black, gaping maw out of which evil creatures seem to gaze"
											del M
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			SummoningBook
				icon = 'Book.dmi'
				icon_state = "Summon"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book flashes images of odd creatures in your mind as you hold it..."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1)
									menu += "Practice"
									menu += "Summon Goblin"
									menu += "Summon Devourer"
									menu += "Summon Spider"
									menu += "Summon Vampire"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Summon Goblin")
									if (M.Tiredness >= 50)
										var/One = prob(50)
										if(One)
											view() << "[M] chants in an ancient rhythym, and as a whistling sound grows in the distance to near deafening proportions an odd, green and gangly looking creature forms from the ground before your eyes!"
											var/mob/Monsters/Goblin/Z = new
											Z.loc = M.loc
											Z.Owner = usr
											Z.name = "{[usr]} Goblin"
											usr.UnitList += Z
											M.Tiredness -= 40
											M.Hunger -= 25
											M.SummoningSkill += 1
										else
											view() << "[M] attempts to cast a summoning spell, but seems to have made some error and nothing happens."
											M.Tiredness -= 50
											M.SummoningSkill += 0.5
										return
								if (Result == "Summon Spider")
									if (M.Tiredness >= 50)
										var/One = prob(40)
										if(One)
											view() << "[M] chants in an ancient rhythym, and as a hissing sound grows in the distance to near deafening proportions an eight legged monstrosity appears from a greenish cloud of mist that seems to have spontaineously appeared from thin air."
											var/mob/Monsters/Spider/Z = new
											Z.loc = M.loc
											Z.Owner = usr
											Z.name = "{[usr]} Spider Warrior"
											usr.UnitList += Z
											M.Tiredness -= 50
											M.Hunger -= 50
										else
											view() << "[M] attempts to cast a summoning spell, but seems to have made some error and nothing happens."
											M.Tiredness -= 65
										return
								if (Result == "Summon Vampire")
									if (M.Tiredness >= 50)
										var/One = prob(30)
										if(One)
											view() << "[M] chants in an ancient rhythym, and as a bubbling sound grows in the distance to near deafening proportions, a whitish haze rises from the crevaces and cracks in the ground, forming itself into a vaguely humanoid shape, it's eyes glow brightly red.... it progressively grows more solid until you see standing before you a gaunt, terrifying figure out of your worst nightmares.."
											var/mob/Monsters/Vampire/Z = new
											Z.loc = M.loc
											Z.Owner = usr
											Z.name = "{[usr]} Vampire"
											usr.UnitList += Z
											M.Tiredness -= 70
											M.Hunger -= 55
										else
											view() << "[M] attempts to cast a summoning spell, but seems to have made some error and nothing happens."
											M.Tiredness -= 85
										return
								if (Result == "Summon Devourer")
									if (M.Tiredness >= 50)
										var/One = prob(25)
										if(One)
											view() << "[M] chants in an ancient rhythym, and as a groaning sound grows in the distance to near deafening proportions, a bloody, grusome puddle slowly oozes from the ground, forming itself into a grisly ball of flesh and bone, burbling and making an otherworldly groaning noise....."
											var/mob/Monsters/Devourer/Z = new
											Z.loc = M.loc
											Z.Owner = usr
											Z.name = "{[usr]} Devourer"
											usr.UnitList += Z
											M.Tiredness -= 100
											M.Hunger -= 85
										else
											view() << "[M] attempts to cast a summoning spell, but seems to have made some error and nothing happens."
											M.Tiredness -= 100
										return
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.SummoningSkill += 0.25
										M.Tiredness -= 45
										view() << "[M] opens the Summoning book and begins to practice a spell."
										M.PracticeSkill = 1
										spawn(100)
											M.PracticeSkill = 0
											M.Owner << "[M] now has [M.SummoningSkill] Summoning skill."
									else
										M.Owner << "[M] is already practicing a spell!"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			TheForce
				icon = 'Book.dmi'
				icon_state = "TheForce"
				weight = 5
				suffix = null
				desc = "The Force is With You..."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Force Choke"
								menu += "Force Lightning"
								menu += "Force Throw"
								menu += "Throw Lightsaber"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Force Choke")
									for(var/mob/Monsters/V in oview(5,M))
										if(V == M.MagicTarget)
											V.CanWalk = 0
											V.BloodContent -= 25
											V.BloodLoss()
											view() << "[M] holds their hand up and uses Force Choke on [V]!!!"
											spawn(200)
												V.CanWalk = 1
												return
								if (Result == "Force Lightning")
									for(var/mob/Monsters/V in oview(5,M))
										if(V == M.MagicTarget)
											V.BloodContent -= 100
											V.BloodLoss()
											V.overlays += /obj/Lightning/
											view() << "[M] holds their hand up and fires dozens of bolts of Force Lightning into [V]!!!"
											spawn(300)
												V.overlays -= /obj/Lightning/
												return
								if (Result == "Force Throw")
									for(var/mob/Monsters/V in oview(5,M))
										if(V == M.MagicTarget)
											var/X = rand(-4,4)
											var/Y = rand(-4,4)
											V.loc = locate(V.x+X,V.y+Y,V.z)
											for(var/turf/T in view(0,V))
												if(T.density == 1)
													for(var/turf/T2 in range(5,V))
														if(T2.density == 0)
															V.loc = T2
															view(V) << "[V] is slammed into [T] and severely injured!"
															V.BloodContent -=40
															V.BloodLoss()
															V.Slowdown2()
															return
												else
													V.BloodContent -=15
													V.BloodLoss()
													view(V) << "[M] uses force throw on [V] and [V] is flung several yards and battered when it hits the ground!!!"
													return
								if (Result == "Throw Weapon")
									for(var/mob/Monsters/V in oview(5,M))
										if(V == M.MagicTarget)
											for(var/obj/Items/Weapons/W in M)
												if(W.suffix == "(Equiped)")
													V.BloodContent -= 50
													view() << "[M] quickly throws their [W] at [V] possibly severing a limb!"
													var/Limbs = rand(1,4)
													if(Limbs == 1)
														V.HasRightArm = 0
														V.LimbLoss()
													if(Limbs == 2)
														V.HasLeftArm = 0
														V.LimbLoss()
													if(Limbs == 3)
														V.HasRightLeg = 0
														V.LimbLoss()
													if(Limbs == 4)
														V.HasLeftLeg = 0
														V.LimbLoss()
													return
									return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

			UnholyBook
				icon = 'Book.dmi'
				icon_state = "Unholy"
				weight = 5
				suffix = null
				desc = "Angry red eyes stare out of the pages at you..."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Possess")
									for(var/mob/Monsters/V in view(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											if(V.Owner != M.Owner)
												V.Owner = M.Owner
												usr.UnitList += V
												view(M) << "[M] fires some sort of dark, evil spirit at [V] that takes control of their body!!!"
												return
								if (Result == "Dark Lash")
									for(var/mob/Monsters/V in view(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											V.BloodContent -= 100
											V.BloodLoss()
											view(M) << "[M] twirls their arm slightly as darkness gathers in a small orb in it's hand, Suddenly it slashes it's arm through the air in a whiplike motion and the orb of darkness grows into a long, thin tendril that strikes [V]!!!"
											return
								if (Result == "Paralyzing Darkness")
									for(var/mob/Monsters/V in view(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											V.CanWalk = 0
											view(M) << "[M] chants some sort of unholy mass as clouds of black mist swirl towards [V] engulfing it in the paralyzing essense of fear and making it unable to move!!!"
											spawn(100)
											V.CanWalk = 1
											return
								if (Result == "Blinding Darkness")
									for(var/mob/Monsters/V in view(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											V.BloodContent -= 50
											V.HasLeftEye = 0
											V.HasRightEye = 0
											V.CanSee = 0
											V.BloodLoss()
											V.LimbLoss()
											view(M) << "[M] twists their hand and says a short, malicious sounding mystic word, which drains the very light away for several feet, and then [M] opens their hand and *GRABS* a chunk of the gathered darkness and flings it at [V]'s eyes, causing them to grow dim and bleed profusely!"
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

			WorldMap
				icon = 'Book.dmi'
				icon_state = "Map"
				weight = 1
				suffix = null
				desc = "You stare at the map for a moment and look at all of the pretty decorations."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Swamp")
									usr << "The swamp is a wet place at the mid-southwest area and is filled with the race of *Lizardmen*, The swamp can be dangerous if the inhabitants are unfriendly"
									return
								if (Result == "Arctic")
									usr << "The arctic is a barren place, normally uninhabited, and well suited to the *Orcish* race."
									return
								if (Result == "Desert")
									usr << "The desert is unforgiving and harsh, normally only inhabited by tribes of humans intent on harnessing the power of alchemy."
									return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return



			GMBook
				icon = 'Book.dmi'
				icon_state = "GMBook"
				weight = 5
				suffix = null
				desc = "This book radiates the aura of the Ban Hammah!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Raise Zombie")
									for(var/mob/Body/B in range())
										var/mob/Monsters/Zombie/Z = new
										Z.icon = B.icon
										Z.icon_state = B.icon_state
										Z.icon = turn(Z.icon,270)
										Z.Zombie()
										Z.loc = B.loc
										Z.Owner = usr
										Z.name = "[usr] Zombie"
										Z.LimbLoss()
										usr.UnitList += Z
										var/obj/Bloods/Zombie/O = new
										Z.overlays += O
										del(B)
										return
								if (Result == "Raise Skeleton")
									for(var/obj/Items/Bones/Skull/B in range())
										var/mob/Monsters/Skeleton/Z = new
										Z.icon = 'Skeleton.dmi'
										Z.icon_state = "Normal"
										Z.Zombie()
										Z.loc = B.loc
										Z.Owner = usr
										Z.name = "[usr] Skeleton"
										Z.LimbLoss()
										usr.UnitList += Z
										del(B)
										return
								if (Result == "Chaotic Bolt")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] fires a bolt of chaotic energy into [V]!"
										V.icon = 'Blood.dmi'
										V.overlays = null
										V.CanWalk = 0
										flick("ChaosBurst",V)
										sleep(30)
										del(V)
										return
								if (Result == "Ban Hammah")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] Whacks [V] with the Ban Hammah!!!"
										V.icon = 'Blood.dmi'
										V.overlays = null
										V.CanWalk = 0
										flick("HolyBurst",V)
										sleep(30)
										del(V)
										return
								if (Result == "Chance")
									view() << "[M] controls the forces of chance!"
									M.EXP += 1000
									M.PotionSkill += 3
									M.ArmourSkill += 3
									M.ShieldSkill += 3
									M.SpearSkill += 3
									M.PoisonSkill += 3
									M.BoneCraftingSkill += 3
									M.UnArmedSkill += 3
									M.SneakingSkill += 3
									M.MaceSkill += 3
									M.FishingSkill += 3
									M.JewlCraftingSkill += 3
									M.MetalCraftingSkill += 3
									M.WoodCraftingSkill += 3
									M.SmeltingSkill += 3
									M.StoneCraftingSkill += 3
									M.LeatherCraftingSkill += 3
									return
								if (Result == "Teleport")
									var/X = M.icon
									M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
									M.icon = 'Blood.dmi'
									flick("AstralBurst",M)
									view() << "A glowing blue portal snaps into existance and [M] steps through it!"
									spawn(10)
									M.icon = X
									return
								if (Result == "Simulacrum")
									if(M.IsMist == 0)
										if(M.Morphed == 0)
											var/list/menu5 = new()
											menu5 += "Human"
											menu5 += "Dragon"
											menu5 += "Goblin"
											menu5 += "Devourer"
											menu5 += "Kobold"
											menu5 += "LizardMan"
											menu5 += "Orc"
											menu5 += "SpiderQueen"
											menu5 += "SpiderWarrior"
											menu5 += "Ghost"
											menu5 += "Demon"
											menu5 += "FrogMan"
											menu5 += "Skeleton"
											menu5 += "Vampire"
											menu5 += "Cancel"
											var/Result5 = input("Take on the Shape of What creature?", "Choose", null) in menu5
											if (Result5 != "Cancel")
												..()
											if (Result5 == "Human")
												M.icon = 'Human.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Dragon")
												M.icon = 'dragons.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Devourer")
												M.icon = 'Devourer.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Goblin")
												M.icon = 'Goblins.dmi'
												M.LimbLoss()
												return
											if (Result5 == "SpiderQueen")
												M.icon = 'SpiderQueenMature.dmi'
												M.LimbLoss()
												return
											if (Result5 == "SpiderQueen")
												M.icon = 'SpiderQueenMature.dmi'
												M.LimbLoss()
												return
											if (Result5 == "SpiderWarrior")
												M.icon = 'SpiderWarriorOlder.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Kobold")
												M.icon = 'Kobold.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Skeleton")
												M.icon = 'Skeleton.dmi'
												M.LimbLoss()
												return
											if (Result5 == "LizardMan")
												M.icon = 'LizardMan.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Orc")
												M.icon = 'OrcMale.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Demon")
												M.icon = 'Demon.dmi'
												M.LimbLoss()
												return
											if (Result5 == "FrogMan")
												M.icon = 'FrogMan.dmi'
												M.LimbLoss()
												return
											if (Result5 == "Vampire")
												M.icon = 'Vampire.dmi'
												M.LimbLoss()
												M.density = 1
										return
								if (Result == "Dread Bolt")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] fires a bolt of death energy into [V]!"
										view() << "[M] feels some of its lifeforce drained away by the bolt and becomes tired!"
										V.BloodContent -= 50
										V.BloodLoss()
										V.HP -= 25
										V.Owner << "<b><font color=red>[V] is bleeding!!"
										V.BloodLoss()
										return
								if (Result == "Incapacitate")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] waves his arms rapidly and screams, then points at [V] and a blast of heat sears [V]'s legs off!"
										V.CanWalk = 0
										V.CanSee = 0
										V.HasRightLeg = 0
										V.HasLeftLeg = 0
										V.LimbLoss()
										return
								if (Result == "Destruction")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] chants a mantra of destruction and focuses the evil energies on [V]!"
										V.icon = 'Blood.dmi'
										V.overlays = null
										V.CanWalk = 0
										flick("DestructionBurst",V)
										sleep(30)
										del(V)
										return
								if (Result == "Lash")
									for(var/mob/Monsters/V in oview(5,M))
										view() << "[M] lashes [V] with an invisible, fiery whip!"
										V.BloodContent -= 75
										V.BloodLoss()
										V.HP -= 50
										V.Owner << "<b><font color=red>[V] is bleeding!!"
										return
								if (Result == "Destroy Undead")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.Undead == 1)
											view() << "[M] fires a ray of holy light into [V] destroying the foul creature!"
											V.icon = 'Blood.dmi'
											V.overlays = null
											V.CanWalk = 0
											flick("HolyBurst",V)
											sleep(30)
											del(V)
										else if(V.Vampire == 1)
											view() << "[M] fires a ray of holy light into [V] destroying the foul vampire!"
											V.icon = 'Blood.dmi'
											V.overlays = null
											V.CanWalk = 0
											flick("HolyBurst",V)
											sleep(30)
											del(V)
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			DestructionBook
				icon = 'Book.dmi'
				icon_state = "DestructionBook"
				weight = 5
				suffix = null
				Enchanted = 1
				desc = "This book feels warm to the touch and seems to pulse with a life of its own, while you hold it images of fire and ruins fill your mind"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Practice"
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1)
									if(M.DestructionSkill >= 10)
										menu += "Lash"
									if(M.DestructionSkill >= 20)
										menu += "Incapacitate"
										menu -= "Lash"
										menu += "Lash II"
									if(M.DestructionSkill >= 35)
										menu -= "Incapacitate"
										menu -= "Lash II"
										menu += "Incapacitate II"
										menu -= "Lash III"
										menu += "Destruction"
									if(M.DestructionSkill >= 50)
										menu -= "Incapacitate II"
										menu += "Incapacitate III"
										menu -= "Destruction"
										menu += "Destruction II"
									if(M.DestructionSkill >= 80)
										menu -= "Destruction II"
										menu += "Destruction III"
										menu += "Summon Destroyer Sword"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.DestructionSkill += 0.25
										M.Tiredness -= 25
										view() << "[M] opens the destruction book and begins to practice a spell."
										M.PracticeSkill = 1
										spawn(100)
											M.PracticeSkill = 0
											M.Owner << "[M] has finished practicing and now has [M.DestructionSkill] Destruction skill."
									else
										M.Owner << "[M] is already practicing a spell!"
								if (Result == "Incapacitate")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] waves his arms rapidly and screams, then points at [V] and a blast of heat sears [V]'s legs off!"
											V.CanWalk = 0
											V.CanSee = 0
											V.HasRightLeg = 0
											V.HasLeftLeg = 0
											V.LegFling()
											V.LegFling()
											V.LimbLoss()
											M.Tiredness -= 70
											M.Hunger -= 70
											M.DestructionSkill += 0.25
											return
								if (Result == "Summon Destroyer Sword")
									var/obj/Items/Weapons/Swords/DestructionSword/A4 = new
									view() << "[M] slowly chants and sways, as a gaping red maw opens from the earth, spewing forth flames and brimstone..!"
									view() << "<b><font color =red>Pure essence of destruction forms from the maw into the shape of a blade!"
									world << "<FONT SIZE=+1><font color =red> Someone has created a Sword of Destruction!!!"
									A4.WeaponDamageMin = 100
									A4.WeaponDamageMax = 120
									A4.loc = M.loc
									A4.name = "Sword of Destruction - Ungodly Quality"
									M.DestructionSkill = 31
									return
								if (Result == "Incapacitate II")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] waves his arms rapidly and screams, then points at [V] and a blast of heat sears [V]'s legs off!"
											V.CanWalk = 0
											V.CanSee = 0
											V.HasRightLeg = 0
											V.HasLeftLeg = 0
											V.LegFling()
											V.LegFling()
											V.LimbLoss()
											M.Tiredness -= 50
											M.Hunger -= 50
											M.DestructionSkill += 0.25
											return
								if (Result == "Incapacitate III")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] waves his arms rapidly and screams, then points at [V] and a blast of heat sears [V]'s legs off!"
											V.CanWalk = 0
											V.CanSee = 0
											V.HasRightLeg = 0
											V.HasLeftLeg = 0
											V.LegFling()
											V.LegFling()
											V.LimbLoss()
											M.Tiredness -= 35
											M.Hunger -= 35
											M.DestructionSkill += 0.25
											return
								if (Result == "Destruction")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] chants a mantra of destruction and focuses the evil energies on [V], sacrificing both of it's arms to destroy [V]!"
											V.icon = 'Blood.dmi'
											V.overlays = null
											V.CanWalk = 0
											M.Tiredness -= 100
											M.HasLeftArm = 0
											M.HasRightArm = 0
											M.BloodContent -= 150
											M.ArmFling()
											M.ArmFling()
											M.LimbLoss()
											M.BloodLoss()
											M.DestructionSkill += 1
											flick("DestructionBurst",V)
											sleep(30)
											del(V)
											M.DestructionSkill += 1.25
											return
								if (Result == "Destruction II")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] chants a mantra of destruction and focuses the evil energies on [V], sacrificing it's own arm to destroy [V]!"
											V.icon = 'Blood.dmi'
											V.overlays = null
											V.CanWalk = 0
											M.Tiredness -= 80
											M.HasLeftArm = 0
											M.ArmFling()
											M.LimbLoss()
											M.DestructionSkill += 1
											flick("DestructionBurst",V)
											sleep(30)
											del(V)
											M.DestructionSkill += 1.25
											return
								if (Result == "Destruction III")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] chants a mantra of destruction and focuses the evil energies on [V]!"
											V.icon = 'Blood.dmi'
											V.overlays = null
											V.CanWalk = 0
											M.Tiredness -= 60
											flick("DestructionBurst",V)
											sleep(30)
											del(V)
											M.DestructionSkill += 0.25
											return
								if (Result == "Lash")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] lashes [V] with an invisible, fiery whip!"
											view() << "[M] tires with the effort of controling the spell!"
											V.BloodContent -= 50
											V.BloodLoss()
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 35
											M.DestructionSkill += 0.10
											return
								if (Result == "Lash II")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] lashes [V] with an invisible, fiery whip!"
											view() << "[M] tires with the effort of controling the spell!"
											V.BloodContent -= 75
											V.BloodLoss()
											V.HP -= 50
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 30
											M.DestructionSkill += 0.10
											return
								if (Result == "Lash III")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] lashes [V] with an invisible, fiery whip!"
											view() << "[M] tires with the effort of controling the spell!"
											V.BloodContent -= 125
											V.LeftArmHP -= 50
											V.RightArmHP -= 50
											V.LeftLegHP -= 50
											V.RightLegHP -= 50
											V.LimbLoss()
											V.BloodLoss()
											V.HP -= 50
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 25
											M.DestructionSkill += 0.25
											return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			HolyBook
				icon = 'Book.dmi'
				icon_state = "HolyBook"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book seems to radiate an aura of happiness, puppies, and rainbows"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								if(src.Enchanted == 1)
									menu += "Practice"
									if(M.HolySkill >= 10)
										menu += "Holy Fast"
									if(M.HolySkill >= 25)
										menu += "Heal Self"
									if(M.HolySkill >= 40)
										menu += "Heal Other"
										menu += "Destroy Undead"
									if(M.HolySkill >= 40)
										menu -= "Destroy Undead"
										menu += "Destroy Unholy Creature"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.HolySkill += 0.5
										M.Tiredness -= 25
										view() << "[M] opens the holy book and begins to practice a prayer."
										M.PracticeSkill = 1
										spawn(100)
											M.PracticeSkill = 0
											M.Owner << "[M] has finished practicing and now has [M.HolySkill] Holy skill."
									else
										M.Owner << "[M] is already practicing!"
								if (Result == "Holy Fast")
									view() << "[M] concentrates the holy energies of the book on themself to relieve their hunger!"
									M.Hunger = 110
									M.Tiredness -= 35
									M.HolySkill += 0.25
									return
								if (Result == "Heal Other")
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] heals [V] with the power of the holy book of light!"
											V.HasLeftLeg = 1
											V.HasRightLeg = 1
											V.HasLeftArm = 1
											V.HasRightArm = 1
											V.HasTeeth = 1
											V.Teeth = "Good"
											V.TeethHP = M.TeethHPMax
											V.LeftArm = "Good"
											V.RightArm = "Good"
											V.LeftLeg = "Good"
											V.RightLeg = "Good"
											V.RightLegHP = M.OrganMaxHP
											V.LeftLegHP = M.OrganMaxHP
											V.LeftArmHP = M.OrganMaxHP
											V.RightArmHP = M.OrganMaxHP
											V.Crippled = 0
											V.CanUseRightArm = 1
											V.CanUseLeftArm = 1
											V.CanWalk = 1
											V.CanSee = 1
											V.BloodContent = M.MaxBloodContent
											V.BleedType = null
											V.LimbLoss()
											M.Hunger -= 20
											M.Tiredness -= 35
											M.HolySkill += 0.5
											return
								if (Result == "Heal Self")
									if(M.ImmuneToMagic == 0)
										view() << "[M] heals themself with the holy book of light!"
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
										M.CanSee = 1
										M.BloodContent = M.MaxBloodContent
										M.BleedType = null
										M.LimbLoss()
										M.Tiredness -= 35
										M.Hunger -= 20
										M.HolySkill += 0.5
										return
								if (Result == "Destroy Undead")
									for(var/mob/Monsters/V in oview(5,M))
										var/One = prob(90)
										var/Two = prob(1)
										if (One)
											if(V.Undead == 1)
												view() << "[M] fires a ray of holy light into [V] destroying the foul creature!"
												V.icon = 'Blood.dmi'
												V.overlays = null
												V.CanWalk = 0
												M.Tiredness -= 20
												flick("HolyBurst",V)
												sleep(30)
												del(V)
												M.HolySkill += 0.5
											else if(V.Vampire == 1)
												view() << "[M] fires a ray of holy light into [V] destroying the foul vampire!"
												V.icon = 'Blood.dmi'
												V.overlays = null
												V.CanWalk = 0
												M.Tiredness -= 20
												flick("HolyBurst",V)
												sleep(30)
												del(V)
												M.HolySkill += 0.5
										if (Two)
											view() << "[M] has angered the gods with their impudent demands and is smitten down!"
											M.icon = 'Blood.dmi'
											M.overlays = null
											M.CanWalk = 0
											M.Tiredness -= 20
											flick("HolyBurst",V)
											sleep(30)
											del(M)
								if (Result == "Destroy Unholy Creature")
									for(var/mob/Monsters/V in oview(5,M))
										var/One = prob(90)
										var/Two = prob(1)
										if (One)
											if(V.Undead == 1)
												view() << "[M] fires a ray of holy light into [V] destroying the foul creature!"
												V.icon = 'Blood.dmi'
												V.overlays = null
												V.CanWalk = 0
												M.Tiredness -= 15
												flick("HolyBurst",V)
												sleep(30)
												del(V)
												M.HolySkill += 0.5
											else if(V.Vampire == 1)
												view() << "[M] fires a ray of holy light into [V] destroying the foul vampire!"
												V.icon = 'Blood.dmi'
												V.overlays = null
												V.CanWalk = 0
												M.Tiredness -= 15
												flick("HolyBurst",V)
												sleep(30)
												del(V)
												M.HolySkill += 0.5
											else if(V.Demon == 1)
												view() << "[M] fires a ray of holy light into [V] destroying the foul Demon!"
												V.icon = 'Blood.dmi'
												V.overlays = null
												V.CanWalk = 0
												M.Tiredness -= 20
												flick("HolyBurst",V)
												sleep(30)
												del(V)
												M.HolySkill += 0.5
										if (Two)
											view() << "[M] has angered the gods with their impudent demands and is smitten down!"
											M.icon = 'Blood.dmi'
											M.overlays = null
											M.CanWalk = 0
											M.Tiredness -= 20
											flick("HolyBurst",V)
											sleep(30)
											del(M)

										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			AstralBook
				icon = 'Book.dmi'
				icon_state = "AstralBook"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book gives off a bit of static electricity while you hold it, the instructions page reads: Teleport: Teleports caster to desired location(Where your ghost is), be cautious as you will be incapacitated upon reaching your destination. Find: Locate someone who you wish to find. Lightning Bolt: Fire the energies of the book at your enemies."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1)
									menu += "Practice"
									if(M.AstralSkill >= 5)
										menu += "Find"
									if(M.AstralSkill >= 10)
										menu += "Find II"
										menu -= "Find"
									if(M.AstralSkill >= 20)
										menu += "Find III"
										menu -= "Find II"
									if(M.AstralSkill >= 30)
										menu += "Teleport"
									if(M.AstralSkill >= 35)
										menu += "Teleport II"
										menu -= "Teleport"
									if(M.AstralSkill >= 40)
										menu += "Teleport III"
										menu -= "Teleport II"
									if(M.AstralSkill >= 45)
										menu += "Create Portal"
										menu += "Destroy Portal"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Create Potion of Eternal Life")
									if(M in view(1,src))
										for(var/obj/Items/Potions/LifePotion/S in M)
											var/obj/Items/Potions/EternalLifePotion/G5 = new
											G5.loc = M.loc
											del(S)
											view() << "[M] enchants the potion of LongLife!!"
											M.Tiredness -= 80
											M.Hunger -= 30
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.AstralSkill += 0.25
										M.Tiredness -= 25
										view() << "[M] opens the astral book and begins to practice a spell."
										M.PracticeSkill = 1
										spawn(100)
											M.PracticeSkill = 0
											M.Owner << "[M] has finished practicing and now has [M.AstralSkill] Astral skill."
											view() << "[M] finishes practicing."
									else
										M.Owner << "[M] is already practicing!"
								if (Result == "Teleport")
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
										usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
										return
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
										usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
										return
									M.AstralSkill += 0.25
									if(M.AstralSkill >= 1)
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view() << "A glowing blue portal snaps into existance and [M] steps through it!"
										M.Tiredness -= 80
										for(var/turf/T in view(0,M))
											if(T.density == 1 && T.opacity == 1)
												M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
												M.icon = 'Blood.dmi'
												flick("AstralBurst",M)
												view() << "and is torn to pieces by the dense object they stepped into!"
												M.Tiredness -= 30
												spawn(10)
													M.icon = 'Blood.dmi'
													flick("HolyBurst",M)
													del(M)
										spawn(10)
										M.icon = X
								if (Result == "Teleport II")
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
										usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
										return
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
										usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
										return
									M.AstralSkill += 0.25
									if(M.AstralSkill >= 1)
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view() << "A glowing blue portal snaps into existance and [M] steps through it!"
										M.Tiredness -= 60
										for(var/turf/T in view(0,M))
											if(T.density == 1 && T.opacity == 1)
												M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
												M.icon = 'Blood.dmi'
												flick("AstralBurst",M)
												view() << "and is torn to pieces by the dense object they stepped into!"
												M.Tiredness -= 30
												spawn(10)
												M.icon = 'Blood.dmi'
												flick("HolyBurst",M)
												del(M)
										spawn(10)
										M.icon = X
								if (Result == "Teleport III")
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
										usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
										return
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
										usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
										return
									M.AstralSkill += 0.25
									var/X = M.icon
									M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
									M.icon = 'Blood.dmi'
									flick("AstralBurst",M)
									view() << "A glowing blue portal snaps into existance and [M] steps through it!"
									M.Tiredness -= 40
									for(var/turf/T in view(0,M))
										if(T.density == 1 && T.opacity == 1)
											M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
											M.icon = 'Blood.dmi'
											flick("AstralBurst",M)
											view() << "and is torn to pieces by the dense object they stepped into!"
											M.Tiredness -= 30
											spawn(10)
											M.icon = 'Blood.dmi'
											flick("HolyBurst",M)
											del(M)
									spawn(10)
									M.icon = X
								if (Result == "Create Portal")
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
										usr << "There is a magic blocking portal stone near your destination, you cannot make a portal!"
										return
									for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
										usr << "There is a magic blocking portal stone near [M], you cannot make a portal!"
										return
									var/obj/AstralPortal/Port = new
									var/obj/AstralPortal/Port2 = new
									Port.loc = M.loc
									Port.GoesTo = usr.loc
									Port2.loc = usr.loc
									Port2.GoesTo = M.loc
									view() << "Someone has created a portal with this location as the destination!!!"
									M.Hunger -= 50
									M.Tiredness -= 90
									M.AstralSkill += 0.25
									return
								if (Result == "Destroy Portal")
									for(var/obj/AstralPortal/Port in view(5,M))
										view() << "[M] fires a bolt of astral energy into the portal and causes it to implode upon itself, destroying it completely"
										M.Tiredness -= 50
										M.Hunger -= 50
										M.AstralSkill += 0.25
										for(var/obj/AstralPortal/Port2 in range(1,Port.GoesTo))
											del Port2
											break
										del Port
										return
								if (Result == "Find")
									M.AstralSkill += 0.25
									var/One = prob(50)
									var/T = input("Warp to who?")as null|text
									if(One)
										if(!T)
											..()
										else
											for(var/mob/S in world)
												if(T == S.name)
													var/XX = S.x
													var/YY = S.y
													XX += rand(-120,120)
													YY += rand(-120,120)
													usr << "[S]'s location is somewhere near [XX],[YY],[S.z]"
													view(S) << "You get the odd feeling that someone is watching you..."
									else
										view(M) << "[M]'s eyes are zapped by bolts of lightning and explode!"
										M.CanSee = 0
										M.HasLeftEye = 0
										M.HasRightEye = 0
										M.RightEye = "Melted"
										M.LeftEye = "Melted"
										M.BloodContent -= 50
										M.BloodLoss()
								if (Result == "Find II")
									M.AstralSkill += 0.25
									var/One = prob(75)
									var/T = input("Warp to who?")as null|text
									if(One)
										if(!T)
											..()
										else
											for(var/mob/S in world)
												if(T == S.name)
													var/XX = S.x
													var/YY = S.y
													XX += rand(-90,90)
													YY += rand(-90,90)
													usr << "[S]'s location is somewhere near [XX],[YY],[S.z]"
													view(S) << "You get the odd feeling that someone is watching you..."
									else
										view(M) << "[M]'s eyes are zapped by bolts of lightning and explode!"
										M.CanSee = 0
										M.HasLeftEye = 0
										M.HasRightEye = 0
										M.RightEye = "Melted"
										M.LeftEye = "Melted"
										M.BloodContent -= 50
										M.BloodLoss()
								if (Result == "Find III")
									M.AstralSkill += 0.25
									var/One = prob(90)
									var/T = input("Warp to who?")as null|text
									if(One)
										if(!T)
											..()
										else
											for(var/mob/S in world)
												if(T == S.name)
													var/XX = S.x
													var/YY = S.y
													XX += rand(-70,70)
													YY += rand(-70,70)
													usr << "[S]'s location is somewhere near [XX],[YY],[S.z]"
													view(S) << "You get the odd feeling that someone is watching you..."
											return
									else
										view(M) << "[M]'s eyes are zapped by bolts of lightning and explode!"
										M.CanSee = 0
										M.HasLeftEye = 0
										M.HasRightEye = 0
										M.RightEye = "Melted"
										M.LeftEye = "Melted"
										M.BloodContent -= 50
										M.BloodLoss()
								if (Result == "Lightning Bolt")
									M.AstralSkill += 0.25
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] fires a lightning bolt into [V]!"
											view() << "[M] becomes completely exhausted from their effort to channel the energy"
											V.BloodContent -= 100
											V.BloodLoss()
											V.HasLeftArm = 0
											V.HasLeftLeg = 0
											V.HasRightLeg = 0
											V.HasRightArm = 0
											V.CanWalk = 0
											V.Crippled = 1
											V.CanSee = 0
											V.Stunned = 0
											V.LimbLoss()
											V.ArmFling()
											V.ArmFling()
											V.LegFling()
											V.LegFling()
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 100
											return
								if (Result == "Lightning Bolt II")
									M.AstralSkill += 0.25
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											view() << "[M] fires a lightning bolt into [V]!"
											view() << "[M] becomes completely exhausted from their effort to channel the energy"
											V.BloodContent -= 175
											V.BloodLoss()
											V.HasLeftArm = 0
											V.HasLeftLeg = 0
											V.HasRightLeg = 0
											V.HasRightArm = 0
											V.CanWalk = 0
											V.Crippled = 1
											V.CanSee = 0
											V.Stunned = 0
											V.LimbLoss()
											V.ArmFling()
											V.ArmFling()
											V.LegFling()
											V.LegFling()
											V.Owner << "<b><font color=red>[V] is bleeding!!"
											M.Tiredness -= 50
											return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			ChaosBook
				icon = 'Book.dmi'
				icon_state = "Chaos"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book seems to warp and twist in your hands, and when you look at it it seems to take odd shapes and forms before your eyes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(src.Enchanted == 1)
									menu += "Practice"
									if(M.ChaosSkill >= 5)
										menu += "Chance"
									if(M.ChaosSkill >= 15)
										menu += "Simulacrum"
										menu += "Chaotic Bolt"
									if(M.ChaosSkill >= 30)
										menu -= "Chaotic Bolt"
										menu += "Chaotic Bolt II"
									if(M.ChaosSkill >= 50)
										menu -= "Chaotic Bolt II"
										menu += "Master Chaos Bolt"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Practice")
									if(M.PracticeSkill == 0)
										M.ChaosSkill += 0.25
										M.Tiredness -= 25
										view() << "[M] opens the Chaos book and begins to practice a spell."
										M.PracticeSkill = 1
										spawn(200)
											M.PracticeSkill = 0
											M.Owner << "[M] has finished practicing and now has [M.ChaosSkill] Chaos skill."
											view() << "[M] finishes practicing."
									else
										M.Owner << "[M] is already practicing!"
								if (Result == "Chaotic Bolt")
									M.ChaosSkill += 0.25
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											var/One = prob(5)
											var/Two = prob(25)
											var/Three = prob(75)
											M.ChaosSkill += 0.5
											if(One)
												view() << "[M] fires a bolt of chaotic energy into [V]!"
												view() << "[M] becomes exausted from the effort of creating the chaos bolt"
												M.Tiredness -=40
												if(V.HumanParts == 1)
													V.icon = 'Blood.dmi'
													V.overlays = null
													V.CanWalk = 0
													flick("ChaosBurst",V)
													sleep(30)
													del(V)
											else if(Two)
												view() << "[M] fires a bolt of chaotic energy that flies harmlessly away!"
												view() << "[M] becomes exausted from the effort of creating the chaos bolt"
												M.Tiredness -= 50
											else if(Three)
												view() << "[M]'s Chaos Bolt flies into the air, reverses direction, and strikes [M]!!!"
												if(M.HumanParts == 1)
													M.HasLeftArm = 0
													M.HasLeftLeg = 0
													M.HasRightLeg = 0
													M.HasRightArm = 0
													M.CanWalk = 0
													M.Crippled = 1
													M.CanSee = 0
													M.Stunned = 0
													M.LimbLoss()
													M.ArmFling()
													M.ArmFling()
													M.LegFling()
													M.LegFling()
													M.BloodContent -= 75
													M.BloodLoss()
											return
								if (Result == "Chaotic Bolt II")
									M.ChaosSkill += 0.25
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											var/One = prob(50)
											var/Two = prob(40)
											var/Three = prob(50)
											if(One)
												view() << "[M] fires a bolt of chaotic energy into [V]!"
												view() << "[M] becomes exausted from the effort of creating the chaos bolt"
												M.Tiredness -=40
												if(V.HumanParts == 1)
													V.icon = 'Blood.dmi'
													V.overlays = null
													V.CanWalk = 0
													flick("ChaosBurst",V)
													sleep(30)
													del(V)
											else if(Two)
												view() << "[M] fires a bolt of chaotic energy that flies harmlessly away!"
												for(var/mob/Monsters/II in world)
													var/Strike = prob(1)
													if(Strike == 1)
														view(II) << "[II] is struck by a rogue chaos bolt, it bounces off of them into the air after slicing a small piece of flesh off of their chest!"
														II.BloodContent -= 20
														II.BloodLoss()
														return
												view() << "[M] becomes exausted from the effort of creating the chaos bolt"
												M.Tiredness -= 50
											else if(Three)
												view() << "[M]'s Chaos Bolt flies into the air, reverses direction, and strikes [M]!!!"
												if(M.HumanParts == 1)
													M.HasLeftArm = 0
													M.HasLeftLeg = 0
													M.HasRightLeg = 0
													M.HasRightArm = 0
													M.CanWalk = 0
													M.Crippled = 1
													M.CanSee = 0
													M.Stunned = 0
													M.LimbLoss()
													M.ArmFling()
													M.ArmFling()
													M.LegFling()
													M.LegFling()
													M.BloodContent -= 75
													M.BloodLoss()
											else
												view() << "[M] chaos bolt fizzles and pops in their hand and then dissappears."
												M.Tiredness -= 40
											return
								if (Result == "Master Chaos Bolt")
									M.ChaosSkill += 0.25
									for(var/mob/Monsters/V in oview(5,M))
										if(V.ImmuneToMagic == 0 && M.MagicTarget == V)
											var/One = prob(75)
											if(One)
												view() << "[M] fires a bolt of chaotic energy into [V]!"
												view() << "[M] becomes exausted from the effort of creating the chaos bolt"
												M.Tiredness -=40
												if(V.HumanParts == 1)
													V.icon = 'Blood.dmi'
													V.overlays = null
													V.CanWalk = 0
													flick("ChaosBurst",V)
													sleep(30)
													del(V)
											else
												view(M) << "[M] fires a chaos bolt which promptly flies into the air and dissappears."
												for(var/mob/Monsters/M2 in world)
													var/ChaosStrike = prob(2)
													if(ChaosStrike)
														M2.BloodContent -= 45
														M2.BloodLoss()
														view(M2) << "[M2] is randomly hit with a rogue chaos bolt!"
														M2.Owner << "[M2] is randomly hit with a rogue chaos bolt!"
														return
											return
								if (Result == "Chance")
									var/Good = prob(55)
									var/Bad = prob(5)
									if(Good)
										view() << "[M] Succeeds in controling the forces of chance and brings itself knowledge and power, Beware, this is not without risk."
										M.EXP += 1000
										M.PotionSkill += 3
										M.ArmourSkill += 3
										M.ShieldSkill += 3
										M.SpearSkill += 3
										M.PoisonSkill += 3
										M.BoneCraftingSkill += 3
										M.UnArmedSkill += 3
										M.SneakingSkill += 3
										M.MaceSkill += 3
										M.FishingSkill += 3
										M.JewlCraftingSkill += 3
										M.MetalCraftingSkill += 3
										M.WoodCraftingSkill += 3
										M.SmeltingSkill += 3
										M.StoneCraftingSkill += 3
										M.LeatherCraftingSkill += 3
										M.ChaosSkill += 0.25

									if(Bad)
										view() << "[M] Attempts to control the forces of chaos to bring itself knowledge and power, Instead, they must sufDipop the consequences of chance."
										M.icon = 'Blood.dmi'
										M.overlays = null
										M.CanWalk = 0
										flick("ChaosBurst",M)
										sleep(30)
										var/obj/Items/Shafts/ChaosBook/C = new()
										C.loc = M.loc
										del(M)
										return
								if (Result == "Simulacrum")
									if(M.IsMist == 0)
										if(M.ImmuneToMagic == 0)
											if(M.Morphed == 0)
												var/list/menu5 = new()
												menu5 += "Human"
												menu5 += "Dwarf"
												menu5 += "Ghost"
												menu5 += "Goblin"
												menu5 += "Devourer"
												menu5 += "Kobold"
												menu5 += "LizardMan"
												menu5 += "Orc"
												menu5 += "SpiderQueen"
												menu5 += "SpiderWarrior"
												menu5 += "Ghost"
												menu5 += "Demon"
												menu5 += "FrogMan"
												menu5 += "Skeleton"
												menu5 += "Vampire"
												menu5 += "Cancel"
												var/Result5 = input("Take on the Shape of What creature?", "Choose", null) in menu5
												if (Result5 != "Cancel")
													..()
												if (Result5 == "Human")
													M.icon = 'Human.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Dwarf")
													M.icon = 'Human.dmi'
													M.LimbLoss()
													M.overlays += 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Ghost")
													M.icon = 'Ghost.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Devourer")
													M.icon = 'Devourer.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Goblin")
													M.icon = 'Goblins.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "SpiderQueen")
													M.icon = 'SpiderQueenMature.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "SpiderQueen")
													M.icon = 'SpiderQueenMature.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "SpiderWarrior")
													M.icon = 'SpiderWarriorOlder.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Kobold")
													M.icon = 'Kobold.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Skeleton")
													M.icon = 'Skeleton.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "LizardMan")
													M.icon = 'LizardMan.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays += 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Orc")
													M.icon = 'OrcMale.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Demon")
													M.icon = 'Demon.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays += /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "FrogMan")
													M.icon = 'FrogMan.dmi'
													M.LimbLoss()
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays -= /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
													return
												if (Result5 == "Vampire")
													M.icon = 'Vampire.dmi'
													M.LimbLoss()
													M.density = 1
													M.overlays -= 'Beards.dmi'
													M.overlays -= 'LizardTail.dmi'
													M.overlays += /obj/wing1/
													M.overlays -= /obj/wing2/
													M.overlays -= /obj/wing3/
											return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Spade
				icon = 'MetalObjects.dmi'
				icon_state = "Spade"
				weight = 7
				suffix = null
				desc = "This is a spade, it can be used to bury the dead or make farm land"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/obj/Items/Shafts/Spade/SP in M)
									for(var/turf/grounds/D in view(0,M))
										if(D.icon_state == "Desert")
											menu += "Dig Up Sand"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Dig Up Sand")
									if(M.weight <= M.weightmax)
										var/obj/Items/ores/Sand/S = new
										S.loc = M
										S.suffix = "(Carrying)"
										M.weight += S.weight
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Flag
				icon = 'Flags.dmi'
				icon_state = "Soviet Flag"
				weight = 7
				suffix = null
				desc = "This is a Flag, it can be used to poke out someone's eyes or to beat the over the head, also you can use it to symbolize your country..."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Dig Up Sand")
									if(M.weight <= M.weightmax)
										var/obj/Items/ores/Sand/S = new
										S.loc = M
										S.suffix = "(Carrying)"
										M.weight += S.weight
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			SpearShaft
				icon = 'Cave.dmi'
				icon_state = "Shaft"
				weight = 5
				suffix = null
				desc = "This is a spear shaft, it can be combined with a spear head to create a spear"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Ingots
			New()
				ItemDecay()
			SilverBar
				icon = 'Cave.dmi'
				icon_state = "SilverBar"
				weight = 20
				suffix = null
				desc = "This is a silver bar, it can be used to create armour and weapons as well as other fanciful things"
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									if(M.Vampire == 0 && M.Werewolf == 0)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
								else
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Gold"
									menu += "Transmute Into Iron"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Transmute Into Gold")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/GoldBar/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
								if (Result == "Transmute Into Iron")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/MetalIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			GoldBar
				icon = 'Cave.dmi'
				icon_state = "GoldBar"
				weight = 20
				suffix = null
				desc = "This is a gold bar, it can be used to create armour and weapons as well as other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Silver"
									menu += "Transmute Into Iron"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Transmute Into Silver")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/SilverBar/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
								if (Result == "Transmute Into Iron")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/MetalIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			MetalIngot
				icon = 'Cave.dmi'
				icon_state = "MetalIngot"
				weight = 20
				suffix = null
				desc = "This is a metal ingot, it can be used to create armour and weapons and other metal objects"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Silver"
									menu += "Transmute Into Gold"
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Transmute Into Gold")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/GoldBar/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
								if (Result == "Transmute Into Silver")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/SilverBar/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			AdamantiumIngot
				icon = 'Cave.dmi'
				icon_state = "AdamantiumIngot"
				weight = 0
				suffix = null
				desc = "This is a Adamantium ingot, it can be used to create amazing armour and weapons."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
		Poisons
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
								usr << "[M] : I Cant Carry Too Much!"
								return

				for(var/mob/Monsters/M in usr.Selected)
					for(src in M)
						if(src.loc == M)
							if(src.suffix == "(Carrying)")
								src.loc = M.loc
								src.suffix = null
								M.weight -= src.weight
								return
			Toxic
				icon = 'Cave.dmi'
				icon_state = "Toxic"
				weight = 10
				suffix = null
				desc = "This is toxic, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal posion."

			Poison
				icon = 'Cave.dmi'
				icon_state = "Poison"
				weight = 10
				suffix = null
				desc = "This is posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep."

			StrongPoison
				icon = 'Cave.dmi'
				icon_state = "StrongPoison"
				weight = 10
				suffix = null
				desc = "This is strong posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal poison and toxic"

		Potions
			EmptyBottle
				IsEmpty = 1
				icon = 'Farm Items.dmi'
				icon_state = "Empty"
				name = "Empty Bottle"
				weight = 10
				suffix = null
				desc = "This is an empty bottle, it can be used for potion creation."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			LifePotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "RedPotion"
				name = "Potion of LongLife"
				weight = 10
				suffix = null
				desc = "This is a potion of long life, it will extend a units life time."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			EternalLifePotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "SparklePotion"
				name = "Potion of Eternal Life"
				weight = 10
				suffix = null
				desc = "This is a potion of Eternal life, it will extend a units life time infinitely."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			VampirismCure
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "BluePotion"
				name = "Vampirism Cure"
				weight = 10
				suffix = null
				desc = "This is a potion of Cure, it will prevent a newly bitten victim form turning into a vampire."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			HealPotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "BluePotion"
				name = "Potion of Restoration"
				weight = 10
				suffix = null
				desc = "This is a potion of limb restoration, it will heal any lost limbs."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			DevourerPotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "PurplePotion"
				name = "Immunity To Devourer Potion"
				weight = 10
				suffix = null
				desc = "This is a potion of immunity, it will make you immune to the dread Devourer disease"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
		Arrows
			Fireball
				//sticks in or caught in mid air
				icon = 'fx.dmi'
				icon_state = "Fireball"
				weight = 0
				suffix = null
				desc = "This is a fireball, it's very hot"
				Bump(atom/m)
					if(isobj(m))
						for(var/mob/Monsters/K in view(2,src))
							K.Fire()
						for(var/turf/grounds/G in view(2,src))
							G.Firestorm()
						del src
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							for(var/mob/Monsters/K in view(2,src))
								K.Fire()
							for(var/turf/grounds/G in view(2,src))
								G.Firestorm()
							del src
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
						for(var/mob/Monsters/K in view(3,src))
							K.Fire()
						for(var/turf/grounds/G in view(3,src))
							G.Firestorm()
						del src
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

			WoodenArrow
				//sticks in or caught in mid air
				icon = 'WoodItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a wooden arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(25)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePoison == 0)
										DMG += src.PoisonContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											if(L.Content <= 250)
												src.loc = L
												L.Content += 1
												return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			MetalArrow
				//sticks in or caught in mid air
				icon = 'MetalObjects.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a metal arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(15)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePoison == 0)
										DMG += src.PoisonContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											if(L.Content <= 250)
												src.loc = L
												L.Content += 1
												return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			SilverArrow
				//sticks in or caught in mid air
				icon = 'SilverItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a silver arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(20)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.Vampire == 1)
										DMG += rand(2,4)
									if(M.Infects == 1)
										DMG += rand(10,15)
									if(M.Werepowers == 1)
										DMG += rand(25,30)
									if(M.Werewolf == 1)
										DMG += rand(2,4)
									if(M.ImmunePoison == 0)
										DMG += src.PoisonContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)


				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											if(L.Content <= 250)
												src.loc = L
												L.Content += 1
												return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			BoneArrow
				//sticks in or caught in mid air
				icon = 'BoneItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a bone arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(20)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePoison == 0)
										DMG += src.PoisonContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return
					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											if(L.Content <= 250)
												src.loc = L
												L.Content += 1
												return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


		Coins
			SilverCoin
				icon = 'SilverItems.dmi'
				icon_state = "Coin"
				weight = 10
				suffix = null
				Silver = 1
				desc = "This is a Silver Coin, it can be used for trade."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									if(M.Vampire == 0 && M.Werewolf == 0)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										view() << "[M] tries to pick up the silver coins but they start to smolder when picked up and [M] throws them back to the ground"
										M.BloodContent -= 5
										M.BloodLoss()
								else
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			GoldCoin
				icon = 'GoldItems.dmi'
				icon_state = "Coin"
				weight = 10
				Gold = 1
				suffix = null
				desc = "This is a Gold Coin, it can be used for trade."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Plants
			suffix = "Stuck"
			New()
				TomatoDecay()
			GrapeVine
				icon = 'Cave.dmi'
				icon_state = "PPlant1"
				Content3 = "Grape"
				weight = 10
				Content = 5
				desc = "This is a grape vine plant."
				New()
					src.PlantRegen()
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Food/CookedMeats/Grape/T = new
										T.loc = M.loc
										if(src.Content >= 1)
											src.icon_state = "PPlant5"
										if(src.Content >= 2)
											src.icon_state = "PPlant4"
										if(src.Content >= 3)
											src.icon_state = "PPlant3"
										if(src.Content >= 4)
											src.icon_state = "PPlant2"
										if(src.Content <= 0)
											for(var/turf/e in view(0,src))
												e.HasPlantIn = 0
											del(src)
											return
			Wheat
				icon = 'plants.dmi'
				icon_state = "wheat"
				weight = 10
				Content = 5
				desc = "This is a wheat plant."
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Food/Ingredients/WheatSeeds/T = new
										T.loc = M.loc
										if(src.Content >= 1)
											src.icon_state = "wheat3"

										if(src.Content >= 2)
											src.icon_state = "wheat3"

										if(src.Content >= 3)
											src.icon_state = "wheat2"
										if(src.Content >= 4)
											src.icon_state = "wheat2"
										if(src.Content <= 0)
											for(var/turf/e in view(0,src))
												e.HasPlantIn = 0
											del(src)
											return
			GarlicPlant
				icon = 'Cave.dmi'
				icon_state = "Garlic Plant"
				weight = 10
				Content = 0
				desc = "This is a garlic plant."
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Seeds/Garlic/G = new
										G.loc = M.loc
									else
										var/obj/Items/Seeds/Garlic/G = new
										G.loc = M.loc
										del(src)



			TomatoPlant
				icon = 'Cave.dmi'
				icon_state = "Plant1"
				Content3 = "Tomato"
				weight = 10
				Content = 5
				desc = "This is a tomato plant."
				New()
					src.PlantRegen()
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Food/CookedMeats/Tomato/T = new
										T.loc = M.loc
										if(src.Content >= 1)
											src.icon_state = "Plant5"

										if(src.Content >= 2)
											src.icon_state = "Plant4"

										if(src.Content >= 3)
											src.icon_state = "Plant3"
										if(src.Content >= 4)
											src.icon_state = "Plant2"
										if(src.Content <= 0)
											for(var/turf/e in view(0,src))
												e.HasPlantIn = 0
											del(src)
											return



		Seeds
			New()
				ItemDecay()
			Garlic
				CanEat = 1
				icon = 'Farm Items.dmi'
				icon_state = "Garlic"
				weight = 2
				suffix = null
				desc = "This is garlic, it can be used for alchemy or eaten as food"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Eat"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Eat")
									if(src in view(1,M))
										view() << "<b><font color=blue>[M] eats [src]"
										if(M.Vampire == 1)
											M.GoingToDie = 1
											M.DeathType = "Garlic"
											view() << "<b><font color=red>[M] was killed by garlic!"
											M.Death()
											del(src)
											return
										if(src.Poisoned == 1)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[src]"
											M.DeathType = "Poison"
											M.Death()
											return
										M.Hunger += 100
										M.said = 0
										if(M.Hunger >= 100)
											M.Hunger = 100
										M.weight -= src.weight
										del(src)
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.icon_state == "FarmLand")
												if(T.HasPlantIn == 0)
													for(var/obj/Items/Seeds/S in M.loc)
														if(S != src)
															usr << "Cant plant too many seeds in one area!"
															return
													var/obj/A1 = src
													A1.loc = M.loc
													A1.suffix = "(Planted)"
													M.weight -= A1.weight
													A1.icon_state = ""
													A1.GarlicGrow()
													return
			PoisonSporeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a posion plant seed, it can be planted in swamps only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.PoisonSporeGrow()
												return
			CarnivorousPlantSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a Carnivorous plant seed, it can be planted in swamps only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/obj/Items/Seeds/S in M.loc)
											if(S != src)
												usr << "Cant plant too many seeds in one area!"
												return
										for(var/turf/T in view(0,M))
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.CarnGrow()
												return
			TreeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tree seed, it can be planted out side only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											for(var/obj/Items/Seeds/S in M.loc)
												if(S != src)
													usr << "Cant plant too many seeds in one area!"
													return
											if(T.icon_state == "Grass")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
											if(T.icon_state == "Desert")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
			GrapeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a grape seed, it can be planted anywhere."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/obj/Items/Seeds/S in M.loc)
											if(S != src)
												usr << "Cant plant too many seeds in one area!"
												return
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = "(Planted)"
										M.weight -= A1.weight
										A1.icon_state = ""
										A1.GrapeGrow()
										break
										return
			PlantmanSeed
				icon = 'PlantmanEgg.dmi'
				icon_state = "PlantmanSeed"
				weight = 2
				suffix = null
				desc = "This is a Plantman seed, it can be planted anywhere."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Plantman == 1)
									menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/obj/Items/Seeds/S in M.loc)
											if(S != src)
												usr << "Cant plant too many seeds in one area!"
												return
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = "(Planted)"
										M.weight -= A1.weight
										A1.icon_state = ""
										A1.Owner = M.Owner
										A1.PlantmanGrow()
										break
										return
			TomatoSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tomato seed, it can be planted in farm land only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.icon_state == "FarmLand")
												if(T.HasPlantIn == 0)
													for(var/obj/Items/Seeds/S in M.loc)
														if(S != src)
															usr << "Cant plant too many seeds in one area!"
															return
													var/obj/A1 = src
													A1.loc = M.loc
													A1.suffix = "(Planted)"
													M.weight -= A1.weight
													A1.icon_state = ""
													T.HasPlantIn = 1
													A1.TomatoGrow()
													break
													return



			TowerCapSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tower cap seed, it can be planted in a cave only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											for(var/obj/Items/Seeds/TowerCapSeed/S in view(0,M))
												if(S in M.loc)
													return
												else
													if(T.icon_state == "CaveFloor")
														for(var/obj/Items/Seeds/Z in M.loc)
															if(Z != src)
																usr << "Cant plant too many seeds in one area!"
																return
														var/obj/A1 = src
														A1.loc = M.loc
														A1.suffix = "(Planted)"
														M.weight -= A1.weight
														A1.icon_state = ""
														A1.TowerCapGrow()
														return


		Glands
			New()
				ItemDecay()
			PoisonRoots
				icon = 'Animal.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion root, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			ToxicGland
				icon = 'Cave.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			PoisonGland
				name = "PoisonGland"
				icon = 'Cave.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Graves

			TombStone

				icon = 'StoneItems.dmi'
				icon_state = "TombStone1"
				weight = 30
				suffix = null
				TS = 1
				desc = "This a tomb stone, it can be placed over a Vrage."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Grave

				icon = 'Cave.dmi'
				icon_state = "Vrage"
				weight = 10
				suffix = null
				desc = "Vrage"
			UndeadSpawner
				icon = 'Cave.dmi'
				icon_state = "Vrage"
				name = "Unholy Vrage"
				weight = 10
				suffix = null
				desc = "Vrage"
				New()
					src.UndeadSpawner()
		Spawners
			Spawner
				icon = 'Cave.dmi'
				icon_state = "Vrage"
				invisibility = 80
				name = "{"
				weight = 10
				suffix = null
				text = "{"
				desc = "Kobold"
				New()
					src.Spawner()
		Bones
			New()
				ItemDecay()

			SkullPile

				icon = 'Cave.dmi'
				icon_state = "SkullPile"
				weight = 10
				suffix = null
				desc = "This is a skull pile, it looks scary."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Skull

				icon = 'Cave.dmi'
				icon_state = "Skull"
				weight = 10
				suffix = null
				desc = "This is a skull, it can be used for bone crafting or burial"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Shell

				icon = 'Cave.dmi'
				icon_state = "Shell"
				weight = 10
				suffix = null
				desc = "This is a hard shell, it can be used for crafting or burial."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			BloodyLeg

				icon = 'Blood.dmi'
				icon_state = "Arm"
				weight = 5
				suffix = null
				IsBodyPart = 1
				desc = "This is a leg, it is covered in blood and pretty useless"
				New()
					DeleteLimbs()
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			BloodyArm

				icon = 'Blood.dmi'
				icon_state = "Arm"
				weight = 5
				suffix = null
				IsBodyPart = 1
				desc = "This is an arm, it is covered in blood and pretty useless"
				New()
					DeleteLimbs()
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Head
				icon = 'Heads.dmi'
				icon_state = "FrogManHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Bones
				icon = 'Cave.dmi'
				icon_state = "Bone"
				weight = 10
				suffix = null
				desc = "These are bones, they can be used for bone crafting or burial"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Furniture
			Fences
				WoodenFence
					icon = 'Fences.dmi'
					icon_state = "Wooden Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
									return


							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											usr << src.desc
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
				StoneFence
					icon = 'Fences.dmi'
					icon_state = "Stone Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
									return


							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											usr << src.desc
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
				MetalFence
					icon = 'Fences.dmi'
					icon_state = "Metal Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
									return


							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											usr << src.desc
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
			Ovens
				Oven
					icon = 'Cave.dmi'
					icon_state = "Oven"
					weight = 100
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GoldOven
					icon = 'Cave.dmi'
					icon_state = "GoldOven"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				SilverOven
					icon = 'Cave.dmi'
					icon_state = "SilverOven"
					Silver = 1
					weight = 75
					suffix = null
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Silver == 1)
								if(M.Vampire == 1 || M.Werewolf == 1)
									if(src in view(1,M))
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										return
									if(src in M)
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
											M.BloodContent -= 5
											M.BloodLoss()
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return


			Doors
				Door = 1
				GMDoor
					icon = 'MetalObjects.dmi'
					icon_state = "MetalDoor"
					weight = 100
					suffix = null
					density = 1
					opacity = 1
					suffix = "Stuck"
					HumanParts = 0
					HP = 1000000000
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(M in view(1,src))
								if(usr.GM == 1)
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "MetalDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return
				TrapDoor
					icon = 'Cave.dmi'
					icon_state = "ClosedTrapDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Make Key"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.icon_state == "ClosedTrapDoor")
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.icon_state == "ClosedTrapDoor")
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
										if (Result == "Make Key")
											var/obj/Items/Shafts/DoorKey/D = new
											D.loc = M
											M.weight += D.weight
											D.LockVar = src.LockVar
											M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Human == 1)
													menu += "PickLock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															view(M) << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the trapdoor with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.icon_state == "OpenTrapDoor")
												src.icon_state = "ClosedTrapDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.icon_state == "ClosedTrapDoor")
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.icon_state == "ClosedTrapDoor")
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.icon_state == "ClosedTrapDoor")
												src.icon_state = "OpenTrapDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													if(src in M)
														M.weight -= src.weight
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.icon_state == "OpenTrapDoor")
												src.icon_state = "ClosedTrapDoor"
												return
											if(src.icon_state == "ClosedTrapDoor")
												src.icon_state = "OpenTrapDoor"
												return





								if(M in view(1,src))
									if(src.icon_state == "OpenTrapDoor")
										src.icon_state = "ClosedTrapDoor"
										return
									if(src.icon_state == "ClosedTrapDoor")
										src.icon_state = "OpenTrapDoor"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return

				BoneDoor
					icon = 'Cave.dmi'
					icon_state = "BoneDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Make Key"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
										if (Result == "Make Key")
											var/obj/Items/Shafts/DoorKey/D = new
											D.loc = M
											M.weight += D.weight
											D.LockVar = src.LockVar
											M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Human == 1)
													menu += "PickLock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															view(M) << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "BoneDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													if(src in M)
														M.weight -= src.weight
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "BoneDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "BoneDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				GoldDoor
					icon = 'GoldItems.dmi'
					icon_state = "GoldDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Human == 1)
													menu += "PickLock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "GoldDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "GoldDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "GoldDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				MetalDoor
					icon = 'MetalObjects.dmi'
					icon_state = "MetalDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del src
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Human == 1)
													menu += "PickLock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "MetalDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "MetalDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "MetalDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				StoneDoor
					icon = 'StoneItems.dmi'
					icon_state = "StoneDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del src
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Human == 1)
													menu += "PickLock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "StoneDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "StoneOpen"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "StoneDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "StoneOpen"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "StoneDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "StoneOpen"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				WoodenDoor
					icon = 'Cave.dmi'
					icon_state = "WoodenDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					IsWood = 1
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del src
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Illithid == 1)
													menu += "Unlock - TK"
												if(M.Human == 1)
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Human == 0)
														for(var/obj/Items/Shafts/LockPick/P in M)
															var/a
															a = prob(M.LockPickingSkill)
															if(a == 0)
																M.Owner << "Failed"
																M.LockPickingSkill += 1
																del(P)
																break
																return
															else
																M.Owner << "Unlocked!"
																src.Locked = 0
																M.LockPickingSkill += 1
																return
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "WoodenDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "WoodenDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "WoodenDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return

			Pillars
				PortalStone
					icon = 'Book.dmi'
					icon_state = "PortalStone"
					name = "Anti-Astral Stone"
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A14 = src
									A14.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Destroy"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
									if (Result == "Destroy")
										if(src.suffix == "(Carrying)")
											M.weight -= src.weight
											del src
											return
				GoblinPillar
					icon = 'StoneItems.dmi'
					icon_state = "Pillar"
					weight = 50
					suffix = null
					density = 0
					name = "Pillar"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GoldPillar
					icon = 'GoldItems.dmi'
					icon_state = "Pillar"
					name = "Golden Pillar"
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				Statue
					icon = 'Statue.dmi'
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				DwarfPillar
					icon = 'StoneItems.dmi'
					icon_state = "Pillar"
					name = "Pillar"
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A14 = src
									A14.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
			Posts
				BoneTrainingPost
					icon = 'Cave.dmi'
					icon_state = "BonePost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return
						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				SilkTrainingPost
					icon = 'Cave.dmi'
					icon_state = "SilkPost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return
						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				WoodTrainingPost
					icon = 'Cave.dmi'
					icon_state = "Wood Post"
					weight = 50
					Content3 = 1
					suffix = null
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GoldTrainingPost
					icon = 'GoldItems.dmi'
					icon_state = "Gold Training Post"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GremlinTrainingPost
					icon = 'Gremlin Equipment.dmi'
					icon_state = "Gremlin Training Post"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				SilverTrainingPost
					icon = 'SilverItems.dmi'
					icon_state = "Silver Training Post"
					weight = 50
					Silver = 1
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src.Silver == 1)
								if(M.Vampire == 1 || M.Werewolf == 1)
									if(src in view(1,M))
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
										return
									if(src in M)
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											view() << "[M] tries to touch the silver but it leaves a steaming, burnt spot on their hand and they drop it"
											M.BloodContent -= 5
											M.BloodLoss()
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				MetalTrainingPost
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Training Post"
					weight = 50
					suffix = null
					HP = 100
					Content3 = 1
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			Tables
				Table
					icon = 'Cave.dmi'
					icon_state = "Table"
					weight = 30
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return
				GoodAltar
					icon = 'Cave.dmi'
					icon_state = "GoodAltar"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Pray"
								menu += "Destroy"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Destroy")
									for(var/mob/S in world)
										if(S == src.Owner)
											if(src.loc == M)
												M.weight -= src.weight
											S.AltarCount -= 1
											S << "One of your altars has been destroyed! [src.x],[src.y],[src.z]"
											if(S.AltarCount == 0)
												S.WorshipPoints = 0
												S << "All of your altars have been destroyed, you are powerless(Dead)!"
											del(src)
											return
								if (Result == "Pray")
									for(var/mob/S in world)
										if(S == src.Owner)
											if(M.Undead == 0 && M.Infects == 0 && M.Hunger >= 70)
												view(M) << "[M] prays to [S]"
												S << ("[usr] has prayed to you.")
												S.WorshipPoints += 15
												M.Hunger -= 70
												M.Tiredness -= 70
											else
												usr << "Undead CANNOT pray to a good god!! Or you are too hungry."
											return
							if(src.Placed == 0)
								var/list/menu = new()
								menu += "Place"
								menu += "Cancel"
								var/Result = input("Place the Altar?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Place")
									if(src.loc == M)
										M.weight -= src.weight
									src.loc = M.loc
									src.Placed = 1
									src.density = 1
									return
							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				NeutralAltar
					icon = 'Cave.dmi'
					icon_state = "NeutralAltar"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
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
													if(M in view(1,src))
														S.AltarCount -= 1
														S << "One of your altars has been destroyed! [src.x],[src.y],[src.z]"
														if(S.AltarCount == 0)
															S.WorshipPoints = 0
															S << "All of your altars have been destroyed, you are dead!"
															S.Rares -= "Neutral God"
														del(src)
														return
													else
														S << "[M] has failed to destroy your altar."
				EvilAltar
					icon = 'Cave.dmi'
					icon_state = "EvilAltar"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Sacrifice"
								menu += "Destroy"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Destroy")
									for(var/mob/S in world)
										if(S == src.Owner)
											if(src.loc == M)
												M.weight -= src.weight
											S.AltarCount -= 1
											S << "One of your altars has been destroyed! [src.x],[src.y],[src.z]"
											if(S.AltarCount == 0)
												S.WorshipPoints = 0
												S << "All of your altars have been destroyed, you are powerless(Dead)!"
											del(src)
											return
								if (Result == "Sacrifice")
									for(var/mob/S in world)
										if(S == src.Owner)
											if(M in view(2,src))
												if(M.Gremlin == 0)
													usr << "[M] leaps into the flames of the dispicable altar and allows the dark tendrils to consume it."
													S << ("[usr] has made a sacrifice to you.")
													S.WorshipPoints += M.Level
													S.WorshipPoints += M.Level
													S.WorshipPoints += M.Level
													M.DeathType = "Sacrificed To Death"
													M.GoingToDie = 1
													M.Death()
													return
												else
													M.Owner << "You cannot sacrifice this creature."
							if(src.Placed == 0)
								var/list/menu = new()
								menu += "Place"
								menu += "Cancel"
								var/Result = input("Place the Altar?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Place")
									if(src.loc == M)
										M.weight -= src.weight
									src.loc = M.loc
									src.Placed = 1
									src.density = 1
									return
							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
			Chairs
				BoneThrone
					icon = 'BoneItems.dmi'
					icon_state = "Throne"
					weight = 50
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return
				WoodenChair
					icon = 'Cave.dmi'
					icon_state = "Chair"
					weight = 15
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A14 = src
									A14.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Face North"
									menu += "Face East"
									menu += "Face West"
									menu += "Face South"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
									if (Result == "Face North")
										if(src.suffix == "(Carrying)")
											src.dir = 3
											src.layer = 5
									if (Result == "Face South")
										if(src.suffix == "(Carrying)")
											src.dir = 2
											src.layer = 4
									if (Result == "Face East")
										if(src.suffix == "(Carrying)")
											src.dir = 4
											src.layer = 4
									if (Result == "Face West")
										if(src.suffix == "(Carrying)")
											src.dir = 8
											src.layer = 4
				GoldenThrone
					icon = 'RoyalItems.dmi'
					icon_state = "Throne"
					weight = 50
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return

			Beds
				CR = 40
				GoldBed
					icon = 'GoldItems.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				MetalBed
					icon = 'MetalObjects.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				WoodenBed
					icon = 'Cave.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				SleepingBag
					icon = 'Cave.dmi'
					icon_state = "SleepingBag"
					weight = 5
					suffix = null
					New()
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				LeatherBed
					icon = 'Cave.dmi'
					icon_state = "LeatherBed"
					weight = 25
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return

		Food
			CanEat = 1
			New()
				ItemDecay()
			Ingredients
				WheatSeeds
					icon = 'Cave.dmi'
					icon_state = "Grain"
					weight = 5
					suffix = null
					CanEat = 0
					desc = "This is a pile of wheat grain"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Plant"
									menu += "Grind"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Plant")
										if (Result == "Plant")
											if(src.suffix == "(Carrying)")
												for(var/turf/T in view(0,M))
													if(T.icon_state == "FarmLand")
														if(T.HasPlantIn == 0)
															for(var/obj/Items/Seeds/S in M.loc)
																if(S != src)
																	usr << "Cant plant too many seeds in one area!"
																	return
															for(var/obj/Items/Food/Ingredients/W in M.loc)
																if(W != src)
																	usr << "Cant plant too many seeds in one area!"
																	return
															var/obj/A1 = src
															A1.loc = M.loc
															A1.suffix = "(Planted)"
															M.weight -= A1.weight
															A1.icon_state = ""
															A1.WheatGrow()
															return
									if (Result == "Grind")
										view() << "[M] grinds the wheat into flour"
										var/obj/Items/Food/Ingredients/Flour/F =  new()
										F.loc = M.loc
										M.weight -= src.weight
										del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				Flour
					icon = 'Cave.dmi'
					icon_state = "Flour"
					weight = 5
					suffix = null
					CanEat = 0
					desc = "This is a bag of wheat flour, use near water to make dough"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Make Bread Dough"
									menu += "Make Cake Mix"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Make Bread Dough")
										for(var/turf/grounds/K in view(1,M))
											if(K.icon_state == "water")
												view() << "[M] mixes the flour with water to make bread dough."
												var/obj/Items/Food/Ingredients/BreadDough/B = new()
												B.loc = M.loc
												var/obj/Items/Food/Ingredients/BreadDough/B2 = new()
												B2.loc = M.loc
												var/obj/Items/Food/Ingredients/BreadDough/B3 = new()
												B3.loc = M.loc
												var/obj/Items/Food/Ingredients/BreadDough/B4 = new()
												B4.loc = M.loc
												M.weight -= src.weight
												del src
									if (Result == "Make Cake Mix")
										for(var/turf/grounds/K in view(1,M))
											if(K.icon_state == "water")
												view() << "[M] mixes the flour with water to make cake mix."
												var/obj/Items/Food/Ingredients/CakeMix/B = new()
												B.loc = M.loc
												M.weight -= src.weight
												del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				CakeMix
					icon = 'Cave.dmi'
					icon_state = "CakePan"
					name = "Cake Mix"
					weight = 5
					suffix = null
					CanEat = 0
					desc = "This is a bowl full of cake mix"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Bake"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Bake")
										for(var/obj/Items/Furniture/Ovens in  view(1,M))
											view() << "[M] puts the pan in the oven and bakes it."
											var/obj/Items/Food/Ingredients/Bread/B = new
											B.loc = M.loc
											B.icon_state = "Cake"
											B.name = "Cake"
											B.IsCake = 1
											M.weight -= src.weight
											del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				BreadDough
					icon = 'Cave.dmi'
					icon_state = "Dough"
					name = "Bread Dough"
					weight = 5
					suffix = null
					CanEat = 0
					desc = "This is a slab of whole wheat bread dough"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Bake"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Bake")
										for(var/obj/Items/Furniture/Ovens in  view(1,M))
											view() << "[M] puts the bread dough in the oven and bakes it."
											var/obj/Items/Food/Ingredients/Bread/B = new
											B.loc = M.loc
											M.weight -= src.weight
											del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				Bread
					icon = 'Cave.dmi'
					icon_state = "Bread"
					weight = 5
					suffix = null
					CanEat = 0
					IsBread = 1
					desc = "This is a loaf of whole wheat bread"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Eat"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Eat")
										if(src.IsCake == 1)
											M.Hunger = 300
											M.weight -= src.weight
											view() << "[M] eats the delicious chocolate cake."
											del src
										else
											M.Hunger = 200
											M.weight -= src.weight
											view() << "[M] eats the loaf of dry bread"
											del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
			CookedMeats
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						var/obj/m = src
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A = m
								A.loc = M
								var/list/menu = new()
								if(M.MagicalConcentration >= 10)
									menu += "Poison Divination"
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
								if (Result == "Poison Divination")
									if(m.Poisoned == 1)
										M.Owner << "The meat is poison"
									else
										M.Owner << "The meat is not poison"
								if (Result == "Eat")
									if(m in M)
										view() << "<b><font color=blue>[M] eats [m]"
										if(m.Poisoned == 1 && M.SandKing == 0)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Poison"
											M.Death()
											return
										if(m.icon_state == "Grape")
											var/obj/Items/Seeds/GrapeSeed/G1 = new
											var/obj/Items/Seeds/GrapeSeed/G2 = new
											G1.loc = M.loc
											G2.loc = M.loc
										if(m.icon_state == "Tomato")
											var/obj/Items/Seeds/TomatoSeed/G1 = new
											var/obj/Items/Seeds/TomatoSeed/G2 = new
											G1.loc = M.loc
											G2.loc = M.loc
										M.Hunger += 100
										if(M.Spider == 1)
											M.WebContent += 25
											if(M.WebContent >= M.MaxWebContent)
												M.WebContent = M.MaxWebContent
										M.said = 0
										if(M.Hunger >= 100)
											M.Hunger = 100
										M.weight -= m.weight
										if(M.Race == "Dragon")
											if(m.Content2 == "Elf")
												M.WeaponDamageMin += 1
												M.WeaponDamageMax += 1
											if(m.Content2 == "Demon")
												M.MagmaPoints += 100
											if(m.Content2 == "Dragon")
												M.ZombiePoints += 250
											if(m.Content2 == "Gremlin")
												M.SandPoints += 50
												if(M.SandDrake == 1)
													M.Defence += 0.05
											if(m.Content2 == "Lizardman")
												M.PoisonPoints += 50
												if(M.PoisonDrake == 1)
													M.PoisonDMG += 0.5
											if(m.Content2 == "Orc")
												M.IcePoints += 50
												if(M.IceDrake == 1)
													M.ColdBreath += 1
										del(m)
										return
				CookedMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked meat, it can be eaten"

				Cheese
					icon = 'Cave.dmi'
					icon_state = "Cheese"
					weight = 5
					suffix = null
					desc = "This is a chunk of cheese, it can be eaten"

				EverlastingStew
					icon = 'Cave.dmi'
					icon_state = "Stew"
					weight = 10
					suffix = null
					desc = "This is a bowl of everlasting stew!"

				Grape
					icon = 'Cave.dmi'
					icon_state = "Grape"
					weight = 10
					suffix = null
					desc = "This is a grape, once eaten it will provide a seed, it can also be used to create wines."

				Tomato
					icon = 'Cave.dmi'
					icon_state = "Tomato"
					weight = 10
					suffix = null
					desc = "This is a tomato, it can be used as food and will provide seeds as well."

			Fungases
				Fungas
					icon = 'Cave.dmi'
					icon_state = "Fungas"
					weight = 10
					name = "Fungus"
					suffix = null
					desc = "This is a chunk of fungas, it can be eaten by some creatures such as Kobolds and Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			Meats
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						var/obj/m = src
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A = m
								A.loc = M
								var/list/menu = new()
								if(M.MagicalConcentration >= 10)
									menu += "Poison Divination"
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
								if (Result == "Poison Divination")
									if(m.Poisoned == 1)
										M.Owner << "The meat is poison"
									else
										M.Owner << "The meat is not poison"
								if (Result == "Eat")
									if(m in M)
										if(M.Carn == 0)
											var/die = prob(33)
											if(die == 1)
												view() << "<b><font color=red>[M] tried to eat meat raw but it killed [M]"
												M.HP = 0
												M.GoingToDie = 1
												M.Killer = "[m]"
												M.DeathType = "Food Poisoning"
												M.Death()
												return
											else
												view() << "<b><font color=blue>[M] eats [m]"
												if(m.Poisoned == 1 && M.Gremlin == 0)
													view() << "<b><font color=red>[M] was poisoned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[m]"
													M.DeathType = "Poison"
													M.Death()
													return
												M.Hunger += 100
												if(M.Spider == 1)
													M.WebContent += 25
													if(M.WebContent >= M.MaxWebContent)
														M.WebContent = M.MaxWebContent
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= m.weight
												del(m)
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
											if(M.Spider == 1)
												M.WebContent += 25
												if(M.WebContent >= M.MaxWebContent)
													M.WebContent = M.MaxWebContent
											M.said = 0
											if(M.Hunger >= 100)
												M.Hunger = 100
											M.weight -= m.weight
											if(M.Race == "Dragon")
												if(m.Content2 == "Elf")
													M.WeaponDamageMin += 1
													M.WeaponDamageMax += 1
												if(m.Content2 == "Demon")
													M.MagmaPoints += 100
												if(m.Content2 == "Dragon")
													M.ZombiePoints += 250
												if(m.Content2 == "Gremlin")
													M.SandPoints += 50
													if(M.SandDrake == 1)
														M.Defence += 0.05
												if(m.Content2 == "Lizardman")
													M.PoisonPoints += 50
													if(M.PoisonDrake == 1)
														M.PoisonDMG += 0.5
												if(m.Content2 == "Orc")
													M.IcePoints += 50
													if(M.IceDrake == 1)
														M.ColdBreath += 1
											del(m)
											return
				UnCookedMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked meat, it can be eaten raw by some creatures such as Kobolds or Goblins"

		woods
			New()
				ItemDecay()
			wood
				icon = 'Cave.dmi'
				icon_state = "Wood"
				weight = 20
				suffix = null
				desc = "This is a wooden log, it can be used to create furtniture, buildings and pretty much anything else"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalWill >= 5)
									menu += "Transmute Into Stone"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Transmute Into Stone")
									var/obj/Items/ores/stone/K = new()
									K.loc = M
									M.weight += K.weight
									K.suffix = "(Carrying)"
									if(src in M)
										M.weight -= src.weight
									view(M) << "[M] uses their force of will to transmute the piece of wood into a large stone."
									del src
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
		gems
			New()
				ItemDecay()
			Gems = 1
			RubyRing
				icon = 'Jewelry.dmi'
				icon_state = "Ruby Ring"
				weight = 5
				desc = "This is a Ruby Ring, it can be enchanted by a Mage to create a Ring of Fury"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									menu += "Wear"
									menu += "Remove"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(src.icon_state == "Silver Ruby Ring")
										usr << "Enchants the ring with magical essence!"
										src.Enchanted = 1
										src.name = "Ring of Fury"
									if(src.icon_state == "Ruby Ring")
										usr << "Enchants the ring with magical essence!"
										src.Enchanted = 1
										src.name = "Ring of Berserker Fury"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(M.WearingRing == 0)
											src.suffix = "(Equiped)"
											M.WearingRing = 1
											usr << "[M] puts on the [src]"
											M.WeaponDamageMin += 2
											M.WeaponDamageMax += 5
											return
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Remove")
									if(src.suffix == "(Equiped)")
										if(M.WearingRing == 1)
											src.suffix = "(Carrying)"
											M.WearingRing = 0
											usr << "[M] takes off the [src]"
											M.WeaponDamageMin -= 2
											M.WeaponDamageMax -= 5
											return
										else
											usr << "[M] isn't wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			DiamondRing
				icon = 'Jewelry.dmi'
				icon_state = "Diamond Ring"
				weight = 5
				desc = "This is a Diamond Ring, it can be enchanted by a Mage to create a Ring of Protection"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									menu += "Wear"
									menu += "Remove"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(src.icon_state == "Silver Diamond Ring")
										usr << "Enchants the ring with magical essence!"
										src.Enchanted = 1
										src.name = "Ring of Protection"
									if(src.icon_state == "Diamond Ring")
										usr << "Enchants the ring with magical essence!"
										src.Enchanted = 1
										src.name = "Ring of Invulnerable Flesh"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(M.WearingRing == 0)
											src.suffix = "(Equiped)"
											M.WearingRing = 1
											usr << "[M] puts on the [src]"
											M.Defence += 10
											if(src.icon_state == "Diamond Ring")
												M.Defence += 5
												M.ImmuneToMagic = 1
											return
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Remove")
									if(src.suffix == "(Equiped)")
										if(M.WearingRing == 1)
											src.suffix = "(Carrying)"
											M.WearingRing = 0
											usr << "[M] takes off the [src]"
											M.Defence -= 10
											if(src.icon_state == "Diamond Ring")
												M.Defence -= 5
											return
										else
											usr << "[M] isn't wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			RainbowRing
				icon = 'Jewelry.dmi'
				icon_state = "Rainbow Ring"
				weight = 5
				desc = "This is a Rainbow Ring, it can be enchanted by a Mage to create a Ring of Power"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									menu += "Wear"
									menu += "Remove"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(src.Enchanted == 0)
										usr << "Enchants the ring with magical essence!"
										src.Enchanted = 1
										src.name = "Ring of Power"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(M.WearingRing == 0)
											src.suffix = "(Equiped)"
											M.WearingRing = 1
											usr << "[M] puts on the [src]"
											M.Defence += 30
											M.ImmuneToMagic = 1
											M.WeaponDamageMin += 10
											M.WeaponDamageMax += 20
											M.ImmunePoison = 1
											return
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Remove")
									if(src.suffix == "(Equiped)")
										if(M.WearingRing == 1)
											src.suffix = "(Carrying)"
											M.WearingRing = 0
											usr << "[M] takes off the [src]"
											M.Defence -= 30
											M.WeaponDamageMin -= 10
											M.WeaponDamageMax -= 20
											return
										else
											usr << "[M] isn't wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			EmeraldRing
				icon = 'Jewelry.dmi'
				icon_state = "Emerald Ring"
				weight = 5
				desc = "This is a Emerald Ring, it can be enchanted by a Mage to create a Ring of Poison Resistance"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									if(M.WearingRing == 0)
										menu += "Wear"
									if(M.WearingRing == 1)
										menu += "Remove"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(M.Mana >= 40)
										if(src.icon_state == "Silver Emerald Ring")
											usr << "Enchants the ring with magical essence!"
											M.Mana -= 40
											src.Enchanted = 1
											src.name = "Ring of Poison Resistance"
										if(src.icon_state == "Emerald Ring")
											usr << "Enchants the ring with magical essence!"
											M.Mana -= 40
											src.Enchanted = 1
											src.name = "Ring of Pestilence"
									else
										usr << "[M] needs 40 mana to do this!"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(M.WearingRing == 0)
											if(M.ImmunePoison == 0)
												src.suffix = "(Equiped)"
												M.WearingRing = 1
												usr << "[M] puts on the [src]"
												M.ImmunePoison = 1
												return
											else
												usr << "[M] is already immune to poison!"
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Remove")
									if(src.suffix == "(Equiped)")
										if(M.WearingRing == 1)
											src.suffix = "(Carrying)"
											M.WearingRing = 0
											usr << "[M] takes off the [src]"
											M.ImmunePoison = 0
											return
										else
											usr << "[M] isn't wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			PlantFibreRing
				icon = 'Jewelry.dmi'
				icon_state = "Lycan Ring"
				weight = 5
				desc = "This is a Plant Fibre Ring, it can be enchanted by a Mage to create a Ring of Lycanthropy"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									if(M.WearingRing == 0)
										menu += "Wear"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(M.Mana >= 60)
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 60
										src.Enchanted = 1
										src.name = "Ring of Lycanthropy"
									else
										usr << "[M] needs 60 mana to do this!"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(M.WearingRing == 0)
											if(M.Werewolf == 0)
												if(M.Vampire == 0 && M.Spider == 0 && M.Gargoyle == 0 && M.Wolf == 0 && M.Wagon == 0 && M.Deer == 0 && M.icon != 'Skeleton.dmi' )
													M.WearingRing = 1
													usr << "[M] puts on the ring of Lycanthropy, it bonds to their flesh and eats into their hand!"
													M.Werewolf = 1
													M.WerewolfTransformation()
													M.Carn = 1
													M.Strength += 4
													M.Agility += 4
													M.Defence += 15
													M.AM = 1
													M.Delay -= 1
													M.Regen()
													M.weight -= src.weight
													del src
													return
												else
													usr << "[M] attempts to wear the ring but it slips off their finger leaving large, bloody gashes"
													M.BloodLoss()
													M.BloodContent -= 10
													if(M.Vampire == 1)
														usr << "[M]'s ring finger is sliced off!"
														M.WearingRing = 1
											else
												usr << "[M] is already a werewolf!"
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Emerald
				icon = 'Cave.dmi'
				icon_state = "Emerald"
				weight = 10
				desc = "This is an Emerald, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Ruby
				icon = 'Cave.dmi'
				icon_state = "Ruby"
				weight = 10
				desc = "This is an Ruby, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Diamond
				icon = 'Cave.dmi'
				icon_state = "Diamond"
				weight = 10
				desc = "This is an Diamond, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			UnCutDiamond
				icon = 'Cave.dmi'
				icon_state = "Un-CutDiamond"
				weight = 10
				desc = "This is an Un-Cut Diamond, it can be used by a Jewel Crafter to create a Diamond"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.icon_state == "Guardstone")
									menu += "Consume"
								if(M.Gargoyle == 1)
									menu += "Eat"
									menu += "Heal"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the diamond down its gullet and begins to digest it,   [M]'s skin hardens as the diamond is digested and incorporated into its body"
									M.Hunger = 100
									if(M.Defence <= 350)
										M.Defence += 5
									else
										M.Owner << "You can no longer gain defense from eating diamonds (You can increase your base defense more if you unequip all of your armor and eat a diamond then.)"
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Consume")
									usr << "The gem is placed into [M]'s gem slot"
									M.icon_state = "GuardstoneDiamond"
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Heal")
									usr << "[M] places the diamond onto it's body, the diamond begins to be absorbed into the cracks and damages sustained by [M], However, The absorbtion causes their body to become weaker and less resilient(Defence Lowered By 5 Points)"
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
									M.RightArmHP = M.OrganMaxHP
									M.LeftArmHP = M.OrganMaxHP
									M.LeftLegHP = M.OrganMaxHP
									M.RightLegHP = M.OrganMaxHP
									M.Crippled = 0
									M.CanUseRightArm = 1
									M.CanUseLeftArm = 1
									M.CanWalk = 1
									M.Defence -= 5
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			UnCutRuby
				icon = 'Cave.dmi'
				icon_state = "Un-CutRuby"
				weight = 10
				desc = "This is an Un-Cut Ruby, it can be used by a Jewel Crafter to create a Ruby"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.Gargoyle == 1)
									menu += "Eat"
								if(M.icon_state == "Guardstone")
									menu += "Consume"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the ruby down its gullet and begins to digest it   You have eaten [M.GargRuby] Rubies, you gain power at 15, 30, and 100."
									M.Hunger = 100
									M.GargRuby += 1
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Consume")
									usr << "The gem is placed into [M]'s gem slot"
									M.icon_state = "GuardstoneRuby"
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			UnCutRainbow
				icon = 'Cave.dmi'
				icon_state = "UnCutRainbowPearl"
				name = "Uncut Rainbow Pearl"
				weight = 10
				desc = "This is an Uncut Rainbow Pearl, it can be used by a Jewel Crafter to create a Rainbow Pearl"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.Gargoyle == 1)
									menu += "Eat"
								if(M.icon_state == "Guardstone")
									menu += "Consume"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									M.GargRuby += 10
									M.GargEmerald += 10
									M.Defence += 25
									usr << "[M] shoves the pearl down its gullet and begins to digest it   You have eaten [M.GargRuby] Rubies, [M.GargEmerald] Emeralds, and gain 20 defence, you gain power at 15, 30, and 100."
									M.Hunger = 400
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Rainbow
				icon = 'Cave.dmi'
				icon_state = "RainbowPearl"
				name = "Rainbow Pearl"
				weight = 10
				desc = "This is a Rainbow Pearl, it can be used by a Jewel Crafter to create a Rainbow Pearl Ring"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.Gargoyle == 1)
									menu += "Eat"
								if(M.icon_state == "Guardstone")
									menu += "Consume"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									M.GargRuby += 10
									M.GargEmerald += 10
									M.Defence += 25
									usr << "[M] shoves the pearl down its gullet and begins to digest it   You have eaten [M.GargRuby] Rubies, [M.GargEmerald] Emeralds, and gain 20 defence, you gain power at 15, 30, and 100."
									M.Hunger = 400
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			UnCutEmerald
				icon = 'Cave.dmi'
				icon_state = "Un-CutEmerald"
				desc = "This is an Un-Cut Emerald, it can be used by a Jewel Crafter to create a Emerald"
				weight = 10
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.Gargoyle == 1)
									menu += "Eat"
								if(M.icon_state == "Guardstone")
									menu += "Consume"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the emerald down its gullet and begins to digest it   You have eaten [M.GargEmerald] Emeralds, you gain power at 15, 30, and 100."
									M.Hunger = 100
									M.GargEmerald += 1
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Consume")
									usr << "The gem is placed into [M]'s gem slot"
									M.icon_state = "GuardstoneEmerald"
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
		ores
			New()
				ItemDecay()
			metal
				name = "Iron"
				icon = 'Cave.dmi'
				icon_state = "Metal"
				weight = 20
				desc = "This is a chunk of Metal, it can be used to create Ingots for armour and weapon creation"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Gargoyle == 1)
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the iron down its gullet and begins to digest it"
									M.Hunger = 100
									var/obj/St = src
									M.weight -= St.weight
									del St

								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Adamantium
				name = "Adamantium"
				icon = 'Cave.dmi'
				icon_state = "Adamantium"
				weight = 20
				desc = "This is a chunk of Adamantium, it can be used to create Ingots for amazing armour and weapon creation"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Gargoyle == 1)
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the Adamantium down its gullet and starts to crack and crumbles as it's body is destroyed!"
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									M.GoingToDie = 1
									M.Killer = "a piece of Adamantium ore"
									M.DeathType = "eating it like a moron."
									M.Death()
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Sand
				icon = 'Farm Items.dmi'
				icon_state = "Sand"
				weight = 30
				desc = "This is sand, it can be used to create glass objects."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GoldNugget
				icon = 'Cave.dmi'
				icon_state = "Nugget"
				weight = 30
				desc = "This is a golden nugget, it can be used to create Ingots for armour and weapon creation or used to create royal items as well as other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Gargoyle == 1)
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the piece of gold down its gullet"
									M.Hunger = 100
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			silver
				icon = 'Cave.dmi'
				icon_state = "Silver"
				weight = 20
				desc = "This is a lump of silver, it can be used to create coins, weapons, armour, and other fanciful things"
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									if(M.Vampire == 0 && M.Werewolf == 0)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
								else
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Gargoyle == 1)
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the piece of silver down it's gullet"
									M.Hunger = 100
									var/obj/St = src
									del St

									M.weight -= St.weight
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			stone
				icon = 'Cave.dmi'
				icon_state = "Stone"
				weight = 20
				desc = "This is a lump of stone, it can be used to detail walls and floors, it can also be used for statue creation or food for Gargoyles"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								if(M.Gargoyle == 1)
									menu += "Eat"
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Wood"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Transmute Into Wood")
									var/obj/Items/woods/wood/K = new()
									K.loc = M
									M.weight += K.weight
									K.suffix = "(Carrying)"
									if(src in M)
										M.weight -= src.weight
									view(M) << "[M] uses their force of will to transmute the piece of stone into a piece of wood."
									del src
								if (Result == "Eat")
									view() << "[M] swallows a large rock whole"
									M.Hunger = 100
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return



