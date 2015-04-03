module Roberts::Model
  class UserRepository
    include Lotus::Repository

    # Fetches all users with the given email
    #
    # @param email [String]
    # @return Query
    def self.by_email(email)
      query do
        where(email: email)
      end
    end
  end
end
