1.**安装brew**
vim 颜色和基本配置(要么用整体布局要么就简单)
bash_profile 配置 ，设置命令行下使用vi
meld 对比工具
辅助功能中增强触控板功能
brew tap homebrew/x11
brew install meld

安装virtualBox一定要装增强功能包
devices->Insert Guest Additions CD image
这样才能添加共享文件夹，全屏（勾选views的AUTO-resize）等操作

安装Sublime Text 并使用命令行运行
红色部分是你安装程序的名字，运行完后使用subl即可。
sudo ln -s /Applications/Sublime.app/Contents/SharedSupport/bin/subl /usr/bin/subl

抓包工具CocoaPacketAnalyzer

Fixing "There was a problem with the editor 'vi'" for Git on Mac OS X
git config --global core.editor /usr/bin/vim -f 

Mac上，首先需要安装brew工具，这和linux中的apt-get一样，是用来管理其他软件的
比如软件的安装，卸载等，都可以使用[brew](http://brew.sh/index_zh-cn.html)，这里有关于brew的介绍。其他的也有一些用户介绍，不过安装过程不靠谱。例如[这个](http://www.cnblogs.com/TankXiao/p/3247113.html)。

安装sloccount 代码统计工具
安装mpv-player 播放器 [address](https://github.com/mpv-player/homebrew-mpv https://mpv.io/)

2.安装maven2
     maven2可以直接使用brew安装，不过可能会安装到最新版本maven3，我们只需要使用maven2就好了，给brew装一个[插件](https://github.com/Homebrew/homebrew-versions)
	 ```
	 brew tap homebrew/versions
	 brew update
	 brew install maven2
	 ```
	 能够直接使用brew install maven2来安装了。配置maven，拷贝init-docs/setting.xml到~/.m2下即可。
	 3.安装mysql
	 在brew中直接使用`brew install mysql `命令安装mysql。
	 4.安装mangodb
	 使用`brew install mongodb`
	 5.安装rabbitmq
	 使用`brew install rabbitmq`
	 6.安装zookeeper
	 `brew install zookeeper`
	 7. 安装jdk：
	      使用dmg文件双击安装即可，一切都默认即可。然后配置java环境变量，修改 /etc/profile文件，在文件末尾添加如下三行
		  ```
		  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
		  export PATH=$JAVA_HOME/bin:$PATH
		  export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
		  ```
		  装好java，输入java -v 应该能够看到成功的输出，输出java的版本信息等。修改完profile之后要执行source /etc/profile才能生效。
		  8. 安装idea：
		       使用dmg文件安装即可。[idea注册方法](http://inhu.net/intellij-idea-14-keygen.html)。
			   9. 安装apache tomcat：
			    使用解压文件，放到合适的位置，然后配置Tomcat的环境变量，环境变量配置是修改/etc/profile文件。修改PATH这个变量即可，例如，我的PATH修改之后如下：
				
				```
				export PATH=$JAVA_HOME/bin:/Users/xiaogeng/Documents/MyApplication/Tomcat7/bin:$PATH
				```
				Tomcat放在Documents/MyApplication/ 目录下。
				10. 创建/home/admin目录
				遇到错误可以[参考](http://tinyhema.iteye.com/blog/2116671)，拷贝filter.properties到/home/admin/conf，将/etc/hosts替换为init-docs/hosts         执行 source /etc/hosts 生效。
。
11. 在mongodb执行如下命令
```
1. 启动mongodb
1) mongod --config /usr/local/etc/mongod.conf 
2) 在新的终端执行 mongo

2. Mongodb中执行
db.createUser(
   {
	        user: "weike",
			     pwd: "iha0p1ng",
				      roles:
					         [
							          { role: "root", db: "admin" }
									         ]
											    }
												)

db.auth('weike','iha0p1ng')
```
命令行下：
`mongorestore -u weike -p iha0p1ng ~/mongo-albin/`

mysql 启动 mysql.server start [参考](http://blog.csdn.net/qdujunjie/article/details/30492199)
mysql 连接 mysql -h127.0.0.1 -uroot -p
