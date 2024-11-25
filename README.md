# Ada's Bubblegum 💅

Nix configuration specific to my Macintosh machines. Stuff is sticky.

## Install Nix 

```
sh <(curl -L https://nixos.org/nix/install)
```

## Setup Starter Config
```
mkdir -p ~/.config/nix

# Emable nix-command and flakes to bootstrap 
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Run the flake

```
nix run nix-darwin -- switch --flake ~/home/nix#bubblegum
```

:fist_raised: :fist_oncoming: :fist_raised: :fist_oncoming:
