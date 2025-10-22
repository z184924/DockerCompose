# gitlab部署常见问题

## 1.重置管理员密码

### 1.1. 进入gitlab容器

```bash
docker exec -it gitlab bash
```

### 1.2. 进入gitlab-rails控制台

```bash
gitlab-rails console
```

### 1.3. 修改管理员密码

```bash
u = User.where(id: 1).first
u.password = '12345678'
u.password_confirmation = '12345678'
u.save!
exit
```
