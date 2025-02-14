{
  description = "rustdesk devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    vcpkg = {
      url = "github:microsoft/vcpkg";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      rust-overlay,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs { inherit system overlays; };

        # flutter
        # flutter = pkgs.flutter.override { version = "3.24.5"; };

      in
      {
        devShells.default =
          with pkgs;
          mkShell {
            buildInputs = [
              openssl
              pkg-config
              eza
              fd
              rust-bin.stable."1.75.0".default
              flutter
              python3
              cmake
              vcpkg
            ];

            shellHook = ''

              # vcpkg initialize
              export VCPKG_ROOT="${vcpkg}"
              export VCPKG_INSTALLED_ROOT="${vcpkg}/installed"


              # flutter
              echo "Flutter version: $(flutter --version)"

              # rust
              echo "Rust version: $(rustc --version)"

              # vcpkg install
              echo "Installing vcpkg libraries..."
              vcpkg install --x-install-root="$VCPKG_INSTALLED_ROOT"
            '';
          };
      }
    );
}