/mob/living/carbon/human/species/lizardmen
	name = "lizardmen"
	icon = 'icons/roguetown/mob/monster/stonekeep_lizardmen.dmi'
	icon_state = "lizardmen"
	race = /datum/species/lizardmen
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/lizardmen, /obj/item/bodypart/head/lizardmen, /obj/item/bodypart/l_arm/lizardmen,
					/obj/item/bodypart/r_arm/lizardmen, /obj/item/bodypart/r_leg/lizardmen, /obj/item/bodypart/l_leg/lizardmen)
	rot_type = /datum/component/rot/corpse/lizardmen
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw, /datum/intent/simple/bite)
	possible_rmb_intents = list()
	vitae_pool = 1000 // Not as much vitae from them as humans to avoid vampires cheesing mobs

/datum/species/lizardmen/after_creation(mob/living/carbon/C)
	..()
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_STRONGBITE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_ORGAN_EATER, TRAIT_GENERIC)//so they don't puke if they chew an organ/limb
	pain_mod = 0.9 // 10% less pain from wounds
	bleed_mod = 0.8 // 20% less bleed rate from injuries
	C.grant_language(/datum/language/orcish)
	to_chat(C, "<span class='info'>I can speak Orcish with ,g before my speech.</span>")//putting this here so it makes the players inherit the perks


/datum/species/lizardmen/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/orcish)

/mob/living/carbon/human/species/lizardmen/npc
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15 //they can dodge easily, but have a cooldown on it
	canparry = TRUE
	flee_in_pain = FALSE//like the orcs they don't run away from a fight
	wander = FALSE


/mob/living/carbon/human/species/lizardmen/slave/after_creation()
	..()
	job = "slave lizardmen"
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/obj/item/bodypart/chest/lizardmen
	dismemberable = 1
/obj/item/bodypart/l_arm/lizardmen
	dismemberable = 1
/obj/item/bodypart/r_arm/lizardmen
	dismemberable = 1
/obj/item/bodypart/r_leg/lizardmen
	dismemberable = 1
/obj/item/bodypart/l_leg/lizardmen
	dismemberable = 1

/obj/item/bodypart/head/lizardmen/update_icon_dropped()
	return

/obj/item/bodypart/head/lizardmen/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/lizardmen/skeletonize()
	. = ..()
	icon_state = "lizardmen_skel_head"
	sellprice = 2

/mob/living/carbon/human/species/lizardmen/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/lizardmen/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "lizardmen_skel_head", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "lizardmen_skeleton", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/lizardmen/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/lizardmen/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/lizardmen/update_inv_armor()
	update_wearable()

/mob/living/carbon/human/species/lizardmen/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/lizardmen/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("aggro")
	. = ..()

/mob/living/carbon/human/species/lizardmen/proc/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)

	mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)

/mob/living/carbon/human/species/lizardmen/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("aggro", "laugh")
	. = ..()

/mob/living/carbon/human/species/lizardmen/after_creation()
	..()
	gender = MALE
	QDEL_NULL(sexcon)
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/lizardmen()
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/stonekeep_lizardmen.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = rand(15,40)
	src.grant_language(/datum/language/common)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "lizardmen"
	real_name = "lizardmen"
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
//	if(gob_outfit)
//		var/datum/outfit/O = new gob_outfit
//		if(O)
//			equipOutfit(O)

/datum/species/lizardmen
	name = "lizardmen"
	id = "lizardmen"
	species_traits = list(NOEYESPRITES)
	inherent_traits = list(TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,TRAIT_CRITICAL_WEAKNESS, TRAIT_NASTY_EATER, TRAIT_LEECHIMMUNE, TRAIT_INHUMENCAMP)
	no_equip = list(SLOT_HEAD,SLOT_SHIRT, SLOT_WEAR_MASK, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	damage_overlay_type = ""
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "lizardmen"
	var/loadout = /datum/outfit/job/roguetown/npc/lizardmen/ambush


/datum/species/lizardmen/update_damage_overlays(mob/living/carbon/human/H)
	return

/datum/species/lizardmen/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/lizardmen/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/datum/component/rot/corpse/lizardmen/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 20 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE
	else if(amount > 12 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted)
				var/turf/open/T = C.loc
				if(istype(T))
					T.add_pollutants(/datum/pollutant/rot, 1)
	if(should_update)
		if(amount > 20 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 12 MINUTES)
			C.update_body()


/mob/living/carbon/human/species/lizardmen/slave/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/lizardmen/slave)//weak enemy that can be used in hordes, strong but badly geared

/datum/outfit/job/roguetown/npc/lizardmen/slave/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 13
	H.STASPD = 12
	H.STACON = 13
	H.STAEND = 13
	var/weapontype = pickweight(list("Sword" = 1, "Club" = 2, "Axe" = 3, "sickle" = 4)
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/lizardmen
		head = /obj/item/clothing/head/roguetown/helmet/lizardmen/slave
	switch(weapontype)
		if("Sword")
			r_hand = /obj/item/rogueweapon/sword/long/rider/copper
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Club")
			r_hand = /obj/item/rogueweapon/mace/woodclub
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Axe")
			r_hand = /obj/item/rogueweapon/axe/copper
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("sickle")
			r_hand = /obj/item/rogueweapon/sickle/copper
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)

/mob/living/carbon/human/species/lizardmen/warrior/after_creation()//medium tier enemy, comparable to guards or orc warriors
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/lizardmen/warrior)

/datum/outfit/job/roguetown/npc/lizardmen/warrior/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 13
	H.STASPD = 12
	H.STACON = 13
	H.STAEND = 13
	var/weapontype = pickweight(list("Sword" = 1, "Club" = 2, "Axe" = 3)
		armor = /obj/item/clothing/suit/roguetown/armor/leather/lizardmen
		head = /obj/item/clothing/head/roguetown/helmet/lizardmen
	switch(weapontype)
		if("Sword")
			r_hand = /obj/item/rogueweapon/sword/scimitar
			l_hand = /obj/item/rogueweapon/shield/tower/buckleriron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Club")
			r_hand = /obj/item/rogueweapon/mace
			l_hand = /obj/item/rogueweapon/shield/tower/buckleriron
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Axe")
			r_hand = /obj/item/rogueweapon/axe/iron
			l_hand = /obj/item/rogueweapon/shield/tower/buckleriron
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
