{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit inputs;
            };
            modules = [
                ./hardware-configuration.nix

                ./boot.nix
                ./drivers.nix
                ./misc.nix

                ./programs.nix
                ./users.nix

                home-manager.nixosModules.home-manager {
                    home-manager = {
                        extraSpecialArgs = {
                            inherit inputs;
                        };

                        useGlobalPkgs = true;
                        useUserPackages = true;

                        users = {
                            funnsam = import ./funnsam/home.nix;
                        };
                    };
                }
            ];
        };
    };
}
