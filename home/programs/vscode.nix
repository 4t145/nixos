{
  pkgs,
  ...
}: {
  imports = [
    (fetchTarball "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];
  programs.vscode-server.enable = true;
}