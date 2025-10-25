local particle = {
	object_type = "ConsumableType",
	key = "Particle",
	primary_colour = G.C.SET.Planet, -- change these
	secondary_colour = G.C.SECONDARY_SET.Planet,
	shop_rate = 0.0,
	loc_txt = {},
	default = "c_cry_neutron", -- idk
	can_stack = true,
	can_divide = true,
}

local particle_digital_hallucinations_compat = {
	colour = G.C.SET.Planet,
	loc_key = "cry_plus_particle",
	create = function()
		local ccard = create_card("Particle", G.consumeables, nil, nil, nil, nil, nil, "diha")
		ccard:set_edition({ negative = true }, true)
		ccard:add_to_deck()
		G.consumeables:emplace(ccard)
	end,
}
-- Normal pack, 1 of 2
local pack1 = {
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies = {
		items = {
			"set_cry_particle",
		},
	},
	object_type = "Booster",
	key = "particle_normal_1",
	kind = "Particle",
	atlas = "placeholder",
	pos = { x = 3, y = 1 },
	config = { extra = 2, choose = 1 },
	cost = 4,
	order = nil, -- idk
	weight = 0.3,
	create_card = function(self, card)
		return create_card("Particle", G.pack_cards, nil, nil, true, true, nil, "cry_particle_1")
	end,
	ease_background_color=nil,
	loc_vars=function(self,info_queue,card)
		return{vars={
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.choose
		}}
	end,
	group_key="k_cry_particle_pack",
	cry_digital_hallucinations=particle_digital_hallucinations_compat
}
-- Jumbo pack, 1 of 4
local packJ = {
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies = {
		items = {
			"set_cry_particle",
		},
	},
	object_type = "Booster",
	key = "particle_normal_1",
	kind = "Particle",
	atlas = "placeholder",
	pos = { x = 3, y = 1 },
	config = { extra = 4, choose = 1 },
	cost = 4,
	order = nil, -- idk
	weight = 0.3,
	create_card = function(self, card)
		return create_card("Particle", G.pack_cards, nil, nil, true, true, nil, "cry_particle_1")
	end,
	ease_background_color=nil,
	loc_vars=function(self,info_queue,card)
		return{vars={
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.choose
		}}
	end,
	group_key="k_cry_particle_pack",
	cry_digital_hallucinations=particle_digital_hallucinations_compat
}
-- Mega pack, 2 of 4
local packM = {
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies = {
		items = {
			"set_cry_particle",
		},
	},
	object_type = "Booster",
	key = "particle_normal_1",
	kind = "Particle",
	atlas = "placeholder",
	pos = { x = 3, y = 1 },
	config = { extra = 4, choose = 2 },
	cost = 4,
	order = nil, -- idk
	weight = 0.3,
	create_card = function(self, card)
		return create_card("Particle", G.pack_cards, nil, nil, true, true, nil, "cry_particle_1")
	end,
	ease_background_color=nil,
	loc_vars=function(self,info_queue,card)
		return{vars={
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.choose
		}}
	end,
	group_key="k_cry_particle_pack",
	cry_digital_hallucinations=particle_digital_hallucinations_compat
}

-- Theorem tag, free normal particle pack
local theorem={
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies={
		items={
			"p_cry_particle_normal_1",
			"set_cry_particle"
		}
	},
	object_type="Tag",
	atlas="tag_cry",
	name="cry-Theorem Tag",
	order=nil,
	pos={x=4,y=2},
	config={type="new_blind_choice"},
	key="theorem",
	min_ante=4,
	loc_vars=function(self,info_queue)
		info_queue[#info_queue+1]={set="Other",key="p_cry_particle_normal_1",specific_vars={1,2}}
		return{vars={}}
	end,
	apply=function(self,tag,context)
		if(context.typer=="new_blind_choice")then
			local key="p_cry_particle_normal_1"
			local card = Card(
				G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
				G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
				G.CARD_W * 1.27,
				G.CARD_H * 1.27,
				G.P_CARDS.empty,
				G.P_CENTERS[key],
				{ bypass_discovery_center = true, bypass_discovery_ui = true }
			)
			card.cost = 0
			card.from_tag = true
			G.FUNCS.use_card({ config = { ref_table = card } })
			if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
				card:set_edition(nil, true, true)
			elseif G.GAME.modifiers.cry_force_random_edition then
				local edition = Cryptid.poll_random_edition()
				card:set_edition(edition, true, true)
			end
			card:start_materialize()
			return true
		end
		tag.triggered = true
		return true
	end
}
-- Proton, X1.25 mult for all poker hand upgrades
local proton={
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies={
		items={
			"set_cry_particle",
		},
	},
	object_type="Consumable",
	set="Particle",
	name="cry-Proton",
	key="proton",
	pos={x=3,y=1},
	config={extra={x=1.25}},
	loc_vars=function(self,info_queue,card)
		if(not card)then
			return{vars={self.config.extra.x}}
		end
		return{vars={card.ability.extra.x}}
	end,
	no_collection=true,
	cost=4,
	atlas="placeholders",
	order=nil,
	can_use=function(self,card)
		return(true)
	end,
	can_bulk_use=true,
	use=function(self,card,area,copier)
		for _, hand in ipairs(G.handlist) do
			G.GAME.hands[hand].l_mult=to_big(G.GAME.hands[hand].l_mult)*to_big(card.ability.extra.x)
		end
	end,
	bulk_use=function(self,card,area,copier,numer)
		for _, hand in ipairs(G.handlist) do
			G.GAME.hands[hand].l_mult=to_big(G.GAME.hands[hand].l_mult)*to_big(card.ability.extra.x) ^ to_big(number)
		end
	end,
	demicoloncompat=true,
	force_use=function(self,card,are)
		self:use(card,area)
	end,
}
-- Neutron, X1.1 chips for all poker hand upgrades
local proton={
	cry_credits = {
		idea = {
			"PlayerrWon",
			"HexaCryonic",
		},
		code = {
			"PyMaster22",
		},
	},
	dependencies={
		items={
			"set_cry_particle",
		},
	},
	object_type="Consumable",
	set="Particle",
	name="cry-Proton",
	key="proton",
	pos={x=3,y=1},
	config={extra={x=1.25}},
	loc_vars=function(self,info_queue,card)
		if(not card)then
			return{vars={self.config.extra.x}}
		end
		return{vars={card.ability.extra.x}}
	end,
	no_collection=true,
	cost=4,
	atlas="placeholders",
	order=nil,
	can_use=function(self,card)
		return(true)
	end,
	can_bulk_use=true,
	use=function(self,card,area,copier)
		for _, hand in ipairs(G.handlist) do
			G.GAME.hands[hand].l_chips=to_big(G.GAME.hands[hand].l_chips)*to_big(card.ability.extra.x)
		end
	end,
	bulk_use=function(self,card,area,copier,numer)
		for _, hand in ipairs(G.handlist) do
			G.GAME.hands[hand].l_chips=to_big(G.GAME.hands[hand].l_chips)*to_big(card.ability.extra.x) ^ to_big(number)
		end
	end,
	demicoloncompat=true,
	force_use=function(self,card,are)
		self:use(card,area)
	end,
}
