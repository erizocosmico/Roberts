# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class User
# encoding: utf-8
    include Lotus::Entity
# encoding: utf-8

# encoding: utf-8
    TYPE_ADMIN = 1
# encoding: utf-8
    TYPE_USER  = 0
# encoding: utf-8

# encoding: utf-8
    attributes :id, :name, :email, :password, :type
# encoding: utf-8

# encoding: utf-8
    def admin?
# encoding: utf-8
      @type == TYPE_ADMIN
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
