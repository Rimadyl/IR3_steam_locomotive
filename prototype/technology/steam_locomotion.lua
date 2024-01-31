-- Technology.lua
-- Credit @cupcakescankill
-- Modified: added rail & sheet metal wagon to recipe unlocks, increased science pack requirement.
require("constants")
data:extend({
	{
		type = "technology",
		name = "meat:steam-locomotion-technology",
		icon = SPRITE_PATH.."technology/steam-locomotion.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects = {
			{
				type = "unlock-recipe",
				recipe = "meat:steam-locomotive-recipe"
			},
			{
				type = "unlock-recipe",
				recipe = "meat:sheet-metal-cargo-wagon"
			},
			{
				type = "unlock-recipe",
				recipe = "rail"
			}
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1}
			},
			time = 60
		},
		order = "e-g"
	}
})
