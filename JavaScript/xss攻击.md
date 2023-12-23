渗透测试

> 渗透测试是为了暴露出目标应用程序的所存在的威胁与风险。所有的测试活动均以模拟真实攻击者的恶意攻击行为对目标进行模拟攻击，它模拟真正的黑客入侵攻击方法，以人工渗透为主，自动化工具为辅。



xss攻击

> 攻击者往 Web 页面里插入恶意 Script 代码，当用户浏览该页之时，嵌入其中 Web 里面的 Script 代码会被执行，从而达到恶意攻击用户的目的。

处理方式：

- 过滤输入的数据，包括“<” “>” “on*”等非法字符。



过滤”script“字段为例：

```js
function fn (obj = {}, multiple = false) {
  // 遍历对象，拿到key
  for (let key in obj) {
    // 如果为string，进行replace正则匹配
    if(typeof obj[key] !=== 'string') {
      // 如果是对象且multiple为true，递归
      if(obj[key] instanceof Object && multiple){
        fn(obj[key], true)
      }
    }	else obj[key] = obj[key].replace(/script/gi, '') // 正则匹配替换
  }
}
```

