{
  pkgs,
  ...
}: {
  programs.vscode-server.enable = true;
  extensions = with pkgs.vscode-extensions; [
    ms-vscode.remote-server
  ];
}