# encoding: utf-8
module Web::Middlewares
# encoding: utf-8
  module Auth
# encoding: utf-8
    include Roberts::Model
# encoding: utf-8

# encoding: utf-8
    # Retrieves the session key from the rack session. If the session
# encoding: utf-8
    # exists and is not expired retrieves the session data and the
# encoding: utf-8
    # user data.
# encoding: utf-8
    #
# encoding: utf-8
    # @api private
# encoding: utf-8
    def authenticate!
# encoding: utf-8
      session_token = @_env['rack.session'][:session_token]
# encoding: utf-8
      session = SessionRepository.by_token(session_token).first
# encoding: utf-8

# encoding: utf-8
      if session and !session.expired?
# encoding: utf-8
        user = UserRepository.find session.user_id
# encoding: utf-8

# encoding: utf-8
        if user
# encoding: utf-8
          @current_session = session
# encoding: utf-8
          @current_user = user
# encoding: utf-8
          @authenticated = true
# encoding: utf-8
        end
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def admin_area!
# encoding: utf-8
      if !@authenticated or !@current_user.admin?
# encoding: utf-8
        redirect_to Web::Routes.path :home
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
