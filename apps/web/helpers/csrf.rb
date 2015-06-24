module Web::Helpers
  # Note: This module needs to be prepended, not included!
  module Csrf
    # Overrides the call method of the module where it is prepended
    # to retrieve the csrf token from the session and assign it to
    # an ivar.
    #
    # @api private
    def call(params)
      @csrf = params['rack.session']["csrf"]
      super
    end
  end
end