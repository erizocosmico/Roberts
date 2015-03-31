module Roberts::Model
  class Ticket
    include Lotus::Entity

    attributes :title, :description, :type, :priority, :created_at, :reported_by, :email_to_reply
  end
end