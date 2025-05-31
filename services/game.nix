{...} : 
{
	systemd.services.game = {
		enable = false;
		description = "game-server";

		serviceConfig = {
			Type = "forking";
			ExecStart = "/var/test/test";
		};

		wantedBy = [ "multi-user.target" ];
		after = [ "network-up.target" ];
	};
}
# {
#   systemd.services.my-web-server = {
#     description = "My Simple Web Server";
#     wantedBy = [ "multi-user.target" ];
#     after = [ "network.target" ];
#
#     serviceConfig = {
#       ExecStart = "/run/current-system/sw/bin/python3 -m http.server 8080";
#       Restart = "always";
#       User = "nobody"; # or a dedicated user
#       WorkingDirectory = "/var/www"; # or another directory with content
#     };
#
#     # Optional: open the port via firewall
#     wantedBy = [ "multi-user.target" ];
#   };
#
#   networking.firewall.allowedTCPPorts = [ 8080 ];
# }
