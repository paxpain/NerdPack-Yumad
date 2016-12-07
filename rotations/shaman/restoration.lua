local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Astral Shift', key = 'S_ASE', default = true},
	{type = 'spinner', text = 'Astral Shift (Health %)', key = 'S_AS', default = 40},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	{type = 'spinner', text = 'Ancient Healing Potion(Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},
	
	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Healing Rain @ Cursor', key = 'K_HR', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_EBT', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets off cooldown.'},
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
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.'},
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
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.'},
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
	{type = 'text', text = '|cffff0000Elemental DPS rotation is dependent on the value set for Healing Wave.|r'},
	{type = 'text', text = '@ 100% = Healing Wave filler spam at all times.'},
	{type = 'text', text = '@ < 100% = Elemental DPS takes precedence.'},
	{type = 'spinner', text = 'Healing Wave (Health %)', key = 'L_HW', default = 100},
	{type = 'spacer'},
	{type = 'header', text = 'AoE Lowest Healing', align = 'center'},
	{type = 'text', text = 'Toggle Multitarget on NeP Bar.'},
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
		text = 'Enable/Disable: Elemental DPS in rotation. Set Healing Wave value to < 100.',
		icon = 'Interface\\ICONS\\spell_fire_flameshock',
	})
end

local Survival = {
	-- Astral Shift
	{'Astral Shift', 'UI(S_ASE)&player.health<=UI(S_AS)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
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
	{'Lightning Bolt', nil, 'target'},
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
	{Keybinds},
	{Survival},
	{Emergency},
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
	{Lowest, 'lowest.health<100'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	--{'%ressdead(Ancestral Spirit)'}, -- Confirmed broken by MTS. 
}

NeP.CR:Add(264, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffRestoration|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})

	-- Archived local nested toggle.
	--[[
	{{ -- AoE
		-- Healing Rain
		{'Healing Rain', {'UI(G_HR)', 'player.advanced'}, 'player.ground'},
		--Chain Heal used to heal moderate to high damage. Provides Tidal Waves.
		{'Chain Heal','UI(G_CH)', 'player'}
	}, {'toggle(AoE)', 'player.area(40).friendly >= 3', 'AoEHeal(80, 3)'} }
	]]
