// To enable gods go to the rare listings and put in entries that grant "God" and "Neutral God"

// To enable clan points open the Saved Code.dm file, copy the SpendYourPoints entry and paste the entry in the verbs file below the WorldSay verb.

// To give clan leaders the ability to send points to clan members go into Saved Code.dm and copy the Send_Points entry and paste it in the admin file under the ClanVerbs entry.

// To add another clan, go to the Login.dm file, add the clan leader's key under the admin entries with the other clan leaders, in both the one that assigns Faction and the one that gives ClanVerbs,
// then put the icons for cape/standard/tapestry in the corresponding icon files, name them the same as the person's faction(clan name), go to turfs, search for TeamCape, go to the equip/unequip and copy/paste to
// make a new entry, rename it to the faction, etc., Then, search for /obj/pandoracape/ in the turfs file, copy/paste it, replace the icon with the one for the clan cape, now you have finished the clan, unless you want to add custom armor.

// To disable the random map, go to World.dm and // out the WorldRandomize() proc near the top of the file, then go to Night() in the world.dm file, and add Repop() to the beginning of night (right after the "Darkness Falls" message.), now you can load a premade map with no problems.

// Secret unitchat phrases for nuking people are "Ælric Dæmun Drëad" for melting someone into multicoloured lights, and "Calo Ûrrduu Septim Sum" for setting them on fire.

// Secret commands you enter into the command bar are: "ProjectLazarus999" - Reloads your savefile, deletes current units and brings old units back to life. "GoodnessGraciousGreatBallsOfFire777" - makes whatever unit is selected throw fireballs wherever you click. "Doomwave222" makes a shockwave appear at your camera which moves out 10 spaces in every direction(This is broken in this version and I never bothered fixing it, currently all the waves go down.)