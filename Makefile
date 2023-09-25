############################################################################
#
#  Nix commands related to the local machine
#
############################################################################

deploy:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace

debug:
	nixos-rebuild switch --flake . --use-remote-sudo --show-trace --verbose

check:
	nix flake check --show-trace

update:
	nix flake update --show-trace

history:
	nix profile history --profile /nix/var/nix/profiles/system

gc:
	# remove all generations older than 7 days
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

	# garbage collect all unused nix store entries
	sudo nix store gc --debug
