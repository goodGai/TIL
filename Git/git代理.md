git 代理配置

> git 总是失败，想着学一下代理相关设置



- 查看全局代理

  ```shell
  git config --global --get http.proxy 
  git config --global --get https.proxy 
  ```

- 设置代理

  ```shell
  git config --global http.proxy http://ip:port //http
  git config --global https.proxy https://ip:port //https
  ```

- 取消代理

  ```shell
  git config --global --unset http.proxy 
  git config --global --unset https.proxy 
  ```

