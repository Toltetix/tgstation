/mob/living/carbon/monkey/examine(mob/user)
	var/msg = "<span class='info'>*---------*\nThis is \icon[src] \a <EM>[src]</EM>!\n"

	if (src.handcuffed)
		msg += "It is \icon[src.handcuffed] handcuffed!\n"
	if (src.head)
		msg += "It has \icon[src.head] \a [src.head] on its head. \n"
	if (src.wear_mask)
		msg += "It has \icon[src.wear_mask] \a [src.wear_mask] on its face.\n"
	if (src.l_hand)
		msg += "It has \icon[src.l_hand] \a [src.l_hand] in its left hand.\n"
	if (src.r_hand)
		msg += "It has \icon[src.r_hand] \a [src.r_hand] in its right hand.\n"
	if (src.back)
		msg += "It has \icon[src.back] \a [src.back] on its back.\n"
	if (src.stat == DEAD)
		msg += "<span class='deadsay'>It is limp and unresponsive, with no signs of life.</span>\n"
	else
		msg += "<span class='warning'>"
		if (src.getBruteLoss())
			if (src.getBruteLoss() < 30)
				msg += "It has minor bruising.\n"
			else
				msg += "<B>It has severe bruising!</B>\n"
		if (src.getFireLoss())
			if (src.getFireLoss() < 30)
				msg += "It has minor burns.\n"
			else
				msg += "<B>It has severe burns!</B>\n"

		if (src.fire_stacks > 0)
			msg += "It's covered in something flammable.\n"
		if (src.fire_stacks < 0)
			msg += "It's soaked in water.\n"

		if (src.stat == UNCONSCIOUS)
			msg += "It isn't responding to anything around it; it seems to be asleep.\n"
		msg += "</span>"

	if (src.digitalcamo)
		msg += "It is moving its body in an unnatural and blatantly unsimian manner.\n"

	msg += "*---------*</span>"

	user << msg