module Web::Mixins
  module Session
    # Retrieves the Rack session
    #
    # @return Hash
    def session
      @_env['rack.session']
    end
  end
end
