require ‘dalli’
options = { :username => ‘username’, :password => ‘password’ } #username即为控制台上基本信息上的实例详情中的实例 ID，password即为控制台上修改密码功能设置的密码。
dc = Dalli::Client.new(‘ip:port’, options) #ip即为控制台上基本信息上的实例详情中的内网地址，port即为控制台上基本信息上的实例详情中的端口号。
dc.set(‘key’, ‘value’)
value = dc.get(‘key’)