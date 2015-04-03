module Web::Mixins
  module Translate
    # Translates a message with the given key interpolating all arguments passed.
    #
    # @param k [String, Symbol] key of the translation
    # @param args [Array, nil] an optional set of arguments passed to the translate method
    # @return String
    def t(k, *args)
      I18n.t k, *args
    end
  end
end
