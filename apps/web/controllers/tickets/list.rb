module Web::Controllers::Tickets
  class List
    include Web::Action

    params do
      param :page, type: Integer
    end

    expose :tickets
    expose :page
    expose :num_pages

    def call(params)
      @page = params[:page] || 1
      @page = 1 unless @page > 1
      @tickets = TicketRepository.by_page(@page)
      @num_pages = TicketRepository.num_pages
    end
  end
end