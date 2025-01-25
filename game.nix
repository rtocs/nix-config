{...} : 
{
	systemd.services.<name> = {
		path = [ some-package ];
		script = "some-binary";
		environment = {
			FOO = "BAR";
		};
	};
}
