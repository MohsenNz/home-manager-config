## Step 0: Clone

Clone and go to the directory:

## #1. Install apt packages

```bash
sudo xargs apt install < ./apt-pkgs -y 
```

## #2. Install Nix

See [here](https://zero-to-nix.com/start/install)

```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

## #3. Initialize Home-manager (with flake)

```bash
bash ./init-home-manager.sh
```

```bash
nix run home-manager/master -- switch
```

After that each time you change home.nix use:

```bash
home-manager switch
```

It will install apps and put dotfiles.

Or if you want just apply dotfiles without package update, run: 

```bash
home-manager switch --option substitute false
```

More info [here](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone).

## #4. Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Comes from [here](https://www.rust-lang.org/tools/install).

To install rust-analyzer:

```bash
rustup component add rust-analyzer
```

## #5. Install Wezterm

```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
```

```bash
sudo apt update
```

```bash
sudo apt install wezterm
```

## #6. Tmux plugins

Enter Tmux then press `prefix` + `I` (capital i, as in Install) to fetch the plugin

## Hints

### Gnome extensions

- [Vital](https://extensions.gnome.org/extension/1460/vitals/)
- [Fullscreen Hot Corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/)
- [Blur My Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)

### Tor

To check the state of tor:

```bash
journalctl -u tor@default.service -f
```

### Tmux resurrect

```bash
prefix + Ctrl-s # save
prefix + Ctrl-r # restore
```

### Update Home-Manager packages

```bash
nix flake update
```

```bash
home-manager switch
```

### If Fonts not worked
Do :

```bash
mkdir .fonts/
```

And Each time you install new font do:

```bash
cp .nix-profile/share/fonts/ .fonts/ -r
```
