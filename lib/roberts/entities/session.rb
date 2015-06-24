require 'time'

module Roberts::Model
  class Session
    include Lotus::Entity

    attributes :id, :user_id, :expiration, :token

    def expired?
      @expiration <= Time.now.to_i
    end
  end
end