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

