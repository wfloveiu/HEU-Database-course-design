# Readme

去年做这个项目的时候使用了阿里短信服务系统来做用户注册，导致代码略为复杂，下载很多腾讯下载下来也都不会改代码，因此我重新修改了后端代码，删除了用户注册功能（感兴趣的同学可以试试使用邮箱进行短信验证，这里不推荐使用阿里短信验证功能），并且添加了该教程给各位小白同学。

**先跪求各位点一个免的star！！支持开源精神！！**

## 项目开发环境及工具

- 前端：Vue，网上教程很多，https://blog.csdn.net/Mq_sir/article/details/118368900

- 前端IDE：Vscode，自行安装

- 后端IDE：Pycharm2021，使用vscode也可以

- 数据库：mysql8.0，自行安装。

  ​                Navicate Premium (其它工具也行)

- Redis：自行安装，https://blog.csdn.net/chen15369337607/article/details/119334531

## 下载源代码及更改配置

### 下载源代码

从Github中clone或者下载压缩包都行

新建一个文件夹

```
git clone git@github.com:wfloveiu/HEU-Database-course-design.git
```

### 启动前端！

使用vscode打开**前端代码**中的**sjk文件夹**

新建终端，输入

```
npm i    
```

![image-20231120183750084](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201837171.png)

这个指令是安装Vue的项目依赖和node module



接着在终端输入以下命令，直接运行Vue项目

```
npm run serve
```

稍等一会儿，就会出现这样

![image-20231120183821420](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201838452.png)

点击任意链接都可以

![image-20231120183929187](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201839228.png)

此时，你的前端项目就算是跑起来了

###  将数据导入数据库中

打开Navicat，在**本地**中新建一个数据库，这里就假设数据库名字就是`zhangsan`

![image-20231120184647835](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201846873.png)



接着：**双击该数据库**，使之处于打开状态







### 启动Redis

启动方法见博客：https://blog.csdn.net/chen15369337607/article/details/119334531

### 启动后端！

使用Pycharm打开**后端代码**文件夹

右下角会显示**无解释器**

![image-20231120185923889](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201859925.png)

然后点击**添加解释器**，并选择该文件夹下的虚拟环境

![image-20231120185646073](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201856107.png)

之后，右下角显示有python解释器了就行。



接着，在config.py文件中做如下修改

![image-20231120190633332](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201906402.png)



接着，打开pycharm的终端，输入命令启动后端项目

```
python app.py
```

![image-20231120190824415](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201908459.png)



## 测试功能是否正常

在前端登录页面，需要输入用户的**手机号**和**密码**，其存在于数据库的user表中，需要你自己去添加数据。我这里的两个都是错误的电话号码

![image-20231120195433423](https://raw.githubusercontent.com/wfloveiu/blogImage/main/img/202311201954461.png)

`role`有2个值`1`表示管理员，`0`表示一般用户。`telephone`字段**最好是你自己的手机号**。

**注意：手机号必须是正常的手机号，不能随便输入11位数字（因为我在前端登录做了手机号码检查）**，建议用2个手机号，一个role设为1，一个设为0，方便后期演示（没有2个手机号？有室友就行！）

选择管理员账户进行登录，登录成功后就可以随意测试功能了，应该没有问题，这里不做详细说明。

## 最后但同样重要

**数据库仅仅提供参考，可以根据需要自己添加数据**



如果对前端样式有修改想法的同学，可以自己去网上搜一搜，或者问问GPT，做一下简单的修改，放置出现抄袭！如果对数据库中的一些表不理解的话，就去看一下**我的报告**，个人感觉挺详细的

