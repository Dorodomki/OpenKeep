	/*==============*
	*				*
	*	  Dwarf		*
	*				*
	*===============*/

//	( + Poison Resistance )

/mob/living/carbon/human/species/dwarf/mountain
	race = /datum/species/dwarf/mountain

/datum/species/dwarf/mountain
	name = "Dwarf"
	id = "dwarf"
	desc = "<b>Dwarf</b><br>\
	A proud and robust race of stunted folk, \
	the dwarves are known for their pride in martial strength \
	and their tenacity towards their ancient customs. \
	A Dwarf, much like the rock that they carve their fortress out of \
	is stubborn and ancient, much like their Patron founder the Saint Malum \
	during the time of the weeping god. They, like stone: also rarely change \
	and are stubborn to a fault. \
	A Dwarf tends to his ancestorial heritage for posterity and guidance on \
	the various challenges their people will face. Even if, in some irony: this behaviour \
	leads the race towards technological innovation as they continue \
	to improve their craft through powerful mechanization and forging. \
	While also impeding their civilizational growth beyond Grimorias mountain ranges due to \
	constant infighting regarding 'true' doctrines, traditions, customs. \
	Dwarves are hearty, stout and prone to severe mood swings, but are not known for their speed or eyesight..."

	skin_tone_wording = "Ore Attunement"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,YOUNGBEARD,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	default_features = list("mcolor" = "FFF", "wings" = "None")
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/md.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fd.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = "t3"
	soundpack_m = /datum/voicepack/male/dwarf
	soundpack_f = /datum/voicepack/female/dwarf
	custom_clothes = TRUE
	offset_features = list(OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
	OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-4), OFFSET_HEAD = list(0,-4), \
	OFFSET_FACE = list(0,-4), OFFSET_BELT = list(0,-5), OFFSET_BACK = list(0,-4), \
	OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
	OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), \
	OFFSET_ID_F = list(0,-4), OFFSET_GLOVES_F = list(0,-4), OFFSET_WRISTS_F = list(0,-4), OFFSET_HANDS_F = list(0,-4), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-5), OFFSET_HEAD_F = list(0,-5), \
	OFFSET_FACE_F = list(0,-5), OFFSET_BELT_F = list(0,-5), OFFSET_BACK_F = list(0,-5), \
	OFFSET_NECK_F = list(0,-5), OFFSET_MOUTH_F = list(0,-5), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list("strength" = 1, "perception" = -2, "intelligence" = 0, "constitution" = 3, "endurance" = 2, "speed" = -1, "fortune" = 0)
	specstats_f = list("strength" = 1, "perception" = -2, "intelligence" = 1, "constitution" = 2, "endurance" = 2, "speed" = -1, "fortune" = 0)
	enflamed_icon = "widefire"
	patreon_req = 0

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
	)
	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/dwarf/mountain/check_roundstart_eligible()
	return TRUE

/datum/species/dwarf/mountain/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/dwarvish)
		return list(SPAN_DWARF)
//	if(message_language.type == /datum/language/common)
//		return list(SPAN_DWARF)
	return message_language.spans

/datum/species/dwarf/mountain/get_skin_list()
	return sortList(list(
		"Platinum" = SKIN_COLOR_PLATINUM,
		"Aurum" = SKIN_COLOR_AURUM,
		"Quicksilver" = SKIN_COLOR_QUICKSILVER,
		"Brass" = SKIN_COLOR_BRASS,
		"Iron" = SKIN_COLOR_IRON,
		"Malachite" = SKIN_COLOR_MALACHITE,
		"Obsidian" = SKIN_COLOR_OBSIDIAN,
		"Brimstone" = SKIN_COLOR_BRIMSTONE,
		"Cerargyrite" =	SKIN_COLOR_CERARGYRITE,
	))

/datum/species/dwarf/mountain/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"brown - mud" = "362e25",
	"brown - oats" = "7a4e1e",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"red - berry" = "b23434",
	"red - wine" = "b87f77",
	"red - sunset" = "bf6821",
	"red - blood" = "822b2b",
	"red - maroon" = "612929",

	"white - withered" = "#7c828a"

	))

/datum/species/dwarf/mountain/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/dwarf/dwarmm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/dwarf/dwarmf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/dwarf/dwarmm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/dwarf/dwarmf.txt") )
	return randname

/datum/species/dwarf/mountain/random_surname()
	return " [pick(world.file2list("strings/rt/names/dwarf/dwarmlast.txt"))]"



/*------------------\
| Poison Resistance |
\------------------*/

/*
To make this work poison on_mob_life needs to have the dwarf modifier in it. Relevant when adding new ones.
The more specialized/expensive poison the less effect the resistance.

For common natural poisons (berrypoison) = effect reduced by 2/3, half nausea
For manufactured poisones = effect reduced by half or so

Note: Its not meant to protect against every dangerous/bad reagent, its supposed to be just poisons, making it meaningful against most common reagent hazards but not full protection.

/datum/reagent/toxin/whateverpoison/on_mob_life(mob/living/carbon/M)
	if(isdwarf(M))
		M.adjustToxLoss(2, 0)
	else
		M.adjustToxLoss(5, 0)

*/
