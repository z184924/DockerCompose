# openvpn部署说明

## 启动前准备

* 配置openvpn容器

```bash
docker-compose run --rm openvpn-server ovpn_genconfig -u udp://SERVER_DOMAIN_NAME
```

SERVER_DOMAIN_NAME需要替换成实际的域名或者IP，此IP或域名需外网能够访问

如果端口不为1194，可以如下命令

```bash
docker-compose run --rm openvpn-server ovpn_genconfig -u udp://SERVER_DOMAIN_NAME:PORT
```

* 初始化

```bash
docker-compose run --rm openvpn-server ovpn_initpki
```

## 启动后创建客户端文件

* 生成客户端配置文件

```bash
docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME
```

* 导出客户端配置文件

```bash
docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
```

## 删除用户

```bash
docker-compose run --rm openvpn easyrsa revoke $CLIENTNAME
```

```bash
docker-compose run --rm openvpn easyrsa gen-crl update-db
```
