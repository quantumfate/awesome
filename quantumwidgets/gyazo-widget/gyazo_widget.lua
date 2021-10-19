local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")

local HOME = os.getenv('HOME')
local ICON_DIR = HOME .. '/.config/awesome/quantumwidgets/gyazo-widget/'

local function gyazo_capture_widget()
    
    local gyazo = wibox.widget {
        {
            {
                image = ICON_DIR .. 'gyazo.png',
                resize = true,
                widget = wibox.widget.imagebox,
        },
        margins = 4,
        layout = wibox.container.margin
    },
    layout = wibox.layout.fixed.horizontal,
	widget = wibox.container.background,
}

    gyazo:buttons(
        awful.util.table.join(
            awful.button({}, 1, function ()
                awful.spawn.with_shell("gyazo")
            end)
        )
    )

    return gyazo

end

return gyazo_capture_widget()
