-- INTRO LEVEL ----------------------------------------------------------

register_level "intro"
{
	name  = "Phobos Base Entry",
	entry = "He started his journey on the surface of Phobos.",

	Create = function ()
		generator.fill("rock",area.FULL)


		local translation = {
			['.'] = "rock",
			[','] = "floor",
			['#'] = "wall",
			['+'] = "door",
			['>'] = "stairs",
			['P'] = { "floor" },
			['1'] = { "floor", being = "former" },
			['H'] = { "floor", being = "sergeant" },
			['2'] = { "floor", being = core.ifdiff( 2, "former" ) },
			['3'] = { "floor", being = core.ifdiff( 3, "former" ) },
			['4'] = { "floor", being = core.ifdiff( 4, "sergeant" ) or core.ifdiff( 3, "former" ) },
			['*'] = { "floor", item = "smed" },
		}

		if CHALLENGE ~= "" and chal[CHALLENGE].entryitem then
			translation["P"].item = chal[CHALLENGE].entryitem
		elseif DIFFICULTY > 3 then
			translation["P"].item = "garmor"
		end

		local proto_key = {
	A = { [[
..............,
.....,,,,..,,,,
.......,,,,,,,,
........,,,,,,,
......,,,.,,,,,
.....,,,#######
.....,,,#,,,,,,
.......,#,>HP,,
.....,,,#,,,,,,
......,,#######
......,,,,,,,,,
........,,,,,,,
..........,,,,,
..............,
...............
]],[[
..............,
.....,,,,..,,,,
.......,,,,,,,,
........,#####,
......,,##,,,##
.....,,##,,,,,,
.....,,#,,,,,,,
.......#,,>HP,,
.....,,#,,,,,,,
......,#,,,,,,,
......,###,,,##
........,#####,
..........,,,,,
..............,
...............
]] },
	B = { [[
,,,,,,,,,,,,...
,,,,,,,,,,,,,,,
,,,,,,,,,,,,,,,
,,,,,,,########
########2,,,,,#
#,,,,1,+,,,,,,+
#,,,,,,#,,,,,,#
+,1,,,,########
#,,,,,,#,,,,,,#
#,,,,1,+,,,,,,+
########2,,,,,#
,,,,,,,########
,,,,,,,,,,,,,,,
,,,,.....,,,,..
...............
]],[[
,,,,,,,,,,,,...
,,,,,,,,,,,,,,,
,,,,,,,,,,,,,,,
###############
#,,,,,,#2,,,,,#
#,,,,1,+,,,,,,#
#,,,,,,#,,,,,,+
+,1,,,,########
#,,,,,,#,,,,,,+
#,,,,1,+,,,,,,#
#,,,,,,#2,,,,,#
###############
,,,,,,,,,,,,,,,
,,,,.....,,,,..
...............
]] },
	C = { [[
..,,,,,,,,,,...
,,,,,,,....,,,.
,,,,,,,,,,,,,,,
,,,,,,,,,,,,,..
####,,,,,,,,,,,
4,*#3,,,,##,,..
,,,##,,,,##,,,.
,,,+,,,,,,,,,..
,,,##,,,,##,,..
4,*#3,,,,##,...
####,,.........
,,,............
,..............
...............
...............
]],[[
..,,,,,,,,,,...
,,,,,,,....,,,.
,,,,,,,,,,,,,,,
,,,,,,,,,,,,,..
###########,,,,
4,*#,,3,,##,,..
,,,#,,,,,,,,,,.
,,,+,,,,,,,,,..
,,,#,,,,,,,,,..
4,*#,,3,,##,...
###########....
,,,............
,..............
...............
...............
]]
}
}
		local proto_map = "ABC"
		local tilesets = {[[
..............,,,,,,,,,,,,,.....,,,,,,,,,,,,...........
.....,,,,..,,,,,,,,,,,,,,,,,,,,,,,,,,....,,,,,,,,,.....
.......,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
........,,,,,,,,,,,,,,#######,,,,,,,,,,,,,,,,,,,,,,,,,.
......,,,.,,,,,########2,,,,######,,,,,,,,,,,,...,,,,..
.....,,,,#######,,,,1,+,,,,,#4,,*#3,,,,##,,,,,,,,,,,...
.....,,,.#,,,,,#,,,,,,#,,,,,+,,,,#,,,,,##,,,,,,,,,,....
.......,,#>HP,,+,1,,,,#######,,,,+,,,,,,,,,...,,,......
.....,,,,#,,,,,#,,,,,,#,,,,,+,,,,#,,,,,##,,,,,,,,,,,...
......,,,#######,,,,1,+,,,,,#4,,*#3,,,,##,,,,,,,,,,....
......,,,,,,,,,########2,,,,######,,....,,,,,,,,,,,....
........,,,,,,,,,,,,,,#######,,,,......................
..........,,,,,,,,,,,,,,,,,,,,,........................
..............,,,,,.....,,,,...........................
.......................................................
]],[[
.......................................................
...........##.,,,,,,,,,,,,,.........,,,,,,,##..........
.....,,,,..##################################,,,,,.....
.......,,,,,#,,,,,,,#,,,,,,#,,,,,,,,#*,,,,,#3,,,,,,,,..
........,,,,#,1,,,,,+,,,,,,+,,,,,,,,+,,,4,,#,,,,,,,,,,.
......,,,,,,#,,,,,,,#,,,,,,#,,,,,,,,#,,,,,,#,,,,,,,,,..
.....,,,,,,,######+##,,,,,,#,,,2,,,,#,,,,,,#,,,,,,,,...
.....,,,,,,,#H>P,,,,#,,,1,,##########,,,,,,+,,,,,,,....
.......,,,,,######+##,,,,,,#,,,2,,,,#,,,,,,#,,,,,......
.....,,,,,,,#,,,,,,,#,,,,,,#,,,,,,,,#,,,,,,#,,,,,,,,...
......,,,,,,#,1,,,,,+,,,,,,+,,,,,,,,+,,,4,,#,,,,,,,....
......,,,,,,#,,,,,,,#,,,,,,#,,,,,,,,#*,,,,,#3,,,,,,....
........,,,##################################..........
..........,##,,,,,,,,,,,,,,,,,,.......,,,..##..........
..............,,,,,.....,,,,...........................
]],[[
.......................................................
..............,,,,,,,,,,,,,,,,,........................
.....,,,,..,,,,,,,,,,########,,,,,,,,,...,,,,,,,,,.....
.......,,,,,,,########2,,,,,########,,,,,,,,,,,,,,,,,..
........,,,,,,#1,,,,,+,,,,,,+,,,,,,#3,,,,,,,,,,,,,,,,,.
......,,,,#####+######,,,,,,######+#####,,,,,,,,,,,,,..
.....,,,,,#,,,,,,,,,,########,,,,,,4,,*#,,,,,,,,,,,,...
.....,,,,,#1,,,,,,,,,+,,,PH>#,,,,,,,,,,+,,,,,,,,,,,....
.......,,,#,,,,,,,,,,########,,,,,,4,,*#,,,,,,,,,......
.....,,,,,#####+######,,,,,,######+#####,,,,,,,,,,,,...
......,,,,,,,,#1,,,,,+,,,,,,+,,,,,,#3,,,,,,,,,,,,,,....
......,,,,,,,,########2,,,,,########,,,.,,,,,,,,,,,....
........,,,,,,,,,,,,,########,,,,,,,,,.................
..........,,,,,,,,,,,,,,,,,,,,,........................
..............,,,,,.....,,,,...........................
]],[[
.......................................................
..............,,,,,,,,,,,,,............................
.....,,,,..,,,,,,,########,,,,,,,,,,,....,,,,,,,,,.....
.......,,,,,,,,,,,#,,,,,,#########,,,,,,,,,,,,,,,,,,,..
........,,,,,,,,,,#1,,,,,+,,,,,,,#3,,,,,,,,,,,,,,,,,,,.
......,,,,,,,,,####+###,,#2,,,,,,#######,,,,,,,,,,,,,..
.....,,,,,,,,,,#,,,,,,########,,,#,4,,*#,,,,,,,,,,,,...
.....,,,,,,,,,,#1,,,,,+,,,PH>#,,,+,,,,,+,,,,,,,,,,,....
.......,,,,,,,,#,,,,,,########,,,#,4,,*#,,,,,,,,,......
.....,,,,,,,,,,####+###,,#2,,,,,,#######,,,,,,,,,,,,...
......,,,,,,,,,,,,#1,,,,,+,,,,,,,#3,,,,,,,,,,,,,,,,....
......,,,,,,,,,,,,#,,,,,,#########,,....,,,,,,,,,,,....
........,,,,,,,,,,########,,,,,,,......................
..........,,,,,,,,,,,,,,,,,,,,,........................
..............,,,,,.....,,,,...........................
]]}
		if math.random(2) == 1 then
			generator.place_tile( translation, tilesets[math.random(#tilesets)], 9, 3 )
		else
			generator.place_proto_map( coord.new( 12, 3 ), proto_map, proto_key, translation )
		end
		generator.scatter( area.FULL:shrinked(3),"rock","tree", 20)
		for c in area.around( coord.new( 75, 10 ), 3 )() do
			generator.set_cell( c, "rock" );
		end

		level:player(75,10)
	end,

	OnTick = function ()
		if CHALLENGE == "" then
			-- XXX Can we discover the actual key registered for the action?
			ui.set_hint("")
			local p = player.position
			if p.x > 64 then
				ui.set_hint("Hint : use numpad or arrows to move around!")
			elseif p.x > 60 then
				ui.set_hint("Hint : press \"?\" to read full help!")
			elseif p.x > 56 then
				ui.set_hint("Hint : you can turn off hints by editing config.lua!")
			end
			if player.exp < 30  and player.beingsinvision > 1 then
				ui.set_hint("Hint : press \"f\" to fire your weapon!")
			end
			if player.eq.weapon and player.eq.weapon.ammo == 0 then
				ui.set_hint("Hint : press \"r\" to reload your weapon!")
			end
			local item = level:get_item(p)
			if item then
				ui.set_hint("Hint : press \"g\" to get items from the ground!")
			end
			local tile = cells[ generator.get_cell( p ) ].id
			if tile == "stairs" then
				ui.set_hint("Hint : press \">\" to move downstairs!")
			end
		end
	end,
	OnExit = function ()
		ui.set_hint("")
	end,

	-- this is needed only to render the trees properly in G-version
	OnEnter = function ()
		for c in generator.each( "tree", area.FULL_SHRINKED ) do
			generator.set_cell( c, "rock" )
			generator.set_cell( c, "tree" )
		end
	end,

}
