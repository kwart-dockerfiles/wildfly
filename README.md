# WildFly Docker images

Alpine Linux based WildFly Docker images.

WildFly is installed (just unzipped) to `/opt/wildfly` folder.

Following export line is used in the `/root/.bashrc`:

```bash
export MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
```

It means, the server can be started with a bind on public IP with:

```bash
/opt/wildfly/bin/standalone.sh -b $MY_IP -bmanagement $MY_IP
```
