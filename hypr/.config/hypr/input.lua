hl.config({

	input = {
		kb_layout = "us",
		kb_variant = "intl",
		follow_mouse = 1,
		-- # kb_options = korean:ralt_hangul,
		-- # kb_options = caps:swapescape,
		-- # sensitivity = 0,
		force_no_accel = false,
		-- # accel_profile = flat ,
		-- # numlock_by_default = true,
		-- # 🔗 See https://wiki.hyprland.org/Configuring/Variables/#touchpad
		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			clickfinger_behavior = true,
		},
		tablet = {
			left_handed = true,
			output = "HDMI-A-1",
			-- # transform = 2  # 180° invert (upside-down/full mirror)
			-- # Other options:
			-- # transform = 0  # Normal (default)
			-- # transform = 1  # 90° clockwise
			-- # transform = 3  # 90° counter-clockwise
			-- # transform = 4  # Flipped (horizontal mirror for left-handed)
			-- # transform = 6  # Left-handed mode
			-- # transform = 7  # Right-handed mode (if needed)
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
hl.gesture({
	fingers = 3,
	direction = "up",
	action = function()
		hl.dispatch(hl.dsp.workspace.toggle_special("special"))
	end,
})

hl.gesture({
	fingers = 3,
	direction = "down",
	action = function()
		hl.dispatch(hl.dsp.workspace.toggle_special("notas"))
	end,
})

local function send(mods, key)
	return function()
		hl.dispatch(hl.dsp.send_shortcut({ mods = mods, key = key }))
	end
end

hl.gesture({ fingers = 4, direction = "left", action = send("CTRL", "Page_Down") })
hl.gesture({ fingers = 4, direction = "right", action = send("CTRL", "Page_Up") })
-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- hl.device({
-- 	name = "epic-mouse-v1",
-- 	sensitivity = -0.5,
-- })
