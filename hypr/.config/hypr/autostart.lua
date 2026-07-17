hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm finalize")
	hl.exec_cmd("fcitx5 -d")
	hl.exec_cmd("gsr-ui launch-daemon")
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")

	hl.exec_cmd("hyprctl dispatch workspace 1")
	hl.exec_cmd("sleep 0.3 && hyprctl dispatch focusmonitor eDP-1 && hyprctl dispatch workspace 10")

	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	hl.exec_cmd("hyprpolkitagent")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("udiskie --no-automount --smart-tray")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("wl-paste --primary --watch wl-copy")
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("awww")

	hl.exec_cmd(
		" rclone mount gdrive: ~/gdrive --vfs-cache-mode writes --allow-other --dir-cache-time 10s --attr-timeout 1s & disown "
	)

	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprctl setcursor volantes_cursor 16")
end)
