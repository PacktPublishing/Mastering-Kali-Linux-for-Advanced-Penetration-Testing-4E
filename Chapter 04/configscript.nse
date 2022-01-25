local http=require ‘http’
description = [[ This is my custom discovery on the network ]]
categories = {“safe”,”discovery”}
require(“http”)
function portrule(host, port)
  return port.number == 80
end
function action(host, port)
  local response
  response = http.get(host, port, “/config.php”)
  if response.status and response.status ~= 404
then
    return “successful”
  end
end
