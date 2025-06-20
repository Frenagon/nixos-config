{
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        "$font" = "DejaVu Sans Mono";

        general = {
          hide_cursor = true;
          disable_loading_bar = true;
          no_fade_in = false;
        };

        background = {
          monitor = "";
          path = "${./background.jpg}";
          blur_passes = 0;
        };

        label = [
          {
            monitor = "";
            text = "$TIME";
            color = "$text";
            font_size = 120;
            font_family = "$font";
            position = "0, 500";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = "cmd[update:43200000] LC_TIME=en_US.utf8 date +'%A, %d %B %Y'";
            color = "$text";
            font_size = 24;
            font_family = "$font";
            position = "0, 350";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = "cmd[update:5000] battery-level";
            color = "$text";
            font_size = 24;
            font_family = "$font";
            position = "-15, 10";
            halign = "right";
            valign = "bottom";
          }
        ];

        input-field = {
          monitor = "";
          size = "400, 80";
          outline_thickness = 4;
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "$accent";
          inner_color = "$surface0";
          font_color = "$text";
          font_family = "$font";
          fade_on_empty = false;
          placeholder_text = "<span foreground='##$textAlpha'><i>󰌾 Logged in as </i><span foreground='##$accentAlpha'>$USER</span></span>";
          hide_input = false;
          check_color = "$accent";
          fail_color = "$red";
          fail_text = "<i>$FAIL</i>";
          capslock_color = "$yellow";
          position = "0, -84";
          halign = "center";
          valign = "center";
        };
      };
      extraConfig = ''

        {
          monitor=
          text=$FPRINTMESSAGE
          color=$text
          font_size=14
          font_family=$font
          position=0, -107
          halign=center
          valign=center
        }
      '';
    };
  };
}
