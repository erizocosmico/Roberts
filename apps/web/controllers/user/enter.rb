require 'bcrypt'
require 'time'
require 'securerandom'

module Web::Controllers::User
  class Enter
    include Web::Action

    params do
      param :email, presence: true, format: /.+@.+\..+/
      param :password, presence: true
    end

    def call(params)
      if !@authenticated
        if !params.valid?
          invalid_form params
        end

        user = UserRepository.by_email(params[:email]).first
        if !user or BCrypt::Password.new(user.password) != params[:password]
          invalid_form params
        end

        user_session = Session.new(
          user_id: user.id,
          expiration: Time.now.to_i + (30*86400),
          token: SecureRandom.base64(64)
        )
        user_session = SessionRepository.create user_session
        session[:session_token] = user_session.token
      end

      redirect_to link_to(:home)
    end

    private
    def invalid_form(params)
      save_form(:login, params, [:email, :password], errors)
      redirect_to link_to(:user_login)
    end
  end
end
