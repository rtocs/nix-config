{...} : 
{
	systemd.services.game = {
		enable = true;
		description = "game-server";
		
		serviceConfig = {
			Type = "forking";
			ExecStart = "usr/bin/game-server/main";
			ExecStop = "pkill main";
			Restart = "on-failure";	
		};

		wantedBy = [ "multi-user.target" ];
		after = [ "network-up.target" ];
		script = "";

		environment = {
		};
	};
}
