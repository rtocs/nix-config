{...} :
{
	security.acme.acceptTerms = true;
	security.acme.defaults.email = "";

	services.nginx = {
		enable = true;
		virtualHosts = {
			"foo.example.com" = {
				forceSSL = true;
				enableACME = true;
				serverAliases = [ "bar.example.com" ];
				locations."/" = {
					root = "/var/www";
				};
			};

			"baz.example.com" = {
				forceSSL = true;
				useACMEHost = "foo.example.com";
				locations."/" = {
					root = "/var/www";
				};
			};
		};
	};
	networking.firewall.allowedTCPPorts = [ 80, 443 ];
}

