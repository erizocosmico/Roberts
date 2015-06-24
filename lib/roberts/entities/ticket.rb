# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class Ticket
# encoding: utf-8
    include Lotus::Entity
# encoding: utf-8
    include Roberts::Action
# encoding: utf-8

# encoding: utf-8
    attributes :id, :title, :description, :type, :priority, :created_at, :reported_by, :email_to_reply, :status
# encoding: utf-8

# encoding: utf-8
    def active?
# encoding: utf-8
      statuses.key(@status) == :active
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def closed?
# encoding: utf-8
      statuses.key(@status) == :closed
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def solved?
# encoding: utf-8
      statuses.key(@status) == :solved
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
