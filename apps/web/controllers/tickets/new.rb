module Web::Controllers::Tickets
  class New
    include Web::Action
    prepend Web::Mixins::Csrf
    include Roberts::Ticket

    expose :title
    expose :description
    expose :type
    expose :priority
    expose :email_to_reply
    expose :priorities
    expose :types

    def call(params)
      with_form :create_ticket do |form|
        @title, @description, @type, @priority, @email_to_reply = form.values_at(:title, :description, :type, :priority, :email_to_reply)
      end

      @priorities = priorities
      @types = types
    end
  end
end
