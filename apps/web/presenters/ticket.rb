# encoding: utf-8
require 'time'
# encoding: utf-8

# encoding: utf-8
module Web::Presenters
# encoding: utf-8
  class TicketPresenter
# encoding: utf-8
    include Lotus::Presenter
# encoding: utf-8
    include Roberts::Ticket
# encoding: utf-8
    include Web::Helpers::Markdown
# encoding: utf-8

# encoding: utf-8
    def created_at
# encoding: utf-8
      Time.at(super).strftime '%H:%M:%S - %d/%m/%Y'
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def type
# encoding: utf-8
      types[super].name
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def priority
# encoding: utf-8
      priorities[super].name
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def display_actions?
# encoding: utf-8
      active?
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def description
# encoding: utf-8
      _raw md_to_html(super)
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
