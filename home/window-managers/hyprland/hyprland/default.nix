{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.hyprland;
in {
  config = mkIf cfg.enable {
    programs = {
      zsh = {
        profileExtra = ''
          if uwsm check may-start && uwsm select; then
            exec uwsm start default
          fi
        '';
      };
    };

    home.packages = with pkgs; [
      uwsm
      hyprpicker
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        "$terminal" = "kitty";

        exec-once = [
          "uwsm app -- vivaldi"
          "[workspace 2 silent] uwsm app -- kitty"
          "[workspace 3 silent] uwsm app -- obsidian"
          "uwsm app -- waybar"
          "uwsm app -- clipse -listen"
          "systemctl --user enable --now hypridle.service"
        ];

        monitor = cfg.monitors;

        xwayland = {
          force_zero_scaling = true;
        };

        env =
          [
            "XCURSOR_SIZE,32"
            "NIXOS_OZONE_WL,1"
            "ELECTRON_OZONE_PLATFORM_HINT,wayland"
            "WLR_NO_HARDWARE_CURSORS,1"
          ]
          ++ optionals cfg.nvidiaPatches [
            "LIBVA_DRIVER_NAME,nvidia"
            "__GLX_VENDOR_LIBRARY_NAME,nvidia"
          ];

        general = {
          gaps_in = 2;
          gaps_out = 0;
          border_size = 2;
          "col.active_border" = "$accent";
          "col.inactive_border" = "$overlay0";
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 2;
          rounding_power = 4.0;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba($crustAlpha99)";
          };
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };

        animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];
          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, fade"
            "workspacesOut, 1, 1.94, almostLinear, fade"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master.new_status = "master";

        misc = {
          disable_hyprland_logo = true;
          background_color = "$base";
        };

        input = {
          kb_layout = "us,us";
          kb_variant = ",intl";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad.natural_scroll = false;
        };

        gestures.workspace_swipe = false;

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, SPACE, exec, uwsm app -- $terminal"
          "$mainMod, Q, killactive,"
          "$mainMod, F, fullscreen,"
          "$mainMod SHIFT, F, togglefloating,"
          "$mainMod SHIFT, J, togglesplit, # dwindle"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod CTRL SHIFT, Q, exit,"
          "$mainMod SHIFT, P, exec, uwsm app -- rofi_powermenu 2 7"
          "$mainMod, C, exec, uwsm app -- hyprpicker -ad"
          "$mainMod, V, exec, uwsm app -- kitty --class clipse -e 'clipse'"
          "$mainMod SHIFT, L, exec, pgrep hyprlock || hyprlock"
          "SHIFT, SPACE, exec, rofi_launcher 4 5"
          "$mainMod, PERIOD, exec, bemoji -n"
          "CTRL, SPACE, exec, change_kb_layout next"
          "CTRL SHIFT, SPACE, exec, change_kb_layout prev"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"

          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 3, exec, run_if_closed 'class: obsidian' obsidian"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 6, exec, run_if_closed 'class: Godot' godot"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"

          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"
          "$mainMod SHIFT, 0, movetoworkspace, 10"

          "$mainMod CTRL, left, movewindow, l"
          "$mainMod CTRL, right, movewindow, r"
          "$mainMod CTRL, up, movewindow, u"
          "$mainMod CTRL, down, movewindow, d"
          "$mainMod CTRL, H, movewindow, l"
          "$mainMod CTRL, L, movewindow, r"
          "$mainMod CTRL, K, movewindow, u"
          "$mainMod CTRL, J, movewindow, d"

          "$mainMod, A, togglespecialworkspace, magic"
          "$mainMod SHIFT, A, movetoworkspace, special:magic"

          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

          "$mainMod, S, exec, grimblast --notify copy area"
          "$mainMod ALT, S, exec, grimblast --notify save area"
          "$mainMod CTRL, S, exec, grimblast --notify copy active"
          "$mainMod CTRL ALT, S, exec, grimblast --notify save active"
          "$mainMod SHIFT, S, exec, grimblast --notify copy output"
          "$mainMod SHIFT ALT, S, exec, grimblast --notify save output"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        binde = [
          "$mainMod ALT, left, resizeactive, -20 0"
          "$mainMod ALT, right, resizeactive, 20 0"
          "$mainMod ALT, up, resizeactive, 0 -20"
          "$mainMod ALT, down, resizeactive, 0 20"
          "$mainMod ALT, H, resizeactive, -20 0"
          "$mainMod ALT, L, resizeactive, 20 0"
          "$mainMod ALT, K, resizeactive, 0 -20"
          "$mainMod ALT, J, resizeactive, 0 20"
        ];

        bindel = [
          ",XF86AudioRaiseVolume, exec, volume_control up"
          ",XF86AudioLowerVolume, exec, volume_control down"
          ",XF86AudioMute, exec, volume_control mute"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightness_control up"
          ",XF86MonBrightnessDown, exec, brightness_control down"
        ];

        bindl = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          "tile, class:(Godot)"
          "float, class:(Godot), title:negative:(Godot)"
          "float, class:(clipse)"
          "size 622 652, class:(clipse)"
          "stayfocused, class:(clipse)"
          "workspace 3, class:(obsidian)"
          "workspace 6, class:(Godot)"
        ];
      };
    };
  };
}
