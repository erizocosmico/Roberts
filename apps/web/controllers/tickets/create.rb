# encoding: utf-8
require 'time'
# encoding: utf-8

# encoding: utf-8
module Web::Controllers::Tickets
# encoding: utf-8
  class Create
# encoding: utf-8
    include Web::Action
# encoding: utf-8
    include Roberts::Slack
# encoding: utf-8
    include Roberts::Ticket
# encoding: utf-8
    include Web::Helpers::Translate
# encoding: utf-8

# encoding: utf-8
    params do
# encoding: utf-8
      param :title, presence: true, size: 3..255
# encoding: utf-8
      param :description, presence: true, size: 3..9999999
# encoding: utf-8
      param :type, type: Integer, presence: true, inclusion: 0..3
# encoding: utf-8
      param :priority, type: Integer, presence: true, inclusion: 0..4
# encoding: utf-8
      param :email_to_reply, presence: false, format: /(|.+@.+\..+)/
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      if !params.valid?
# encoding: utf-8
        url = link_to(:new_tickets)
# encoding: utf-8

# encoding: utf-8
        save_form(
# encoding: utf-8
          :create_ticket,
# encoding: utf-8
          params,
# encoding: utf-8
          [:title, :description, :type, :priority, :email_to_reply],
# encoding: utf-8
          errors
# encoding: utf-8
        )
# encoding: utf-8
      else
# encoding: utf-8
        ticket = Ticket.new(
# encoding: utf-8
          title: params[:title],
# encoding: utf-8
          description: params[:description],
# encoding: utf-8
          type: params[:type],
# encoding: utf-8
          priority: params[:priority],
# encoding: utf-8
          email_to_reply: params[:email_to_reply],
# encoding: utf-8
          created_at: Time.now.to_i
# encoding: utf-8
        )
# encoding: utf-8

# encoding: utf-8
        ticket = TicketRepository.create ticket
# encoding: utf-8
        send_ticket_to_slack ticket
# encoding: utf-8
        url = link_to(:tickets, id: ticket.id)
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      redirect_to url
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    private
# encoding: utf-8
    # Posts the ticket creation notice on a Slack channel
# encoding: utf-8
    #
# encoding: utf-8
    # @param ticket [Roberts::Model::Ticket]
# encoding: utf-8
    # @api private
# encoding: utf-8
    def send_ticket_to_slack(ticket)
# encoding: utf-8
      priority = translate priorities[ticket.priority].name
# encoding: utf-8
      type = translate types[ticket.type].name
# encoding: utf-8
      msg = translate 'slack_msg', title: ticket.title, url: ENV['APP_DOMAIN'] + link_to(:tickets, id: ticket.id), priority: priority, type: type
# encoding: utf-8

# encoding: utf-8
      post_message msg
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
