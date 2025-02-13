{ config, pkgs, ... }:

{
  # my name is 4t145
  home.username = "4t145";
  home.homeDirectory = "/home/4t145";

  home.packages = with pkgs;[
    neofetch

    # archives
    zip
    xz
    unzip

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor
  ];

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "4t145";
    userEmail = "u4t145@163.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}