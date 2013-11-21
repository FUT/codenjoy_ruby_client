require 'rack'

class CodenjoyRubyClient
  # Cell status
  EMPTY = ' '
  BUSY  = '*'

  # Rotate clockwise
  ROTATE_0   = 0
  ROTATE_90  = 1
  ROTATE_180 = 2
  ROTATE_270 = 3

  def self.run(host='0.0.0.0', port=8888, &answer)
    codenjoy_server = lambda do |env|
      decoded_query = URI.decode_www_form env['QUERY_STRING']
      query = Hash[decoded_query]

      [200, {"Content-Type" => "text/plain"}, [answer.call(query)]]
    end

    Rack::Handler::WEBrick.run codenjoy_server, Host: host, Port: port
  end
end

# Short alias
CRClient = CodenjoyRubyClient
