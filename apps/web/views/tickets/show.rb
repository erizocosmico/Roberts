module Web::Views::Tickets
  class Show
    include Web::View
    include Roberts::Action
    include Roberts::Ticket
    layout :application

    def page_title
      layout.page_title + translate('view_ticket')
    end

    def actions
      locals[:actions].map do |a|
        ActionPresenter.new a
      end
    end

    def ticket
      TicketPresenter.new locals[:ticket]
    end
  end
end