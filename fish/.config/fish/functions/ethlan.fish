function ethlan --description 'Ethernet solo LAN (sin gateway/DNS) on/off'
    set -l conf /etc/systemd/network/20-ethernet.network.d/50-lan-only.conf

    switch "$argv[1]"
        case on
            printf '%s\n' '[DHCPv4]' 'UseGateway=no' 'UseRoutes=no' 'UseDNS=no' '' '[IPv6AcceptRA]' 'UseGateway=no' 'UseDNS=no' | sudo tee $conf >/dev/null
            or return 1
        case off
            sudo rm -f $conf
            or return 1
        case '' status
            if test -f $conf
                echo "ethlan: on (ethernet solo LAN, internet por WiFi)"
            else
                echo "ethlan: off (ethernet normal, puede dar internet)"
            end
            return 0
        case '*'
            echo "usage: ethlan [on|off|status]"
            return 1
    end

    sudo networkctl reload
    and sudo networkctl reconfigure enp2s0 2>/dev/null
    ethlan status
end
