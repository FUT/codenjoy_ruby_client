Simple codenjoy ruby client.
====================

# Usage

1. `gem install codenjoy-ruby-client`
2. Create file `client.rb`:
```
require 'codenjoy_ruby_client'

# CRClient is the alias for CodenjoyRubyClient
CRClient.run |query|
  p "We have #{query}"

  'left=0, right=0, rotate=0, drop' # Here is our response to the server
end
```
3. Run `ruby client.rb` in console

# Description

You can use next constants to make your code more readable:
```
# Cell status
CRClient::EMPTY      # ' '
CRClient::BUSY       # '*'

# Rotate clockwise
CRClient::ROTATE_0   # 0
CRClient::ROTATE_90  # 1
CRClient::ROTATE_180 # 2
CRClient::ROTATE_270 # 3
```
