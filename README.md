# Android-Mining
Quick installation of mining on Android Phones

- install userland on your Android
- select Ubuntu in Userland and supply your login details.
- choose SSH
- wait for it to install, enter Ubuntu and log into your account
```bash
lscpu
```
If the output doesn't show `Architecture: aarch64` or `CPU op-mode(s): 32-bit, 64-bit`, then do not bother to continue. Your phone is not running a 64-bit OS.

```bash
curl -o- https://raw.githubusercontent.com/Oink70/Android-Mining/main/install.sh | bash
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
