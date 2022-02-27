{ config, ... }:

{
  home.file.".ssh/config".text = ''
    Host *
      IdentityAgent /Users/jonny/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
      HashKnownHosts yes
      UserKnownHostsFile /Users/jonny/.ssh/known_hosts
  '';
}
