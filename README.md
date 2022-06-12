# Android-Mining
Quick installation of mining on Android Phones

- install Userland app (from appstore or a downloaded apk) on your Android
- select Ubuntu in Userland and supply your login details.
- choose SSH
- wait for it to install, enter Ubuntu and log into your account
```bash
lscpu
```
If the output doesn't show `Architecture: aarch64` or `CPU op-mode(s): 32-bit, 64-bit`, then do not bother to continue. Your phone is not running a 64-bit OS.

```bash
curl -o- -k https://raw.githubusercontent.com/Oink70/Android-Mining/main/install.sh | bash
```

Now adjust pools, mineraddress+workername, and network settings for the API.
exit with `<CTRL>-X` followed by `y` and an `<ENTER>`
```bash
nano config.json
```

start mining with `~/ccminer/start.sh`

WARNING: The scripts installs my own public SSH key. You may want to remove that from your `~/.ssh/authorized_keys` file and replace it with your own for passwordless access.

Standard SSH port for Userland is port `2022`.


I accept no warranties or liabilities on this repo. It is supplied as a service.
Use at your own risk!!!

Starting the miner:
`~/ccminer/start.sh`

Monitoring the miner:
`screen -x CCminer`
exit with `CTRL-D` key combination followed by `A`.

Terminating the miner:
`screen -X -S CCminer quit`

## Github cloning and customizing
1. clone this repo to your own github account
2. change the URL on line 14 of the README.md to reflect your own account
3. change the SSH key on line 7 of `install.sh` to reflect your own SSH key
4. change lines 12+13 to reflect your own github link (especially line 13!!!)
5. adjust the `config.json` to your address and mining details.
6. optional: change the lines 20-21 of your `config.json` to your own LAN IP range.

