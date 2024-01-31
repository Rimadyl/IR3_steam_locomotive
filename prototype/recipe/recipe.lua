--recipe.lua
--Credit @cupcakescankill & @DellAquila
-- Modified: recipe ingredients to fit IR3 early game intermediates

--Sheet metal wagon
data:extend({{
    type = "recipe",
    name = "meat:sheet-metal-cargo-wagon",
    energy_required = 1,
    enabled = false,
    ingredients =
    {
      {"copper-gear-wheel", 20},
      {"copper-plate", 40},
      {"copper-rod", 8},
      {"copper-frame-large",1},
      {"tin-plate", 40}
    },
    result = "meat:sheet-metal-cargo-wagon"
}})

--Steam locomotive
data:extend({{
	type = "recipe",
	name = "meat:steam-locomotive-recipe",
	enabled = false,
	energy_required = 16.5,
	normal = {
		enabled = false,
		ingredients = {{"copper-frame-large",1},{"tin-plate",100},{"copper-piston",8},{"copper-engine-unit",1},{"steam-pipe",10}},
		result = "meat:steam-locomotive-item"
	},
	expensive = {
		enabled = false,
		ingredients = {{"boiler",1},{"steam-engine",1},{"steel-plate",15},{"copper-frame-large",1},{"tin-plate",100},{"copper-piston",8},{"copper-engine-unit",1},{"steam-pipe",10}},
		result = "meat:steam-locomotive-item"
	},
	energy_required =  16.5,
	show_amount_in_title = false
}})
