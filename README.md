# Lua Logger

`nginx` `lua` 写文件库，解决 `lua` `io.open` 在 `nginx` 多 `worker` 模式下并发写文件问题。直接利用 `ffi` 模块调用底层系统函数实现原子性写操作。

## 使用方式

在 `nginx` 中加载该库文件：

```nginx
lua_package_path "/your-path/logger/?.lua;;";
```

具体使用方法：

```nginx
# 引入该模块
local logger = require "logger"

# 调用写方法
logger.send("hello the logger \n", "/tmp/test.log")
```
