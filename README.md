# NixOS

## 

```
nix profile history --profile /nix/var/nix/profiles/system

# 清理 7 天之前的所有历史版本
sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d
# 清理历史版本并不会删除数据，还需要手动 gc 下
sudo nix store gc --debug
```