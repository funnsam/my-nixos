{ config, pkgs, ... }:
{
    home.shell.enableZshIntegration = true;

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    programs = {
        zsh = {
            enable = true;
            oh-my-zsh = {
                enable = true;
                theme = "robbyrussell";
                plugins = [
                    "git"
                    "z"
                ];
            };
            initContent = "fastfetch";
            shellAliases = {
                zigb = "zig build -fincremental";
                zigstd = "zig std --port 3000";
            };
        };

        direnv = {
            enable = true;
            nix-direnv.enable = true;
        };
        tofi.enable = true;
        obs-studio = {
            enable = true;
            plugins = with pkgs.obs-studio-plugins; [
                wlrobs
            ];
        };
    };

    home.packages = with pkgs; [
        # compositor stuff
        bibata-cursors
        hyprpaper

        # status bar stuff
        dunst
        waybar
        playerctl

        # utils used in hotkeys
        grim
        wl-clipboard

        # useful stuff triggered by hotkeys
        ghostty
        hyprpicker
        nemo

        # ui config stuff
        fluent-gtk-theme

        # gui apps
        chromium
        discord
        inkscape
        featherpad
        feh
        gimp
        gparted

        # games
        ckan
        unstable.openttd-jgrpp
        unstable.osu-lazer-bin
        prismlauncher

        # hw dev
        freecad
        kicad

        # sw dev
        # android-studio
        # android-tools
        jetbrains.idea
    ];
}
