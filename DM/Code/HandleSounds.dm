//Credit to: Spuzzum
//Contributed by: Spuzzum


//These are a bunch of useful procs that allow you to
// stop any sound effects or MIDI playing.  They allow
// you to selectively shut off the sound effects, or
// the MIDI, or both, as desired.


mob/proc/StopSfx()
    //Stops only the sound effects (not the MIDI music)
    // being played for this mob.
    if(!src.key || !src.client) return

    src << sound(null, channel=1)
    src << sound(null, channel=2)
    src << sound(null, channel=3)
    src << sound(null, channel=4)
    src << sound(null, channel=5)
    src << sound(null, channel=6)
    src << sound(null, channel=7)
    src << sound(null, channel=8)


mob/proc/StopMidi()
    //Stops only the MIDI music (not the sound effects)
    // being played for this mob.
    if(!src.key || !src.client) return

    src << sound(null, channel=-1)


mob/proc/StopSounds()
    //Stops all MIDI and sound effects played for this mob.
    if(!src.key || !src.client) return

    src << sound(null)