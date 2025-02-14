{
  config, 
  pkgs,
  username,
  environment,
  ...
} : {

  services.xserver = {
    enable = true;
    layout = "us";
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
    displayManager = {
      defaultSession = "plasma";
      # 自动登录设置
      lightdm.enable = true;
      autoLogin = {
        enable = true;
        user = username;  # 替换为你的用户名
      };
    };
  
  };

  # 安装必要的包
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
  ];
}