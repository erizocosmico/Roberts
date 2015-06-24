# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  module Links
# encoding: utf-8
    # Returns the relative path for a link with the given name and arguments.
# encoding: utf-8
    #
# encoding: utf-8
    # @param name Symbol
# encoding: utf-8
    # @param args [Array, nil] optional set of arguments for the link
# encoding: utf-8
    def link_to(name, *args)
# encoding: utf-8
      Web::Routes.path(name, *args)
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
