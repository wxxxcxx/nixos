args:
builtins.map
  (name: (import (./. + "/${name}") args))
  (builtins.filter
    (file: file != "default.nix" )
    (builtins.attrNames (builtins.readDir ./.)))
