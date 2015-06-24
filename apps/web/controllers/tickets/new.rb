# encoding: utf-8
module Web::Controllers::Tickets
# encoding: utf-8
  class New
# encoding: utf-8
    include Web::Action
# encoding: utf-8
    prepend Web::Helpers::Csrf
# encoding: utf-8
    include Roberts::Ticket
# encoding: utf-8

# encoding: utf-8
    expose :title
# encoding: utf-8
    expose :description
# encoding: utf-8
    expose :type
# encoding: utf-8
    expose :priority
# encoding: utf-8
    expose :email_to_reply
# encoding: utf-8
    expose :priorities
# encoding: utf-8
    expose :types
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      with_form :create_ticket do |form|
# encoding: utf-8
        @title, @description, @type, @priority, @email_to_reply = form.values_at(:title, :description, :type, :priority, :email_to_reply)
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      @priorities = priorities
# encoding: utf-8
      @types = types
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
