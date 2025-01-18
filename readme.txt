Build
before flakes
sudo nixos-rebuild switch -I nixos-config=/home/nixos/nix-config/configuration.nix

flakes
nixos-rebuild  switch --flake /home/nixos/nix-config/configuration.nix

clean 
sudo nix-collect-garbage --delete-older-than 5d

