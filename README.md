# NixOS configuration
This is my [NixOS](https://nixos.org/) configuration, it's used to setup my NixOS systems.

## How to install
1. Clone the repo inside `~/.config/nixos`.
```
git clone https://github.com/Frenagon/nixos-config.git ~/.config/nixos
```

2. Backup the original configuration.
```
sudo mv /etc/nixos /etc/nixos.bak
```

3. Create a symbolic link to the repo configuration.
```
sudo ln -s ~/.config/nixos /etc/nixos
```

4. Deploy the configuration.
```
sudo nixos-rebuild switch
```
