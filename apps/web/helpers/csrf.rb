# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  # Note: This module needs to be prepended, not included!
# encoding: utf-8
  module Csrf
# encoding: utf-8
    # Overrides the call method of the module where it is prepended
# encoding: utf-8
    # to retrieve the csrf token from the session and assign it to
# encoding: utf-8
    # an ivar.
# encoding: utf-8
    #
# encoding: utf-8
    # @api private
# encoding: utf-8
    def call(params)
# encoding: utf-8
      @csrf = params['rack.session']["csrf"]
# encoding: utf-8
      super
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
