{
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.vscode];
  programs.vscode.enable = true;
}