{...} :
{
	systemd.services.test-server = {
		description = "test";
		enable = true;
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];

		serviceConfig = {
			ExecStart = "/home/nixos/test/main";
			WorkingDirectory = "/home/nixos/test/"; 
			Restart = "always";
			User = "nixos";
		};
	}
	networking.firewall.allowedTCPPorts = [ 8090 ];
}

