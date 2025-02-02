{...} : 
{
	systemd.services.game = {
		enable = false;
		description = "game-server";
		serviceConfig = {

			Type = "forking";
			ExecStart = "/var/test/test";
			Restart = "on-failure";	
		};

		wantedBy = [ "multi-user.target" ];
		after = [ "network-up.target" ];
	};
}
