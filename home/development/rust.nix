{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    pkgs.rustc
    pkgs.cargo
    pkgs.rustup
    pkgs.rust-analyzer
  ];
  programs.rustc.enable = true;
  programs.cargo.enable = true;
  programs.rustup.enable = true;
  programs.rust-analyzer.enable = true;
}