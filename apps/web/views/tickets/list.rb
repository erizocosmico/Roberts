module Web::Views::Tickets
  class List
    include Web::View

    def tickets
      locals[:tickets].map do |t|
        TicketPresenter.new(t)
      end
    end
  end
end
