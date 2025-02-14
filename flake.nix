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
    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #    stylix = {
    #      url = "github:danth/stylix";
    #      inputs = {
    #        nixpkgs.follows = "nixpkgs";
    #        home-manager.follows = "home-manager";
    #      };
    #    };
  };

  outputs = {
    nixos-hardware,
    auto-cpufreq,
    catppuccin,
    ...
  } @ inputs: let
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
          modules = [catppuccin.nixosModules.catppuccin];
          homeModules = [
            ./home/profiles/ada.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };

        AdaLaptop = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-laptop;
          inherit username;
          modules = [
            catppuccin.nixosModules.catppuccin
            auto-cpufreq.nixosModules.default
            nixos-hardware.nixosModules.lenovo-thinkpad-t14
          ];
          homeModules = [
            ./home/profiles/ada-laptop.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };

        AdaRes = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-res;
          inherit username;
          modules = [
            catppuccin.nixosModules.catppuccin
            auto-cpufreq.nixosModules.default
            nixos-hardware.nixosModules.lenovo-thinkpad-t490
          ];
          homeModules = [
            ./home/profiles/ada-res.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };
      };

      homeConfigurations = {
        frenagon = mkHome {
          system = defaultSystem;
          modules = [
            ./home/profiles/common.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };
      };
    };
}
