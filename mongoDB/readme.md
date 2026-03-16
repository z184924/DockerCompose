# mongodb部署说明

## 1. 初始化replset

进入容器并执行`mongo`进入mongo shell

以下IP地址为容器内IP地址，请根据实际情况修改

```shell
config = { _id:"replset0", members:[{_id:0,host:"172.18.0.2:27017"},{_id:1,host:"172.18.0.3:27017"},{_id:2,host:"172.18.0.4:27017"}]}
rs.initiate(config)
```

## 2. 查看状态

```shell
rs.status()
```

## 3. 设置允许副本读取

```shell
db.getMongo().setSlaveOk()
```

## 4. 创建管理员用户

```shell
db.createUser({user:'root',pwd:'root',roles:[{role:'root',db:'admin'}]})
```

## 5. 创建普通用户

```shell
db.createUser({user:'test',pwd:'test',roles:[{role:'readWrite',db:'test'}]})
```

## 6. 退出mongo shell

```shell
exit
```

## 7. 退出容器并禁用匿名登录

修改docker-compose.yml文件，在启动命令command中添加`--auth`参数
