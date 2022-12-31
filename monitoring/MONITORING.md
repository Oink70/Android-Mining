# Monitoring CCminer

## Enabling the API on CCminer.
Monitoring requires CCMINER to have the API enabled, which it is by default not the case. By default it only accepts connections from localhost (127.0.0.1)
In the `config.json` you'll find the required lines needed to enable the API:
```json
	"api-allow": "192.168.1.0/24", # allows access for this IP range. Adjust to your own situation.
	"api-bind": "0.0.0.0:4068"     # enables the API by making it listen on the specified IP address and port. 0.0.0.0 signifies all adapters and IPs.
```

If desired you can restrict the `api-allow` range to a single IP: `"api-allow": "192.168.1.25/32"`.

## talking to the CCminer API port.
In order to talk to CCminer remotely you can use `api.pl` (which is a perl script).
Usage:
```bash
./api.pl --cmd COMMAND --address ADDRESS --port PORT
```
The `--cmd`, `--address` and `--port` can be abbreviated to `-c`, `-a` and `-p`
Available commands:
```
summary
threads
pool
histo
hwinfo
meminfo
scanlog
switchpool
quit
```

`summary` and `pool` are the must usable commands for monitoring.
The `api.pl` returns values separated by `;`s and can already be used to check key data, although they are meant to be machine processed and are not very human friendly.
Keep in mind that most APIs are originally meant to be used in GPU mining operations and are of little value for CPU mining.

In order to give the key info in a more human friendly manner (but still machine processable) you can use the included `check-all` script.
On line 4 of the script you can supply a space-separated list of IP addresses to check.
The script converts the output of all checked miner IPs and converts that into a single json and prints the key data of that json on line 18.

That will give us a list of data, which is already human readable, but still not in a human friendly format. The advantage is that it is now in json format, so `jq` can be used to select fields to display.
An example for this would be:
```bash
./check-all | jq -c '.[] | [.HOST,.POOL,.KHS]'
```
Which shows us which host (IP) is connected to which pool (as defined in the `config.json` of the miner) and the hashrate it produces in kHs, one line per miner.

I personally use `watch --color -n 60 "/root/api/check-all | jq -c '.[] | [.HOST,.POOL,.KHS]' | sed '/pool.verus.io/s/.*/\x1B[32m&\x1B[0m/g; /pool.verus.io/!s/.*/\x1B[31m&\x1B[0m/g' | column"` in a screen session, to monitor the status of my miners: when on the defined pool (pool.verus.io) it colors the line green, any other status is colored red.

Of course you can select other keys to monitor. The available keys for the data gathered by `check-all` is:
```
HOST       # Host that is queried. 
POOL       # Th pool name the host is using
USER       # The username the host is using (mining address + workername)
KHS        # The local hashrate in KHS of the host
DIFF       # The difficulty of the ob the host is mining
ACC        # Number of accepted work jobs submitted to the pool
REJ        # Number of rejected work jobs submitted to the pool
WAIT       # time the miner is currently waiting for the pool to respond (usually 0 when working on a job)
UPTIME     # amount of seconds the miner is running since last start
TS         # current time in linux EPOCH format
```

### I accept no warranties or liabilities on this repo. It is supplied as a service.
### Use at your own risk!!!