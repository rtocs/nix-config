{
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  environment.variables.EDITOR = "nvim";
}
