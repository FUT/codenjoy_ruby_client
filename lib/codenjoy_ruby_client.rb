require 'rack'

class CodenjoyRubyClient
  def self.run(host='0.0.0.0', port=8888, &answer)
    codenjoy_server = lambda do |env|
      decoded_query = URI.decode_www_form env['QUERY_STRING']
      query = Hash.new[decoded_query]

      [200, {"Content-Type" => "text/plain"}, [answer.call(query)]]
    end
    Rack::Handler::WEBrick.run codenjoy_server, Host: host, Port: port
  end
end
