local mod = get_mod("NoOverchargeDmgIndicator")

-- Override to not draw damage indicator if it's overcharge self damage.
mod:hook(DamageIndicatorGui, "update", function (func, self, dt)
	local my_player = self.player_manager:player_from_peer_id(self.peer_id)
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	local health_extension = ScriptUnit.extension(player_unit, "health_system")
	local strided_array, array_length = health_extension:recent_damages()
	
	if array_length > 0 then
		for i = 1, array_length / DamageDataIndex.STRIDE, 1 do
			local index = (i - 1) * DamageDataIndex.STRIDE
			local damage_type = strided_array[index + DamageDataIndex.DAMAGE_TYPE]
			
			if damage_type == "overcharge" then
				-- Overcharge damage, either via staff cooldown or during explosion; ignore it.
				return
			end
		end
	end

	-- Some other damage type; call the original function.
	return func(self, dt)
end)