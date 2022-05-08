---------------------------
---- Quantumfate theme ----
---------------------------

local theme_assets = require("beautiful.theme_assets")
local dpi = require("beautiful.xresources").apply_dpi
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local gears = require("gears")
local lain = require("lain")
local wibox = require("wibox")
local os = os
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
--[[
    Variables
]]

local colors = {}

-- see if the file exists
function file_exists(file)
	local f = io.open(file, "rb")
	if f then
		f:close()
	end
	return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
	if not file_exists(file) then
		return {}
	end
	local lines = {}
	i = 0
	for line in io.lines(file) do
		lines["color" .. i] = line
		i = i + 1
	end
	return lines
end

-- tests the functions above
local file = "/home/leonch/.config/awesome/themes/quantum-desktop/colors"
-- os.getenv("HOME") .. themes_path .. 'colors'
local colors = lines_from(file)

-- paths
local config_dir = os.getenv("HOME") .. "/.config/awesome/"
local theme_dir = "themes/"

local modkey = "Mod4"

local theme = {}

-- Set theme colors
theme.color0 = colors.color0
theme.color1 = colors.color1
theme.color2 = colors.color2
theme.color3 = colors.color3
theme.color4 = colors.color4
theme.color5 = colors.color5
theme.color6 = colors.color6
theme.color7 = colors.color7
theme.color8 = colors.color8
theme.color9 = colors.color9
theme.color10 = colors.color10
theme.color11 = colors.color11
theme.color12 = colors.color12
theme.color13 = colors.color13
theme.color14 = colors.color14
theme.color15 = colors.color15

-- number of available tags (dont do more than 9)
theme.tag_count = 5
theme.dir = config_dir .. theme_dir .. "/quantum-desktop"
theme.icon_dir = theme.dir .. "/icons"
theme.wallpaper_dir = theme.dir .. "/wallpaper"
-- Wallpaper for horizontal rotation
theme.wallpaper_horizontal = theme.wallpaper_dir .. "/horizontal_wallpaper.jpg"
-- Wallpaper for vertical rotation
theme.wallpaper_vertical = theme.wallpaper_dir .. "/vertical_wallpaper.png"
theme.font = "Fira Code Nerd Font Mono 9"
theme.bg_normal = theme.color0
theme.bg_focus = theme.color5
theme.bg_urgent = theme.color2
theme.bg_minimize = theme.color0
theme.bg_systray = theme.bg_normal

theme.fg_normal = theme.color7
theme.fg_focus = theme.color0
theme.fg_urgent = theme.color2
theme.fg_minimize = theme.color6

theme.useless_gap = dpi(8)
theme.border_width = dpi(2)
theme.border_normal = theme.color0
theme.border_focus = theme.color0
theme.border_marked = theme.color0

theme.hotkeys_modifiers_fg = theme.color7

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load

--[[
    Titlebar
]]

theme.titlebar_dir = theme.dir .. "/titlebar/"

theme.titlebar_close_button_normal = theme.titlebar_dir .. "close_normal.png"
theme.titlebar_close_button_focus = theme.titlebar_dir .. "close_focus.png"

theme.titlebar_minimize_button_normal = theme.titlebar_dir .. "minimize_normal.png"
theme.titlebar_minimize_button_focus = theme.titlebar_dir .. "minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.titlebar_dir .. "ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = theme.titlebar_dir .. "ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.titlebar_dir .. "ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = theme.titlebar_dir .. "ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.titlebar_dir .. "sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = theme.titlebar_dir .. "sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.titlebar_dir .. "sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = theme.titlebar_dir .. "sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.titlebar_dir .. "floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = theme.titlebar_dir .. "floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.titlebar_dir .. "floating_normal_active.png"
theme.titlebar_floating_button_focus_active = theme.titlebar_dir .. "floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.titlebar_dir .. "maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = theme.titlebar_dir .. "maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.titlebar_dir .. "maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = theme.titlebar_dir .. "maximized_focus_active.png"

--[[
    Layout
]]

-- You can use your own layout icons like this:
theme.tasklist_plain_task_name = true
-- theme.tasklist_disable_icon                     = true
theme.awesome_icon             = theme.icon_dir .. "/awesome_icon_white.png"
theme.awesome_icon_launcher    = theme.icon_dir .. "/awesome_icon.png"
theme.taglist_squares_sel      = theme.icon_dir .. "/square_sel.png"
theme.taglist_squares_unsel    = theme.icon_dir .. "/square_unsel.png"
theme.spr_small                = theme.icon_dir .. "/spr_small.png"
theme.spr_very_small           = theme.icon_dir .. "/spr_very_small.png"
theme.spr_right                = theme.icon_dir .. "/spr_right.png"
theme.spr_bottom_right         = theme.icon_dir .. "/spr_bottom_right.png"
theme.spr_left                 = theme.icon_dir .. "/spr_left.png"
theme.bar                      = theme.icon_dir .. "/bar.png"
theme.bottom_bar               = theme.icon_dir .. "/bottom_bar.png"
theme.mpdl                     = theme.icon_dir .. "/mpd.png"
theme.mpd_on                   = theme.icon_dir .. "/mpd_on.png"
theme.prev                     = theme.icon_dir .. "/prev.png"
theme.nex                      = theme.icon_dir .. "/next.png"
theme.stop                     = theme.icon_dir .. "/stop.png"
theme.pause                    = theme.icon_dir .. "/pause.png"
theme.play                     = theme.icon_dir .. "/play.png"
theme.clock                    = theme.icon_dir .. "/clock.png"
theme.calendar                 = theme.icon_dir .. "/cal.png"
theme.cpu                      = theme.icon_dir .. "/cpu.png"
theme.net_up                   = theme.icon_dir .. "/net_up.png"
theme.net_down                 = theme.icon_dir .. "/net_down.png"

theme.layout_dir = theme.dir .. "/layouts/"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.layout_dir .. "fairhw.png"
theme.layout_fairv = theme.layout_dir .. "fairvw.png"
theme.layout_floating = theme.layout_dir .. "floatingw.png"
theme.layout_magnifier = theme.layout_dir .. "magnifierw.png"
theme.layout_max = theme.layout_dir .. "maxw.png"
theme.layout_fullscreen = theme.layout_dir .. "fullscreenw.png"
theme.layout_tilebottom = theme.layout_dir .. "tilebottomw.png"
theme.layout_tileleft = theme.layout_dir .. "tileleftw.png"
theme.layout_tile = theme.layout_dir .. "tilew.png"
theme.layout_tiletop = theme.layout_dir .. "tiletopw.png"
theme.layout_spiral = theme.layout_dir .. "spiralw.png"
theme.layout_dwindle = theme.layout_dir .. "dwindlew.png"
theme.layout_cornernw = theme.layout_dir .. "cornernww.png"
theme.layout_cornerne = theme.layout_dir .. "cornernew.png"
theme.layout_cornersw = theme.layout_dir .. "cornersww.png"
theme.layout_cornerse = theme.layout_dir .. "cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

local markup = lain.util.markup
local blue   = "#80CCE6"
local space3 = markup.font("FiraCode Nerd Font 4", " ")

local theme_icons = require "themes.quantum-desktop.theme_icons"

-- Clock
local mytextclock = wibox.widget.textclock(markup("#FFFFFF", space3 .. "%H:%M   " .. space3))
mytextclock.font = theme.font
local clock_icon = theme_icons.clock_icon
local clockbg = wibox.container.background(mytextclock, theme.bg_normal, gears.shape.rectangle)
local clockwidget = wibox.container.margin(clockbg, dpi(4), dpi(5), dpi(7), dpi(5))


-- Calendar
local mytextcalendar = wibox.widget.textclock(markup.fontfg(theme.font, "#FFFFFF", space3 .. "%d %b " .. space3))
local calendar_icon = theme_icons.calendar_icon
local calbg = wibox.container.background(mytextcalendar, theme.bg_normal, gears.shape.rectangle)
local calendarwidget = wibox.container.margin(calbg, dpi(0), dpi(5), dpi(5), dpi(5))
theme.cal = lain.widget.cal({
	attach_to = { mytextclock, mytextcalendar },
	notification_preset = {
		fg = "#FFFFFF",
		bg = theme.bg_normal,
		position = "top_right",
		font = "Monospace 10"
	}
})

-- Net
local netdown_icon = theme_icons.down_icon
local netup_icon = theme_icons.up_icon
local net = lain.widget.net({
	settings = function()
		widget:set_markup(space3 .. markup.font(theme.font, net_now.received .. "  "
			.. net_now.sent) .. space3)
	end
})
local netbg = wibox.container.background(net.widget, theme.bg_normal, gears.shape.rectangle)
local networkwidget = wibox.container.margin(netbg, dpi(5), dpi(5), dpi(5), dpi(5))

-- CPU
local cpu_icon = theme_icons.cpu_icon
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(space3 .. markup.font(theme.font, "CPU " .. cpu_now.usage
			.. "% ") .. markup.font("Roboto 5", " "))
	end
})
local cpubg = wibox.container.background(cpu.widget, theme.bg_normal, gears.shape.rectangle)
local cpuwidget = wibox.container.margin(cpubg, dpi(0), dpi(0), dpi(5), dpi(5))

--[[
    Rules
]]

theme.rules = {

	{ rule = { class = "discord" }, properties = { screen = 2, tag = "2" } },
}
-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

--[[
   Heler functions 
]]

-- determine if screen is horizontal
-- @param: s = screen
function is_horizontal_screen(s)
	return s.geometry.width >= s.geometry.height
end

-- set the wallpaper for screen s
-- @param: s = screem, wallpaper = /path/to/png
function set_wallpaper(s, wallpaper)
	if beautiful.wallpaper then
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- helper function to prepare an array of tags
function get_tag_count()
	local my_tags = {}
	-- Each screen has its own tag table.
	for i = 1, theme.tag_count do
		my_tags[i] = "" .. i
	end
	return my_tags
end

-- ALSA volume bar
theme.volume = lain.widget.alsabar({
	notification_preset = { font = "Monospace 9" },
	--togglechannel = "IEC958,3",
	width = dpi(80), height = dpi(10), border_width = dpi(0),
	colors = {
		background = "#383838",
		unmute     = "#80CCE6",
		mute       = "#FF9F9F"
	},
})
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(5)
local volumewidget = wibox.container.background(theme.volume.bar, theme.bg_focus, gears.shape.rectangle)
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(5), dpi(5))

--[[
    Widgets
]]
-- Spotify
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
-- CPU
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
-- FS
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")


-- Separators
local first = wibox.widget.textbox('<span font="Roboto 7"> </span>')
local spr_small = wibox.widget.imagebox(theme.spr_small)
local spr_very_small = wibox.widget.imagebox(theme.spr_very_small)
local spr_right = wibox.widget.imagebox(theme.spr_right)
local spr_bottom_right = wibox.widget.imagebox(theme.spr_bottom_right)
local spr_left = wibox.widget.imagebox(theme.spr_left)
local bar = wibox.widget.imagebox(theme.bar)
local bottom_bar = wibox.widget.imagebox(theme.bottom_bar)

local barcolor = gears.color({
	type  = "linear",
	from  = { dpi(32), 0 },
	to    = { dpi(32), dpi(32) },
	stops = { { 0, theme.bg_normal }, { 0.25, theme.bg_normal }, { 1, theme.bg_normal } }
})

function theme.at_screen_connect(s)
	if is_horizontal_screen(s) then
		theme.wallpaper = theme.wallpaper_horizontal
		theme.layout = awful.layout.layouts[1]
	else
		theme.wallpaper = theme.wallpaper_vertical
		theme.layout = awful.layout.layouts[3]
	end

	-- Wallpaper
	set_wallpaper(s, theme.wallpaper)

	awful.tag(get_tag_count(), s, theme.layout)
	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()

	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = wibox.container.margin(awful.widget.layoutbox(s), dpi(0), dpi(0), dpi(5), dpi(5))
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function() awful.layout.inc(1) end),
		awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
		awful.button({}, 3, function() awful.layout.inc(-1) end),
		awful.button({}, 4, function() awful.layout.inc(1) end),
		awful.button({}, 5, function() awful.layout.inc(-1) end)))

	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons, { bg_focus = theme.bg_focus })

	mytaglistcont = wibox.container.background(s.mytaglist, theme.bg_normal, gears.shape.rectangle)
	s.mytag = wibox.container.margin(mytaglistcont, dpi(5), dpi(0), dpi(5), dpi(5))

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, shape_border_width = 2, shape_border_color = theme.tasklist_bg_normal, align = "center" })

	-- Create the wibox

	-- Add widgets to the wibox


	-- preparing values to be used depending on the screen rotation
	if is_horizontal_screen(s) then
		s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(32) })
		s.mywibox:setup {
			layout = wibox.layout.align.horizontal,
			{
				-- Left widgets
				layout = wibox.layout.fixed.horizontal,
				wibox.container.margin(mylauncher, dpi(5), dpi(0), dpi(5), dpi(5)),
				s.mytag,
				s.mylayoutbox,
				theme_icons.seperator_icon,
				wibox.container.margin(wibox.widget.systray(), dpi(5), dpi(0), dpi(5), dpi(5)),
			},
			wibox.container.margin(s.mytasklist, dpi(5), dpi(5), dpi(5), dpi(5)), -- Middle widget
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
				wibox.container.margin(spotify_widget({
					font = "Ubuntu Mono 10",
					play_icon = "/usr/share/icons/Arc/actions/22/player_start.png",
					pause_icon = "/usr/share/icons/Arc/actions/22/player_pause.png",
					dim_when_paused = true,
					dim_opacity = 0.5,
					max_length = 15,
					show_tooltip = true,
				}), dpi(5), dpi(0), dpi(5), dpi(5)),
				wibox.container.margin(fs_widget(), dpi(5), dpi(0), dpi(5), dpi(5)),
				theme_icons.seperator_icon,
				wibox.container.margin(theme_icons.keyboard_icon, dpi(5), dpi(0), dpi(5), dpi(5)),
				wibox.container.margin(mykeyboardlayout, dpi(5), dpi(0), dpi(5), dpi(5)),
				theme_icons.seperator_icon,
				netdown_icon,
				networkwidget,
				netup_icon,
				theme_icons.seperator_icon,
				cpu_icon,
				cpuwidget,
				wibox.container.margin(cpu_widget(), dpi(5), dpi(0), dpi(5), dpi(5)),
				theme_icons.seperator_icon,
				calendar_icon,
				calendarwidget,
				theme_icons.seperator_icon,
				clock_icon,
				clockwidget,
			},
		}
	else
		s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = dpi(0), height = dpi(32) })
		s.borderwibox = awful.wibar({ position = "bottom", screen = s, height = dpi(1), bg = theme.fg_focus, x = dpi(0), y = dpi(33) })

		-- Add widgets to the bottom wibox
		s.mybottomwibox:setup {
			layout = wibox.layout.align.horizontal,
			{ -- Left widgets
				layout = wibox.layout.fixed.horizontal,
				s.mytag,
				s.mylayoutbox,
				theme_icons.seperator_icon,
			},

			wibox.container.margin(s.mytasklist, dpi(5), dpi(5), dpi(5), dpi(5)), -- Middle widget
			{ -- Right widgets
				layout = wibox.layout.fixed.horizontal,
			},
		}

	end
end

-- theme.titlebar_maximized_button_focus_inactive = theme_icons.maximized_icon_normal

function theme.build_custom_titlebar(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c, { size = 20 }):setup({
		{ -- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{ -- Middle
			{ -- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{ -- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
return theme
