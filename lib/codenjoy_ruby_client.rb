require 'rack'
require 'pry'

class CodenjoyRubyClient
  def self.run(answer)
    codenjoy_server = lambda { |env| [200, {"Content-Type" => "text/plain"}, [answer.call env]] }
    Rack::Handler::WEBrick.run codenjoy_server, Port: 8888, Host: '0.0.0.0'
  end
end
