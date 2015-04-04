module Web::Controllers::Tickets
  class Show
    include Web::Action
    prepend Web::Helpers::Csrf
    include Roberts::Action

    params do
      param :id, presence: true, type: Integer
    end

    expose :ticket
    expose :actions

    def call(params)
      @ticket = TicketRepository.find params[:id]
      @actions = ActionRepository.by_ticket(@ticket.id).all
    end
  end
end
