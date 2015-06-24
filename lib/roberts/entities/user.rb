module Roberts::Model
  class User
    include Lotus::Entity

    TYPE_ADMIN = 1
    TYPE_USER  = 0

    attributes :id, :name, :email, :password, :type

    def admin?
      @type == TYPE_ADMIN
    end
  end
end