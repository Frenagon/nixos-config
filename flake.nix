{
  description = "Frenagon's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = {nixos-hardware, ...} @ inputs: let
    builders = import ./utils/builders.nix inputs;
    defaultSystem = "x86_64-linux";
    username = "frenagon";
  in
    with builders; {
      nixosConfigurations = {
        Ada = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada;
          inherit username;
          home = ./home/profiles/ada.nix;
          modules = [];
        };

        AdaLaptop = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-laptop;
          inherit username;
          home = ./home/profiles/ada-laptop.nix;
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t14
          ];
        };

        AdaRes = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-res;
          inherit username;
          home = ./home/profiles/ada-res.nix;
          modules = [
            nixos-hardware.nixosModules.lenovo-thinkpad-t490
          ];
        };
      };

      homeConfigurations = {
        frenagon = mkHome {
          system = defaultSystem;
          home = ./home/profiles/common.nix;
        };
      };
    };
}
