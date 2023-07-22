{ stdenv, lib, fetchurl, unzip, ... }:
stdenv.mkDerivation rec {
  name = "rime-cloverpinyin";
  version = "1.1.4";
  src = fetchurl {
    url = "https://github.com/fkxxyz/rime-cloverpinyin/releases/download/${version}/clover.schema-${version}.zip";
    sha256 = "sha256-Mn1qb5pndyRAGZzklh3a4KukAHgoUSLTJ1hP8Rb9R4s=";
  };
  nativeBuildInputs = [ unzip ];
  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    runHook preInstall
    echo $out
    ls -al .
    rm -rf opencc
    mkdir -p $out/share/rime-data/build/
    install -Dm644 *.yaml -t $out/share/rime-data/
    runHook postInstall
  '';
  meta = with lib; {
    description = "Clover Simplified pinyin input for rime";
    homepage = "https://github.com/fkxxyz/rime-cloverpinyin";
    license = licenses.lgpl3Only;
  };
}
