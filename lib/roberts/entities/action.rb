module Roberts::Model
  class Action
    include Lotus::Entity

    attributes :id, :user_id, :ticket_id, :timestamp, :type, :priority, :comment, :new_priority
  end
end
