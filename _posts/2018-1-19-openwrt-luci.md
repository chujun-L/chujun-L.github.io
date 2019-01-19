![openwrt登陆界面](https://raw.githubusercontent.com/chujun-L/chujun-L.github.io/master/images/openwrt.png)
#openwrt的luci学习
***
luci是基于Model-View-Controller (MVC)的web应用设计模式，luci使用UCI的配置文件作为Model，使用UCI的配置语言CBI将UCI的配置文件转换成HTML格式作为View，然后lua脚本作为Controller。
插入luci的目录结构

luci在openwrt的目录结构
![luci目录结构](https://raw.githubusercontent.com/chujun-L/chujun-L.github.io/master/images/luci-patch.jpg)

登陆页面在openwrt的目录路径及加载的过程
![web login](https://raw.githubusercontent.com/chujun-L/chujun-L.github.io/master/images/openwrt-loginweb.jpg)

luci的配置文件
![配置文件](https://raw.githubusercontent.com/chujun-L/chujun-L.github.io/master/images/luci的配置文件.jpg)

[luci API参考文档](https://htmlpreview.github.io/?https://github.com/openwrt/luci/blob/master/documentation/api/index.html)

Nixio is the "Networking and I/O library for Lua." 

luci的Model、View、Controller三部分的分析：
* Model
* View
* Controller