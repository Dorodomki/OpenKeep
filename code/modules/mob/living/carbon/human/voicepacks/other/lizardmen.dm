/datum/voicepack/lizardmen/get_sound(soundin, modifiers)
	var/used
	switch(soundin)
		if("laugh")
			used = pick('sound/vo/mobs/lizardmen/laugh(1).ogg','sound/vo/mobs/lizardmen/laugh(2).ogg')
		if("aggro")
			used = pick('sound/vo/mobs/lizardmen/aggro(1).ogg','sound/vo/mobs/lizardmen/aggro(2).ogg')
		if("deathgurgle")
			used = pick('sound/vo/mobs/lizardmen/death(1).ogg','sound/vo/mobs/lizardmen/death(2).ogg', 'sound/vo/mobs/lizardmen/death(3).ogg')
//		if("idle")
//			used = pick('sound/vo/mobs/lizardmen/idle(1).ogg','sound/vo/mobs/lizardmen/lizardmen(2).ogg','sound/vo/mobs/lizardmen/idle (3).ogg','sound/vo/mobs/lizardmen/idle (4).ogg','sound/vo/mobs/lizardmen/idle (5).ogg')
		if("pain")
			used = pick('sound/vo/mobs/lizardmen/pain(1).ogg','sound/vo/mobs/lizardmen/pain(2).ogg','sound/vo/mobs/lizardmen/pain(3).ogg','sound/vo/mobs/lizardmen/pain(4).ogg')
		if("paincrit")
			used = pick('sound/vo/mobs/lizardmen/pain(1).ogg','sound/vo/mobs/lizardmen/painscream(2).ogg','sound/vo/mobs/lizardmen/pain(3).ogg','sound/vo/mobs/lizardmen/pain(4).ogg')
		if("painscream")
			used = pick('sound/vo/mobs/lizardmen/painscream(1).ogg','sound/vo/mobs/lizardmen/painscream(2).ogg')

	return used