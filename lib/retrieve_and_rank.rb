module Watson
  class RetrieveAndRank

    def self.configure(options = {})
      @username     = options[:username]
      @password     = options[:password]
      @url          = options[:url]
      #init_cluster
      load_solr_clusters
    end

    def self.init_cluster
      response = Excon.post(url_cluster,
                            body:     {}.to_json,
                            headers:  {
                                'Content-Type' => 'application/json',
                                'Accept' => 'application/json'
                            },
                            user:      @username,
                            password:  @password)
      result = JSON.parse(response.body)
      @solr_cluster_id = result[:solr_cluster_id]
      puts result
    end

    def self.list_solr_clusters
      @clusters
    end

    def self.load_solr_clusters
      response = Excon.get('https://gateway.watsonplatform.net/retrieve-and-rank/api/v1/solr_clusters',
                            headers:  {
                                'Content-Type' => 'application/json',
                                'Accept' => 'application/json'
                            },
                            user:      @username,
                            password:  @password)
      result = JSON.parse(response.body)
      @clusters = result['clusters'].collect { |c| Cluster.new(c) }
    end

    def self.send_message(message = '')
      response = Excon.post('https://watson-api-explorer.mybluemix.net/retrieve-and-rank/api/v1/solr_clusters/sc6eb55cdb_35ec_42e5_b1b0_d93d6936ac4e/solr/Diabetes/select?q=qu%C3%A9%20es%20la%20diabetes&wt=json',
                            q: 'q=qu%C3%A9%20es%20la%20diabetes',


                           headers:  {
                               'Content-Type' => 'application/json',
                               'Accept' => 'application/json'
                           },
                           user:      @username,
                           password:  @password)
      result = JSON.parse(response.body)
      answers(result['response']['docs'])
    end

    def self.answers(data)
      data.each do |d|
        puts d['body']
      end
    end

    def self.url_cluster
      @url + '/v1/solr_clusters'
    end
  end
end