module Web::Mixins
  module Auth
    include Roberts::Model

    # Retrieves the session key from the rack session. If the session
    # exists and is not expired retrieves the session data and the
    # user data.
    #
    # @api private
    def authenticate!
      session_token = @_env['rack.session'][:session_token]
      session = SessionRepository.by_token(session_token).first

      if session and !session.expired?
        user = UserRepository.find session.user_id

        if user
          @current_session = session
          @current_user = user
          @authenticated = true
        end
      end
    end
  end
end
