<p align="center">
  <img width="100px" src="https://raw.githubusercontent.com/NixOS/nixos-artwork/master/logo/nix-snowflake-colours.svg" />
</p>

# My NixOS Configuration
My personal NixOS configuration with different profiles for my machines.

## Requirements
Before using this repo you need to meet the following requirements:
1. Be on a `NixOS` machine.
2. Have `git` installed.
3. Have `flakes` enabled.
4. Either have your `hostname` match one of the hosts or create your own.

## How to use
1. Clone the repo in `~/.nixos-config`.

   ```sh
   git clone git@github.com:Frenagon/nixos-config.git ~/.nixos-config
   ```
   
2. Backup your original NixOS configuration just in case.

   ```sh
   sudo mv /etc/nixos /etc/nixos.bak
   ```

3. Create a symbolic link to your new NixOS config.

   ```sh
   sudo ln -s ~/.nixos-config /etc/nixos
   ```

4. Rebuild the new configuration.

   ```sh
   sudo nixos-rebuild switch
   ```

## Resourses
Useful links to different NixOS resources.
- [NixOS and Flakes](https://nixos-and-flakes.thiscute.world/nixos-with-flakes/other-useful-tips) - A useful guide to NixOS and Flakes with some useful tips.
- [NixOS Search](https://search.nixos.org/packages) - Search for NixOS packages and options.
- [Home Manager Search](https://home-manager-options.extranix.com/?query=&release=master) - Search for Home Manager options.
- [NixOS WSL](https://nix-community.github.io/NixOS-WSL/index.html) - NixOS WSL implementation and documentation.
