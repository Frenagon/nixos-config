{
  pkgs,
  username,
  ...
}: {
  hardware.openrazer.enable = true;
  environment.systemPackages = with pkgs; [
    openrazer-daemon
  ];

  users.users."${username}" = {
    extraGroups = ["openrazer"];
  };
}
