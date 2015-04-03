require 'time'

module Web::Controllers::Tickets
  class Create
    include Web::Action
    include Roberts::Slack
    include Roberts::Ticket
    include Web::Mixins::Translate
    include Web::Mixins::Links

    params do
      param :title, presence: true, size: 3..255
      param :description, presence: true, size: 3..9999999
      param :type, type: Integer, presence: true, inclusion: 0..3
      param :priority, type: Integer, presence: true, inclusion: 0..4
      param :email_to_reply, presence: false, format: /(|.+@.+\..+)/
    end

    def call(params)
      if !params.valid?
        url = Web::Routes.path(:new_tickets)

        save_form(
          :create_ticket,
          params,
          [:title, :description, :type, :priority, :email_to_reply],
          errors
        )
      else
        ticket = Ticket.new(
          title: params[:title],
          description: params[:description],
          type: params[:type],
          priority: params[:priority],
          email_to_reply: params[:email_to_reply],
          created_at: Time.now.to_i
        )

        ticket = TicketRepository.create ticket
        send_ticket_to_slack ticket
        url = Web::Routes.path(:tickets, id: ticket.id)
      end

      redirect_to url
    end

    private
    # Posts the ticket creation notice on a Slack channel
    #
    # @param ticket [Roberts::Model::Ticket]
    # @api private
    def send_ticket_to_slack(ticket)
      priority = t priorities[ticket.priority].name
      type = t types[ticket.type].name
      msg = t 'slack_msg', title: ticket.title, url: link_to(:tickets, id: ticket.id), priority: priority, type: type

      post_message msg
    end
  end
end
