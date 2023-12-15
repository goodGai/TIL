图片格式为Base64时：

```js
function fn() {
      // 正则表达式用于匹配 Base64 图片格式
    const base64Regex = /^data:image\/[a-zA-Z+]*;base64,/;
    if(base64Regex.test(imgSrc)){
      return new Promise(async (resolve, reject) => {
        try {
          // 解码 Base64 图片数据
          const base64Data = imgSrc.replace(/^data:image\/\w+;base64,/, '');
          const buffer = Buffer.from(base64Data, 'base64');

          // 创建一个唯一的文件名
          const fileName = `man.png`;

          // 指定保存图片的目录
          const uploadDir = path.join(__dirname, 'uploads');

          // 如果目录不存在，创建它
          if (!fs.existsSync(uploadDir)) {
            fs.mkdirSync(uploadDir);
          }

          // 构建完整的文件路径
          const filePath = path.join(uploadDir, fileName);

          // 将数据写入文件
          fs.writeFileSync(filePath, buffer);
          const [method, url] = staticPath.user.face;
          // 创建一个 FormData 对象并添加文件
          const formData = new FormData();
          formData.append('file', fs.createReadStream(filePath), 'man.jpg');

          // 发起上传请求
          try {
            const result = await this.mutation({ method, url, options: { data: formData , params: { userId } }, headers: { "Content-Type": "multipart/form-data" } });
            resolve(result);
          } catch (error) {
            reject(error);
          }
        } catch (error) {
          // 处理错误
          reject(error);
        }
      })
    }
}
```

