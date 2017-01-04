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
	{type = 'checkbox', text = 'Enable Off heals', key = 'H_OHE', default = false},
	{type = 'spinner', text = 'Healing Surge (Health %)', key = 'H_OH', default = 35},
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

}

local exeOnLoad = function()
	-- Rotation loaded message.
	print('|cff0068ff ----------------------------------------------------------------------|r')
	print('|cff0068ff --- |rShaman: |cff0068ffELEMENTAL|r')
	print('|cff0068ff --- |rLightning Rod (Mythic+) Talents: 1/3 - 2/1 - 3/1 - 4/2 - 5/2 - 6/1 - 7/2')
	print('|cff0068ff --- |rIcefury Talents: 1/2 - 2/1 - 3/1 - 4/2 - 5/3 - 6/3 - 7/3')
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

-- Lighting Rod Rotation ##############################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/lightning-rod-build-guide/
local LRCooldowns = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Stormkeeper'},
	{'Fire Elemental', '!talent(6,2)'},
	{'Elemental Mastery', 'talent(6,1)'},
	{'Blood Fury', 'player.buff(Elemental Mastery)'},
}

local LRAoE = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Liquid Magma Totem', 'talent(6,1)', 'cursor.ground'},
	{{{'Flame Shock', '!target.debuff(Flame Shock)'},
	{'Lava Burst', 'player.buff(Lava Surge)'},
	}, {'!moving||moving'}},
	{'Earthquake', 'player.maelstrom>=50', 'cursor.ground'},
	{'Stormkeeper'},
	{'Chain Lightning', nil, 'target'},
}

local LRST = {
	{'Totem Mastery', 'totem(Totem Mastery).duration<1'},
	{'Liquid Magma Totem', 'talent(6,1)', 'cursor.ground'},
	{{{'Flame Shock', '!target.debuff(Flame Shock)||player.maelstrom>=20&player.buff(Elemental Focus)&target.debuff(Flame Shock).duration<9'},
	{'Earth Shock', 'player.maelstrom>=92||player.maelstrom>=86&!player.buff(Lava Surge)'},
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime||player.buff(Lava Surge)||player.buff(Lava Surge)&player.buff(Stormkeeper).duration>spell(Lava Burst).casttime+gcd'},
	}, {'!moving||moving'}},
	{'Stormkeeper'},
	{'Chain Lightning', 'player.area(40).enemies>1'},
	{'Lightning Bolt', nil, 'target'},
}

-- Icefury Rotation ###################################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/icefury-build-guide/
local IFCooldowns = {
	{'Stormkeeper'},
	{'Fire Elemental', '!talent(6,2)'},
	{'Blood Fury', 'lastcast(Fire Elemental)'},
}

local IFAoE = {
}

local IFST = {
	{{{'Flame Shock', '!target.debuff(Flame Shock)||player.maelstrom>=20&player.buff(Elemental Focus)&target.debuff(Flame Shock).duration<9'},
	{'Elemental Blast', nil, 'target'},
	{'Earth Shock', 'player.maelstrom>=92'},
	{'Icefury', 'player.maelstrom<=76'},
	{'Frost Shock', 'lastcast(Icefury)&spell(Frost Shock).charges=4||player.maelstrom>20'},
	{'!Frost Shock', 'player.maelstrom<20&player.buff(Icefury).count<=2&player.buff(Icefury).duration<=2+gcd'},
	{'Lava Burst', 'target.debuff(Flame Shock).duration>spell(Lava Burst).casttime||player.buff(Lava Surge)||player.maelstrom<=88&spell(Lava Burst).charges<=2'},
	}, {'!moving||moving'}},
	{'Stormkeeper'},
	{'Lightning Bolt', nil, 'target'},
}

-- Ascendance Rotation ################################################################
-- http://www.stormearthandlava.com/elemental-shaman-hub/ascendance-build-guide/
local ASCooldowns = {
}

local ASAoE = {
}

local ASST = {
}

local inCombat = {
	{Keybinds},
	{Dispel, 'toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Survival, 'player.health<100'},
	{'Healing Surge', 'UI(H_OHE)&lowest.health<UI(H_OH)', 'lowest'},
	{Trinkets},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{LRCooldowns, 'talent(7,2)&toggle(cooldowns)'},
	{IFCooldowns, 'talent(7,3)&toggle(cooldowns)'},
	{LRAoE, 'talent(7,2)&toggle(aoe)&player.area(40).enemies>2'},
	{IFAoE, 'talent(7,3)&toggle(aoe)&player.area(40).enemies>2'},
	{LRST, 'talent(7,2)&target.infront&target.range<=40'},
	{IFST, 'talent(7,3)&target.infront&target.range<=40'},
}

local outCombat = {
        { 'Ghost Wolf' , { 'player.movingfor >= 2' , '!player.buff' }},
	{Dispel, 'toggle(yuPS)&spell(Cleanse Spirit).cooldown=0'},
	{Interrupts, 'toggle(interrupts)&target.interruptAt(70)&target.infront&target.range<=30'},
	{'Healing Surge', 'UI(H_OHE)&lowest.health<70', 'lowest'},
}

NeP.CR:Add(262, {
	name = '|r[|cff00fff0Yumad|r] Shaman - |cff0068ffElemental|r',
	ic = inCombat,
	ooc = outCombat,
	gui = GUI,
	load = exeOnLoad
})
