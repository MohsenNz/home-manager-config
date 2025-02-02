## Step 0: Clone

Clone and go to the directory:

```bash
git clone --recurse-submodules git@github.com:MohsenNz/reproducible-ubuntu.git
```

```bash
cd reproducible-ubuntu
```

## Step 1: Install apt packages

```bash
sudo xargs apt install < ./apt-pkgs -y 
```

## Step 2: Install snap packages

```bash
sudo snap install alacritty --classic
sudo snap install telegram-desktop
```

## Step 3: Install Nix

See [here](https://zero-to-nix.com/start/install)

## Step 4: Initialize Home-manager (with flake)

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

More info [here](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone).

## Step 5: Install Rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Comes from [here](https://www.rust-lang.org/tools/install).

To install rust-analyzer:

```bash
rustup component add rust-analyzer
```

## Install Wezterm

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

## Step 6: Enable/Start user systemd services

```bash
systemctl --user enable --now xrayd.service
```

## Step 7: Append profile & bashrc extentions

```bash
bash ./extend-profile-bashrc.sh
```

Now reboot.

## Step 8: Load Dconf

```bash
dconf load / < dconf.ini
```

## Step 9: Tmux plugins

Enter Tmux then press `prefix` + `I` (capital i, as in Install) to fetch the plugin


## Step 10: Init impure links

```bash
bash ./init-impure.sh
```

## Step 11: Gnome extensions

- [Vital](https://extensions.gnome.org/extension/1460/vitals/)
- [Fullscreen Hot Corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/)
- [Blur My Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)

## Some TIPS:

### Telegram alternative way

```bash
sudo add-apt-repository ppa:atareao/telegram
```

```bash
sudo apt update && sudo apt install telegram
```

Comes from [here](https://www.omgubuntu.co.uk/2019/08/how-to-install-telegram-on-ubuntu).

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

### Wallpaper

Wallpaper directory contains some pictures to be set for background

### Update Home-Manager packages

```nix
nix flake update
```

```bash
home-manager switch
```

### Saving Dconf

```bash
dconf dump / > dconf.ini
```

Or in nushell:

```nu
dconf dump / | save --raw dconf.ini
```

## TODO
- Test on an isolated system
- Solve dconf problems (some times it cause unable to change background until you change it from settings directly)
- Create light colorscheme for tmux-powerline

## NOTE
In dotfiles the folders ended with -ip are impure that means they will have side-effect 
in the system, So as far as nix dotfiles are imputable we didn't link the folder and instead 
we linked each item inside it separately.

### If Fonts not worked
Do :

```bash
mkdir .fonts/
```

And Each time you install new font do:

```bash
cp .nix-profile/share/fonts/ .fonts/ -r
```
