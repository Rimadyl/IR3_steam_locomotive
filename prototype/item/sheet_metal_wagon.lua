--Sheet metal cargon wagon item
--Credit @DellAquila
require("constants")

data:extend({{
    type = "item-with-entity-data",
    name = "meat:sheet-metal-cargo-wagon",
    icon = SPRITE_PATH..'icon/cargo-wagon.png',
    icon_size = 32,
    subgroup = "transport",
    order = "a[train-system]-g[cargo-wagon]",
    place_result = "meat:sheet-metal-cargo-wagon",
    stack_size = 5
  }})
