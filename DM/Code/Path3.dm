/***
 This demo shows you how to use Deadron's PathFinding library.
 When you click on a spot, your mob will move there, avoiding
 all obstacles.

 For convenience this demo uses the EventLoop library so that
 the mob's base_EventCycle() proc will be called each tick.
 You don't have to use that for the PathFinding though.
***/





atom
	var
		destination

mob





	proc/WalkToA()
		if(src)
			if (destination)
				var/mob/m = src.destination
				src.loc = m.loc




		spawn(1) WalkToA()

	proc/WalkTo()
		if(src.Delay <= 1)
			src.Delay = 1
		if(src.Fainted == 0)
			if(src.CanWalk)
				if(Stunned == 0 && src.Content2 != "Tied")
					if(src.Freeze)
						return
					if (destination)
						step_towards(src,src.destination)
						if (src.loc == destination)
							destination = null




		spawn(src.Delay) WalkTo()