# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class SessionRepository
# encoding: utf-8
    include Lotus::Repository
# encoding: utf-8

# encoding: utf-8
    # Fetches all sessions with a specific token (it should be one, though)
# encoding: utf-8
    #
# encoding: utf-8
    # @param token [String]
# encoding: utf-8
    # @return Query
# encoding: utf-8
    def self.by_token(token)
# encoding: utf-8
      query do
# encoding: utf-8
        where(token: token)
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
