{
  pkgs,
  ...
}: {
  home.packages = [pkgs.helix];

  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
    };
    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };
}