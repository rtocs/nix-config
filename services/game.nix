{...} : 
{
	systemd.services.game = {
		# TODO
		description = "game-server";
		serviceConfig = {
		};

		wantedBy = [ "default.target" ];
		path = [ some-package ];
		script = "";
		environment = {
		};
	};
}
