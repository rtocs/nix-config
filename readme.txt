build 

nixos-rebuild  switch --flake /home/nixos/nix-config#wsl
nixos-rebuild  switch --flake /home/nixos/nix-config#digitalocean

from git
nixos-rebuild  switch --flake github:rtocs/nix-config#digitalocean
nixos-rebuild  switch --flake github:rtocs/nix-config#wsl

clean 
sudo nix-collect-garbage --delete-older-than 5d
