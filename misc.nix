{ pkgs, ... }:
{
    time.timeZone = "Asia/Hong_Kong";
    services.earlyoom.enable = true;

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
    };
    nix.optimise = {
        automatic = true;
    };

    system.stateVersion = "26.05";
}
