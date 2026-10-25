{ config, inputs, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [
        (final: prev: {
            unstable = import inputs.nixpkgs-unstable {
                inherit (prev.stdenv.hostPlatform) system;
                inherit (config.nixpkgs) config;
            };
        })
    ];

    programs = {
        zsh.enable = true;

        hyprland.enable = true;
        hyprland.xwayland.enable = true;

        steam.enable = true;

        nix-ld = {
            enable = true;
            libraries = with pkgs; [
                stdenv.cc.cc
            ];
        };

        virt-manager.enable = true;
    };

    environment.systemPackages = with pkgs; [
        # important stuff
        mesa

        # cli utils
        fastfetch
        jq
        ripgrep
        tinyxxd
        wget

        # tui utils
        htop
        neovim
        tmux

        # gui apps
        firefox

        # sw dev
        git
        gcc
        gnumake
        lldb
        python3
    ];

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        nerd-fonts.fira-code
    ];

    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            swtpm.enable = true;
        };
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORMTHEME = "qt6ct";
    };
}
