/obj/item/clothing/suit/roguetown/armor/leather/lizardmen
	name = "warrior leatherplaque"
	icon_state = "hard_icon"
	item_state = "hard_lizard"
	allowed_race = list("lizardmen")
	smeltresult = /obj/item/ash
	sellprice = VALUE_LEATHER_ARMOR_PLUS

	armor = ARMOR_LEATHER_GOOD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG

/obj/item/clothing/suit/roguetown/armor/leather/hide/lizardmen
	name = "slave loincloth"
	icon_state = "slave_cloth_icon"
	item_state = "slave_cloth"
	icon = 'icons/roguetown/mob/monster/stonekeep_lizardmen.dmi'
	allowed_race = list("lizardmen")
	sewrepair = TRUE
	smeltresult = /obj/item/ash
	sellprice = VALUE_LEATHER_ARMOR

	armor_class = AC_LIGHT
	armor = ARMOR_LEATHER_BAD
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/head/roguetown/helmet/lizardmen
	name = "lizardmen warrior helmet"
	icon_state = "bronze_helmet_icon"
	item_state = "bronze_helmet"
	desc = "A decorated full helmet of bronze, the design doesn't fit anything else besides the deformated wearer."
	icon = 'icons/roguetown/mob/monster/stonekeep_lizardmen.dmi'
	smeltresult = /obj/item/ash
	sellprice = VALUE_STEEL_HELMET
	armor = ARMOR_PLATE
	body_parts_covered = FULL_HEAD
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONGEST

	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	body_parts_covered = HEAD_NECK

/obj/item/clothing/suit/roguetown/armor/cuirass/lizardmen
	slot_flags = ITEM_SLOT_ARMOR
	name = "Bronze armor"
	desc = "A decorated cuirass of bronze, the design doesn't fit anything else besides the deformated wearer."
	icon_state = "bronze_armor_icon"
	item_state = "bronze_armor"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ash
	boobed = FALSE
	sellprice = VALUE_STEEL_ARMOR

	armor_class = AC_MEDIUM
	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG

