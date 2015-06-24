# encoding: utf-8
module Web::Views::Tickets
# encoding: utf-8
  class List
# encoding: utf-8
    include Web::View
# encoding: utf-8
    layout :application
# encoding: utf-8

# encoding: utf-8
    def page_title
# encoding: utf-8
      layout.page_title + translate('open_tickets')
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def tickets
# encoding: utf-8
      locals[:tickets].map do |t|
# encoding: utf-8
        TicketPresenter.new(t)
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
