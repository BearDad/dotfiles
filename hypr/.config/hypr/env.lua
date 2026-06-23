-- env = XCURSOR_THEME,~/.local/share/icons/volantes_cursors/
-- env = XCURSOR_SIZE,12
-- env = GDK_BACKEND,wayland
-- env = QT_QPA_PLATFORM,wayland

hl.env("HYPRCURSOR_THEME", "volantes_cursors")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("XCURSOR_THEME", "volantes_cursors") -- fallback for GTK apps
hl.env("XCURSOR_SIZE", "16")

hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
