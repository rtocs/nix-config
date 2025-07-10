build

nixos-rebuild  switch --flake /home/nixos/nix-config#wsl-dev
nixos-rebuild  switch --flake /home/nixos/nix-config#digitalocean-server

from git
nixos-rebuild  switch --flake github:rtocs/nix-config#digitalocean-server
nixos-rebuild  switch --flake github:rtocs/nix-config#wsl-dev

clean
sudo nix-collect-garbage --delete-older-than 1d


