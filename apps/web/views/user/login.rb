module Web::Views::User
  class Login
    include Web::View
    layout :application

    def page_title
      layout.page_title + translate('login')
    end
  end
end
