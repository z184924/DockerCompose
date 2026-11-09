# openvpn部署说明

## 启动前准备

* 配置openvpn容器

```bash
docker compose run --rm openvpn-server ovpn_genconfig -u udp://$SERVER_DOMAIN_NAME
```

SERVER_DOMAIN_NAME需要替换成实际的域名或者IP，此IP或域名需外网能够访问

如果端口不为1194，可以如下命令

```bash
docker compose run --rm openvpn-server ovpn_genconfig -u udp://$SERVER_DOMAIN_NAME:$PORT
```

* 初始化 CA 和服务端证书

```bash
docker compose run --rm openvpn-server ovpn_initpki
```

## 启动后创建客户端文件

* 生成客户端配置文件

```bash
docker compose run --rm openvpn-server easyrsa build-client-full $CLIENTNAME
```

执行命令后，会要求输入客户端证书密码(两次)  
最后会要求输入服务器端证书密码签发

* 导出客户端配置文件

```bash
docker compose run --rm openvpn-server ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn
```

## 删除用户

```bash
docker compose run --rm openvpn-server easyrsa revoke $CLIENTNAME
```

```bash
docker compose run --rm openvpn-server easyrsa gen-crl update-db
```

## 服务端配置文件说明

* duplicate-cn  
允许多个客户端使用同一个证书

* route 192.168.254.0 255.255.255.0  
除非需要将一部分号段转发到另一个网段，通常不需要

* push "redirect-gateway def1"  
客户端将所有流量都通过openvpn服务器访问,通常不需要

* push "block-outside-dns"  
禁止客户端使用外部DNS

* push "dhcp-option DNS 8.8.8.8"  
将DNS服务器指向8.8.8.8

* push "route 10.8.0.0 255.255.255.0"  
客户端10.8.0.0/24网段通过openvpn服务器访问

## 客户端配置文件说明

* redirect-gateway def1  
客户端将所有流量都通过openvpn服务器访问,通常不需要

* route 10.8.0.0 255.255.255.0  
客户端10.8.0.0/24网段通过openvpn服务器访问
