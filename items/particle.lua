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
-- Particle Pack, 1 of 2
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
	order = nil,
}
