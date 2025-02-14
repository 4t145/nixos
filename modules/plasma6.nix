{
  config, 
  pkgs,
  username,
  environment,
  ...
} : {
  services.desktopManager = {
    plasma6.enable = true;
    defaultSession = "plasma";
    sddm.enable = true;
    autoLogin = {
      enable = true;
      user = username; 
    };
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };

  # 安装必要的包
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}