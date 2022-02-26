{ config, lib, ... }:

{
  programs.ssh.enable = true;

  programs.ssh.forwardAgent = true;
  programs.ssh.serverAliveInterval = 60;

  programs.ssh.hashKnownHosts = true;
  programs.ssh.userKnownHostsFile = "${config.home.homeDirectory}/.ssh/known_hosts";

  programs.ssh.matchBlocks = {
    id_ed25519 = {
      host = "*";
      identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
      identitiesOnly = true;
      extraOptions = {
        UseKeychain    = "yes";
        AddKeysToAgent = "yes";
        IgnoreUnknown  = "UseKeychain";
      };
    };
  };
}
