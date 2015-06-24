# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class UserRepository
# encoding: utf-8
    include Lotus::Repository
# encoding: utf-8

# encoding: utf-8
    # Fetches all users with the given email
# encoding: utf-8
    #
# encoding: utf-8
    # @param email [String]
# encoding: utf-8
    # @return Query
# encoding: utf-8
    def self.by_email(email)
# encoding: utf-8
      query do
# encoding: utf-8
        where(email: email)
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
