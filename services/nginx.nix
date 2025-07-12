{ secrets, ... }:
{
	# users.users.nginx = {
	# };

	services.nginx = {
		user = "nginx"
		enable = true;

		recommendedGzipSettings = true;
		recommendedProxySettings = true;
		recommendedTlsSettings = true;

	# virtualHosts. = {
	# 	enableACME = true;
	# 	forceSSL = true;
	#
	# 	locations."/" = {
	# 		root = "/var/www/example"; 
	# 		index = "index.html";
	# 	};
	# };
	};

	security.acme = {
		AcceptTerms = true;
		email = secrets.mainEmail:
	};

	networking.firewall.allowedTCPPorts = [ 80 443 ];
}
