local awful = require("awful")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
require("awful.autofocus")
local modkey = require("configuration.keys.mod").mod_key
local altkey = require("configuration.keys.mod").alt_key

-- ░█░█░█▀▀░█░░░█▀█░█▀▀░█▀▄░█▀▀
-- ░█▀█░█▀▀░█░░░█▀▀░█▀▀░█▀▄░▀▀█
-- ░▀░▀░▀▀▀░▀▀▀░▀░░░▀▀▀░▀░▀░▀▀▀
--
-- Helper functions for sane(er) keyboard resizing in layout.suit.tile.* modes
local function resize_horizontal(factor)
	local layout = awful.layout.get(awful.screen.focused())
	if layout == awful.layout.suit.tile then
		awful.tag.incmwfact(-factor)
	elseif layout == awful.layout.suit.tile.left then
		awful.tag.incmwfact(factor)
	elseif layout == awful.layout.suit.tile.top then
		awful.client.incwfact(-factor)
	elseif layout == awful.layout.suit.tile.bottom then
		awful.client.incwfact(-factor)
	end
end

local function resize_vertical(factor)
	local layout = awful.layout.get(awful.screen.focused())
	if layout == awful.layout.suit.tile then
		awful.client.incwfact(-factor)
	elseif layout == awful.layout.suit.tile.left then
		awful.client.incwfact(-factor)
	elseif layout == awful.layout.suit.tile.top then
		awful.tag.incmwfact(-factor)
	elseif layout == awful.layout.suit.tile.bottom then
		awful.tag.incmwfact(factor)
	end
end

-- ░█▀▀░█░░░▀█▀░█▀▀░█▀█░▀█▀░░░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
-- ░█░░░█░░░░█░░█▀▀░█░█░░█░░░░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
-- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░▀░░░░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀
--
local client_keys = awful.util.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, {
		description = "toggle fullscreen",
		group = "client",
	}),

	awful.key({ modkey }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),

	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "go back",
		group = "client",
	}),

	awful.key({ modkey }, ";", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, {
		description = "go back",
		group = "client",
	}),

	awful.key({ modkey }, "l", function()
		awful.client.focus.byidx(1)
	end, {
		description = "focus next by index",
		group = "client",
	}),

	awful.key({ modkey }, "h", function()
		awful.client.focus.byidx(-1)
	end, {
		description = "focus previous by index",
		group = "client",
	}),

	awful.key({ modkey, "Shift" }, "l", function()
		awful.client.incwfact(0.01)
	end, {
		description = "increase client width factor",
		group = "layout",
	}),

	-- Layout-aware resizing
	awful.key({ modkey, "Shift" }, "h", function()
		resize_horizontal(0.05)
	end, {
		group = "layout",
		description = "increase master width factor",
	}),
	awful.key({ modkey, "Shift" }, "l", function()
		resize_horizontal(-0.05)
	end, {
		group = "layout",
		description = "decrease master width factor",
	}),
	awful.key({ modkey, "Shift" }, "k", function()
		resize_vertical(-0.05)
	end, {
		group = "layout",
		description = "increase master width factor",
	}),
	awful.key({ modkey, "Shift" }, "j", function()
		resize_vertical(0.05)
	end, {
		group = "layout",
		description = "decrease master width factor",
	}),

	awful.key({ modkey, "Control" }, "h", function()
		awful.client.swap.bydirection("left")
	end, {
		description = "swap with next client by index",
		group = "client",
	}),
	awful.key({ modkey, "Control" }, "l", function()
		awful.client.swap.bydirection("right")
	end, {
		description = "swap with next client by index",
		group = "client",
	}),

	awful.key({ modkey }, "n", function(c)
		c.minimized = true
	end, {
		description = "minimize client",
		group = "client",
	}),

	awful.key({ modkey }, "c", function(c)
		c.fullscreen = false
		c.maximized = false
		c.floating = not c.floating
		c:raise()
	end, {
		description = "toggle floating",
		group = "client",
	})

	-- 	awful.key({ modkey, "Shift" }, "c", function(c)
	-- 		local focused = awful.screen.focused()
	--
	-- 		awful.placement.centered(c, {
	-- 			honor_workarea = true,
	-- 		})
	-- 	end, {
	-- 		description = "align a client to the center of the focused screen",
	-- 		group = "client",
	-- 	}),
	-- awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	--
	-- awful.key({ modkey }, "Up", function(c)
	-- 	c:relative_move(0, dpi(-10), 0, 0)
	-- end, {
	-- 	description = "move floating client up by 10 px",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey }, "Down", function(c)
	-- 	c:relative_move(0, dpi(10), 0, 0)
	-- end, {
	-- 	description = "move floating client down by 10 px",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey }, "Left", function(c)
	-- 	c:relative_move(dpi(-10), 0, 0, 0)
	-- end, {
	-- 	description = "move floating client to the left by 10 px",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey }, "Right", function(c)
	-- 	c:relative_move(dpi(10), 0, 0, 0)
	-- end, {
	-- 	description = "move floating client to the right by 10 px",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Shift" }, "Up", function(c)
	-- 	c:relative_move(0, dpi(-10), 0, dpi(10))
	-- end, {
	-- 	description = "increase floating client size vertically by 10 px up",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Shift" }, "Down", function(c)
	-- 	c:relative_move(0, 0, 0, dpi(10))
	-- end, {
	-- 	description = "increase floating client size vertically by 10 px down",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Shift" }, "Left", function(c)
	-- 	c:relative_move(dpi(-10), 0, dpi(10), 0)
	-- end, {
	-- 	description = "increase floating client size horizontally by 10 px left",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Shift" }, "Right", function(c)
	-- 	c:relative_move(0, 0, dpi(10), 0)
	-- end, {
	-- 	description = "increase floating client size horizontally by 10 px right",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Control" }, "Up", function(c)
	-- 	if c.height > 10 then
	-- 		c:relative_move(0, 0, 0, dpi(-10))
	-- 	end
	-- end, {
	-- 	description = "decrease floating client size vertically by 10 px up",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Control" }, "Down", function(c)
	-- 	local c_height = c.height
	-- 	c:relative_move(0, 0, 0, dpi(-10))
	-- 	if c.height ~= c_height and c.height > 10 then
	-- 		c:relative_move(0, dpi(10), 0, 0)
	-- 	end
	-- end, {
	-- 	description = "decrease floating client size vertically by 10 px down",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Control" }, "Left", function(c)
	-- 	if c.width > 10 then
	-- 		c:relative_move(0, 0, dpi(-10), 0)
	-- 	end
	-- end, {
	-- 	description = "decrease floating client size horizontally by 10 px left",
	-- 	group = "client",
	-- }),
	-- awful.key({ modkey, "Control" }, "Right", function(c)
	-- 	local c_width = c.width
	-- 	c:relative_move(0, 0, dpi(-10), 0)
	-- 	if c.width ~= c_width and c.width > 10 then
	-- 		c:relative_move(dpi(10), 0, 0, 0)
	-- 	end
	-- end, {
	-- 	description = "decrease floating client size horizontally by 10 px right",
	-- 	group = "client",
	-- })
)

return client_keys
