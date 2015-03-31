module Roberts::Model
  class User
    include Lotus::Entity

    attributes :name, :email, :password, :type
  end
end