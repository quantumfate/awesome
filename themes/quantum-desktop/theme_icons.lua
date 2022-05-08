local wibox = require("wibox")
local M = {}

local font_icon = {
    seperator_icon = '|',
    clock_icon = '',
    calendar_icon = '',
    up_icon = '',
    down_icon = '',
    cpu_icon = '',
    signal_icon = '',
    keyboard_icon = '',
    -- titlebar icons
    close_icon = '',
    ontop_icon_normal = '',
    ontop_icon_focused = '',
    pin_icon_normal = '賈',
    pin_icon_focused = '車',
    maximized_icon_normal = '',
    maximized_icon_focues = '',
    float_icon_normal = '',
    float_icon_focused = '',
}

local function prepare_icons(t)
    for key, value in pairs(t) do
        M[key] = wibox.widget {
            markup = value,
            align  = 'center',
            valign = 'center',
            font   = 'FiraCode Nerd Font',
            widget = wibox.widget.textbox
        }
    end
end

prepare_icons(font_icon)

return M
