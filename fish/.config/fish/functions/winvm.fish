function winvm --description 'Start win11pro and open RDP session'
    set -l vm win11pro
    set -l ip 192.168.122.45
    set -l uri qemu:///system

    if not virsh -c $uri domstate $vm | string match -q running
        virsh -c $uri start $vm; or return 1
    end

    echo -n "Waiting for RDP"
    for i in (seq 60)
        if timeout 1 bash -c "cat < /dev/null > /dev/tcp/$ip/3389" 2>/dev/null
            echo
            break
        end
        echo -n .
        sleep 2
    end

    set -l pass (secret-tool lookup service winvm user danie)
    if test -z "$pass"
        echo "No password in keyring. Store it with:"
        echo "  secret-tool store --label='winvm' service winvm user danie"
        return 1
    end

    sdl-freerdp3 /v:$ip /u:danie /p:$pass /w:1920 /h:1080 +clipboard /cert:ignore -grab-keyboard &
    disown
    if set -q KITTY_WINDOW_ID
        kitty @ close-tab --self
    else
        exit
    end
end
