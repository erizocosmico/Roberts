module Web::Views::Tickets
  class Show
    include Web::View
    include Roberts::Action
    include Roberts::Ticket

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
