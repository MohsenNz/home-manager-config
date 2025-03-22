# Asus battery charge threshold

```bash
cp battery-charge-threshold.service /etc/systemd/system/

sudo systemctl enable battery-charge-threshold.service
sudo systemctl start battery-charge-threshold.service

# After each change
sudo systemctl daemon-reload
sudo systemctl restart battery-charge-threshold.service
```

[Read more](https://www.linuxuprising.com/2021/02/how-to-limit-battery-charging-set.html)
