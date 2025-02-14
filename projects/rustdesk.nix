{
  description = "rustdesk devShell";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };

        # flutter
        flutter = pkgs.flutter.override {
          version = "3.24.5";
        };

        # build vcpkg
        vcpkgCommit = "6f29f12e82a8293156836ad81cc9bf5af41fe836";
        vcpkgDir = "./.vcpkg-${vcpkgCommit}";
        vcpkg = pkgs.runCommand "vcpkg" {
          nativeBuildInputs = [ pkgs.git pkgs.cmake pkgs.python3 ];
        } ''
          git clone https://github.com/microsoft/vcpkg $out
          cd $out
          git checkout ${vcpkgCommit}
          ./bootstrap-vcpkg.sh -disableMetrics
        '';


      in
      {
        devShells.default = with pkgs; mkShell {
          buildInputs = [
            openssl
            pkg-config
            eza
            fd
            rust-bin.stable."1.75".default
            flutter
            python3
          ];

          shellHook = ''
            # cmake
            echo "CMake toolchain: $CMAKE_TOOLCHAIN_FILE"

            # vcpkg initialize
            export VCPKG_ROOT="${vcpkg}"
            export VCPKG_INSTALLED_ROOT="${vcpkg}/installed"
            export PATH="$VCPKG_ROOT:$PATH"
            echo "current vcpkg version: $(git -C $VCPKG_ROOT rev-parse HEAD)"

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