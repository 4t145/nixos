{
  config, 
  pkgs,
  username,
  ...
} : {
    services.xserver = {
    enable = true;
    layout = "us";
    
    # 启用 XFCE
    desktopManager.xfce.enable = true;
    displayManager = {
      defaultSession = "xfce";
      # 自动登录设置
      lightdm.enable = true;
      autoLogin = {
        enable = true;
        user = username;  # 替换为你的用户名
      };
    };
    
    # 安装必要的包
    environment.systemPackages = with pkgs; [
      # 基础工具
      xorg.xhost
      xorg.xauth
      xorg.xrdb
      
      # 常用应用
      firefox
      gnome.nautilus
      gnome.gedit
      
      # WSL 集成工具
      wslu  # WSL 工具集
      
      # 主题和图标
      arc-theme
      papirus-icon-theme
    ];

  };
}