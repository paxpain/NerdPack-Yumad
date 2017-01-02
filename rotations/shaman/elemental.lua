local GUI = {
	-- GUI Survival
	{type = 'header', text = 'Survival', align = 'center'},
	{type = 'checkbox', text = 'Enable Astral Shift', key = 'S_ASE', default = true},
	{type = 'spinner', text = 'Astral Shift (Health %)', key = 'S_AS', default = 40},
	{type = 'checkbox', text = 'Enable Healing Surge', key = 'S_HSGE', default = true},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'S_HSG', default = 30},
	{type = 'checkbox', text = 'Enable Earth Elemental', key = 'S_EEE', default = true},
	{type = 'spinner', text = 'Earth Elemental (Health %)', key = 'S_EE', default = 50},
	{type = 'checkbox', text = 'Enable Gift of the Naaru', key = 'S_GOTNE', default = true},
	{type = 'spinner', text = 'Gift of the Naaru (Health %)', key = 'S_GOTN', default = 40},
	{type = 'checkbox', text = 'Enable Healthstone', key = 'S_HSE', default = true},
	{type = 'spinner', text = 'Healthstone (Health %)', key = 'S_HS', default = 20},
	{type = 'checkbox', text = 'Enable Ancient Healing Potion', key = 'S_AHPE', default = true},
	{type = 'spinner', text = 'Ancient Healing Potion (Health %)', key = 'S_AHP', default = 20},
	{type = 'ruler'},{type = 'spacer'},
	
	-- GUI Keybinds
	{type = 'header', text = 'Keybinds', align = 'center'},
	{type = 'checkbox', text = 'L-Shift: Totem Mastery', key = 'K_TM', default = true},
	{type = 'checkbox', text = 'L-Control: Lightning Surge Totem @ Cursor', key = 'K_LST', default = true},
	{type = 'checkbox', text = 'L-Alt: Earthbind Totem @ Cursor', key = 'K_ET', default = true},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Trinkets
	{type = 'header', text = 'Trinkets', align = 'center'},
	{type = 'text', text = 'Activate on-use trinkets on cooldown.'},
	{type = 'checkbox', text = 'Enable Top Trinket', key = 'trinket_1', default = false},
	{type = 'checkbox', text = 'Enable Bottom Trinket', key = 'Trinket_2', default = false},
	{type = 'ruler'},{type = 'spacer'},

	-- GUI Player Healing
	{type = 'header', text = 'Player Healing', align = 'center'},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'P_HS', default = 30},
	{type = 'ruler'},{type = 'spacer'},
}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cff0068ff --- |rShaman: |cff0068ffELEMENTAL|r')
	print('|cff0068ff --- |rLightning Rod Talents: 1/3 - 2/1 - 3/1 - 4/2 - 5/2 - 6/1 - 7/2')
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cffff0000 Configuration: |rRight-click the MasterToggle and go to Combat Routines Settings|r')

	NeP.Interface:AddToggle({
		-- Cleanse Spirit
		key = 'yuPS',
		name = 'Cleanse Spirit',
		text = 'Enable/Disable: Automatic removal of curses.',
		icon = 'Interface\\ICONS\\ability_shaman_cleansespirit',
	})
end

local Survival = {
	-- Astral Shift usage if enabled in UI.
	{'Astral Shift', 'UI(S_ASE)&player.health<=UI(S_AS)'},
	--Healing Surge usage if enabled in UI.
	{'Healing Surge', 'UI(S_HSGE)&!moving&player.health<=UI(S_HSG)', 'player'},
	-- Earth Elemental usage if enabled in UI.
	{'Earth Elemental', 'UI(S_EEE)&player.health<=UI(S_EE)'},
	-- Gift of the Naaru usage if enabled in UI.
	{'Gift of the Naaru', 'UI(S_GOTNE)&player.health<=UI(S_GOTN)'},
	-- Healthstone usage if enabled in UI.
	{'#Healthstone', 'UI(S_HSE)&player.health<=UI(S_HS)'},
	-- Ancient Healing Potion usage if enabled in UI.
	{'#Ancient Healing Potion', 'UI(S_AHPE)&player.health<=UI(S_AHP)'},
}

local Keybinds = {
	-- Totem Mastery on Left-Shift if enabled in UI.
	{'!Totem Mastery', 'keybind(lshift)&UI(K_TM)'},
	-- Lightning Surge Totem at cursor on Left-Control if enabled in UI.
	{'!Lightning Surge Totem', 'keybind(lcontrol)&UI(K_LST)', 'cursor.ground'},
	-- Earthbind Totem at cursor on Left-Alt if enabled in UI.
	{'!Earthbind Totem', 'keybind(lalt)&UI(K_ET)', 'cursor.ground'},
}

local Trinkets = {
	-- Top Trinket usage if enabled in UI.
	{'#trinket1', 'UI(trinket_1)'},
	-- Bottom Trinket usage if enabled in UI.
	{'#trinket2', 'UI(trinket_2)'},
}

local Interrupts = {
	-- Wind Shear selected target.
	{'!Wind Shear'},
}

local Dispel ={
	-- Cleanse Spirit
	{'%dispelall'},
}

local Cooldowns = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Stormkeeper'},
	{'Fire Elemental', '!talent(6,2)'},
	{'Elemental Mastery', 'talent(6,1)'},
	{'Blood Fury', 'player.buff(Elemental Mastery)'},
}

local AoE = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Liquid Magma Totem', 'talent(6,1)', 'cursor.ground'},
	{{{'Flame Shock', 'target.debuff(Flame Shock).duration<gcd'},
	{'Lava Burst', 'player.buff(Lava Surge)'},}, {'!moving||moving'}},
	{'Earthquake', 'player.maelstrom>=50', 'cursor.ground'},
	{'Stormkeeper'},
	{'Chain Lightning', nil, 'target'},
}

local ST = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Liquid Magma Totem', 'talent(6,1)', 'cursor.ground'},
	{{{'Flame Shock', '!target.debuff(Flame Shock)||target.debuff(Flame Shock).duration<gcd||player.maelstrom>=20&player.buff(Elemental Focus)&target.debuff(Flame Shock).duration<9'},
	{'Earth Shock', 'player.maelstrom>=92||player.maelstrom>=86&!player.buff(Lava Surge)'},
	{'Stormkeeper'},
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime&spell(Lava Burst).cooldown=0||player.buff(Lava Surge)||player.buff(Lava Surge)&player.buff(Stormkeeper).duration>spell(Lava Burst).casttime+gcd'},}, {'!moving||moving'}},
	{'Chain Lightning', 'player.area(40).enemies>1'},
	{'Lightning Bolt', nil, 'target'},
}

local inCombat = {
	{Keybinds},
	{Dispel, 'toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Survival},
	{Trinkets},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{Cooldowns, 'toggle(cooldowns)'},
	{AoE, 'toggle(aoe)&player.area(40).enemies>2'},
	{ST, 'target.range<40&target.infront'},
}

local outCombat = {
	{Dispel, 'toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
}

NeP.CR:Add(262, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffElemental|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})