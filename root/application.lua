local current_path = ngx.var.uri

ngx.say('<h1>' .. current_path .. '</h1>')

local resty_consul = require('resty.consul')
local consul = resty_consul:new({
        host = '52.45.226.19',
        port = 80
    })

local res, err = consul:get(current_path)
if not res then
  ngx.log(ngx.ERR, err)
else
  if type(res[1].Value) == 'table' then
    ngx.say(res[1].Value.msg)
  else
    ngx.log(ngx.ERR, "Failed to decode value :(")
  end  
end
