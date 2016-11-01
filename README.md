# Watson-client

API client for watson IPBM services

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'watson-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install watson-client

## Usage

### Conversation API
Initialize your own credentials for Conversation API
```ruby
Watson::Conversation.configure(
  password: 'YOUR_CONVERSATION_PASSWORD',
  username: 'YOUR_CONVERSATION_USERNAME',
  url:      'https://gateway.watsonplatform.net/conversation/api',
  workspace_id: 'YOUR_CONVERSATION_WORKSPACE_ID'
)
```

**Example:**
A simple response from your dialog model
```ruby
require 'watson'

client = Watson::Conversation.new
client.send_message('message one')
  >> "Watson response one"
client.send_message('message two')
  >> "Watson response two"
```

Try something different
```ruby
require 'watson'

puts 'Say Hi!'
user_input = nil
until user_input == 'q' || user_input == 'exit'
  print '> '
  user_input = gets.chomp
  return if user_input == 'q' || user_input == 'exit'
  r = client.send_message(user_input)
  puts r
  sleep 0.5
end
```

### Retrieve and Rank API
Initialize your own credentials for Conversation API
```ruby
Watson::RetrieveAndRank.configure(
  url:      'https://watson-api-explorer.mybluemix.net/retrieve-and-rank/api',
  password: 'YOUR_RETRIEVE_AND_RANK_PASSWORD',
  username: 'YOUR_RETRIEVE_AND_RANK_USERNAME',
  cluster_id: 'YOUR_RETRIEVE_AND_RANK_CLUSTER_ID',
  collection_name: 'YOUR_RETRIEVE_AND_RANK_COLLECTION_NAME'
)
```
Get the suggested answers
```ruby
responses = Watson::RetrieveAndRank.send_message('message')
```

The response is returned as a JSON array.

### Conversation Enhanced
Combination of Conversation API and Retrieve & Rank API. In order to get this class working you need to set both both configurations variables.
If the `Conversation` class detects an unknown message, we call `RetrieveAndRank` with the intent name of that unknown message, so we need to set that intent name in the constructor of `ConversationEnhanced` class.

```ruby
client = Watson::ConversationEnhanced.new('INTENT_NAME')
user_input = nil
until user_input == 'q' || user_input == 'exit'
  print '> '
  user_input = gets.chomp
  return if user_input == 'q' || user_input == 'exit'
  r = client.send_message(user_input)
  puts r
  sleep 0.5
end

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/katorres02/w-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
