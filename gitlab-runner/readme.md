# 注册runner说明

可查阅文档<https://docs.gitlab.com/16.9/runner/register/index.html>

* 如果不清楚如何修改config中的config.toml,可以删除config.toml文件，然后执行如下命令

## 注册runner

需要先启动gitlab-runner服务，然后执行如下命令

``` bash
docker exec -it gitlab-runner gitlab-runner register
```
