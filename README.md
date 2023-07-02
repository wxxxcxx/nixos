# NixOS

## 

```
# 查看历史构建的版本
nix profile history --profile /nix/var/nix/profiles/system
# 清理 7 天之前的所有历史版本
sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
# 清理历史版本并不会删除数据，还需要手动 gc 下
sudo nix store gc --debug

# 显示已经安装的 package
nix-env -qa

# 创建 FHS 环境
(pkgs.buildFHSUserEnv ( pkgs.appimageTools.defaultFhsEnvArgs // {
    name = "fhs";
    targetPkgs = pkgs: (
        (pkgs.appimageTools.defaultFhsEnvArgs.targetPkgs pkgs) ++ (with pkgs;[
        pkg-config
        ncurses
        node2nix
        nodejs
        pnpm
        yarn
        ])
    );
    profile = "export FHS=1";
    runScript = "bash";
    extraOutputsToInstall = [ "dev" ];
}))
```

# Faqs

Q: 如何像 `pacman -F` 一样查看文件属于哪个包？
A: 使用 `nix-index` 包。