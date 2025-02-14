{
  config, 
  pkgs,
  username,
  environment,
  ...
} : {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    displayManager = {
      defaultSession = "plasma";
      sddm.enable = true;
      autoLogin = {
        enable = true;
        user = username; 
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };

  # 安装必要的包
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}