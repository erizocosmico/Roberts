require 'kramdown'

module Web::Helpers
  module Markdown
    # Converts a text in mardown to HTML
    #
    # @param text [String]
    # @return String
    def md_to_html(text)
      Kramdown::Document.new(text).to_html
    end
  end
end
