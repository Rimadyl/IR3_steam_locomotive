--control.lua
-- Credit @cupcakescankill
-- Modified: removed fluid handling processes & hooks

local WheelControl = require("script/handle_wheels.lua")
local WHEEL_UPDATE_TICK = 2

function on_tick(event)
	for i = 1 + event.tick % WHEEL_UPDATE_TICK, #global.locomotives, WHEEL_UPDATE_TICK do
		local v = global.locomotives[i]
		if is_locomotive_valid(i, v) then
			WheelControl:update_wheel_position(v.locomotive, v.wheels)
		end
	end
end

function is_locomotive_valid(i, v)
	if not v then
		table.remove(global.locomotives, i)
		return;
	end
	if not v.locomotive or not v.locomotive.valid then
		table.remove(global.locomotives, i)
		if v.wheels then
			v.wheels.destroy()
		end
		return false
	else
		return true
	end
end

function addToGlobal(locomotive, is_cold, no_water)
	local wheels = WheelControl:apply_wheels(locomotive)
	table.insert(global.locomotives, {
		locomotive = locomotive,
		wheels = wheels,
	})
end

function on_build(event)
	if (not event.created_entity or not event.created_entity.valid) then
		return
	end
	if (event.created_entity.name == 'meat:steam-locomotive-placement-entity') then
		local force = game.forces.neutral
		if (event.player_index) then
			local player = game.get_player(event.player_index)
			force = player.force
		end
		if (event.robot) then
			force = event.robot.force
		end
		local position = event.created_entity.position
		local orientation = event.created_entity.orientation
		local surface = event.created_entity.surface
		event.created_entity.destroy()
		local locomotive = surface.create_entity({
			name = "meat:steam-locomotive",
			position = position,
			orientation = orientation,
			force = force,
			raise_script_built = false
		})
		addToGlobal(locomotive, true, true)
		-- hack to get fluid trains to see the created entity
		locomotive.train.manual_mode = false
		locomotive.train.manual_mode = true
	elseif (event.created_entity.name == 'meat:steam-locomotive') then
		addToGlobal(event.created_entity, true, true)
	end
end

--for compatibility with mods like space exploration
function on_script_built(event)
	local entity = event.entity
	if not entity then return end
	if entity.name ~= 'meat:steam-locomotive' then return end
	addToGlobal(entity, false, false)
end



function on_init()
	if not global then global = {} end
	if not global.locomotives then global.locomotives = {} end
end



script.on_configuration_changed(on_init)
script.on_init(on_init)
script.on_event(defines.events.on_tick, on_tick)
script.on_event(defines.events.on_built_entity, on_build)
script.on_event(defines.events.on_robot_built_entity, on_build)
script.on_event(defines.events.script_raised_built, on_script_built)
