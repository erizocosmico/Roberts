collection :users do
  entity Roberts::Model::User
  repository Roberts::Model::UserRepository

  attribute :id, Integer
  attribute :name, String
  attribute :password, String
  attribute :type, Integer
end

collection :sessions do
  entity Roberts::Model::Session
  repository Roberts::Model::SessionRepository

  attribute :user_id, Integer
  attribute :expiration, Integer
  attribute :token, String
end

collection :tickets do
  entity Roberts::Model::Ticket
  repository Roberts::Model::TicketRepository

  attribute :title, String
  attribute :description, String
  attribute :type, Integer
  attribute :priority, Integer
  attribute :created_at, Integer
  attribute :reported_by, Integer
  attribute :email_to_reply, String
end

collection :actions do
  entity Roberts::Model::Action
  repository Roberts::Model::ActionRepository

  attribute :user_id, Integer
  attribute :ticket_id, Integer
  attribute :timestamp, Integer
  attribute :type, Integer
  attribute :new_type, Integer
  attribute :comment, String
end