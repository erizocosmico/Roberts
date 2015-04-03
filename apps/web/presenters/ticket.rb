require 'time'

module Web::Presenters
  class TicketPresenter
    include Lotus::Presenter
    include Roberts::Ticket

    def created_at
      Time.at(super).strftime '%H:%M:%S - %d/%m/%Y'
    end

    def type
      types[super].name
    end

    def priority
      priorities[super].name
    end
  end
end
