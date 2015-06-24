# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  module Translate
# encoding: utf-8
    # Translates a message with the given key interpolating all arguments passed.
# encoding: utf-8
    #
# encoding: utf-8
    # @param k [String, Symbol] key of the translation
# encoding: utf-8
    # @param args [Array, nil] an optional set of arguments passed to the translate method
# encoding: utf-8
    # @return String
# encoding: utf-8
    def t(k, *args)
# encoding: utf-8
      I18n.t k, *args
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    alias_method :translate, :t
# encoding: utf-8
  end
# encoding: utf-8
end
