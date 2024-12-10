{
  pkgs,
  device-id,
  ...
}: {
  boot.kernelParams = ["i915.force_probe=${device-id}"];

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };
}
