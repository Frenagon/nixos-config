{
  lib,
  config,
  ...
}:
with lib; let
  # Get username from the first user in users.users that is a normal user
  username =
    if config.users.users != {}
    then let
      normalUsers = lib.filterAttrs (_: user: user.isNormalUser or false) config.users.users;
      firstUser = lib.head (lib.attrNames normalUsers);
    in
      if normalUsers != {}
      then firstUser
      else null
    else null;
  enableGUI = !(config.wsl.enable or false);
in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "1password-gui"
      "1password"
    ];

  programs._1password.enable = true;
  programs._1password-gui = mkIf enableGUI {
    enable = true;
    polkitPolicyOwners = ["${username}"];
  };

  environment.etc = mkIf enableGUI {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
        zen
      '';
      mode = "0755";
    };
  };
}
