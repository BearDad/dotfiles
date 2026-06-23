
#!/usr/bin/env bash

# Sleep for 60 seconds (1 minute)
# sleep 30

# Initialize/launch your Flatpak apps
flatpak run com.rtosta.zapzap &
flatpak run com.discordapp.Discord --enable-features=UseOzonePlatform --ozone-platform=x11 &
