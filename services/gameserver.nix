{pkgs, secrets, ...} :
{
	users.users.gameserver = {
		isSystemUser = true;
		description = "game server user";
		group = "gameserver";
		home = "/home/gameserver";
		openssh.authorizedKeys.keys  = [
			secrets.wslKeyMain
			secrets.wslKeyLaptop
			secrets.winKeyLaptop
		];
	};

	users.groups.gameserver = {
		name = "gameserver";
	};

	systemd.services.gameserver = {
		description = "game server";
		enable = true;
		wantedBy = [ "multi-user.target" ];
		after = [ "network.target" ];


		serviceConfig = {
			ExecStart = "/home/nixos/main";
			WorkingDirectory = "/home/nixos/"; 
			Restart = "always";
			User = "nixos";
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

