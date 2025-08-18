{
  lib,
  username,
  ...
}:
with lib; {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "1password-gui"
      "1password"
    ];

  programs._1password.enable = true;
  programs._1password-gui = mkIf (username != null) {
    enable = true;
    polkitPolicyOwners = ["${username}"];
  };

  environment.etc = mkIf (username != null) {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
      '';
      mode = "0755";
    };
  };
}
