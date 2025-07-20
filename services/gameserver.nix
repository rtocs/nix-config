{pkgs, secrets, ...} :
{
	users.users.gameserver = {
		isSystemUser = true;
		description = "game server user";
		group = "gameserver"
		home = "/home/gameserver";
	};

	users.group.gameserver = {};

	systemd.services.gameserver = {
		description = "game server";
		enable = true;
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];

		serviceConfig = {
			ExecStart = "/home/gameserver/test/main";
			WorkingDirectory = "/home/server/test/"; 
			Restart = "always";
			User = "gameserver";
		};
	};

	services.nginx = {
		virtualHosts.${secrets.testDomain} = {
			locations = {
				"/gameserver/" = {
					proxyPass = "http://127.0.0.1:8090/";
					proxyWebsockets = true;
				};
			};
		};
	};
}

