build 

flakes
nixos-rebuild  switch --flake /home/nixos/nix-config/configuration.nix

clean 
sudo nix-collect-garbage --delete-older-than 5d

