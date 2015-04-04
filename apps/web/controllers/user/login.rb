module Web::Controllers::User
  class Login
    include Web::Action
    prepend Web::Helpers::Csrf

    expose :email
    expose :password
    expose :login_error

    def call(params)
      with_form :login do |form|
        @email, @password = form.values_at(:email, :password)
        @login_error = true
      end
    end
  end
end
