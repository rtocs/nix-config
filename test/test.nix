{...} : 
{
	services.nginx = {
	 enable = false;
	 config = ''
	 worker_processes 2;
	 events {
	  worker_connections 1024;
	 }
	 http {
	 	server {
			listen 0.0.0.0:8080 ;
			server_name localhost;
			location / {
				return 200 "Hello";
			}
		}
	 }
	 '';
	};
	networking.firewall.allowedTCPPorts = [ 8080 ];
}
