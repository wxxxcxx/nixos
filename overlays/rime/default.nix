{ config, lib, ... }:

(self: super: {
  ibus-engines.rime = super.ibus-engines.rime.override { rimeDataPkgs = [ super.rime-data (super.callPackage ../../packages/rime-cloverpinyin { }) ]; };
})
