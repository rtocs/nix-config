{ secrets, ... }:
{
	services.nginx = {
		enable = true;

		recommendedGzipSettings = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;

		virtualHosts."example.com" = {
			enableACME = true;
			forceSSL = true;

			locations."/" = {
				root = "/var/www/example"; 
				index = "index.html";
			};
		};
	};

	security.acme = {
		AcceptTerms = true;
		email = rotcs-secrets.main-email; 
	};

	networking.firewall.allowedTCPPorts = [ 80 443 ];
}
