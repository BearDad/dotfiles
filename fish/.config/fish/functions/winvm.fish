function winvm
    sdl-freerdp3 /v:192.168.122.45 /u:danie /p:bd23 /w:1920 /h:1080 +clipboard /cert:ignore -grab-keyboard & disown
    kill $fish_pid
end
