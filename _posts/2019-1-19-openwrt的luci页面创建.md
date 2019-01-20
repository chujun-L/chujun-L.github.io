学习luci页面创建之前，先来看一下现成的页面是怎么创建的。我们这里用samba的页面来做分析。我们在luci的界面点击service -> samba这个菜单，然后观察一下samba的URL。我们在luci的源码里搜索一下这串关键字({"admin", "services", "samba"})，可以定位到这串关键字出现在这个文件中(luci/controller/samba.lua)。   
```lua
module("luci.controller.samba", package.seeall)

function index()
        if not nixio.fs.access("/etc/config/samba") then
                return
        end

        local page

        page = entry({"admin", "services", "samba"}, cbi("samba"), _("Network Shares"))
        page.dependent = true
end
```
所以页面的lua的结构是这个样子的：
```lua
module()
function index()
    entry()
end
```
module是lua语言的一个函数[lua参考手册](http://www.lua.org/manual/5.1/manual.html#pdf-module)

entry是luci.dispatcher.lua里的一个函数，它的功能是创建一个web的调度节点[entry函数定义](https://htmlpreview.github.io/?https://raw.githubusercontent.com/openwrt/luci/master/documentation/api/modules/luci.dispatcher.html#entry)

entry (path, target, title, order)中的target是当用户请求这个节点的动作，例如call、template、cbi、post。上面代码中的cbi("samba")，指向的是luci/model/cbi/samba.lua这个文件，它用来描述/etc/config/samba这个配置文件。

call的用法：调用本地的一个函数
```lua
entry({"admin", "network", "switch_status"}, call("switch_status"), nil)

function switch_status(switches)
        local s = require "luci.tools.status"

        luci.http.prepare_content("application/json")
        luci.http.write_json(s.switch_status(switches))
end
```

template的用法：调用的是luci/view目录里面对应的html文件
```lua
entry({"admin", "status", "overview"}, template("admin_status/index"), _("Overview"), 1)
```

cbi的用法：调用luci/model/cbi目录里面对应的lua文件
```lua
entry({"admin", "services", "samba"}, cbi("samba"), _("Network Shares"))
```

post的用法：html的POST方法
```lua
entry({"admin", "network", "wireless_join"}, post("wifi_join"), nil)

function wifi_join()
        local tpl  = require "luci.template"
        local http = require "luci.http"
        local dev  = http.formvalue("device")
        local ssid = http.formvalue("join")

        if dev and ssid then
                local cancel = (http.formvalue("cancel") or http.formvalue("cbi.cancel"))
                if not cancel then
                        local cbi = require "luci.cbi"
                        local map = luci.cbi.load("admin_network/wifi_add")[1]

                        if map:parse() ~= cbi.FORM_DONE then
                                tpl.render("header")
                                map:render()
                                tpl.render("footer")
                        end

                        return
                end
        end

        tpl.render("admin_network/wifi_join")
end
```

luci/model/cbi/samba.lua部分代码：
```lua
m = Map("samba", translate("Network Shares"))

return m
```


从目录的路径我们可以知道，luci/controller/samba.lua这个文件其实可以理解为MVC的Controller，luci/model/cbi/samba.lua是MVC的Model，MVC的View在samba这个页面上并没有对应的html文件，其实是已经通过translate()函数来实现了。