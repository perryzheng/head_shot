require 'httparty'
require 'pp'

class Rep
  include HTTParty
end

pp Rep.get('http://whoismyrepresentative.com/whoismyrep.php?zip=98105')
pp Rep.get('http://whoismyrepresentative.com/whoismyrep.php', :query => {:zip => 46544})