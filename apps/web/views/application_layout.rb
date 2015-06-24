module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def page_title
        'Roberts — '
      end
    end
  end
end