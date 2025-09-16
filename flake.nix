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
    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixos-hardware,
    catppuccin,
    nixos-wsl,
    zen-browser,
    ...
  } @ inputs: let
    builders = import ./utils/builders.nix inputs;
    defaultSystem = "x86_64-linux";
    username = "frenagon";
    commonHomeModules = [
      catppuccin.homeModules.catppuccin
      zen-browser.homeModules.beta
    ];
  in
    with builders; {
      nixosConfigurations = {
        Ada = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada;
          inherit username;
          modules = [catppuccin.nixosModules.catppuccin];
          homeModules =
            [
              ./home/profiles/ada.nix
            ]
            ++ commonHomeModules;
        };

        AdaLaptop = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-laptop;
          inherit username;
          modules = [
            catppuccin.nixosModules.catppuccin
            nixos-hardware.nixosModules.lenovo-thinkpad-t14
          ];
          homeModules =
            [
              ./home/profiles/ada-laptop.nix
            ]
            ++ commonHomeModules;
        };

        AdaWSL = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-wsl;
          inherit username;
          modules = [
            catppuccin.nixosModules.catppuccin
            nixos-wsl.nixosModules.default
          ];
          homeModules =
            [
              ./home/profiles/ada-wsl.nix
            ]
            ++ commonHomeModules;
        };

        AdaWSLWork = mkSystem {
          system = defaultSystem;
          config = ./hosts/ada-wsl-work;
          inherit username;
          modules = [
            catppuccin.nixosModules.catppuccin
            nixos-wsl.nixosModules.default
          ];
          homeModules =
            [
              ./home/profiles/ada-wsl-work.nix
            ]
            ++ commonHomeModules;
        };
      };
    };
}
