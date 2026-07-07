{
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  environment.variables.EDITOR = "nvim";
  environment.shellAliases.dev = "nix develop $HOME/nix-config/shells#dev";
}
