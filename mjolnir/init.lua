local grid = require "mjolnir.bg.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"

grid.MARGINX = 1
grid.MARGINY = 0

grid.GRIDWIDTH = 8
grid.GRIDHEIGHT = 4

hotkey.bind({"cmd","alt"}, "H", function()
    local win = window.focusedwindow()
    if grid.get(win).x == 0 then
        grid.resizewindow_thinner()
    else
        grid.pushwindow_left()
    end
end)
hotkey.bind({"cmd","alt"}, "J", function() grid.pushwindow_down()
    local win = window.focusedwindow()
    if (grid.get(win).y + grid.get(win).h) == grid.GRIDHEIGHT then
        grid.resizewindow_shorter()
    end
    grid.pushwindow_down()
end)
hotkey.bind({"cmd","alt"}, "K", function() grid.pushwindow_up()
    local win = window.focusedwindow()
    if grid.get(win).y == 0 then
        grid.resizewindow_shorter()
    else
        grid.pushwindow_up()
    end
end)
hotkey.bind({"cmd","alt"}, "L", function()
    local win = window.focusedwindow()
    if (grid.get(win).x + grid.get(win).w) == grid.GRIDWIDTH then
        grid.resizewindow_thinner()
    end
    grid.pushwindow_right()
end)

hotkey.bind({"cmd","alt"}, "U", function() grid.resizewindow_taller() end)
hotkey.bind({"cmd","alt"}, "O", function() grid.resizewindow_wider() end)
hotkey.bind({"cmd","alt"}, "I", function() grid.resizewindow_thinner() end)
hotkey.bind({"cmd","alt"}, "P", function() grid.resizewindow_shorter() end)
