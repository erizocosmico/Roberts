module Web::Mixins
  module Links
    # Returns the relative path for a link with the given name and arguments.
    #
    # @param name Symbol
    # @param args [Array, nil] optional set of arguments for the link
    def link_to(name, *args)
      Web::Routes.path(name, *args)
    end
  end
end
