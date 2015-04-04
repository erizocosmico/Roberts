module Web::Views::Tickets
  class List
    include Web::View
    layout :application

    def page_title
      layout.page_title + translate('open_tickets')
    end

    def tickets
      locals[:tickets].map do |t|
        TicketPresenter.new(t)
      end
    end
  end
end
