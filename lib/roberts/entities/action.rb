# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class Action
# encoding: utf-8
    include Lotus::Entity
# encoding: utf-8

# encoding: utf-8
    attributes :id, :user_id, :ticket_id, :timestamp, :type, :priority, :comment, :new_priority
# encoding: utf-8
  end
# encoding: utf-8
end
