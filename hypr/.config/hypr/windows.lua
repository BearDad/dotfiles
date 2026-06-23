-- ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗ ██╗   ██╗██╗     ███████╗███████╗
-- ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
-- ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝██║   ██║██║     █████╗  ███████╗
-- ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
-- ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██║  ██║╚██████╔╝███████╗███████╗███████║
--  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- ── Idle inhibit ───────────────────────────────────────────────────

hl.window_rule({
	match = { class = "celluloid|mpv|vlc|[Ss]potify|LibreWolf|floorp|Brave|firefox|chromium|zen|vivaldi" },
	idle_inhibit = "fullscreen",
})

-- ── Opacity ────────────────────────────────────────────────────────
-- Syntax: "active inactive fullscreen_mode"
-- Using "override" to set absolute values (not multiplicative)

hl.window_rule({
	match = { class = "firefox|Brave-browser" },
	opacity = "0.90 override 0.90 override 1",
})
hl.window_rule({
	match = { class = "code-oss|[Cc]ode|code-url-handler|code-insiders-url-handler" },
	opacity = "0.80 override 0.80 override 1",
})
hl.window_rule({
	match = { class = "kitty" },
	opacity = "0.80 override 0.80 override 1",
})
hl.window_rule({
	match = { class = "org.kde.dolphin|org.kde.ark|nwg-look|qt5ct|qt6ct|kvantummanager" },
	opacity = "0.80 override 0.80 override 1",
})
hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor" },
	opacity = "0.80 override 0.70 override 1",
})
hl.window_rule({
	match = { class = "org.kde.polkit-kde-authentication-agent-1|polkit-gnome-authentication-agent-1" },
	opacity = "0.80 override 0.70 override 1",
})
hl.window_rule({
	match = { class = "org.freedesktop.impl.portal.desktop.gtk|org.freedesktop.impl.portal.desktop.hyprland" },
	opacity = "0.80 override 0.70 override 1",
})
hl.window_rule({
	match = { class = "[Ss]team|steamwebhelper|[Ss]potify" },
	opacity = "0.70 override 0.70 override 1",
})
hl.window_rule({
	match = { class = "[Ww]ine" },
	opacity = "0.70 override 0.70 override 2",
})
hl.window_rule({
	match = { title = "Spotify Free|Spotify Premium" },
	opacity = "0.70 override 0.70 override 1",
})

-- App-specific opacity
hl.window_rule({
	match = { class = "com.github.rafostar.Clapper" },
	opacity = "0.90 override 0.90 override",
})
hl.window_rule({
	match = { class = "com.github.tchx84.Flatseal|hu.kramo.Cartridges|com.obsproject.Studio|gnome-boxes" },
	opacity = "0.80 override 0.80 override",
})
hl.window_rule({
	match = { class = "vesktop|discord|WebCord|ArmCord" },
	opacity = "0.80 override 0.80 override",
})
hl.window_rule({
	match = { class = "app.drey.Warp|net.davidotek.pupgui2|yad|Signal" },
	opacity = "0.80 override 0.80 override",
})
hl.window_rule({
	match = { class = "io.github.alainm23.planify|io.gitlab.theevilskeleton.Upscaler|com.github.unrud.VideoDownloader" },
	opacity = "0.80 override 0.80 override",
})
hl.window_rule({
	match = { class = "io.gitlab.adhami3310.Impression|io.missioncenter.MissionCenter|io.github.flattool.Warehouse" },
	opacity = "0.80 override 0.80 override",
})

-- ── Floating ───────────────────────────────────────────────────────

hl.window_rule({
	match = { class = "org.kde.dolphin", title = "Progress Dialog — Dolphin|Copying — Dolphin" },
	float = true,
})
hl.window_rule({ match = { title = "About Mozilla Firefox" }, float = true })
hl.window_rule({ match = { class = "firefox", title = "Picture-in-Picture|Library" }, float = true })
hl.window_rule({ match = { class = "kitty", title = "top|btop|htop" }, float = true })
hl.window_rule({ match = { class = "vlc|kvantummanager|qt5ct|qt6ct|nwg-look|org.kde.ark" }, float = true })
hl.window_rule({
	match = { class = "org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor" },
	float = true,
})
hl.window_rule({
	match = { class = "org.kde.polkit-kde-authentication-agent-1|Signal|com.github.rafostar.Clapper" },
	float = true,
})
hl.window_rule({
	match = { class = "app.drey.Warp|net.davidotek.pupgui2|yad|eog|io.github.alainm23.planify" },
	float = true,
})
hl.window_rule({
	match = {
		class = "io.gitlab.theevilskeleton.Upscaler|com.github.unrud.VideoDownloader|io.gitlab.adhami3310.Impression|io.missioncenter.MissionCenter",
	},
	float = true,
})

-- Common modals
hl.window_rule({
	match = {
		title = "Open|Authentication Required|Add Folder to Workspace|Choose Files|Save As|Confirm to replace files|File Operation Progress",
	},
	float = true,
})
hl.window_rule({ match = { initial_title = "Open File" }, float = true })
hl.window_rule({ match = { class = "[Xx]dg-desktop-portal-gtk" }, float = true })
hl.window_rule({ match = { title = "File Upload.*|Choose wallpaper.*|Library.*" }, float = true })
hl.window_rule({ match = { class = ".*dialog.*" }, float = true })
hl.window_rule({ match = { title = ".*dialog.*" }, float = true })

-- ── Layer rules ────────────────────────────────────────────────────

hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "notifications" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-notification--window" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

-- ── Workspace assignments ──────────────────────────────────────────

hl.window_rule({
	name = "browser-workspace",
	match = { class = "zen|zen-browser|zen-alpha" },
	workspace = "1",
})
hl.window_rule({
	name = "coding-workspace",
	match = { class = "com.mitchellh.ghostty|ghostty|kitty" },
	workspace = "2",
	opacity = "0.80 override 0.80 override 1",
})
hl.window_rule({
	name = "social-workspace",
	match = { class = "vesktop|discord|WebCord|chrome-www.instagram.com__-Default|chrome-www.reddit.com__-Default" },
	workspace = "4",
})
hl.window_rule({
	name = "media-workspace",
	match = { class = "chrome-netflix.com__-Default|chrome-www.primevideo.com__-Default" },
	workspace = "10",
})

-- RDP client (workspace 4, fullscreen)
hl.window_rule({ match = { class = "com.freerdp.client.sdl3" }, workspace = "4", fullscreen = true })

-- AI tools → special scratchpad, floating, centered
hl.window_rule({
	match = {
		class = "chrome-gemini.google.com__app-Default|chrome-chatgpt.com__-Default|chrome-grok.com__-Default|chrome-claude.ai__-Default|chrome-www.perplexity.ai__-Default",
	},
	workspace = "special",
	float = true,
	size = { 1650, 1000 },
	center = true,
})

-- Gemini on ws5 → tiled
hl.window_rule({ match = { class = "chrome-gemini.google.com__app-Default", workspace = "5" }, float = false })
-- Books and school on ws5 → tiled
hl.window_rule({
	match = { class = "chrome-play.google.com__books-Default" },
	workspace = "5",
	float = false,
})
hl.window_rule({
	match = { class = "chrome-aulasciclos2526.castillalamancha.es__my_courses.php-Default" },
	workspace = "5",
	float = false,
})
