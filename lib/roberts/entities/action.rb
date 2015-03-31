module Roberts::Model
  class Action
    include Lotus::Entity

    attributes :user_id, :ticket_id, :timestamp, :type, :comment, :new_type
  end
end