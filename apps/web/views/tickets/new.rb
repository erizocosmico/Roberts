# encoding: utf-8
module Web::Views::Tickets
# encoding: utf-8
  class New
# encoding: utf-8
    include Web::View
# encoding: utf-8
    layout :application
# encoding: utf-8

# encoding: utf-8
    def page_title
# encoding: utf-8
      layout.page_title + translate('new_ticket')
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
