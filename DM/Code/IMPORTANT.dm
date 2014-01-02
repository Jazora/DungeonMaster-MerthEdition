/*
HTML Create/Edit Library
Created by: GhostAnime (date long forgotton)
Date released: June 4, 2008
----------------------------------

You can have this modified system in place by checking this off in the "Lib" folder of your project.

Note that you MUST add the following to your source to make it work:


1) You must create and add in the verbs to access these create/edit system. Don't worry, it's easy. It's just::

Create: Reference << link("?command=create")
Edit: Reference << link("?command=edit;target=\ref[A];type=view;") <- A being the object edited. See the following snippet of how I had mine programmed in.


Admin/verb	//	Defined under /Admin so most people don't have access
	Create()
		set category="Admin"
		usr.client<<link("?command=create;")
	Edit(A in world)
		set category="Admin"
		usr.client<<link("?command=edit;target=\ref[A];type=view;")

client/New()	//	Adding the /Admin verb to the appropriate person
	..()
	if(isadmin(ckey))src.verbs+=typesof(/Admin/verb)


2) The variables values shown when editing are generally static from the time you edited the person. Click "UPDATE VARS" to... well, update the values.


3) You MUST have the following #define in somewhere in your project. You can modify the values within:
*/

#define CREATE_PATH list(/obj,/mob,/turf)			//	change the path to what you want to create, if you wish
#define islist(X) istype(X,/list)					//	Do not change this line
#define _CSS "<style type='text/css'></style>"	//	Enter the CSS style for the browser, if you wish to make it ore fancy.

