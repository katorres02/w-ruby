module Watson
  class RetrieveAndRank
    def self.configure(options = {})
      @username         = options[:username]
      @password         = options[:password]
      @url              = options[:url]
      @cluster          = options[:cluster_id]
      @collection_name  = options[:collection_name]
    end

    def self.send_message(message = '')
      return if message.empty?
      @message = message
      query = URI.encode(@message)
      response = Excon.post(url(query),
                            headers: {
                              'Content-Type' => 'application/json',
                              'Accept' => 'application/json'
                            },
                            user:      @username,
                            password:  @password)
      result = JSON.parse(response.body)
      answers(result['response']['docs'])
    end

    def self.answers(data)
      data.collect do |d|
        { source: 'retrieveandrank', intent: '',
          message: @message, tittle: d['title'], body: d['body'] }
      end
    end

    def self.url(query)
      @url + '/v1/solr_clusters/' + @cluster + '/solr/' + @collection_name +
        '/select?q=' + query + '&wt=json'
    end
  end
end
