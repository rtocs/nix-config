Build
sudo nixos-rebuild switch -I nixos-config=/home/nixos/nix-config/configuration.nix

clean 
sudo nix-collect-garbage --delete-older-than 5d

