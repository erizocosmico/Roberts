# encoding: utf-8
module Web::Controllers::Tickets
# encoding: utf-8
  class Show
# encoding: utf-8
    include Web::Action
# encoding: utf-8
    prepend Web::Helpers::Csrf
# encoding: utf-8
    include Roberts::Action
# encoding: utf-8

# encoding: utf-8
    params do
# encoding: utf-8
      param :id, presence: true, type: Integer
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    expose :ticket
# encoding: utf-8
    expose :actions
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      @ticket = TicketRepository.find params[:id]
# encoding: utf-8
      @actions = ActionRepository.by_ticket(@ticket.id).all
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
