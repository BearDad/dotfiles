-- env = XCURSOR_THEME,~/.local/share/icons/volantes_cursors/
-- env = XCURSOR_SIZE,12
-- env = GDK_BACKEND,wayland
-- env = QT_QPA_PLATFORM,wayland

hl.env("HYPRCURSOR_THEME", "Bibata-Original-Classic")
hl.env("HYPRCURSOR_SIZE", "16")
hl.env("XCURSOR_THEME", "Bibata-Original-Classic") -- fallback for GTK apps
hl.env("XCURSOR_SIZE", "16")

hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
