{...} : 
{
  systemd.services.test-server = {
    description = "test";
    enable = true;
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "/home/nixos/test/main";
      Restart = "always";
    };

    # Optional: open the port via firewall
    wantedBy = [ "multi-user.target" ];
  };
  networking.firewall.allowedTCPPorts = [ 8090 ];
}

