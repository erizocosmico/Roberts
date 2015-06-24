# encoding: utf-8
module Web::Controllers::User
# encoding: utf-8
  class Login
# encoding: utf-8
    include Web::Action
# encoding: utf-8
    prepend Web::Helpers::Csrf
# encoding: utf-8

# encoding: utf-8
    expose :email
# encoding: utf-8
    expose :password
# encoding: utf-8
    expose :login_error
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      with_form :login do |form|
# encoding: utf-8
        @email, @password = form.values_at(:email, :password)
# encoding: utf-8
        @login_error = true
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
