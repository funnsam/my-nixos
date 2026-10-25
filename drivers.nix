{ pkgs, ... }:
{
    # bluetooth
    hardware.bluetooth.enable = true;
    boot.kernelModules = [ "btusb" ];

    # video
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
            intel-media-driver
        ];
    };

    # sound
    services.pipewire = {
        enable = true;
        pulse.enable = true;
    };

    # network
    networking = {
        networkmanager.enable = true;
        networkmanager.dns = "none";

        hostName = "nixos";
        nameservers = [ "1.1.1.1" "1.0.0.1" ];

        firewall.allowedTCPPorts = [ 3535 3600 ];
    };
    services.resolved.enable = false;
}
