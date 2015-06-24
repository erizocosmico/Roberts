# encoding: utf-8
module Web::Views::Tickets
# encoding: utf-8
  class Show
# encoding: utf-8
    include Web::View
# encoding: utf-8
    include Roberts::Action
# encoding: utf-8
    include Roberts::Ticket
# encoding: utf-8
    layout :application
# encoding: utf-8

# encoding: utf-8
    def page_title
# encoding: utf-8
      layout.page_title + translate('view_ticket')
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def actions
# encoding: utf-8
      locals[:actions].map do |a|
# encoding: utf-8
        ActionPresenter.new a
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def ticket
# encoding: utf-8
      TicketPresenter.new locals[:ticket]
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
