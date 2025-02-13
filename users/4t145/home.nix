{pkgs, ...}: {
  ##################################################################################################################
  #
  # All Ryan's Home Manager Configuration
  #
  ##################################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs
  ];

  programs.git = {
    userName = "4t145";
    userEmail = "u4t145@163.com";
  };


}