{ secrets, pkgs, ... }:
{
  services.nginx = {
    enable = true;
    virtualHosts.${secrets.testDomain} = {
      enableACME = true;
      forceSSL = true;

      root = pkgs.runCommand "hello-world-site" { } ''
        				mkdir -p $out
        				echo "go away" > $out/index.html
        				'';

      locations = {
        "/" = {
          extraConfig = ''index index.html;'';
        };
      };

    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = secrets.mainEmail;
  };

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
}
