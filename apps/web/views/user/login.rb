# encoding: utf-8
module Web::Views::User
# encoding: utf-8
  class Login
# encoding: utf-8
    include Web::View
# encoding: utf-8
    layout :application
# encoding: utf-8

# encoding: utf-8
    def page_title
# encoding: utf-8
      layout.page_title + translate('login')
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
