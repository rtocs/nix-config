build 

nixos-rebuild  switch --flake .#wsl 

clean 
sudo nix-collect-garbage --delete-older-than 5d
