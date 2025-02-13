{
  config,
  pkgs,
  ...
}: {
  services.vscode-server.enable = true;
  programs.vscode.enable = true;
}