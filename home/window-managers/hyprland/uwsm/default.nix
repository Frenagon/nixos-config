{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    home.file = {
      ".config/uwsm/env" = {
        text = ''
          export XCURSOR_SIZE=32
          export NIXOS_OZONE_WL=1
          export ELECTRON_OZONE_PLATFORM_HINT=wayland
          ${
            if cfg.nvidiaPatches
            then ''
              export WLR_NO_HARDWARE_CURSORS=1
              export LIBVA_DRIVER_NAME=nvidia
              export __GLX_VENDOR_LIBRARY_NAME=nvidia
            ''
            else ""
          };
        '';
      };
    };
  };
}
