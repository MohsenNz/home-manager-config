# KMonad

```bash
sudo cp 99-kmonad.rules /etc/udev/rules.d/

sudo udevadm control --reload-rules && sudo udevadm trigger
```

Enable uinput (for key remapping):

```bash
sudo modprobe uinput
echo "uinput" | sudo tee -a /etc/modules
```

Enable daemon (this service handle by home-manger nix dotfiles):

```bash
systemctl --user enable --now kmonad.service
```
