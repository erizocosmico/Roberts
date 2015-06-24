module Web::Views::Tickets
  class New
    include Web::View
    layout :application

    def page_title
      layout.page_title + translate('new_ticket')
    end
  end
end