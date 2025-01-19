build 

local
nixos-rebuild  switch --flake .# 

from git
nixos-rebuild  switch --flake github:rtocs/nix-config#digitalocean
nixos-rebuild  switch --flake github:rtocs/nix-config#wsl

clean 
sudo nix-collect-garbage --delete-older-than 5d
