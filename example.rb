require_relative 'lib/watson'

Watson::Conversation.configure(
  password: 'G4D5QmBwC4Ao',
  username: '2e092e29-887e-4d27-8f7c-d034d6e277e0',
  url:      'https://gateway.watsonplatform.net/conversation/api',
  workspace_id: 'bb3d733b-67a0-4a26-abf3-f453106e1761'
)

Watson::RetrieveAndRank.configure(
  url:      'https://watson-api-explorer.mybluemix.net/retrieve-and-rank/api',
  password: 'EQb5f0dioQi7',
  username: '43cb0ee0-ec36-4204-a359-07ef8989726c',
  cluster_id: 'sc6eb55cdb_35ec_42e5_b1b0_d93d6936ac4e',
  collection_name: 'Diabetes'
)


# conversation example:
#client = Watson::Conversation.new

# client.send_message('Hola')
# sleep 1
# client.send_message('Tengo un problema')
# sleep 1
# client.send_message('quiero regresar mi libro')
# sleep 1
# client.send_message('ok gracias')

#puts 'Dile algo a watson!'
#user_input = nil
#until user_input == 'q' || user_input == 'exit'
#  print '> '
#  user_input = gets.chomp
#  return if user_input == 'q' || user_input == 'exit'
#  client.send_message(user_input)
#  sleep 0.5
#end

# Retrive and rank example
#c = Watson::RetrieveAndRank.list_solr_clusters
#puts c[0].inspect
#puts c[1].inspect
Watson::RetrieveAndRank.send_message('qué es la diabetes')
