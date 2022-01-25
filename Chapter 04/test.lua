#!/usr/bin/lua
local file = io.open(“/etc/shadow”, “r”)
contents = file:read()
file:close()
print (contents)
