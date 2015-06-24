# encoding: utf-8
collection :users do
# encoding: utf-8
  entity Roberts::Model::User
# encoding: utf-8
  repository Roberts::Model::UserRepository
# encoding: utf-8

# encoding: utf-8
  attribute :id, Integer
# encoding: utf-8
  attribute :name, String
# encoding: utf-8
  attribute :password, String
# encoding: utf-8
  attribute :type, Integer
# encoding: utf-8
end
# encoding: utf-8

# encoding: utf-8
collection :sessions do
# encoding: utf-8
  entity Roberts::Model::Session
# encoding: utf-8
  repository Roberts::Model::SessionRepository
# encoding: utf-8

# encoding: utf-8
  attribute :id, Integer
# encoding: utf-8
  attribute :user_id, Integer
# encoding: utf-8
  attribute :expiration, Integer
# encoding: utf-8
  attribute :token, String
# encoding: utf-8
end
# encoding: utf-8

# encoding: utf-8
collection :tickets do
# encoding: utf-8
  entity Roberts::Model::Ticket
# encoding: utf-8
  repository Roberts::Model::TicketRepository
# encoding: utf-8

# encoding: utf-8
  attribute :id, Integer
# encoding: utf-8
  attribute :title, String
# encoding: utf-8
  attribute :description, String
# encoding: utf-8
  attribute :type, Integer
# encoding: utf-8
  attribute :priority, Integer
# encoding: utf-8
  attribute :created_at, Integer
# encoding: utf-8
  attribute :reported_by, Integer
# encoding: utf-8
  attribute :email_to_reply, String
# encoding: utf-8
  attribute :status, Integer
# encoding: utf-8
end
# encoding: utf-8

# encoding: utf-8
collection :actions do
# encoding: utf-8
  entity Roberts::Model::Action
# encoding: utf-8
  repository Roberts::Model::ActionRepository
# encoding: utf-8

# encoding: utf-8
  attribute :id, Integer
# encoding: utf-8
  attribute :user_id, Integer
# encoding: utf-8
  attribute :ticket_id, Integer
# encoding: utf-8
  attribute :timestamp, Integer
# encoding: utf-8
  attribute :type, Integer
# encoding: utf-8
  attribute :priority, Integer
# encoding: utf-8
  attribute :new_priority, Integer
# encoding: utf-8
  attribute :comment, String
# encoding: utf-8
end
