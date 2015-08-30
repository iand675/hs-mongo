with (import <nixpkgs> {}).pkgs;
let modifiedHaskellPackages = haskellPackages.override {
      overrides = self: super: {
        bindings-libbson = self.callPackage ../bindings-libbson {};
        bindings-mongoc = self.callPackage ../bindings-mongoc {};
        hs-mongo = self.callPackage ./. {};
      };
    };
in modifiedHaskellPackages.hs-mongo.env

