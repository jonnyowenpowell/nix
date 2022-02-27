{ config, ... }:

{
  home.file.".ssh/config".text = ''
    Host *
      IdentitiesOnly yes
	      IdentityAgent /Users/jonny/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
      AddKeysToAgent yes
      ForwardAgent yes
      Compression no
      ServerAliveInterval 60
      ServerAliveCountMax 3
      HashKnownHosts yes
      UserKnownHostsFile /Users/jonny/.ssh/known_hosts
      ControlMaster no
      ControlPath ~/.ssh/master-%r@%n:%p
      ControlPersist no
  '';
}
