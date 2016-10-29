module Watson
  class ConversationEnhanced < Conversation

    def initialize(intent = '')
      @intent = intent
    end

    def send_message(message = '')
      return if message.empty?
      response = super
      if must_retrieve?(response[:intent])
        retrieve_and_rank(message)
      else
        response
      end
    end

    def must_retrieve?(result)
      result == @intent
    end

    def retrieve_and_rank(message)
      RetrieveAndRank.send_message(message)
    end
  end
end
