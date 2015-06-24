# encoding: utf-8
require 'time'
# encoding: utf-8

# encoding: utf-8
module Web::Presenters
# encoding: utf-8
  class ActionPresenter
# encoding: utf-8
    include Lotus::Presenter
# encoding: utf-8
    include Roberts::Action
# encoding: utf-8
    include Roberts::Ticket
# encoding: utf-8
    include Web::Helpers::Translate
# encoding: utf-8
    include Web::Helpers::Markdown
# encoding: utf-8

# encoding: utf-8
    def timestamp
# encoding: utf-8
      Time.at(super).strftime '%H:%M:%S - %d/%m/%Y'
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
    def new_priority
# encoding: utf-8
      priorities[super].name
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def type
# encoding: utf-8
      action_types.key super
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def msg
# encoding: utf-8
      translate 'action_' + type.to_s, priority: translate(priority), new_priority: translate(new_priority)
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def comment
# encoding: utf-8
      _raw md_to_html(super)
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
