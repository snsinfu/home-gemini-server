This repository contains config files for my home server.

### Target machine

```
OS                  FreEBSD 12 amd64
Ethernet device     re0
WiFi device         ath0 (QCNFA222)
Hostname            gemini
IP address          192.168.1.58/24
Gateway & DNS       192.168.1.1
```

You must be able to log in to the machine as root using the key `~/.ssh/id_rsa`.

### Provision

Prepare three files:

- `.env` file containing `AP_SSID=your-ssid` variable definition
- `config/authorized_keys` file containing ssh pubkeys
- `config/hostapd.wpa_psk` file containing WPA keys

Then type `make` to provision the system. Reboot is necessary.
