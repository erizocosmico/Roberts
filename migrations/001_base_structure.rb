class CreateBaseStructure < Sequel::Migration

  def up
    create_table(:users) do
      primary_key :id
      String :name, :size => 50
      String :email, :size => 100
      String :password, :size => 100
      Integer :type
    end

    create_table(:sessions) do
      primary_key :id
      foreign_key :user_id, :users
      String :token, :size => 100
      Integer :expiration
    end

    create_table(:tickets) do
      primary_key :id
      String :title, :size => 255
      String :description, :text => true
      Integer :type
      Integer :priority
      Integer :created_at
      foreign_key :reported_by, :users
      String :email_to_reply, :size => 100
      Integer :status, :default => 0
    end

    create_table(:actions) do
      primary_key :id
      foreign_key :user_id, :users
      foreign_key :ticket_id, :tickets
      Integer :timestamp
      Integer :type
      Integer :priority
      Integer :new_priority
      String :comment, :text => true
    end
  end

  def down
    drop_table(:users)
    drop_table(:sessions)
    drop_table(:tickets)
    drop_table(:actions)
  end

end
