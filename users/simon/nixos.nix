{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.simon = {
    isNormalUser = true;
    home = "/home/simon";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$6$iIziDQVxaXkx3EVX$ClVu.m4wd92gc3S2C0drusrCyBHIqt.X4Pb.l0cMq/zCw.mGbRD2fiYrbFdcu41jUXzqy67JkapyUI8okH2S9/";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGFnWjTRbwfZzjvEM8IZA+sULRKJGG2PsGzoFA0v2/d5 simon@Simons-Air.lan"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
