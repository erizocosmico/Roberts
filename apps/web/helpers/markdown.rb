# encoding: utf-8
require 'kramdown'
# encoding: utf-8

# encoding: utf-8
module Web::Helpers
# encoding: utf-8
  module Markdown
# encoding: utf-8
    # Converts a text in mardown to HTML
# encoding: utf-8
    #
# encoding: utf-8
    # @param text [String]
# encoding: utf-8
    # @return String
# encoding: utf-8
    def md_to_html(text)
# encoding: utf-8
      Kramdown::Document.new(text).to_html
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
