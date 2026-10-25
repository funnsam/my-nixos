{ pkgs, ... }:
{
    users.users = {
        funnsam = {
            isNormalUser = true;
            extraGroups = [ "dialout" "libvirtd" "wheel" ];
            packages = with pkgs; [];
            shell = pkgs.zsh;
        };
    };
}
