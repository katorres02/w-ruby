require './watson/conversation'

Watson::Conversation.configure(
  password: 'G4D5QmBwC4Ao',
  username: '2e092e29-887e-4d27-8f7c-d034d6e277e0',
  url:      'https://gateway.watsonplatform.net/conversation/api',
  workspace_id: 'bb3d733b-67a0-4a26-abf3-f453106e1761'
)

client = Watson::Conversation.new

# client.send_message('Hola')
# sleep 1
# client.send_message('Tengo un problema')
# sleep 1
# client.send_message('quiero regresar mi libro')
# sleep 1
# client.send_message('ok gracias')

puts 'Dile algo a watson!'
user_input = nil
until user_input == 'q' || user_input == 'exit'
  print '> '
  user_input = gets.chomp
  return if user_input == 'q' || user_input == 'exit'
  client.send_message(user_input)
  sleep 0.5
end
