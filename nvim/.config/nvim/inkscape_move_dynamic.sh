#!/usr/bin/env bash
# Launch Inkscape and move its new window to the special workspace (Hyprland).

FILE="$1"
CLASS="org.inkscape.Inkscape"
TIMEOUT=30 # seconds; a cold start can be slow
WORKSPACE="${INKSCAPE_WORKSPACE:-special:special}"

inkscape_windows() {
    hyprctl clients -j | jq -r --arg c "$CLASS" '.[] | select(.class == $c) | .address'
}

# Windows that already exist, so we only move the one we open
before=$(inkscape_windows)

if [ -n "$FILE" ]; then
    inkscape "$FILE" >/dev/null 2>&1 &
else
    inkscape >/dev/null 2>&1 &
fi

# Poll until the new window maps, then move it by address
# (a dispatch without a window moves whatever window has focus).
# Hyprland >= 0.55 (Lua config): hyprctl dispatch takes a Lua expression.
for ((i = 0; i < TIMEOUT * 4; i++)); do
    sleep 0.25
    for addr in $(inkscape_windows); do
        grep -qxF "$addr" <<<"$before" && continue
        out=$(hyprctl dispatch "hl.dsp.window.move({ workspace = \"$WORKSPACE\", window = \"address:$addr\" })")
        if [ "$out" != "ok" ]; then
            echo "inkscape_move_dynamic: $out" >&2
            exit 1
        fi
        exit 0
    done
done

echo "inkscape_move_dynamic: no new Inkscape window after ${TIMEOUT}s" >&2
exit 1
