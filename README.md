# saio-swauth
This image is useful for development using openstack swift.

## Quick Install
```bash
docker run -d -i --hostname saio-swauth --name saio-swauth -p 28018:8018 -p 28081:8081 kiravspace/saio-swauth
```

## Ensure it works
```bash
curl -v -H "X-Auth-Admin-User: .super_admin" -H "X-Auth-Admin-Key: swauthkey" http://127.0.0.1:28081/auth/v2
```
