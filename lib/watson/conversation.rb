module Watson
  class Conversation
    def self.configure(options = {})
      @@username     = options[:username]
      @@password     = options[:password]
      @@url          = options[:url]
      @@workspace_id = options[:workspace_id]
    end

    def conversation
      @context['conversation_id']
    end

    def send_message(message = '')
      return if message.empty? || message.nil?
      @message = message
      params = { input: { text: @message }, alternate_intents: true }
      params.merge!(@context) unless @context.nil?
      response = Excon.post(url,
                            body:     params.to_json,
                            headers:  {
                              'Content-Type' => 'application/json',
                              'Accept' => 'application/json'
                            },
                            user:      @@username,
                            password:  @@password)
      result = JSON.parse(response.body)
      @context = { context: result['context'] }
      build_response(result)
    end

    def build_response(result)
      {
        source: 'conversation', intent: result['intents'][0]['intent'],
        message: @message, tittle: @message, body: result['output']['text'],
        context_id: result['context']['conversation_id']
      }
    end

    def url
      @@url + '/v1/workspaces/' + @@workspace_id + '/message?version=2016-09-20'
    end
  end
end
