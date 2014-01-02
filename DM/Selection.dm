obj/Hud
	DigAdd
		icon = 'Selection.dmi'
		icon_state = "addi"
		layer = 11
		name = "Add tiles to autodig selection. Hot Key - (tab)"
		New(client/c)
			screen_loc = "2,19"
			c.screen += src
		DblClick()
			usr.digadd()
	DigSub
		icon = 'Selection.dmi'
		icon_state = "subi"
		layer = 11
		name = "Subtract tiles from autodig selection. Hot Key - (tab)"
		New(client/c)
			screen_loc = "3,19"
			c.screen += src
		DblClick()
			usr.digsub()
	DigSel
		icon = 'Selection.dmi'
		icon_state = "autodig"
		layer = 11
		name = "Use selection autodig. To use you must have at least one unit selected with autodig on. Hot Key - (f5)"
		New(client/c)
			screen_loc = "1,19"
			c.screen += src
		DblClick()
			usr.switchdig()
mob
	var/autodigging = 0
	var/adding = 1
	proc/GetADiggers()
		var/digcount = 0
		for(var/mob/M in usr.Selected)
			if(M.Dig)
				digcount++
		return digcount
	verb/digadd()
		set name = ".digsub"
		if(usr.Function == "RemoveAutodig")
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "adda"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You are now adding autodig!"
			usr.Function = "PlaceAutodig"
	verb/digsub()
		set name = ".digsub"
		if(usr.Function == "PlaceAutodig")
			adding = 0
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "suba"
			usr << "You are now removing autodig!"
			usr.Function = "RemoveAutodig"
	verb/enddig()
		set name = ".enddig"
		if(autodigging)
			autodigging = 0
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You have stopped using the autodigging selection feature!"
	verb/switchdig()
		set name = "Use Autodigging"
		if(usr.Function == "PlaceAutodig" || usr.Function == "RemoveAutodig")
			autodigging = 0
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You have stopped using the autodigging selection feature!"
			usr.Function = null
		else
			autodigging = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "adda"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You are now using the autodigging selection feature!"
			usr.Function = "PlaceAutodig"
	verb/switchadd()
		set name = "Toggle Autodigging add/sub"
		if(autodigging)
			if(usr.Function == "PlaceAutodig")
				adding = 0
				for(var/obj/Hud/DigAdd/O in usr.client.screen)
					O.icon_state = "addi"
				for(var/obj/Hud/DigSub/O in usr.client.screen)
					O.icon_state = "suba"
				usr << "You are now removing autodig!"
				usr.Function = "RemoveAutodig"
			else if(usr.Function == "RemoveAutodig")
				adding = 1
				for(var/obj/Hud/DigAdd/O in usr.client.screen)
					O.icon_state = "adda"
				for(var/obj/Hud/DigSub/O in usr.client.screen)
					O.icon_state = "subi"
				usr << "You are now adding autodig!"
				usr.Function = "PlaceAutodig"
client
	var/paintdigon
	var/paintdigoff
	var/blockdigon = 1
	var/blockdigoff
	var/selecting
	var/list/box
	var/tmp/sellist[] = list()
	var/list/block1
	var/turf/loc1
	var/turf/loc2
	var/list/selected
	New()
		new/obj/Hud/DigSel(src)
		new/obj/Hud/DigAdd(src)
		new/obj/Hud/DigSub(src)
		..()
	//MouseDown(object,location)
	//	var/digcount = 0
	//	for(var/mob/M in world)
	//		if(M.client == src)
	//			selected = M.Selected
	//	for(var/mob/J in selected)
	//		if(J.Dig)
	//			digcount++
	//	if(selected.len)
	//		if(mob.autodigging && digcount)
	//			src.Box(location,location)
	//	else
	//		if(mob.autodigging)
	//			mob.autodigging = 0
	//			mob.adding = 1
	//			for(var/obj/Hud/DigAdd/O in usr.client.screen)
	//				O.icon_state = "addi"
	//			for(var/obj/Hud/DigSub/O in usr.client.screen)
	//				O.icon_state = "subi"
	//		src.Box(location,location)


	//MouseUp(object,location)
	//	if(loc1)
	//		Endbox(loc1,location)
	//	loc1 = null
	//	loc2 = null
	//	..()

	//MouseDrag(src_object,over_object,src_location,over_location)
	//	if(selected.len)
	//		if(mob.autodigging)
	//			src.Box(loc1,over_location)
	//	else
	//		src.Box(loc1,over_location)
	//	..()

	//proc/Box(turf/l1,turf/l2)
	//	if(!isloc(l1,l2) || l2.x < 1)
	//		return
	//	if(!loc1)
	//		loc1 = l1
	//	loc2=l2
	//	block1 = GetBlock(l1,l2)
	//	for(var/image/d in sellist)
	//		del(d)
	//	SelectBox(loc1,loc2,/turf,'Selection.dmi',"sel",sellist)
	//	if(mob.autodigging)
	//		for(var/turf/B in block1)
	//			if(B.CanDigAt || B.Tree)
	//				if(mob.adding)
	//					sellist += new/image ('Selection.dmi',B,"gsel",6)
	//				else
	//					sellist += new/image ('Selection.dmi',B,"rsel",6)
	//	for(var/image/I in sellist)
	//		src << I

	//proc/Endbox(turf/l1,turf/l2)
	//	var/smob
	//	for(var/mob/M in block1)

	//	for(var/mob/M in selected)
	//		if(M.Dig)
	//			smob = M
	//	for(var/image/d in sellist)
	//		del(d)
	//	if(!isloc(l1,l2) || l2.x < 1)
	//		return
	//	block1 = GetBlock(l1,l2)
	//	if(mob.autodigging)
	//		for(var/turf/T in block1)
	//			if(mob.adding)
	//				var/tmp/count=0
	//				for(var/obj/C in T)
	//					var/mob/D = C.Owner
	//					if(istype(C,/obj/DigAt/) && D.Owner == mob)
	//						count++
	//				if((T.CanDigAt || T.Tree) && !count)
	//					var/obj/DigAt/DD = new(T)
	//					DD.Owner = smob
	//			else
	//				for(var/obj/C in T)
	//					if(istype(C,/obj/DigAt/) && C.Owner == smob)
	//						del(C)
	//	else
	//		for(var/turf/T in block1)
	//			for(var/mob/M in T)
	//				if(M.Owner == src.mob && !M.Escort)
	//					if(M.Sleeping == 0)
	//						src.mob.Selected.Add(M)
	//						images += M.Star
//	proc/GetBlock(turf/l1,turf/l2) //returns the correct block of turfs
//		var/X1=max(l1.x,l2.x)
//		var/X2=min(l1.x,l2.x)
//		var/Y1=max(l1.y,l2.y)
//		var/Y2=min(l1.y,l2.y)
//	Don't add	if(X1-X2 > 10)
//	Don't add		if(X1 > X2)
//	Don't add		X1 = X2 + 10
//	Don't add	if(Y1-Y2 > 10)
//	Don't add		Y1 = Y2 + 10
	//	var/Xt = l2.x - l1.x
	//	var/Yt = l2.y - l1.y
	//	if(Xt > 16)
	//		X1 = X2 + 16
	//	if(Xt < -16)
	//		X2 = X1 - 16
	//	if(Yt > 16)
	//		Y1 = Y2 + 16
	//	if(Yt < -16)
	//		Y2 = Y1 - 16
	//	return block(locate(X2,Y2,l1.z),locate(X1,Y1,l1.z))
//	proc/SelectBox(turf/l1,turf/l2,atom/A,icon/I,S as text,ilist[])
		//currently not working properly
		//l1 = turf where cursor clicked
		//l2 = turf where cursor currently is
		//atom/A = turfs/mobs/objs to have icon around
		//icon/I = icon
		//ilist[] = holds icon objects created
//		if(!isloc(l1,l2) || !(l1.x > 0))
//			return
//		block1 = GetBlock(l1,l2)
//		if(A != null)
//			if(!istype(A,/area))
//				for(var/atom/B in block1)
//					if(istype(B,A))
//						if(istype(B,/turf))
//							for(var/C in B)
//								if(istype(C,/image))
//									del(C)
//							ilist += new/image(I,B,S,5)
//						else
//							for(var/C in B.loc)
//								if(istype(C,/image))
//									del(C)
//							ilist += new/image(I,B.loc,S,6)
//		for(var/image/d in ilist)
//			src << d