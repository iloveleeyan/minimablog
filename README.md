### 一个界面简约高效，专注于写作与阅读的博客程序

简笔记程序（免费版 0.9.0）使用说明

简笔记官网：https://minimablog.cn

简笔记比起流行的博客程序，如 WordPress ，Typecho 等，有 4 个很明显的优势：

1. 由于是前后端分离的架构，页面访问速度极快，体验很好
2. 后台写日志是全 markdown 语言写的，没有 html 混排，文章代码很简洁干净
3. 日志图片自动压缩大小，不会一篇日志出现 20 个每张 5MB 的照片的转圈圈了
4. 天然没有垃圾评论，没有被黑，没有被主站挂掉导致访问缓慢等的问题

本程序是前后端分离的项目，后端服务是一个，运行环境是 java 17
前端项目有两个，前台 web 和后台 admin，分别是博客页面和管理后台

![简笔记前台界面](%E5%9B%BE%E7%89%87.png)

# 信息准备前提
1. 先定好你的 前台 web 域名，后台 admin 域名，后端 api 域名，记下来
2. 例如：前台 web 域名 = abc.com
3. 例如：后台 admin 域名 = user.abc.com
4. 例如：后端 api 域名 = api.abc.com
5. 例如：上传文件的域名 = upload.abc.com
6. 将会在下面的步骤上要用到
7. 准备好这些域名的 ssl 证书文件，如 1.pem 和 1.key


## 懒人做法
你可以把“程序文件”的目录用编辑工具打开，批量替换如下文本。注意默认所有域名都是 https 协议

api.abc.com 替换成你的 api 的域名

www.abc.com 替换成你的博客的前台域名

user.abc.com 替换成你的博客的管理后台域名

upload.abc.com 替换成你的博客的上传文件的域名


/data/abc.com/static 替换成你的服务器静态资源的目录，例如是放上传的图片的

/data/abc.com/api 替换成你的后端 java 程序 jar 包存放的目录

/data/abc.com/admin 替换成你的管理后台的前端文件所在目录（即admin目录下的文件）

/data/abc.com/web 替换成你的前台的前端文件所在目录（即web目录下的文件）


mysqlip 替换成你的 mysql 数据库ip

mysqldatabase 替换成你的 mysql 数据库名

mysqlusername 替换成你的 mysql 数据库用户名

mysqlpassword 替换成你的 mysql 密码

3306 替换成你的 mysql 端口（默认不需要修改）


redisip 替换成你的 redis ip

redisassword 替换成你的 redis 密码

6379 替换成你的 redis 端口（默认不需要修改）


smtp.mxhichina.com 修改成你的邮件服务器的 stmp 地址

smtppassword 修改成你的邮件服务器的 密码

admin@abc.cn 修改成你的邮件服务的发件人地址


/app/ssl/abc.com/1.pem 替换成你的 ssl 证书的 pem 文件路径

/app/ssl/abc.com/1.key 替换成你的 ssl 证书的 key 文件路径

http://127.0.0.1:9082/ 替换成你的 api 的内网地址（如后端服务的端口没改，可以忽略）


简笔记免费版 替换成你的 博客名称

xxxxxxxxxxxxxxxxxxxxxxxxxxxx 替换成你的百度 ip转城市的 access key（用不到就置空即可）

你也可以使用 纯真IP 库，搜索下 cz88 即可找到配置的地方

注意：启动 java 程序的 start.sh 脚本记得给权限，执行 chmod +x *.sh 即可




你也可以自己一步步按照下面的步骤改

## 部署后端 api 服务
1. 在服务器上安装 jdk17（java 17）
2. 在服务器上安装 mysql，redis
3. 把 minimablog.cn-api.jar 上传到服务器的目录A，例如：/data/abc.com/api
4. 创建静态资源目录 static，如放在 /data/abc.com/static，并填写在下面一步骤的值里
5. 修改 application-free.yml 里的信息，修改为你的服务器服务配置，并上传到同目录A
6. 修改 start.sh 里的 cd /data/abc.com/api 这一行的为目录A，其他的无需改
7. 打开 sql 文件，到第 536 行（INSERT INTO `user` ... 那一行），修改 'https://www.abc.com'（数字 999 前的那段） 为你的前台 url（注意不要在结尾加 / 符号），然后 sql 脚本到mysql 数据库
8. 启动 java，执行 start.sh，注意启动前要先给执行文件权限，执行 chmod +x *.sh 即可
9. 注意留意打印信息，如出现报错则进一步排查。如果没出错，会出现 “程序已启动完毕，端口：9082”这样的打印


## 部署前台 web 到服务器
1. 修改 web 目录下的 config.js，把 api 地址改为你的 api 域名地址
2. 上传 web 目录下的所有文件到服务器


## 部署后台 admin 到服务器
1. 修改 admin 目录下的 config.js，把 api 地址改为你的 api 域名地址
2. 上传 admin 目录下的所有文件到服务器


## 部署 nginx
1. 修改 nginx 目录下的参数
2. 设置 nginx ssl 证书配置
3. 安装 nginx，启动 nginx


## 尝试访问
1. 浏览器打开你的前台 web 的 url，如果能顺利出页面则成功
2. 如果出现 nginx 502，或者 nginx 默认页，说明你的 nginx 没配置成功
3. 如果页面框架能显示出来，但是没渲染数据，一般是用于 config.js 没改对的原因，留意上面修改 config.js 一节
4. 如果浏览器出现页面不断刷新转跳，一般是由于数据库表没改成功，留意上面一节：“7. 打开 sql 文件，到第 536 行（INSERT INTO `user` ... 那一行）”。手动改了数据库后，必须重启程序，修改才能生效
5. 如果登入管理后台，登入后马上报错退出到登录页，一般是因为 application-free.yml 的管理后台域名没配对，注意域名后不能带斜杠

## 注意事项
1. 不要自己手动改数据表里的数据，数据是统一关联的。如果强行改了，程序出错了，作者是不会帮你排查问题的

## 部署结束
如果还有疑问，加我的 QQ：536671402

或者简笔记官网找日志排查：https://minimablog.cn# minimablog
