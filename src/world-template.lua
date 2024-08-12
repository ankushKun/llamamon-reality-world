--#region Model

RealityInfo = {
	Dimensions = 2,
	Name = 'ExampleReality',
	['Render-With'] = '2D-Tile-0',
}

RealityParameters = {
	['2D-Tile-0'] = {
		Version = 0,
		Spawn = {
			23,
			72
		},
    -- This is a tileset themed to Llama Land main island
		Tileset = {
			Type = 'Fixed',
			Format = 'PNG',
			TxId = 'tmInxFHl3PzZ13XFVpqkjawjTzV-l00Jph3dzRriPE4', -- TxId of the tileset in PNG format
		},
    -- This is a tilemap of sample small island
		Tilemap = {
			Type = 'Fixed',
			Format = 'TMJ',
			TxId = '0iQYxwrUrfdA1LukkKhOYFJXrRzkjXRHbRn_YcevSjY', -- TxId of the tilemap in TMJ format
      -- Since we are already setting the spawn in the middle, we don't need this
      -- Offset = { -10, -10 },
		},
	},
}

RealityEntitiesStatic = {
	['ulvwSFAbelVFkxdMexJn8HEfm_G7HsIVV4jaA6iUpqc'] = {
		Type = "Avatar",
		Position = {
			27,
			77
		},
		Metadata = {
			DisplayName = "Guide",
			SkinNumber = 1,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Guide"
			},
		},
	},
	['kyHWQ7jYJoY1g0f3Clh21OdCJK1GpCuX7vshl4AyabM'] = {
		Type = "Avatar",
		Position = {
			64,
			60
		},
		Metadata = {
			DisplayName = "Air Llama Master",
			SkinNumber = 2,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Battle"
			},
		},
	},
	['VjmJ-6Th37ifabQMI34Q98zLcXfPIrSsSyAr0tEx10g'] = {
		Type = "Avatar",
		Position = {
			16,
			52
		},
		Metadata = {
			DisplayName = "Water Llama Master",
			SkinNumber = 9,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Battle"
			},
		},
	},
	['-btv1y2R9cf4Ii4KaLxvSBsU4ea_aAzZkQld7d_KMIg'] = {
		Type = "Avatar",
		Position = {
			82,
			84
		},
		Metadata = {
			DisplayName = "Grass Llama Master",
			SkinNumber = 2,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Battle"
			},
		},
	},
	['fax51pKe-lVFi8OBG36X0eLMZqPlz4QMLMiaVjuipEU'] = {
		Type = "Avatar",
		Position = {
			77.5,
			7
		},
		Metadata = {
			DisplayName = "Fire Llama Master",
			SkinNumber = 4,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Battle"
			},
		},
	},
	['J1uJLHNJKwqDsYGqwESy2U0XRCTgdBjY5GWJXOhgWX0'] = {
		Type = "Avatar",
		Position = {
			56,
			17
		},
		Metadata = {
			DisplayName = "Electric Llama Master",
			SkinNumber = 4,
			Interaction = {
				Type = 'SchemaForm',
				Id = "Battle"
			},
		},
	}
}

--#endregion

return print("Loaded Reality Template")