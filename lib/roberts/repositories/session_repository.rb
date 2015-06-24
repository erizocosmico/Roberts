module Roberts::Model
  class SessionRepository
    include Lotus::Repository

    # Fetches all sessions with a specific token (it should be one, though)
    #
    # @param token [String]
    # @return Query
    def self.by_token(token)
      query do
        where(token: token)
      end
    end
  end
end