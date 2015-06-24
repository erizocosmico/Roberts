require 'time'

module Web::Presenters
  class ActionPresenter
    include Lotus::Presenter
    include Roberts::Action
    include Roberts::Ticket
    include Web::Helpers::Translate
    include Web::Helpers::Markdown

    def timestamp
      Time.at(super).strftime '%H:%M:%S - %d/%m/%Y'
    end

    def priority
      priorities[super].name
    end

    def new_priority
      priorities[super].name
    end

    def type
      action_types.key super
    end

    def msg
      translate 'action_' + type.to_s, priority: translate(priority), new_priority: translate(new_priority)
    end

    def comment
      _raw md_to_html(super)
    end
  end
end