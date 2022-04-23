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
local file = "/home/leonch/.config/awesome/themes/quantumfate-mobile/colors"
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
theme.dir = config_dir .. theme_dir .. "quantumfate/"
theme.wallpaper_dir = theme.dir .. "wallpaper/"
-- Wallpaper for horizontal rotation
theme.wallpaper_horizontal = theme.wallpaper_dir .. "horizontal_wallpaper.jpg"
-- Wallpaper for vertical rotation
theme.wallpaper_vertical = theme.wallpaper_dir .. "vertical_wallpaper.png"
theme.font = "Fira Code Font Mono 9"
theme.bg_normal = theme.color0
theme.bg_focus = theme.color4
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

theme.titlebar_dir = theme.dir .. "titlebar/"

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

theme.layout_dir = theme.dir .. "layouts/"

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

--[[
    Rules
]]

theme.rules = {

	{ rule = { class = "discord" }, properties = { tag = "5" } },
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

--[[
    Widgets
]]
-- Spotify
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
-- CPU
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
-- FS
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")
-- Volume
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- Battery
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")

function theme.at_screen_connect(s)
	-- preparing values to be used depending on the screen rotation
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

	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = awful.util.taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = awful.util.tasklist_buttons,
	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(30) })

	-- Add widgets to the wibox

	blue = "#9EBABA"
	seperator = wibox.widget.textbox(' <span color="' .. blue .. '">| </span>')
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			wibox.widget.systray(),
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			seperator,
			spotify_widget({
				font = "Ubuntu Mono 10",
				play_icon = "/usr/share/icons/Arc/actions/22/player_start.png",
				pause_icon = "/usr/share/icons/Arc/actions/22/player_pause.png",
				dim_when_paused = true,
				dim_opacity = 0.5,
				max_length = 15,
				show_tooltip = true,
			}),
			seperator,
			fs_widget(),
			seperator,
			cpu_widget(),
			seperator,
			volume_widget(),
			seperator,
			batteryarc_widget({
				show_current_level = true,
				arc_thickness = 2,
				size = 25,
			}),

			mykeyboardlayout,
			mytextclock,
			s.mylayoutbox,
		},
	})
end

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

	awful.titlebar(c):setup({
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
