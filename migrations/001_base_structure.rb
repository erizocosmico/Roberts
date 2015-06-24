# encoding: utf-8
class CreateBaseStructure < Sequel::Migration
# encoding: utf-8

# encoding: utf-8
  def up
# encoding: utf-8
    create_table(:users) do
# encoding: utf-8
      primary_key :id
# encoding: utf-8
      String :name, :size => 50
# encoding: utf-8
      String :email, :size => 100
# encoding: utf-8
      String :password, :size => 100
# encoding: utf-8
      Integer :type
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    create_table(:sessions) do
# encoding: utf-8
      primary_key :id
# encoding: utf-8
      foreign_key :user_id, :users
# encoding: utf-8
      String :token, :size => 100
# encoding: utf-8
      Integer :expiration
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    create_table(:tickets) do
# encoding: utf-8
      primary_key :id
# encoding: utf-8
      String :title, :size => 255
# encoding: utf-8
      String :description
# encoding: utf-8
      Integer :type
# encoding: utf-8
      Integer :priority
# encoding: utf-8
      Integer :created_at
# encoding: utf-8
      foreign_key :reported_by, :users
# encoding: utf-8
      String :email_to_reply, :size => 100
# encoding: utf-8
      Integer :status, :default => 0
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    create_table(:actions) do
# encoding: utf-8
      primary_key :id
# encoding: utf-8
      foreign_key :user_id, :users
# encoding: utf-8
      foreign_key :ticket_id, :tickets
# encoding: utf-8
      Integer :timestamp
# encoding: utf-8
      Integer :type
# encoding: utf-8
      Integer :priority
# encoding: utf-8
      Integer :new_priority
# encoding: utf-8
      String :comment
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8

# encoding: utf-8
  def down
# encoding: utf-8
    drop_table(:users)
# encoding: utf-8
    drop_table(:sessions)
# encoding: utf-8
    drop_table(:tickets)
# encoding: utf-8
    drop_table(:actions)
# encoding: utf-8
  end
# encoding: utf-8

# encoding: utf-8
end
