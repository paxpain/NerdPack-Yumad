local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkspin', text = 'Ancestral Shift', key = 'S_AS', default_check = true, default_spin = 40},
	{type = 'checkspin', text = 'Gift of the Naaru', key = 'S_GOTN', default_check = true, default_spin = 40},
	{type = 'checkspin', text = 'Healthstone', key = 'S_HS', default_check = true, default_spin = 20},
	{type = 'checkspin', text = 'Ancient Healing Potion', key = 'S_AHP', default_check = false, default_spin = 20},
	{type = 'ruler'},{type = 'spacer'},
	
	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Healing Rain @ Cursor', key = 'K_HR', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_EBT', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Automatically trigger on-use trinkets.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Healing Stream Totem
	{type = 'header', text = 'Healing Stream Totem', align = 'center'},
	{type = 'checkbox', text = 'Enable Healing Stream Totem', key = 'To_HSTE', default = true},
	{type = 'text', text = 'Deployed when 3 or more players within 40yds. drop below 90% health.'},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Emergency Healing
	{type = 'header', text = 'Emergency Healing', align = 'center'},
	{type = 'checkbox', text = 'Enable Emergency Healing', key = 'E_EH', default = true},
	{type = 'text', text = 'Thresholds set to ensure party member survival.'},
	{type = 'spinner', text = 'Riptide (Health %)', key = 'E_RT', default = 25},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'E_HS', default = 35},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Tank Healing
	{type = 'header', text = 'Tank Healing', align = 'center'},
	{type = 'spinner', text = 'Force Riptide (Health %)', key = 'T_FRT', default = 90},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'T_HS', default = 75},
	{type = 'spacer'},
	{type = 'header', text = 'AoE Tank Healing', align = 'center'},
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.|r'},
	{type = 'text', text = '|cffff0000Advanced LUA unlocker required for Healing Rain ontop of tank.|r'},
	{type = 'checkbox', text = 'Enable Healing Rain', key = 'T_HRE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'checkbox', text = 'Enable Chain Heal', key = 'T_CHE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Player Healing
	{type = 'header', text = 'Player Healing', align = 'center'},
	{type = 'spinner', text = 'Force Riptide (Health %)', key = 'P_FRT', default = 85},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'P_HS', default = 70},
	{type = 'spacer'},
	{type = 'header', text = 'AoE Player Healing', align = 'center'},
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.|r'},
	{type = 'text', text = '|cffff0000Advanced LUA unlocker required for Healing Rain ontop of player.|r'},
	{type = 'checkbox', text = 'Enable Healing Rain', key = 'P_HRE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'checkbox', text = 'Enable Chain Heal', key = 'P_CHE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Lowest Healing
	{type = 'header', text = 'Lowest Healing', align = 'center'},
	{type = 'spinner', text = 'Force Riptide (Health %)', key = 'L_FRT', default = 85},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'L_HS', default = 70},
	{type = 'spinner', text = 'Healing Wave (Health %)', key = 'L_HW', default = 100},
	{type = 'spacer'},
	{type = 'header', text = 'AoE Lowest Healing', align = 'center'},
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.|r'},
	{type = 'text', text = '|cffff0000Advanced LUA unlocker required for Healing Rain ontop of lowest health player.|r'},
	{type = 'checkbox', text = 'Enable Healing Rain', key = 'L_HRE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'checkbox', text = 'Enable Chain Heal', key = 'L_CHE', default = true},
	{type = 'text', text = 'Active: when 3 or more players within 40yds. drop below 80% health.'},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cff0068ff --- |rShaman: |cff0068ffRESTORATION|r')
	print('|cff0068ff --- |rRecommended Talents: 1/3 - 2/2 - 3/1 - 4/2 - 5/? - 6/? - 7/?')
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Elemental DPS in rotation toggle.
		key = 'xDPS',
		name = 'Elemental DPS',
		text = 'Enable/Disable: Elemental DPS in rotation.',
		icon = 'Interface\\ICONS\\spell_fire_flameshock',
	})
end

local Survival = {
	-- Ancestral Shift
	{'Ancestral Shift', 'player.health<=UI(S_AS_spin)&UI(S_AS_check)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'player.health<=UI(S_GOTN_spin)&UI(S_GOTN_check)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'player.health<=UI(S_HS_spin)&UI(S_HS_check)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'player.health<=UI(S_AHP_spin)&UI(S_AHP_check)'},
}

local Keybinds = {
	-- Healing Rain at cursor on Left-Shift if enabled in UI.
	{'/cast [@cursor] !Healing Rain', 'keybind(lshift)&UI(K_HR)'},
	-- Lightning Surge Totem at cursor on Left-Control if enabled in UI.
	{'/cast [@cursor] !Lightning Surge Totem', 'keybind(lcontrol)&UI(K_LST)'},
	-- Pause on Left-Alt if enabled in UI.
	{'/cast [@cursor] !Earthbind Totem', 'keybind(lalt)&UI(K_EBT)'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Totems = {
	-- Healing Stream Totem. Range: 40yd. Health: 90%. Players: 3 or more.
	-- NOTE: Should eventually change this to cast on cooldown.
	{'!Healing Stream Totem', 'UI(To_HSTE)&player.area(40,90).heal>=3'}
}

local Emergency = {
	-- Riptide
	{'!Riptide', 'UI(E_EH)&lowest.health<UI(E_RT)', 'lowest'},
	-- Healing Surge 
	{'!Healing Surge', 'UI(E_EH)&lowest.health<UI(E_HS)', 'lowest'},
}

local Interrupts = {
	-- Wind Shear selected target.
	{'!Wind Shear'},
}

local DPS = {
	-- Flame Shock
	{'Flame Shock', '!target.debuff(Flame Shock)'},
	-- Lava Burst 
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime'},
	-- Chain Lightning
	{'Chain Lightning', 'player.area(40).enemies>=2', 'target'},
	-- Lightning Bolt
	{'Lightning Bolt'},
}

local Tank = {
	-- Riptide 
	{'Riptide', 'tank.buff(Riptide).duration<5||tank.health<UI(T_FRT)', 'tank'},
	-- Healing Surge
	{'Healing Surge', 'tank.health<UI(T_HS)', 'tank'},
	-- AoE Healing Rain
	{'Healing Rain', 'advanced&UI(T_HRE)&toggle(AoE)&tank.area(40).friendly>=3&player.area(40,80).heal>=3', 'tank.ground'},
	-- AoE Chain Heal
	{'Chain Heal', 'UI(T_CHE)&toggle(AoE)&tank.area(40).friendly>=3&player.area(40,80).heal>=3', 'tank'},
}

local Player = {
	--Riptide
	{'Riptide', 'player.buff(Riptide).duration<5||player.health<UI(P_FRT)', 'player'},
	--Healing Surge
	{'Healing Surge', 'player.health<UI(P_HS)', 'player'},
	-- AoE Healing Rain
	{'Healing Rain', 'advanced&UI(P_HRE)&toggle(AoE)&player.area(40).friendly>=3&player.area(40,80).heal>=3', 'player.ground'},
	-- AoE Chain Heal
	{'Chain Heal', 'UI(P_CHE)&toggle(AoE)&player.area(40).friendly>=3&player.area(40,80).heal>=3', 'player'},
}

local Lowest = {
	--Riptide
	{'Riptide', 'lowest.buff(Riptide).duration<5||lowest.health<UI(L_FRT)', 'lowest'},
	--Healing Surge
	{'Healing Surge', 'lowest.health<UI(L_HS)', 'lowest'},
	--Healing Wave
	{'Healing Wave', 'lowest.health<UI(L_HW)', 'lowest'},
	-- AoE Healing Rain
	{'Healing Rain', 'advanced&UI(L_HRE)&toggle(AoE)&lowest.area(40).friendly>=3&player.area(40,80).heal>=3', 'lowest.ground'},
	-- AoE Chain Heal
	{'Chain Heal', 'UI(L_CHE)&toggle(AoE)&lowest.area(40).friendly>=3&player.area(40,80).heal>=3', 'lowest'},
}

local inCombat = {
	--{'!Purify Spirit', 'DispelNone(Purify Spirit).health<=100', 'DispelNone(Purify Spirit)'},
	{Keybinds},
	{Emergency},
	{Survival},
	{Totems},
	{Trinkets},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{Tank, 'tank.exists&tank.health<100'},
	{Player, 'player.health<100'},
	{Lowest, 'lowest.health<100'},
	{DPS, 'toggle(xDPS)&target.range<40&target.infront'}
}

local outCombat = {
	{'Riptide', 'lowest.health<100', 'lowest'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{'%ressdead(Ancestral Spirit)'},
}

NeP.CR:Add(264, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffRestoration|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})

	--[[
	{{ -- AoE
		-- Healing Rain
		{'Healing Rain', {'UI(G_HR)', 'player.advanced'}, 'player.ground'},
		--Chain Heal used to heal moderate to high damage. Provides Tidal Waves.
		{'Chain Heal','UI(G_CH)', 'player'}
	}, {'toggle(AoE)', 'player.area(40).friendly >= 3', 'AoEHeal(80, 3)'} }
	]]
