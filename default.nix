{ mkDerivation, base, bindings-DSL, bindings-libbson
, bindings-mongoc, bson, bytestring, stdenv, text
}:
mkDerivation {
  pname = "hs-mongo";
  version = "0.1.0.0";
  src = ./.;
  libraryHaskellDepends = [
    base bindings-DSL bindings-libbson bindings-mongoc bson bytestring
    text
  ];
  homepage = "http://github.com/iand675/hs-mongo";
  description = "ls";
  license = stdenv.lib.licenses.mit;
}
