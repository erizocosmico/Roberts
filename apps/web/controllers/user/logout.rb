# encoding: utf-8
module Web::Controllers::User
# encoding: utf-8
  class Logout
# encoding: utf-8
    include Web::Action
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      if @authenticated
# encoding: utf-8
        SessionRepository.delete @current_session
# encoding: utf-8
        session.delete :session_token
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      redirect_to link_to(:home)
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
