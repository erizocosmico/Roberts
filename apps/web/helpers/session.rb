# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  module Session
# encoding: utf-8
    # Retrieves the Rack session
# encoding: utf-8
    #
# encoding: utf-8
    # @return Hash
# encoding: utf-8
    def session
# encoding: utf-8
      @_env['rack.session']
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
