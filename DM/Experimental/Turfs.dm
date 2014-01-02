

turf
	MouseDrag(src)
		var/turf/S = src
		if(isturf(src))
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
											M.WebContent -= 25
			if(usr.Function == "PlaceBoneBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/Bones/Bones/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Goblin == 1)
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
										M.weight -= W.weight
										del(W)
										break
									if(M.Kobold == 1)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "BoneBridge"
										M.weight -= W.weight
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
										if(S.icon_state == "LavaBridge")
											S.icon_state = "Lava"
											S.name = "Magma"
											S.CanFish = 0
										if(S.Content == "Water")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
										if(S.Content == "CaveWater")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
											S.CaveWater = 1
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
									if(S.Content == "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = "Sky"
										S.name = "Sky"
										S.density = 0
										S.Detailed = 0
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
												if(T.Content == "Sky")
													T.icon = 'Cave.dmi'
													T.icon_state = "Sky"
													T.name = "Sky"
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
										M.weight -= W.weight
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										del(W)
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
												S.icon_state = "DetailedFloor"
												S.name = "DetailedFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
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
												S.name = "WoodenFloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
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
													S.name = "WoodenFloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
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
													S.name = "Floor"
													S.density = 0
													S.name = null
													S.Detailed = 1
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
												S.name = "Floor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.IsWood = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Dwarf == 1)
												S.icon_state = "WoodFloor"
												S.name = "Floor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
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
													S.name = "Floor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
										break
			if(usr.Function == "PlaceBoneWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Bones/Bones/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Kobold == 1)
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
									if(M.Ratmen == 1)
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
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.name = null
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.opacity = 1
										S.IsWall = 1
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
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.name = null
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.opacity = 1
										S.IsWall = 1
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
										S.name = null
										M.BuildingSkill += 1
										S.IsWall = 1
										S.IsWood = 1
										M.WebContent -= 25
										S.CanDigAt = 1
										S.opacity = 1
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
												S.name = null
												S.IsWood = 1
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.IsWall = 1
												M.WebContent -= 25
												S.CanDigAt = 1
												S.opacity = 1

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
										S.name = "WoodWall"
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
											S.name = "WoodWall"
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
									S.name = "SecretWall"
									S.HP += 1000
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.CanDigAt = 1
									M.StoneCraftingSkill += 1
									S.density = 1
									S.IsWall = 1
									S.opacity = 1
									S.name = null
									S.Detailed = 1
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
											S.name = "SecretWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.Detailed = 1
											S.name = null
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
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.name = null
										S.IsWall = 1
										S.opacity = 1
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
										S.name = null
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
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.name = null
										S.opacity = 1
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
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.name = null
										S.opacity = 1
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
											S.icon_state = "DetailedWall"
											S.name = "DetailedWall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.name = null
											S.opacity = 1
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceGemWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1)
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.name = null
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
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
											S.name = null
											S.IsWood = 1
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											M.weight -= W.weight
											del(W)
											break
									else
										usr << "Your race can not build this!"

			if(usr.Function == "PlaceWoodenWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1)
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.name = null
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
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
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.IsWood = 1
										S.name = null
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
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
											S.name = null
											S.IsWood = 1
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
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
			icon_state = "DetailedWall"
			DblClick()
				usr.Detail()
				usr.Up = 0
				usr.Close()

		ClickDestroy
			icon_state = "Dest"
			DblClick()
				usr.Function = "DestroyFloor"
				usr << "Click and drag to destroy floor<br>"
				usr.Close()

		Dec
			icon_state = "Dec"
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
			icon_state = "B"
			DblClick()
				usr.Function = "PlaceSilkBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		Cacoon
			icon_state = "Cacoon"
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
			icon_state = "Post"
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
			icon_state = "SilkWall"
			DblClick()
				usr.Function = "PlaceSilkWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		Lair
			icon_state = "Silk"
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
			icon_state = "Walls"
			DblClick()
				usr.Walls()
		Floors
			icon_state = "Floors"
			DblClick()
				usr.Floors()
		Bridges
			icon_state = "Bridge"
			DblClick()
				usr.Bridge()
		SpiderTrap
			icon_state = "Trap"
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
							break
							usr.Up = 0
							usr.Close()

		Traps
			icon_state = "Trap"
			DblClick()
				usr.Traps()
		ClickBSTTrap
			icon_state = "BST"
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
						if(M.Kobold == 1)
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							for(var/obj/Items/Bones/Bones/W in M)
								M.CreateBST()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		ClickRibTrap
			icon_state = "RibTrap"
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
						if(M.Kobold == 1)
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							for(var/obj/Items/Bones/Bones/W in M)
								M.CreateRib()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		ClickStoneFall
			icon_state = "StoneFall"
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
						for(var/obj/Items/Traps/StoneTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							usr.Up = 0
							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateStone()
							M.weight -= W.weight
							del(W)
							break
					usr.Up = 0
					usr.Close()
		ClickTraps
			icon_state = "Trap"
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
			icon_state = "Stairs"
			DblClick()
				usr.Stairs()
		ClickStair2
			icon_state = "BambooStairs"
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
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,3)
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
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,1)

												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 1)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs2"
													W.Detailed = 1
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,W.z-1)
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
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z+1)

												M.weight -= S.weight
												del(S)
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
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
												M.weight -= S.weight
												del(S)
						usr.Close()
		ClickStair
			icon_state = "Stairs"
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
							for(var/obj/Items/ores/stone/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Sky == 1)
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
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Race != "Orc")
															W.icon = 'Cave.dmi'
															W.icon_state = "Up"
															W.Detailed = 1
															W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,3)
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
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Stairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,1)

												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 1)
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
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Race != "Orc")
															W.icon = 'Cave.dmi'
															W.icon_state = "Up"
															W.Detailed = 1
															W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,W.z-1)
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
														if(M.Kobold == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Stairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z+1)

												M.weight -= S.weight
												del(S)
						usr.Close()
					if (Result13 == "Down")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/ores/stone/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Content3 == "Peak")
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.overlays += /obj/Hole/
												if(M.LizardMan == 1)
													W.overlays += /obj/Hole/
												if(M.Vampire == 1)
													if(night == 0)
													else
														W.icon = 'Cave.dmi'
														W.icon_state = "Stairs"
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Vampire == 0)
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
												W.GoesTo = locate(W.x,W.y,1)
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
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Up"
																W2.Detailed = 1
																W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,3)
												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 0)
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.overlays += /obj/Hole/
												if(M.LizardMan == 1)
													W.overlays += /obj/Hole/
												if(M.Vampire == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "Stairs"
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Vampire == 0)
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
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
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Up"
																W2.Detailed = 1
																W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
												M.weight -= S.weight
												del(S)
						usr.Close()
		Stations
			icon_state = "Station"
			DblClick()
				usr.Stations()
		ClickFarm
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
			icon_state = "Farming"
			DblClick()
				usr.FarmLand()
		ClickTribalBridge
			icon_state = "TribalBridge"
			DblClick()
				usr.Function = "PlaceTribalBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickBoneBridge
			icon_state = "BoneBridge"
			DblClick()
				usr.Function = "PlaceBoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodBridge
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodOrcBridge
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenOrcBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickStoneBridge
			icon_state = "Bridge"
			DblClick()
				usr.Function = "PlaceStoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickSecretWall
			icon_state = "Secret"
			DblClick()
				usr.Function = "PlaceSecretWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickTribalWall
			icon_state = "TribalWall"
			DblClick()
				usr.Function = "PlaceTribalWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickOrcWall
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceOrcWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickWoodWall
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceWoodenWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickStoneWall
			icon_state = "StoneWalls"
			DblClick()
				usr.Function = "PlaceStoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickBoneWall
			icon_state = "BoneWall"
			DblClick()
				usr.Function = "PlaceBoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickOrcFloor
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceOrcFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickWoodFloor
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceWoodenFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()

		ClickFire
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
			icon_state = "Glass"
			DblClick()
				for(var/mob/Monsters/S in usr.Selected)
					var/list/menu3 = new()
					if(S.Goblin == 1)
						menu3 += "Create"
					if(S.Human == 1)
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
			icon_state = "Pos"
			DblClick()
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
			icon_state = "StoneFloor"
			DblClick()
				usr.Function = "PlaceStoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickTribalFloor
			icon_state = "Tribal"
			DblClick()
				usr.Function = "PlaceTribalFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickBoneFloor
			icon_state = "BoneFloor"
			DblClick()
				usr.Function = "PlaceBoneFloor"
				usr << "Click and drag to place floor<br>"
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
							if(usr.Vampire == 1)
								if(night == 0)
									if(usr.DayWalker == 0)
										if(usr.NotInLight == 0)
											usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
											usr.HP -= 50
											usr.SunLight()
											if(usr)
												if(usr.HP <= 0)
													usr.Freeze = 1
													spawn(2)
														usr.GoingToDie = 1
														usr.Killer = "The Sun"
														usr.DeathType = "Burned To Death"
														usr.Death()
													return
				if(src.icon_state == "Peak")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
				if(src.icon_state == "Sky")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
												spawn(2)
													usr.GoingToDie = 1
													usr.Killer = "The Sun"
													usr.DeathType = "Burned To Death"
													usr.Death()
												return
				if(src.icon_state == "Grass")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
												spawn(2)
													usr.GoingToDie = 1
													usr.Killer = "The Sun"
													usr.DeathType = "Burned To Death"
													usr.Death()
												return
				if(src.icon_state == "Marsh")
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 0.5
								if(usr.LizardMan == 1)
									usr.Coldness -= 0
								else
									usr.Coldness -= 0.3
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
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
					if(usr.Undead == 0)
						if(usr.Vampire == 0)
							if(usr.Kobold == 1)
								usr.Coldness -= 1.5
							if(usr.LizardMan == 1)
								usr.Coldness -= 0.6
							if(usr.Race == "Orc")
								usr.Coldness -= 1
							if(usr.LizardMan == 0)
								if(usr.Kobold == 0)
									if(usr.Race != "Orc")
										usr.Coldness -= 1
				if(src.icon_state == "Desert")
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 1
								if(usr.LizardMan == 1)
									usr.Coldness -= 0.3
								if(usr.Race == "Orc")
									usr.Coldness -= 0.8
								if(usr.LizardMan == 0)
									if(usr.Kobold == 0)
										if(usr.Race != "Orc")
											usr.Coldness -= 0.5
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
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

				if(src.icon_state == "Snow")
					if(usr.OnFire == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.WearingChest == 1)
									if(usr.Race != "Orc")
										usr.Coldness += 0.1
								if(usr.WearingChest == 0)
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
												usr.Coldness += 0.5
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
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									if(usr.NotInLight == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
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
					if(src.name != "stonefloor")
						src.name = "stonefloor"
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
					if(src.name != "cavefloor")
						src.name = "cavefloor"
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




		desert
			name = "desert"
			icon = 'Cave.dmi'
			icon_state = "Desert"
			PermSnow = 1
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Desert"
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
					return

				return(1)
		grass
			name = "grass"
			icon = 'Cave.dmi'
			icon_state = "Grass"
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Grass"
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
					return

				return(1)




		cavefloor2
			name = "cavefloor"
			icon = 'Cave.dmi'
			icon_state = "CaveFloor"
			CanDigAt = 0
			Sky = 1
			Entered()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 1
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
		netherplane
			name = "nether"
			icon = 'Cave.dmi'
			icon_state = "NetherFloor"
			OIcon = "NetherFloor"
			CanDigAt = 0
			Sky = 1
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
					return
				return(1)
		DetailedFloor
			name = "stone floor"
			icon = 'Cave.dmi'
			icon_state = "DetailedFloor"
			CanDigAt = 0
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
					return

				return(1)

		NoDig
			name = "Impenatrable Mountain"
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			HP = 1000000
			opacity = 1
			Cant = 0
			Sky = 1
		hellfloor
			name = "hellfloor"
			icon = 'Cave.dmi'
			icon_state = "HellFloor"
			Cant = 1
			OIcon = "HellFloor"
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
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0

		cavefloor
			name = "Mountain"
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			Cant = 0
			Sky = 1
			IsCave = 1
			OIcon = "CaveFloor"
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
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0



		DetailedWall2
			name = "Wall"
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			HP = 300000
			IsWall = 1
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
					return
				return(1)
		DetailedWall
			name = "Stone Wall"
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			IsWall = 1
			HP = 3000000
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
					return
				return(1)
		WoodFloor
			name = "wood floor"
			icon = 'Cave.dmi'
			IsWood = 1
			icon_state = "WoodFloor"
			OIcon = "Grass"
		Chasm
			name = "Chasm"
			icon = 'Cave.dmi'
			icon_state = "Chasm"
			Content = "Chasm"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				else
					if(m.density == 0)
						return(1)
					else
						var/F = prob(33)
						if(F)
							m.Owner << "[m] falls down a large chasm!<br>"
							view() << "[m] falls down a large chasm!<br>"
							del(m)
						else
							m.Owner << "[m] almost falls down a chasm!<br>"
							view() << "[m] almost falls down a chasm!<br>"
						return
		Sky
			name = "Sky"
			icon = 'Cave.dmi'
			icon_state = "Sky"
			Content3 = "Peak"
			Content = "Sky"
			OIcon = "Sky"
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
						if(A.density == 1)
							var/LL = prob(50)
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
			Content3 = "Peak"
			OIcon = "Peak"
		OrcFloor
			icon = 'Cave.dmi'
			icon_state = "OrcFloor"
			OIcon = "Snow"
		lavas
			Content3 = "Lava"
			lava
				name = "Lava"
				icon = 'Lava.dmi'
				icon_state = "Lava"
				density = 1
				Cant = 1
				Content = "Lava"

		Trees
			density = 1
			layer = 4
			opacity = 1
			HP = 250
			Sky = 1
			name = "Tree"

			Tree1
				icon = 'plants.dmi'
				icon_state = "tree 2x1"
				Tree = 1
				IsWood = 1
				OIcon = "Grass"
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
			TundraTree
				icon = 'plants.dmi'
				icon_state = "PermSnow"
				Tree = 1
				Content3 = "PermTree"
				OIcon = "Snow"
				IsWood = 1
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


			water
				name = "Water"
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				Detailed = 1
				Content = "Water"
				OIcon = "water"

			underwater
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				CaveWater = 1
				Detailed = 1
				Content = "CaveWater"
				OIcon = "water"


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
	preg
		icon = 'Cave.dmi'
		icon_state = "preg"
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
		DblClick()

			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.loc = src.GoesTo
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
		icon = /obj/
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

		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"

		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"

		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"

		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"

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
		Infection
			icon = 'Blood.dmi'
			icon_state = "Infection"
			layer = 5
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			New()
				Delete()
		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			New()
				Delete()
		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			New()
				Delete()
		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			New()
				Delete()
		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			New()
				Delete()
		Blood5
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "5"
			New()
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
			FrogManSkin
				icon = 'Cave.dmi'
				icon_state = "FrogSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of frog man skin, it can be used for creating leather armour and clothes"
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
			RatSkin
				icon = 'Cave.dmi'
				icon_state = "RatSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of Rat skin, it can be used for creating leather armour and clothes"
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
			GargoyleSkin
				icon = 'Cave.dmi'
				icon_state = "GargSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of frog man skin, it can be used for creating leather armour and clothes"
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
			HumanSkinBlack
				icon = 'Cave.dmi'
				icon_state = "SkinBlack"
				weight = 10
				name = "Human Skin"
				suffix = null
				desc = "This is a peice of human skin, it can be used for creating leather armour and clothes"
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
			HumanSkin
				icon = 'Cave.dmi'
				icon_state = "HumanSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of human skin, it can be used for creating leather armour and clothes"
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
			DwarfSkin
				icon = 'Cave.dmi'
				icon_state = "HumanSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of dwarf skin, it can be used for creating leather armour and clothes"
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
			GoblinSkin
				icon = 'Cave.dmi'
				icon_state = "GoblinSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of goblin skin, it can be used for creating leather armour and clothes"
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
			VampireSkin
				icon = 'Cave.dmi'
				icon_state = "VampireSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of vampire skin, it can be used for creating leather armour and clothes"
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
			WolfFur
				icon = 'Cave.dmi'
				icon_state = "WolfSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of wolf fur, it can be used for creating leather armour and clothes"
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
			WerewolfSkin
				icon = 'Cave.dmi'
				icon_state = "WolfSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of werewolf fur, it can be used for creating leather armour and clothes"
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
			KoboldSkin
				icon = 'Cave.dmi'
				icon_state = "KoboldSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of kobold skin, it can be used for creating leather armour and clothes"
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
			SpiderSkin
				icon = 'Cave.dmi'
				icon_state = "WolfSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of spider skin, it can be used for creating leather armour and clothes"
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
			MoleSkin
				icon = 'Cave.dmi'
				icon_state = "DeerSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of mole skin, it can be used for creating leather armour and clothes"
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
			LizardSkin
				icon = 'Cave.dmi'
				icon_state = "LizardSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of lizard skin, it can be used for creating leather armour and clothes"
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
			DemonSkin
				icon = 'Cave.dmi'
				icon_state = "DemonSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of demon skin, it can be used for creating leather armour and clothes"
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
			GremlinSkin
				icon = 'Cave.dmi'
				icon_state = "GremlinSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of gremlin skin, it can be used for creating leather armour and clothes"
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
			OrcSkin
				icon = 'Cave.dmi'
				icon_state = "OrcSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of orc skin, it can be used for creating leather armour and clothes"
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
			DeerSkin
				icon = 'Cave.dmi'
				icon_state = "DeerSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of deer skin, it can be used for creating leather armour and clothes"
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
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Armours
			Shields
				SilverBuckler
					icon = 'SilverItems.dmi'
					icon_state = "Silver Buckler"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/SilverBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
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
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/GoldBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				MetalBuckler
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Buckler"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/MetalBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				LizardShield
					icon = 'MetalObjects.dmi'
					icon_state = "LizShield"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/LizardShield/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				ChitinBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Buckler"
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/ChitinBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				BoneBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Bone Buckler"
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/BoneBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				WoodenBuckler
					icon = 'GoblinBuckler.dmi'
					icon_state = "poor"
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/WoodenBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
			Legs


				LeatherLeggings
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeggings"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/LeatherLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/LeatherLeggings/

											else
												usr << "Not enough skill to use!"
				DemonLeatherLeggings
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherLeggings"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											if(M.Werepowers == 0)
												var/obj/A2 = src
												M.WearingLegs = 0
												A2.loc = M
												A2.suffix = "(Carrying)"
												M.overlays -= /obj/Items/Armours/Legs/DemonLeatherLeggings/
												M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DemonLeatherLeggings/

											else
												usr << "Not enough skill to use!"
				SilverLeggings
					icon = 'SilverItems.dmi'
					icon_state = "Silver Leggings"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SilverLeggings/

											else
												usr << "Not enough skill to use!"
				RubyMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalRubyLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
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
											M.overlays -= /obj/Items/Armours/Legs/RubyMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubyMetalLeggings/

											else
												usr << "Not enough skill to use!"
				RubySilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverRubyLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/RubySilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubySilverLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalEmeraldLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldMetalLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverEmeraldLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldSilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldSilverLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalDiamondLeggings"
					weight = 35
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondMetalLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverDiamondLeggings"
					weight = 35
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondSilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondSilverLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldDiamondLeggings"
					weight = 35
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondGoldLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldEmeraldLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldGoldLeggings/

											else
												usr << "Not enough skill to use!"
				RubyGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldRubyLeggings"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/RubyGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubyGoldLeggings/

											else
												usr << "Not enough skill to use!"
				GoldLeggings
					icon = 'GoldItems.dmi'
					icon_state = "Gold Leggings"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/GoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/GoldLeggings/

											else
												usr << "Not enough skill to use!"
				MetalLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Leggings"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/MetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/MetalLeggings/

											else
												usr << "Not enough skill to use!"
				SupernaturalMetalLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Supernatural Leggings"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SupernaturalMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SupernaturalMetalLeggings/

											else
												usr << "Not enough skill to use!"
				ChitinLeggings
					icon = 'BoneItems.dmi'
					icon_state = "ChitinLeggings"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/ChitinLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/ChitinLeggings/

											else
												usr << "Not enough skill to use!"
				SkornLeggings
					icon = 'SkornArmour.dmi'
					icon_state = "SLegs"
					weight = 10
					suffix = null
					name = "Skorn Leggings - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of hundreds, its defence is godly, its craftmanship un-holy, it is made from an unknown material and was forged by demons."
					New()
						Defence = rand(25,30)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SkornLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SkornLeggings/

											else
												usr << "Not enough skill to use!"
				BoneLeggings
					icon = 'BoneItems.dmi'
					icon_state = "BoneLeggings"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/BoneLeggings/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/BoneLeggings/
														M.WeaponDamageMin += src.WeaponDamageMin
														M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
				SupernaturalBoneLeggings
					icon = 'Superbone.dmi'
					icon_state = "leggings"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SupernaturalBoneLeggings/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SupernaturalBoneLeggings/
														M.WeaponDamageMin += src.WeaponDamageMin
														M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
			RightArms


				GoldRightGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GRightArm"
					weight = 7
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/GoldRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/GoldRightGauntlet/

												else
													usr << "Not enough skill to use!"
				ChitinRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CRightArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/ChitinRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/ChitinRightGauntlet/

												else
													usr << "Not enough skill to use!"

				LeatherRightGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherRight"
					weight = 2
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/LeatherRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/LeatherRightGauntlet/

												else
													usr << "Not enough skill to use!"
				DemonLeatherRightGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherRight"
					weight = 2
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/DemonLeatherRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/DemonLeatherRightGauntlet/

												else
													usr << "Not enough skill to use!"
				BoneRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BRightArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/BoneRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/BoneRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SupernaturalBoneRightGauntlet
					icon = 'Superbone.dmi'
					icon_state = "rightarm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SupernaturalBoneRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SupernaturalBoneRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SilverRightGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverRight"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SilverRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SilverRightGauntlet/

												else
													usr << "Not enough skill to use!"
				MetalRightGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MRightArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/MetalRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/MetalRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SupernaturalMetalRightGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "SuperRightArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SupernaturalMetalRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SupernaturalMetalRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SkornRightGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SRightArm"
					name = "Skorn Gauntlet - UnHoly"
					weight = 5
					suffix = null
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(15,20)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SkornRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet/

												else
													usr << "Not enough skill to use!"
			LeftArms


				GoldLeftGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GLeftArm"
					weight = 7
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/GoldLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/GoldLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				ChitinLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CLeftArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/ChitinLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/ChitinLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				BoneLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BLeftArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/BoneLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/BoneLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SupernaturalBoneLeftGauntlet
					icon = 'Superbone.dmi'
					icon_state = "leftarm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SupernaturalBoneLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SupernaturalBoneLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				LeatherLeftGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeft"
					weight = 2
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/LeatherLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/LeatherLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				DemonLeatherLeftGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "DemonLeatherLeft"
					weight = 2
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/DemonLeatherLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/DemonLeatherLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SilverLeftGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverLeft"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SilverLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SilverLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				MetalLeftGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MLeftArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/MetalLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/MetalLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SupernaturalMetalLeftGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "SuperLeftArm"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SupernaturalMetalLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SupernaturalMetalLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SkornLeftGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SLeftArm"
					weight = 5
					suffix = null
					name = "Skorn Gauntlet - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(15,20)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SkornLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet/

												else
													usr << "Not enough skill to use!"
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
											if(src.suffix == "(Equiped)" && M.Werepowers == 0)
												var/obj/A2 = src
												M.WearingBack = 0
												A2.loc = M
												A2.dir = NORTH
												A2.suffix = "(Carrying)"
												M.overlays -= /obj/Items/Armours/Back/LeatherQuiver/
										if (Result == "Equip" && M.Werepowers == 0)
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


				LeatherChestPlate
					icon = 'LeatherItems.dmi'
					icon_state = "Leather ChestPlate"
					name = "Leather Top"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/LeatherChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

											else
												usr << "Not enough skill to use!"
				Vault101Jumpsuit
					icon = 'MetalObjects.dmi'
					icon_state = "Vault101"
					name = "Vault 101 Jumpsuit"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/Vault101Jumpsuit/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/Vault101Jumpsuit/

											else
												usr << "Not enough skill to use!"
				BCoat
					icon = 'MetalObjects.dmi'
					icon_state = "Coat"
					name = "Brown Trenchcoat"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/BCoat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/BCoat/

											else
												usr << "Not enough skill to use!"
				MustardCoat
					icon = 'MetalObjects.dmi'
					icon_state = "MustardCoat"
					name = "Mustard Trenchcoat"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/MustardCoat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/MustardCoat/

											else
												usr << "Not enough skill to use!"
				BlackCoat
					icon = 'MetalObjects.dmi'
					icon_state = "BlackCoat"
					name = "Black Trenchcoat"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/BlackCoat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/BlackCoat/

											else
												usr << "Not enough skill to use!"
				DemonLeatherChestPlate
					icon = 'LeatherItems.dmi'
					icon_state = "Demon Leather ChestPlate"
					name = "Demon Leather Top"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DemonLeatherChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/DemonLeatherChestPlate/

											else
												usr << "Not enough skill to use!"
				BlackRobe
					icon = 'Robe.dmi'
					icon_state = "BlackRobe"
					name = "Magician's Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/BlackRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/BlackRobe/

											else
												usr << "Not enough skill to use!"
				ShaperRobe
					icon = 'Robe.dmi'
					icon_state = "ShaperRobe"
					name = "Shaper Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/ShaperRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/ShaperRobe/

											else
												usr << "Not enough skill to use!"
				ChaosRobe
					icon = 'Robe.dmi'
					icon_state = "ChaosRobe"
					name = "Chaos Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/ChaosRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/ChaosRobe/

											else
												usr << "Not enough skill to use!"
				AstralRobe
					icon = 'Robe.dmi'
					icon_state = "AstralRobe"
					name = "Astral Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/AstralRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/AstralRobe/

											else
												usr << "Not enough skill to use!"
				RedRobe
					icon = 'Robe.dmi'
					icon_state = "RedRobe"
					name = "Magician's Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RedRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RedRobe/

											else
												usr << "Not enough skill to use!"
				NecroRobe
					icon = 'Robe.dmi'
					icon_state = "NecroRobe"
					name = "Necromancer's Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/NecroRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/NecroRobe/

											else
												usr << "Not enough skill to use!"
				WhiteRobe
					icon = 'Robe.dmi'
					icon_state = "WhiteRobe"
					name = "Priest's Robe"
					weight = 5
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/WhiteRobe/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/WhiteRobe/

											else
												usr << "Not enough skill to use!"

				SilverChestPlate
					icon = 'SilverItems.dmi'
					icon_state = "Silver ChestPlate"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SilverChestPlate/

											else
												usr << "Not enough skill to use!"
				GoldChestPlate
					icon = 'GoldItems.dmi'
					icon_state = "Gold ChestPlate"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/GoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/GoldChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestEmerald"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestEmerald"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestDiamond"
					weight = 30
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestDiamond"
					weight = 30
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestDiamond"
					weight = 30
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
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestEmerald"
					weight = 30
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
							src.destination = null
							if(src in M)

								if(src.Wagon == 0)



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
											A1.loc = src.loc
											A1.suffix = null
											src.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											src.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											src.overlays -= /obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/
											src.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(src.ArmourSkill >= src.Skill)
												if(src.WearingChest == 0)
													var/obj/A = src
													src.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													src.Defence += A.Defence
													src.overlays += /obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				RubyGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestRuby"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubyGoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubyGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				RubySilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestRuby"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubySilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubySilverChestPlate/

											else
												usr << "Not enough skill to use!"
												return
				RubyMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestRuby"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubyMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubyMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				MetalChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Metal ChestPlate"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/MetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/



											else
												usr << "Not enough skill to use!"
				SupernaturalMetalChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Supernatural ChestPlate"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SupernaturalMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SupernaturalMetalChestPlate/



											else
												usr << "Not enough skill to use!"
				ChitinChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "ChitinChestPlate"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/ChitinChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/ChitinChestPlate/

											else
												usr << "Not enough skill to use!"
				SkornChestPlate
					icon = 'SkornArmour.dmi'
					icon_state = "SChest"
					weight = 10
					suffix = null
					name = "Skorn ChestPlate - UnHoly"
					layer = 4
					desc = "This armour is tainted with the blood of many, it is made from an unknown material, its defence is godly, its craftmanship is un-holy, it was forged by demons"
					New()
						Defence = rand(35,45)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SkornChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/

											else
												usr << "Not enough skill to use!"
				BoneChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "Bone ChestPlate"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/BoneChestPlate/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
				SupernaturalBoneChestPlate
					icon = 'Superbone.dmi'
					icon_state = "chest"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SupernaturalBoneChestPlate/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SupernaturalBoneChestPlate/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
			NeckGuards
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				BlackCape
					icon = 'Robe.dmi'
					icon_state = "BlackCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/BlackCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/BlackCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				AstralCape
					icon = 'Robe.dmi'
					icon_state = "AstralCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/AstralCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/AstralCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				NecroCape
					icon = 'Robe.dmi'
					icon_state = "NecroCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/NecroCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/NecroCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				ChaosCape
					icon = 'Robe.dmi'
					icon_state = "ChaosCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/ChaosCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/ChaosCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				RedCape
					icon = 'Robe.dmi'
					icon_state = "RedCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/RedCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/RedCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				WhiteCape
					icon = 'Robe.dmi'
					icon_state = "WhiteCape"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											M.overlays -= /obj/Items/Armours/NeckGuards/WhiteCape/
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													M.overlays += /obj/Items/Armours/NeckGuards/WhiteCape/
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				SilverNeckGuard
					icon = 'SilverItems.dmi'
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip" && M.Werepowers == 0)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"

									if (Result == "Equip" && M.Werepowers == 0)
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



				BoneCrown
					icon = 'RoyalItems.dmi'
					icon_state = "BoneCrown"
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

								if(M)



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

				Crown
					icon = 'GoldItems.dmi'
					icon_state = "Crown"
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

				LeatherHelmet
					icon = 'LeatherItems.dmi'
					icon_state = "Leather Helmet"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/LeatherHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/LeatherHelmet/

											else
												usr << "Not enough skill to use!"
				CoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "CoatHat"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/CoatHat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/CoatHat/

											else
												usr << "Not enough skill to use!"
				MustardCoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "MustardCoatHat"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/MustardCoatHat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/MustardCoatHat/

											else
												usr << "Not enough skill to use!"
				DarkMask
					icon = 'MetalObjects.dmi'
					icon_state = "DarkMask"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DarkMask/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DarkMask/

											else
												usr << "Not enough skill to use!"
				BlackCoatHat
					icon = 'MetalObjects.dmi'
					icon_state = "BlackCoatHat"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/BlackCoatHat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/BlackCoatHat/

											else
												usr << "Not enough skill to use!"
				DemonLeatherHelmet
					icon = 'LeatherItems.dmi'
					icon_state = "Demon Leather Helmet"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DemonLeatherHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DemonLeatherHelmet/

											else
												usr << "Not enough skill to use!"
				BlackHood
					icon = 'Robe.dmi'
					icon_state = "BlackHood"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/BlackHood/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/BlackHood/

											else
												usr << "Not enough skill to use!"
				ShaperHood
					icon = 'Robe.dmi'
					icon_state = "ShaperHood"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/ShaperHood/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/ShaperHood/

											else
												usr << "Not enough skill to use!"
				ChaosHood
					icon = 'Robe.dmi'
					icon_state = "ChaosHood"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/ChaosHood/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/ChaosHood/

											else
												usr << "Not enough skill to use!"
				RedHat
					icon = 'Robe.dmi'
					icon_state = "RedHat"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/RedHat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/RedHat/

											else
												usr << "Not enough skill to use!"
				AstralHat
					icon = 'Robe.dmi'
					icon_state = "AstralHat"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/AstralHat/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/AstralHat/

											else
												usr << "Not enough skill to use!"
				WhiteHood
					icon = 'Robe.dmi'
					icon_state = "WhiteHood"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/WhiteHood/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/WhiteHood/

											else
												usr << "Not enough skill to use!"
				SilverHelmet
					icon = 'SilverItems.dmi'
					icon_state = "Silver Helmet"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/SilverHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/SilverHelmet/

											else
												usr << "Not enough skill to use!"
				GoldHelmet
					icon = 'GoldItems.dmi'
					icon_state = "Gold Helmet"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/GoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/GoldHelmet/

											else
												usr << "Not enough skill to use!"
				DiamondMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Metal Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DiamondMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DiamondMetalHelmet/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Gold Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/EmeraldGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/EmeraldGoldHelmet/

											else
												usr << "Not enough skill to use!"
				DiamondGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Gold Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DiamondGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DiamondGoldHelmet/

											else
										usr << "Not enough skill to use!"
				RubyGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Gold Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/RubyGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/RubyGoldHelmet/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Metal Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/EmeraldMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/EmeraldMetalHelmet/

											else
												usr << "Not enough skill to use!"
				RubyMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Metal Helmet"
					weight = 35
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/RubyMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/RubyMetalHelmet/

											else
										usr << "Not enough skill to use!"
				MetalHelmet
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Helmet"
					weight = 30
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/MetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/MetalHelmet/

											else
												usr << "Not enough skill to use!"
				ChitinHelmet
					icon = 'BoneItems.dmi'
					icon_state = "ChitinHelmet"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/ChitinHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/ChitinHelmet/

											else
										usr << "Not enough skill to use!"
				SkornPlateHelmet
					icon = 'SkornArmour.dmi'
					icon_state = "SHelmet"
					weight = 10
					suffix = null
					name = "Skorn Plate Helmet - UnHoly"
					layer = 4
					desc = "This helmet is tainted with the death of hundreds, it is made out of an unknown material, its craftmanship is un-holy, its defence is godly. It was forged by demons."
					New()
						Defence = rand(35,45)
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/SkornPlateHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/

											else
												usr << "Not enough skill to use!"
				BoneHelmet
					icon = 'Cave.dmi'
					icon_state = "Bone Helmet"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/BoneHelmet/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/BoneHelmet/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
				SupernaturalBoneHelmet
					icon = 'Superbone.dmi'
					icon_state = "helmet"
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
										if(src.suffix == "(Equiped)" && M.Werepowers == 0)
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/SupernaturalBoneHelmet/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip" && M.Werepowers == 0)
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/SupernaturalBoneHelmet/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
		Weapons


			Swords
				GoldGladius
					icon = 'GoldItems.dmi'
					icon_state = "Gold Gladius"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoldGladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Pistol
					icon = 'MetalObjects.dmi'
					icon_state = "Pistol"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Pistol/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoltActionRifle
					icon = 'MetalObjects.dmi'
					icon_state = "Rifle"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/BoltActionRifle/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Mesmetron
					icon = 'MetalObjects.dmi'
					icon_state = "Mesmetron"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Mesmetron/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Gladius
					icon = 'MetalObjects.dmi'
					icon_state = "Gladius"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Gladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				FireSword
					icon = 'MetalObjects.dmi'
					icon_state = "FireSword"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/FireSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				SupernaturalSword
					icon = 'MetalObjects.dmi'
					icon_state = "Supernatural Sword"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/SupernaturalSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				DualGladius
					icon = 'MetalObjects.dmi'
					icon_state = "LeftHandGladius"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.WearingShield = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/DualGladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				SoulBlade
					icon = 'MetalObjects.dmi'
					icon_state = "SoulBlade"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Gladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoldStraightSword
					icon = 'GoldItems.dmi'
					icon_state = "Gold Sword"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoldStraightSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Lightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "Saber"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Lightsaber/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BlueLightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "Blue"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/BlueLightsaber/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				RedLightsaber
					icon = 'Lightsaber.dmi'
					icon_state = "RedSaber"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/RedLightsaber/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HellForgedSword
					icon = 'DemonicItems.dmi'
					icon_state = "HellSword"
					weight = 50
					suffix = null
					layer = 4
					New()
						CursedItem()
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
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/HellForgedSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HellForgedDagger
					icon = 'DemonicItems.dmi'
					icon_state = "HellDagger"
					weight = 25
					suffix = null
					layer = 4
					New()
						CursedItem()
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
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/HellForgedDagger/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				StraightSword
					icon = 'MetalObjects.dmi'
					icon_state = "Sword"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/StraightSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneSword
					icon = 'BoneItems.dmi'
					icon_state = "BoneSword"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/BoneSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				ChitinSword
					icon = 'BoneItems.dmi'
					icon_state = "ChitinSword"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/ChitinSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoblinSword
					icon = 'GoblinSword.dmi'
					icon_state = "Swords"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoblinSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HolySword
					icon = 'HolyItems.dmi'
					icon_state = "HolySword"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/HolySword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Daggers
				GoldDagger
					icon = 'GoldItems.dmi'
					icon_state = "Gold Dagger"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Daggers/GoldDagger/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalDagger
					icon = 'Cave.dmi'
					icon_state = "Metal Dagger"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Daggers/MetalDagger/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Maces
				GoldMace
					icon = 'GoldItems.dmi'
					icon_state = "GoldMace"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/GoldMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				SkullMace
					icon = 'BoneItems.dmi'
					icon_state = "Bone Mace"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/SkullMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Staff
					icon = 'MetalObjects.dmi'
					icon_state = "MageStaff"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/Staff/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				AstralStaff
					icon = 'MetalObjects.dmi'
					icon_state = "AstralStaff"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/AstralStaff/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				NecroStaff
					icon = 'MetalObjects.dmi'
					icon_state = "NecroStaff"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/NecroStaff/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalMace
					icon = 'MetalObjects.dmi'
					icon_state = "Mace"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/MetalMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				DemonMace
					icon = 'MetalObjects.dmi'
					icon_state = "HellMace"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/DemonMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Bows
				WoodenBow
					icon = 'WoodItems.dmi'
					icon_state = "WoodBow"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/WoodenBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				ElfBow
					icon = 'WoodItems.dmi'
					icon_state = "Elf Bow"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/ElfBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalBow
					icon = 'MetalObjects.dmi'
					icon_state = "MetalBow"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/MetalBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneBow
					icon = 'BoneItems.dmi'
					icon_state = "BoneBow"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/BoneBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Axes
				GoldAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Axe"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/GoldAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneAxe
					icon = 'BoneItems.dmi'
					icon_state = "BoneAxe"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/BoneAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				ChitinAxe
					icon = 'BoneItems.dmi'
					icon_state = "ChitinAxe"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/ChitinAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalOrcAxe
					icon = 'MetalObjects.dmi'
					icon_state = "MetalOrcAxe"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/MetalOrcAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BattleAxe
					icon = 'MetalObjects.dmi'
					icon_state = "BattleAxe"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.WearingShield = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/BattleAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HellAxe
					icon = 'MetalObjects.dmi'
					icon_state = "HellAxe"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/HellAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return


				MetalAxe
					icon = 'Cave.dmi'
					icon_state = "Axe"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/MetalAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Picks
				GoldPickAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Pick"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Picks/GoldPickAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				PickAxe
					icon = 'Cave.dmi'
					icon_state = "Metal Pick"
					weight = 25
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
										if(M.Wagon == 0)
											usr << "[M] : I cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Picks/PickAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Spears
				SilverSpear
					icon = 'SilverItems.dmi'
					icon_state = "Silver Spear"
					weight = 25
					suffix = null
					layer = 4
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										if(M.Vampire == 0)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											return
										else
											view() << "[M] tries to pick up the silver spear but it leaves a steaming, burnt spot on their hand and they drop it"
											M.BloodContent -= 10
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
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/SilverSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoldSpear
					icon = 'GoldItems.dmi'
					icon_state = "Gold Spear"
					weight = 30
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/GoldSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return

				MetalSpear
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Spear"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/MetalSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HellForgedSpear
					icon = 'DemonicItems.dmi'
					icon_state = "HellSpear"
					weight = 25
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/HellForgedSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				ChitinSpear
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Spear"
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/ChitinSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				WoodenSpear
					icon = 'WoodItems.dmi'
					icon_state = "Wood Spear"
					weight = 15
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/WoodenSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneSpear
					icon = 'BoneSpear.dmi'
					icon_state = "Poor"
					weight = 15
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/BoneSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Spear
					icon = 'Spear.dmi'
					icon_state = "Poor"
					weight = 20
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)" && M.Werepowers == 0)
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										M.overlays -= /obj/Items/Weapons/Spears/Spear/
										return
		Traps
			IsTrap = 1
			Cages
				Content3 = "Cage"
				GoldCage
					icon = 'GoldItems.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a gold cage, it can be used to capture creatures in"
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
				MetalCage
					icon = 'MetalObjects.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a metal cage, it can be used to capture creatures in"
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
				Cacoon
					icon = 'Spiders.dmi'
					icon_state = "Cage"
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
				BoneCage
					icon = 'BoneItems.dmi'
					icon_state = "Cage"
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
				WoodenCage
					icon = 'Cave.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a wooden cage, it can be used to capture creatures in"
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
								for(var/turf/grounds/waters/W in view(1,M))
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
										menu += "Drink"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 10
										V.BloodLoss()
										return
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
								for(var/turf/grounds/waters/W in view(1,M))
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
								for(var/turf/grounds/waters/W in view(1,M))
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
				desc = "This Scroll Holds a spell that will be used up after you cast it.."
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
				desc = "This Scroll Holds a spell that will be used up after you cast it.."
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
									for(var/turf/grounds/desert/D in view(0,M))
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
								menu += "Practice"
								if(M.MagicalAptitude == 1)
									if(M.NecromancySkill >= 1)
										menu += "Raise Zombie"
										menu += "Raise Skeleton"
										menu += "Dread Bolt"
									if(M.NecromancySkill >= 15)
										menu -= "Raise Zombie"
										menu -= "Raise Skeleton"
										menu -= "Dread Bolt"
										menu += "Raise Zombie II"
										menu += "Raise Skeleton II"
										menu += "Dread Bolt II"
									if(M.NecromancySkill >= 30)
										menu -= "Raise Zombie"
										menu -= "Raise Skeleton"
										menu -= "Dread Bolt"
										menu -= "Raise Zombie II"
										menu -= "Raise Skeleton II"
										menu -= "Dread Bolt II"
										menu += "Raise Zombie III"
										menu += "Raise Skeleton III"
										menu += "Dread Bolt III"
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
										Z.name = "[M]'s Skeleton"
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
										Z.name = "[M]'s Skeleton"
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
										view() << "[M] fires a bolt of death energy into [B], raising an evil creature from the bones!"
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
										usr.UnitList += King
										view() << "[M] places a small, yellow caccoon, with streaks of dark green, on the ground, The caccoon starts to crack, shake, and make a loud popping sound as a blobbish creature with no legs and a gaping mouth filled with tendrils escapes from it!"
										for(var/obj/Items/Shafts/MobileSandKing/Sand in M)
											del Sand
									else
										usr << "Please do not try to release multiple sandkings from the same caccon, it does not work."
			DemonBook
				icon = 'Book.dmi'
				icon_state = "DemonBook"
				weight = 5
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
										Z.CanBeSlaved = 0
										Z.IsNPC = 0
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
										M.Owner << "[M] is possessed by demonic forces!"
										M.TurnDemon()
										M.Strength += 20
										M.Defence += 20
										M.EXPNeeded -= 1000
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
								menu += "Practice"
								menu += "Summon Goblin"
								if (M.SummoningSkill >= 10)
									menu += "Summon Spider"
								if (M.SummoningSkill >= 30)
									menu += "Summon Vampire"
								if (M.SummoningSkill >= 50)
									menu += "Summon Devourer"
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
										V.CanWalk = 0
										V.BloodContent -= 25
										V.BloodLoss()
										view() << "[M] holds their hand up and uses Force Choke on [V]!!!"
										spawn(200)
										V.CanWalk = 1
									return
								if (Result == "Force Lightning")
									for(var/mob/Monsters/V in oview(5,M))
										V.BloodContent -= 100
										V.BloodLoss()
										view() << "[M] holds their hand up and fires dozens of bolts of Force Lightning into [V]!!!"
									return
								if (Result == "Force Throw")
									for(var/mob/Monsters/V in oview(5,M))
										V.loc = locate(V.x+2,V.y+5,V.z)
										V.BloodContent -=15
										V.BloodLoss()
										view() << "[M] uses force throw on [V] and [V] is flung several yards and battered when it hits the ground!!!"
								if (Result == "Throw Lightsaber")
									for(var/mob/Monsters/V in oview(5,M))
										V.BloodContent -= 50
										view() << "[M] quickly throws their lightsaber at [V] possibly severing a limb!"
										var/RightArm = prob(25)
										var/LeftArm = prob(25)
										var/RightLeg = prob(25)
										var/LeftLeg = prob(25)
										if(RightArm)
											V.HasRightArm = 0
											V.LimbLoss()
										if(LeftArm)
											V.HasLeftArm = 0
											V.LimbLoss()
										if(RightLeg)
											V.HasRightLeg = 0
											V.LimbLoss()
										if(LeftLeg)
											V.HasLeftLeg = 0
											V.LimbLoss()
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
								menu += "Possess"
								menu += "Dark Lash"
								menu += "Paralyzing Darkness"
								menu += "Blinding Darkness"
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
								menu += "Swamp"
								menu += "Arctic"
								menu += "Desert"
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
								menu += "Teleport"
								menu += "Raise Zombie"
								menu += "Raise Skeleton"
								menu += "Ban Hammah"
								menu += "Dread Bolt"
								menu += "Lash"
								menu += "Incapacitate"
								menu += "Destruction"
								menu += "Destroy Undead"
								menu += "Simulacrum"
								menu += "Chance"
								menu += "Chaotic Bolt"
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
								menu += "Drop"
								menu += "Inspect"
								menu += "Practice"
								if(M.DestructionSkill >= 1)
									menu += "Lash"
									menu += "Incapacitate"
									menu += "Destruction"
								if(M.DestructionSkill >= 15)
									menu -= "Lash"
									menu -= "Incapacitate"
									menu -= "Destruction"
									menu += "Lash II"
									menu += "Incapacitate II"
									menu += "Destruction II"
								if(M.DestructionSkill >= 30)
									menu -= "Lash"
									menu -= "Incapacitate"
									menu -= "Destruction"
									menu -= "Lash II"
									menu -= "Incapacitate II"
									menu -= "Destruction II"
									menu += "Lash III"
									menu += "Incapacitate III"
									menu += "Destruction III"
								if(M.DestructionSkill >= 60)
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
									var/obj/Items/Weapons/Swords/FireSword/A4 = new
									view() << "[M] slowly chants and sways, as a gaping red maw opens from the earth, spewing forth flames and brimstone..!"
									view() << "<b><font color =red>Pure essence of destruction forms from the maw into the shape of a blade!"
									world << "<FONT SIZE=+1><font color =red> Someone has created a Sword of Destruction!!!"
									A4.WeaponDamageMin = 200
									A4.WeaponDamageMax = 345
									A4.loc = M.loc
									A4.name = "Sword of Destruction"
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
								menu += "Drop"
								menu += "Inspect"
								menu += "Practice"
								if(M.HolySkill >= 1)
									menu += "Holy Fast"
								if(M.HolySkill >= 15)
									menu += "Heal Other"
									menu += "Heal Self"
									menu += "Destroy Undead"
								if(M.HolySkill >= 30)
									menu -= "Destroy Undead"
									menu += "Destroy Unholy Creature"
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
								menu += "Practice"
								if(M.AstralSkill >= 1)
									menu += "Teleport"
									menu += "Find"
								if(M.AstralSkill >= 15)
									menu -= "Teleport"
									menu -= "Find"
									menu += "Teleport II"
									menu += "Find II"
									menu += "Lightning Bolt"
								if(M.AstralSkill >= 30)
									menu -= "Teleport"
									menu -= "Find"
									menu -= "Teleport II"
									menu -= "Find II"
									menu -= "Lightning Bolt"
									menu += "Teleport III"
									menu += "Create Portal"
									menu += "Destroy Portal"
									menu += "Find III"
									menu += "Lightning Bolt II"
									menu += "Create Potion of Eternal Life"
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
									M.AstralSkill += 0.25
									if(M.AstralSkill >= 1)
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view() << "A glowing blue portal snaps into existance and [M] steps through it!"
										M.Tiredness -= 80
										for(var/turf/T in view(0,M))
											if(T.density == 1)
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
									M.AstralSkill += 0.25
									if(M.AstralSkill >= 1)
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view() << "A glowing blue portal snaps into existance and [M] steps through it!"
										M.Tiredness -= 60
										for(var/turf/T in view(0,M))
											if(T.density == 1)
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
									M.AstralSkill += 0.25
									var/X = M.icon
									M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
									M.icon = 'Blood.dmi'
									flick("AstralBurst",M)
									view() << "A glowing blue portal snaps into existance and [M] steps through it!"
									M.Tiredness -= 40
									for(var/turf/T in view(0,M))
										if(T.density == 1)
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
									var/obj/AstralPortal/Port = new
									Port.loc = M.loc
									Port.GoesTo = usr.loc
									view() << "Someone has created a portal with this location as the destination!!!"
									M.Hunger -= 50
									M.Tiredness -= 90
									M.AstralSkill += 0.25
									return
								if (Result == "Destroy Portal")
									for(var/obj/AstralPortal/Port)
										del(Port)
										view() << "[M] fires a bolt of astral energy into the portal and causes it to implode upon itself, destroying it completely"
										M.Tiredness -= 50
										M.Hunger -= 50
										M.AstralSkill += 0.25
										return
								if (Result == "Find")
									M.AstralSkill += 0.25
									var/One = prob(90)
									var/T = input("Warp to who?")as null|text
									if(One)
										if(!T)
											..()
										else
											for(var/mob/S in world)
												if(T == S.name)
													usr.loc = S.loc
													view() << "You get the odd feeling that someone is watching you..."
								if (Result == "Find II")
									M.AstralSkill += 0.25
									var/One = prob(95)
									var/T = input("Warp to who?")as null|text
									if(One)
										if(!T)
											..()
										else
											for(var/mob/S in world)
												if(T == S.name)
													usr.loc = S.loc
													view() << "You get the odd feeling that someone is watching you..."
								if (Result == "Find III")
									M.AstralSkill += 0.25
									var/T = input("Warp to who?")as null|text
									if(!T)
										..()
									else
										for(var/mob/S in world)
											if(T == S.name)
												usr.loc = S.loc
												view() << "You get the odd feeling that someone is watching you..."
										return
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
								menu += "Practice"
								if(M.ChaosSkill >= 1)
									menu += "Chaotic Bolt"
									menu += "Chance"
								if(M.ChaosSkill >= 15)
									menu -= "Chaotic Bolt"
									menu += "Simulacrum"
									menu += "Chaotic Bolt II"
								if(M.ChaosSkill >= 30)
									menu -= "Chaotic Bolt"
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
											var/One = prob(40)
											var/Two = prob(50)
											var/Three = prob(20)
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
											if(Three)
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
													if(II.Kobold == 1)
														var/Strike = prob(1)
														if(Strike == 1)
															view(II) << "[II] is struck by a rogue chaos bolt, it bounces off of them into the air after slicing a small piece of flesh off of their chest!"
															II.BloodContent -= 20
															II.BloodLoss()
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
										view() << "[M] Attempts to control the forces of chaos to bring itself knowledge and power, Instead, they must suffer the consequences of chance."
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
									for(var/turf/grounds/desert/D in view(0,M))
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
		Poisons
			Toxic
				icon = 'Cave.dmi'
				icon_state = "Toxic"
				weight = 10
				suffix = null
				desc = "This is toxic, it can be used to add posion to weapons, traps and food, it can be used to even posion units in their sleep. It is more deadly than normal posion."
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
			Poison
				icon = 'Cave.dmi'
				icon_state = "Poison"
				weight = 10
				suffix = null
				desc = "This is posion, it can be used to add posion to weapons, traps and food, it can be used to even posion unitd in their sleep."
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
						var/Break = prob(50)
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
						var/Break = prob(50)
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
						var/Break = prob(50)
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
										DMG += rand(10,15)
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
						var/Break = prob(50)
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
				weight = 10
				Content = 5
				desc = "This is a grape vine plant."
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
				weight = 10
				Content = 5
				desc = "This is a tomato plant."
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
				desc = "This a tomb stone, it can be placed over a grave."
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
				icon_state = "Grave"
				weight = 10
				suffix = null
				desc = "Grave"
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
			FrogManHead

				icon = 'Heads.dmi'
				icon_state = "FrogManHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a frog mans head, it can be stuck on a spike to warn invaders!"
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
			RatHead

				icon = 'Heads.dmi'
				icon_state = "RatHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a frog mans head, it can be stuck on a spike to warn invaders!"
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
			DwarfHead

				icon = 'Heads.dmi'
				icon_state = "HumanHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a dwarf head, it can be stuck on a spike to warn invaders!"
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
			WerewolfHead

				icon = 'Heads.dmi'
				icon_state = "WerewolfHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a Werewolf head, it can be stuck on a spike to warn invaders!"
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
			GremlinHead

				icon = 'Heads.dmi'
				icon_state = "GremlinHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a gremlins head, it can be stuck on a spike to warn invaders!"
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
			LizardHead

				icon = 'Heads.dmi'
				icon_state = "LizardHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a lizards head, it can be stuck on a spike to warn invaders!"
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
			OrcHead

				icon = 'Heads.dmi'
				icon_state = "OrcHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a orcs head, it can be stuck on a spike to warn invaders!"
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
			GargoyleHead

				icon = 'Heads.dmi'
				icon_state = "GargoyleHead"
				weight = 25
				suffix = null
				IsHead = 1
				desc = "This is a Gargoyles head."
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
			DemonHead

				icon = 'Heads.dmi'
				icon_state = "DemonHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a demons head, it can be stuck on a spike to warn invaders!"
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
			HumanHeadBlack

				icon = 'Heads.dmi'
				icon_state = "HumanHeadBlack"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a human head, it can be stuck on a spike to warn invaders!"
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
			HumanHead

				icon = 'Heads.dmi'
				icon_state = "HumanHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a human head, it can be stuck on a spike to warn invaders!"
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
			VampireHead

				icon = 'Heads.dmi'
				icon_state = "VampireHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a vampire head, it can be stuck on a spike to warn invaders!"
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
			KoboldHead

				icon = 'Heads.dmi'
				icon_state = "KoboldHead"
				weight = 10
				IsHead = 1
				suffix = null
				desc = "This is a kobold head, it can be stuck on a spike to warn invaders!"
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
			GoblinHead

				icon = 'Heads.dmi'
				icon_state = "GoblinHead"
				weight = 10
				IsHead = 1
				suffix = null
				desc = "This is a goblin head, it can be stuck on a spike to warn invaders!"
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
											if(src.loc == M)
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
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
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
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
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
											del(src)
											for(src in M)
												if(src.loc == M)
													M.weight -= src.weight
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
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
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
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
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
											del(src)
											for(src in M)
												if(src.loc == M)
													M.weight -= src.weight
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
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
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
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
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
											del(src)
											for(src in M)
												if(src.loc == M)
													M.weight -= src.weight
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
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
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
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
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
				SilverTrainingPost
					icon = 'SilverItems.dmi'
					icon_state = "Silver Training Post"
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
						ItemDecay()
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
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Make Bread Dough")
										for(var/turf/grounds/waters/water in view(1,M))
											view() << "[M] mixes the flour with water to make bread dough."
											var/obj/Items/Food/Ingredients/BreadDough/B = new()
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
										for(var/obj/Items/Furniture/Ovens/Oven in  view(1,M))
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
					IsBread = 0
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
										M.Hunger = 200
										M.weight -= src.weight
										view() << "[M] eats the loaf of bread"
										del src
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
			CookedMeats
				CookedGoblinMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked goblin meat, it can be eaten"
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
				CookedRatMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked Rat meat, it can be eaten"
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
				CookedVampireMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked vampire meat, it can be eaten"
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
				CookedWolfMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked wolf meat, it can be eaten"
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
				CookedKoboldMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked kobold meat, it can be eaten"
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
				EverlastingStew
					icon = 'Cave.dmi'
					icon_state = "Stew"
					weight = 10
					suffix = null
					desc = "This is a bowl of everlasting stew!"
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
				CookedDwarfMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked dwarf meat, it can be eaten"
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
				CookedFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked fish meat, it can be eaten"
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
				Grape
					icon = 'Cave.dmi'
					icon_state = "Grape"
					weight = 10
					suffix = null
					desc = "This is a grape, once eaten it will provide a seed, it can also be used to create wines."
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
									if(M.Carn == 0)
										if(M.Gargoyle == 0)
											menu += "Eat"
									if(M.Vampire == 0)
										if(M.Gargoyle == 0)
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
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Poisoned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Poison"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												var/obj/Items/Seeds/GrapeSeed/S = new
												S.loc = M.loc
												var/obj/Items/Seeds/GrapeSeed/S2 = new
												S2.loc = M.loc
												del(src)
												return
				Tomato
					icon = 'Cave.dmi'
					icon_state = "Tomato"
					weight = 10
					suffix = null
					desc = "This is a tomato, it can be used as food and will provide seeds as well."
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
									if(M.Carn == 0)
										if(M.Gargoyle == 0)
											menu += "Eat"
									if(M.Vampire == 0)
										if(M.Gargoyle == 0)
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
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Poisoned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Poison"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												var/obj/Items/Seeds/TomatoSeed/S = new
												S.loc = M.loc
												var/obj/Items/Seeds/TomatoSeed/S2 = new
												S2.loc = M.loc
												del(src)
												return
				CookedDemonMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of demon meat, it can be eaten"
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
				CookedLizardMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked lizard meat, it can be eaten"
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
				CookedGremlinMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked gremlin meat, it can be eaten"
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
				CookedTropicalFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked tropical fish meat, it can be eaten"
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
				CookedOrcMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked orc meat, it can be eaten"
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
				CookedBlowFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked blow fish meat, it can be eaten"
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
				CookedBugMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked bug meat, it can be eaten"
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
				CookedHumanMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked human meat, it can be eaten"
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
				CookedMoleMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked mole meat, it can be eaten"
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
									if(M.Vampire == 0)
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
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Poisoned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
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
				CookedFrogManMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked frog man meat, it can be eaten"
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
				CookedDeerMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked deer meat, it can be eaten"
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
				UnCookedGoblinMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked goblin meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedRatMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked Rat meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedWerewolfMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked Werewolf meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedVampireMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked vampire meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedDemonMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked demon meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked wolf meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedKoboldMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked kobold meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedFrogManMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked frog man meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedGremlinMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked gremlin meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedDwarfMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked dwarf meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedOrcMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked orc meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedBlowFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked blow fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedTropicalFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked Tropical fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedCaveFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked cave fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedMoleMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked mole meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
									if(M.Vampire == 0)
										if(M.Wagon == 0)
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
											if(M.Carn == 0)
												var/die = prob(33)
												if(die == 1)
													view() << "<b><font color=red>[M] tryed to eat meat raw but it killed [M]"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Food Poisoning"
													M.Death()
													return
												else
													view() << "<b><font color=blue>[M] eats [src]"
													if(src.Poisoned == 1)
														view() << "<b><font color=red>[M] was posioned!"
														M.HP = 0
														M.GoingToDie = 1
														M.Killer = "[M]"
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
													M.weight -= src.weight
													del(src)
													return
											else
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Poisoned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
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

				UnCookedLizardMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked lizard meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedBugMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked bug meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedHumanMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked human meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
				UnCookedMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked deer meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
									if(src in M)
										M.weight -= src.weight
									view(M) << "[M] uses their force of will to transmute the piece of wood into a large stone."
									del src
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
		gems
			New()
				ItemDecay()
			Gems = 1
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
									M.Defence += 5
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
								if(M.Gargoyle == 1)
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
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



