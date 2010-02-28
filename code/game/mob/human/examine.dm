/mob/human/examine()
	set src in view()

	usr << "\blue *---------*"
	usr << text("\blue This is \icon[] <B>[]</B>!", src, src.name)
	if (src.w_uniform)
		usr << text("\blue [] is wearing []\icon[] [].", src.name, !src.w_uniform.blood ? "" : "bloody ", src.w_uniform, src.w_uniform.name)
	if (src.handcuffed)
		usr << text("\blue [] is handcuffed! \icon[]", src.name, src.handcuffed)
	if (src.wear_suit)
		usr << text("\blue [] has a []\icon[] [] on!", src.name, !src.wear_suit.blood ? "" : "bloody ", src.wear_suit, src.wear_suit.name)
	if (src.w_radio)
		usr << text("\blue [] has a \icon[] [] by \his[] mouth!", src.name, src.w_radio, src.w_radio.name, src)
	if (src.wear_mask)
		usr << text("\blue [] has a []\icon[] [] on \his[] head!", src.name, !src.wear_mask.blood ? "" : "bloody ",src.wear_mask, src.wear_mask.name, src)
	if (src.l_hand)
		usr << text("\blue [] has a []\icon[] [] in \his[] left hand!", src.name, !src.l_hand.blood ? "" : "bloody ", src.l_hand, src.l_hand.name, src)
	if (src.r_hand)
		usr << text("\blue [] has a []\icon[] [] in \his[] right hand!", src.name, !src.r_hand.blood ? "" : "bloody ", src.r_hand, src.r_hand.name, src)
	if (src.belt)
		usr << text("\blue [] has a \icon[] [] on \his[] belt!", src.name, src.belt, src.belt.name, src)
	if (src.gloves)
		usr << text("\blue [] has a []\icon[] [] on \his[] hands!", src.name, !src.gloves.blood ? "" : "bloody ", src.gloves, src.gloves.name, src)
	else if (src.blood)
		usr << text("\red [] has bloody hands!", src.name)
	if (src.back)
		usr << text("\blue [] has a \icon[] [] on \his[] back!", src.name, src.back, src.back.name, src)
	if (src.wear_id)
		if ((src.wear_id.registered != src.rname && (get_dist(src, usr) <= 1 || usr.telekinesis == 1) && prob(10)))
			usr << text("\blue [] is wearing \icon[] [] yet doesn't seem to be that person!!!", src.name, src.wear_id, src.wear_id.name)
		else
			usr << text("\blue [] is wearing \icon[] []!", src.name, src.wear_id, src.wear_id.name)
	if (src.dead())
		usr << text("\red [] is limp and unresponsive, a dull lifeless look in their eyes.", src.name)
	if (src.zombie)
		usr << text("\red [] got a dull lifeless look in their eyes.", src.name)
	else
		if (src.bruteloss)
			if (src.bruteloss < 30)
				usr << text("\red [] looks slightly bruised!", src.name)
			else
				usr << text("\red <B>[] looks severely bruised!</B>", src.name)
			if (src.fireloss)
				if (src.fireloss < 30)
					usr << text("\red [] looks slightly burnt!", src.name)
				else
					usr << text("\red <B>[] looks severely burnt!</B>", src.name)
				if (src.knocked_out())
					usr << text("\red [] doesn't seem to be responding to anything around them, their eyes closed as though asleep.", src.name)
	usr << "\blue *---------*"
	return