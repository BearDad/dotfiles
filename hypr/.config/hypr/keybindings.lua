-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║╚════██║
-- ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
-- see https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

local scrPath = os.getenv("HOME") .. "/.config/hypr/scripts"

local TERMINAL = "kitty"
local EDITOR = "nvim"
local EXPLORER = "nautilus"
local BROWSER = "zen-browser"

-- ── Window Management ──────────────────────────────────────────────

hl.bind(mainMod .. " + C", hl.dsp.window.close(), { description = "close focused window" })
hl.bind(mainMod .. " + ALT + F4", hl.dsp.window.close(), { description = "close focused window" })
hl.bind(mainMod .. " + DELETE", hl.dsp.exit(), { description = "kill hyprland session" })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "toggle floating" })
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen(), { description = "toggle fullscreen" })
hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.exec_cmd("hyprlock"), { description = "lock screen" })
hl.bind(mainMod .. " + SHIFT + CTRL + F", hl.dsp.window.pin(), { description = "toggle pin on focused window" })
hl.bind("CTRL + ALT + DELETE", hl.dsp.exec_cmd("wleave"), { description = "logout menu" })

-- Toggle waybar
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("killall waybar || waybar"), { description = "toggle waybar" })

-- ── Focus ──────────────────────────────────────────────────────────

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }), { description = "focus left" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "focus right" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }), { description = "focus up" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }), { description = "focus down" })
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { description = "cycle focus" })

-- ── Resize ─────────────────────────────────────────────────────────

hl.bind(mainMod .. " + SHIFT + right", function()
	hl.dispatch(hl.dsp.window.resize({ delta = { 30, 0 } }))
end, { repeating = true, description = "resize window right" })
hl.bind(mainMod .. " + SHIFT + left", function()
	hl.dispatch(hl.dsp.window.resize({ delta = { -30, 0 } }))
end, { repeating = true, description = "resize window left" })
hl.bind(mainMod .. " + SHIFT + up", function()
	hl.dispatch(hl.dsp.window.resize({ delta = { 0, -30 } }))
end, { repeating = true, description = "resize window up" })
hl.bind(mainMod .. " + SHIFT + down", function()
	hl.dispatch(hl.dsp.window.resize({ delta = { 0, 30 } }))
end, { repeating = true, description = "resize window down" })

-- ── Move active window ─────────────────────────────────────────────
-- Float-aware: moves pixel-by-pixel if floating, else swaps tiled position

local function moveActiveCmd(dx, dy, direction)
	return string.format(
		[[grep -q 'true' <<< $(hyprctl activewindow -j | jq -r .floating) && ]]
			.. [[hyprctl dispatch 'hl.dsp.window.move({ x = %d, y = %d, relative = true })' || ]]
			.. [[hyprctl dispatch 'hl.dsp.window.move({ direction = "%s" })']],
		dx,
		dy,
		direction
	)
end

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd(moveActiveCmd(-30, 0, "l")), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(moveActiveCmd(30, 0, "r")), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd(moveActiveCmd(0, -30, "u")), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.exec_cmd(moveActiveCmd(0, 30, "d")), { repeating = true })

-- ── Mouse move/resize ──────────────────────────────────────────────

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "hold to move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "hold to resize window" })

-- ── Launchers ──────────────────────────────────────────────────────

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(TERMINAL), { description = "terminal emulator" })
hl.bind(
	mainMod .. " + ALT + Return",
	hl.dsp.exec_cmd("[float; move 20% 5%; size 60% 60%] " .. TERMINAL),
	{ description = "dropdown terminal" }
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(EXPLORER), { description = "file explorer" })
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(BROWSER), { description = "web browser" })
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("kitty -e htop"), { description = "system monitor" })

-- Rofi / launcher
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("vicinae toggle"), { description = "application finder" })

-- ── Audio ──────────────────────────────────────────────────────────

hl.bind(
	"F10",
	hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"),
	{ locked = true, description = "toggle mute output" }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o m"),
	{ locked = true, description = "toggle mute output" }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -i m"),
	{ locked = true, description = "un/mute microphone" }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o d"),
	{ locked = true, repeating = true, description = "decrease volume" }
)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(scrPath .. "/volumecontrol.sh -o i"),
	{ locked = true, repeating = true, description = "increase volume" }
)

-- ── Media ──────────────────────────────────────────────────────────

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ── Brightness ──────────────────────────────────────────────────────────

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set -5%"))
-- ── Utilities ──────────────────────────────────────────────────────

hl.bind(
	mainMod .. " + SHIFT + CTRL + K",
	hl.dsp.exec_cmd("hyprctl switchxkblayout all next"),
	{ description = "toggle keyboard layout" }
)

-- Screen capture
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -an"), { description = "color picker" })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grimblast -n copysave area"), { description = "snip screen" })
hl.bind(
	mainMod .. " + CTRL + P",
	hl.dsp.exec_cmd("grimblast -n --freeze copysave area"),
	{ description = "freeze and snip" }
)
hl.bind(
	mainMod .. " + ALT + P",
	hl.dsp.exec_cmd("grimblast -n copysave output"),
	{ locked = true, description = "print monitor" }
)
hl.bind("Print", hl.dsp.exec_cmd("grimblast -n copysave screen"), { locked = true, description = "print all monitors" })

-- ── Workspaces ─────────────────────────────────────────────────────

-- Navigate / move to numbered workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 → key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "navigate to workspace " .. i })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "move window to workspace " .. i }
	)
	hl.bind(
		mainMod .. " + ALT + " .. key,
		hl.dsp.window.move({ workspace = i, silent = true }),
		{ description = "move window to workspace " .. i .. " (silent)" }
	)
end

-- Relative workspace navigation
hl.bind(mainMod .. " + CTRL + L", hl.dsp.focus({ workspace = "e+1" }), { description = "next workspace" })
hl.bind(mainMod .. " + CTRL + H", hl.dsp.focus({ workspace = "e-1" }), { description = "prev workspace" })
hl.bind(mainMod .. " + CTRL + J", hl.dsp.focus({ workspace = "empty" }), { description = "nearest empty workspace" })

-- Relative window-to-workspace
hl.bind(
	mainMod .. " + CTRL + ALT + L",
	hl.dsp.window.move({ workspace = "r+1" }),
	{ description = "move window to next relative workspace" }
)
hl.bind(
	mainMod .. " + CTRL + ALT + H",
	hl.dsp.window.move({ workspace = "r-1" }),
	{ description = "move window to prev relative workspace" }
)

-- Mouse scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- ── Special workspaces (scratchpad) ────────────────────────────────

hl.bind(
	mainMod .. " + SHIFT + S",
	hl.dsp.window.move({ workspace = "special" }),
	{ description = "move to scratchpad" }
)
hl.bind(
	mainMod .. " + ALT + S",
	hl.dsp.window.move({ workspace = "special", silent = true }),
	{ description = "move to scratchpad (silent)" }
)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special(), { description = "toggle scratchpad" })

-- Notes scratchpad (code:94 = § / ` depending on your layout)
hl.bind("code:94", hl.dsp.workspace.toggle_special("notas"))
hl.bind(
	mainMod .. " + SHIFT + code:94",
	hl.dsp.window.move({ workspace = "special:notas" }),
	{ description = "move to notes" }
)
hl.bind(mainMod .. " + ALT + code:94", hl.dsp.window.move({ workspace = "special:notas", silent = true }))

-- ── Alt+G: AI/Books shortcut ───────────────────────────────────────

hl.bind("ALT + G", function()
	hl.dispatch(
		hl.dsp.exec_cmd(
			'chromium --app="https://gemini.google.com/app" --user-data-dir="'
				.. os.getenv("HOME")
				.. '/.config/gemini-profile"'
		)
	)
	hl.dispatch(
		hl.dsp.exec_cmd(
			'chromium --app="https://play.google.com/books" --user-data-dir="'
				.. os.getenv("HOME")
				.. '/.config/books-profile"'
		)
	)
	hl.dispatch(hl.dsp.focus({ workspace = 8 }))
end)

-- ── SwayNC ─────────────────────────────────────────────────────────

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "toggle notification center" })

-- ── Lid Switch ─────────────────────────────────────────────────────────
hl.bind(
	"switch:on:Lid Switch",
	hl.dsp.exec_cmd("pidof hyprlock || hyprlock & hyprctl dispatch dpms off"),
	{ locked = true }
)
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), { locked = true })
