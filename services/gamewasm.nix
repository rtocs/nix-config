{ secrets, pkgs, ... }:
{
  # should be at some random guid.
  # services.nginx = {
  # 	virtualHosts.${secrets.testDomain} = {
  # 		locations = {
  # 			"/gameserver/" = {
  # 				proxyPass = "http://127.0.0.1:8090/";
  # 				proxyWebsockets = true;
  # 			};
  # 		};
  # 	};
  # };
}
