# ubnt-clash

Clash config for Ubnt EdgeRouters

## Install 

Download deb package from https://github.com/sskaje/ubnt-clash/releases

```
dpkg -i  ubnt-clash_x.y.z_all.deb
```


## Configuration

### Create Interface

```
configure
set interfaces clash utun config-url https://........
commit
save

```

ubnt-clash downloads `Dreamacro/clash` by default, you can use MetaCubeX/Clash.Meta by setting: 

```
set interface clash utun executable meta
```
and then `commit` `save`.

### PBR 

Router local IP 192.168.2.1, LAN interface eth1


```
# route table
set protocols static table 10 interface-route 0.0.0.0/0 next-hop-interface utun

# pbr rules
set firewall group address-group SRC_CLASH address 192.168.2.10-192.168.2.250
set firewall modify MCLASH rule 101 action modify
set firewall modify MCLASH rule 101 modify table 10
set firewall modify MCLASH rule 101 source group address-group SRC_CLASH

# apply pbr rules to eth1
set interfaces ethernet eth1 firewall in modify MCLASH

# Fake IP destination only if you need
set firewall group network-group DST_CLASH_FAKEIP network 198.18.0.0/16
set firewall modify MCLASH rule 101 destination group network-group DST_CLASH_FAKEIP

```

### DNS Hijack
Router local IP 192.168.2.1, LAN interface eth1


```
set service nat rule 4050 destination group address-group ADDRv4_eth1
set service nat rule 4050 destination port 53
set service nat rule 4050 inbound-interface eth1
set service nat rule 4050 inside-address address 192.168.2.1
set service nat rule 4050 inside-address port 7874
set service nat rule 4050 protocol udp
set service nat rule 4050 source group address-group SRC_CLASH
set service nat rule 4050 type destination

```

## Config Files

Files are stored under **/config/clash**

* templates: template config files
* utun: config files for utun

YAML files under *templates* will be copied to *utun* unless there is a same file under *utun*.

YAML files with '.yaml' extension under *utun* will be merge into */run/clash/utun/config.yaml* as clash main config file.

YAML files with '.yaml.overwrite' extension under *utun* will be used to overwrite settings in */run/clash/utun/config.yaml*.

GeoIP database file willl be downloaded to */config/clash* and symlink to */run/clash/utun/*.

Dashboard files will be downloaded to */config/clash/dashboard*



## Commands 

### Install 

Install Clash Premium Binary, YQ, GeoIP Database.

Proxy provided by p.rst.im

```
clashctl.sh install

# proxied download
USE_PROXY=1 clashctl.sh install
```

### Update  

#### Update Clash Binary

```
clashctl.sh install

# proxied download
USE_PROXY=1 clashctl.sh install
```

#### Update GeoIP Database


```
clashctl.sh download_db

# proxied download
USE_PROXY=1 clashctl.sh download_db
```

### Show Clash Binary Version 
```
clashctl.sh show_version
```

### Start/Stop/Restart Client 

```
clashctl.sh start
clashctl.sh stop
clashctl.sh restart
```

### Update Config And Restart
```
clashctl.sh rehash
```


### More

```
clashctl.sh help
```


## Cron Update Config


### Via system/task-scheduler

```
set system task-scheduler task update-clash-config crontab-spec "20 */4 * * *"
set system task-scheduler task update-clash-config executable path "/config/scripts/clash-cron"

```

## Test 

### Clash utun

```
curl https://rst.im/ip --interface utun -v
```





