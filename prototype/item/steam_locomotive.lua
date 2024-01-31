--Steam locomotive item
--Credit @cupcakescankill
require("constants")

data:extend({{
	type = "item",
	name = "meat:steam-locomotive-item",
	icon = SPRITE_PATH.."icon/steam-locomotive.png",
	icon_size = 64,
	icon_mipmaps = 4,
	subgroup = "train-transport",
	place_result = "meat:steam-locomotive-placement-entity",
	stack_size = 5
}})
