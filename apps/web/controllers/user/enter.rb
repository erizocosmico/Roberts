# encoding: utf-8
require 'bcrypt'
# encoding: utf-8
require 'time'
# encoding: utf-8
require 'securerandom'
# encoding: utf-8

# encoding: utf-8
module Web::Controllers::User
# encoding: utf-8
  class Enter
# encoding: utf-8
    include Web::Action
# encoding: utf-8

# encoding: utf-8
    params do
# encoding: utf-8
      param :email, presence: true, format: /.+@.+\..+/
# encoding: utf-8
      param :password, presence: true
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      if !@authenticated
# encoding: utf-8
        if !params.valid?
# encoding: utf-8
          invalid_form params
# encoding: utf-8
        end
# encoding: utf-8

# encoding: utf-8
        user = UserRepository.by_email(params[:email]).first
# encoding: utf-8
        if !user or BCrypt::Password.new(user.password) != params[:password]
# encoding: utf-8
          invalid_form params
# encoding: utf-8
        end
# encoding: utf-8

# encoding: utf-8
        user_session = Session.new(
# encoding: utf-8
          user_id: user.id,
# encoding: utf-8
          expiration: Time.now.to_i + (30*86400),
# encoding: utf-8
          token: SecureRandom.base64(64)
# encoding: utf-8
        )
# encoding: utf-8
        user_session = SessionRepository.create user_session
# encoding: utf-8
        session[:session_token] = user_session.token
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      redirect_to link_to(:home)
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    private
# encoding: utf-8
    def invalid_form(params)
# encoding: utf-8
      save_form(:login, params, [:email, :password], errors)
# encoding: utf-8
      redirect_to link_to(:user_login)
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
