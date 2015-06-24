module Roberts::Model
  class Ticket
    include Lotus::Entity
    include Roberts::Action

    attributes :id, :title, :description, :type, :priority, :created_at, :reported_by, :email_to_reply, :status

    def active?
      statuses.key(@status) == :active
    end

    def closed?
      statuses.key(@status) == :closed
    end

    def solved?
      statuses.key(@status) == :solved
    end
  end
end