args:
builtins.map
  (name: (import (./. + "/${name}") args))
  (builtins.filter
    (file: file != "default.nix" && file != "neovim")
    (builtins.attrNames (builtins.readDir ./.)))
