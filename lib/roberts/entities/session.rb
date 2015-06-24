# encoding: utf-8
require 'time'
# encoding: utf-8

# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class Session
# encoding: utf-8
    include Lotus::Entity
# encoding: utf-8

# encoding: utf-8
    attributes :id, :user_id, :expiration, :token
# encoding: utf-8

# encoding: utf-8
    def expired?
# encoding: utf-8
      @expiration <= Time.now.to_i
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
