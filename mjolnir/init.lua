local grid = require "mjolnir.bg.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"

grid.MARGINX = 1
grid.MARGINY = 0

grid.GRIDWIDTH = 8
grid.GRIDHEIGHT = 2

hotkey.bind({"cmd","alt"}, "H", function()
    -- Make window thinner if at the most left
    local win = window.focusedwindow()
    if grid.get(win).x == 0 then
        grid.resizewindow_thinner()
    else
        grid.pushwindow_left()
    end
end)
hotkey.bind({"cmd","alt"}, "J", function()
    -- Mak window shorter if at the bottom
    local win = window.focusedwindow()
    if (grid.get(win).y + grid.get(win).h) == grid.GRIDHEIGHT then
        grid.resizewindow_shorter()
    end
    -- Make sure it stays at the bottom
    grid.pushwindow_down()
end)
hotkey.bind({"cmd","alt"}, "K", function()
    -- Make window shorter if at top
    print("---")
    print("***")
    print("---")

    local win = window.focusedwindow()
    if grid.get(win).y == 0 then
        grid.resizewindow_shorter()
    else
        grid.pushwindow_up()
    end
end)
hotkey.bind({"cmd","alt"}, "L", function()
    -- Make window thinner if at the most right
    local win = window.focusedwindow()
    if (grid.get(win).x + grid.get(win).w) == grid.GRIDWIDTH then
        grid.resizewindow_thinner()
    end
    -- Make sure it stays most right
    grid.pushwindow_right()
end)
hotkey.bind({"cmd","alt"}, "U", function() 
    -- Expand up if at the bottom
    local win = window.focusedwindow()
    if (grid.get(win).y + grid.get(win).h) == grid.GRIDHEIGHT then
        grid.pushwindow_up()
    end
    grid.resizewindow_taller() 
end)
hotkey.bind({"cmd","alt"}, "O", function()
    -- Expand to the left if at the most right
    local win = window.focusedwindow()
    if (grid.get(win).x + grid.get(win).w) == grid.GRIDWIDTH then
        grid.pushwindow_left()
    end
    grid.resizewindow_wider()
end)
hotkey.bind({"cmd","alt"}, "I", function()
    -- Shorten from the left if at most right
    local win = window.focusedwindow()
    if (grid.get(win).x + grid.get(win).w) == grid.GRIDWIDTH then
        grid.resizewindow_thinner()
        grid.pushwindow_right()
    else
        grid.resizewindow_thinner()
    end
end)
hotkey.bind({"cmd","alt"}, "P", function()
    -- Shorten from the top if at the bottom
    local win = window.focusedwindow()
    if (grid.get(win).y + grid.get(win).h) == grid.GRIDHEIGHT then
        grid.resizewindow_shorter()
        grid.pushwindow_down()
    else
        grid.resizewindow_shorter()
    end
end)
