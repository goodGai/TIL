配置代理有时候挺麻烦的，需要来回切换，所以写了一个 `.sh`脚本玩玩

## 新建文件

新建一个 `.sh` 文件

```shell
  git config --global http.proxy http://localhost:ip
  git config --global https.proxy https://localhost:ip
```



## 执行

使用 bash `目录名` 即可



## 优化

目前还没有解决频繁切换的问题，应该使用**传参**的形式控制 git config 的执行

- 输入`set`时：执行 global 配置命令

- 输入`unset` 时：执行取消 global 配置命令
- 输入`get` 时：执行获取 global 的配置命令



用到的语法：

- 访问变量：$1、$2……

- 流程控制：类似于 if-else-if，只是语法不同



整体效果：

```shell
#!/bin/bash

echo '------------';

HELP () {
  echo "get 获取 config"
  echo "set 配置 config"
  echo "unset 取消配置 config"
}

case $1 in
  help|-h)
      HELP
      ;;
  get)
      git config --global --get http.proxy
      git config --global --get https.proxy 
      ;;
  set)
      git config --global http.proxy http://localhost:7890
      git config --global https.proxy https://localhost:7890
      ;;
  unset)
      git config --global --unset http.proxy
      git config --global --unset https.proxy
      ;;
  *)
      echo "Error: 输入项无效 请输入 help 查看正确使用方法"
      ;;
esac
```

Over！



