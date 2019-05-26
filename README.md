This repository contains config files for my home server/WiFi AP.

### Target machine

```
OS                  FreeBSD 12 amd64
Ethernet device     re0
WiFi device         ath0 (QCNFA222)
Hostname            gemini
```

You must be able to log in to the machine as `ansible_user` with ssh and the
user needs to be a password-less sudoer.

### Provision

Create `host_vars/gemini.yml` and run the playbook:

```console
ansible-playbook provision.yml
```

### Possible extensions

- Add Bluetooth PAN server - [btpand(8)][btpand]

[btpand]: https://www.freebsd.org/cgi/man.cgi?query=btpand&sektion=8
