# encoding: utf-8
module Web::Controllers::Tickets
# encoding: utf-8
  class List
# encoding: utf-8
    include Web::Action
# encoding: utf-8

# encoding: utf-8
    params do
# encoding: utf-8
      param :page, type: Integer
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    expose :tickets
# encoding: utf-8
    expose :page
# encoding: utf-8
    expose :num_pages
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      @page = params[:page] || 1
# encoding: utf-8
      @page = 1 unless @page > 1
# encoding: utf-8
      @tickets = TicketRepository.by_page(@page)
# encoding: utf-8
      @num_pages = TicketRepository.num_pages
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
