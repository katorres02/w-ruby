# w-ruby
API client for watson IPBM services

# w-ruby
API client for watson IPBM services

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
require 'watson-client'

client = Watson::Conversation.new
client.send_message('message one')
  >> "Watson response one"
client.send_message('message two')
  >> "Watson response two"
```

Try something different
```ruby
require 'watson-client'

puts 'Say Hi!'
user_input = nil
until user_input == 'q' || user_input == 'exit'
  print '> '
  user_input = gets.chomp
  return if user_input == 'q' || user_input == 'exit'
  client.send_message(user_input)
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
