module Web::Views::Tickets
  class Show
    include Web::View

    def ticket
      TicketPresenter.new(locals[:ticket])
    end
  end
end
