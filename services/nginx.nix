{ secrets, ... } :
{

# users.users.nginx = {
# };

	systemd.services.nginx = {
		enable = true;

		recommendedGzipSettings = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;

		virtualHosts.secrests.testDomain = {
			enableACME = true;
			forceSSL = true;

			root = pkgs.runCommand "hello-world-site" {} ''
				mkdir -p $out
				echo "go away" > $out/index.html
				'';

			locations."/" = {
				extraConfig = ''
					index index.html;
				'';
			};
		};
	};

	security.acme = {
		acceptTerms = true;
		defaults.email = secrets.mainEmail:
	};

	networking.firewall.allowedTCPPorts = [ 80 443 ];
}
