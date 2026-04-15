#TODO
{ pkgs }:

let
  gitConfig = pkgs.writeText "gitconfig" ''
    [diff]
      tool = nvimdiff
    [difftool]
      prompt = false
    [merge]
      tool = nvimdiff
    [mergetool]
      prompt = false
    [core]
      editor = nvim
  '';
in
pkgs.symlinkJoin {
  name = "git-custom";
  paths = [ pkgs.git ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postBuild = ''
    wrapProgram $out/bin/git \
      --set GIT_CONFIG_GLOBAL ${gitConfig}
  '';
}
