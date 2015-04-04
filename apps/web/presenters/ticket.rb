require 'time'

module Web::Presenters
  class TicketPresenter
    include Lotus::Presenter
    include Roberts::Ticket
    include Web::Helpers::Markdown

    def created_at
      Time.at(super).strftime '%H:%M:%S - %d/%m/%Y'
    end

    def type
      types[super].name
    end

    def priority
      priorities[super].name
    end

    def display_actions?
      active?
    end

    def description
      _raw md_to_html(super)
    end
  end
end
