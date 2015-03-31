module Roberts::Model
  class Session
    include Lotus::Entity

    attributes :user_id, :expiration, :token
  end
end