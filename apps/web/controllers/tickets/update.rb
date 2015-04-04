require 'mail'

module Web::Controllers::Tickets
  class Update
    include Web::Action
    include Roberts::Action
    include Web::Helpers::Translate

    before :admin_area!

    params do
      param :id, presence: true, type: Integer
      param :action, presence: true, type: Integer, inclusion: 1..3
      param :priority, presence: true, type: Integer, inclusion: 0..4
      param :comment, type: String
    end

    def call(params)
      # It's an administrative task that could have no errors unless
      # the form has been tampered so if the params are not valid just
      # redirect the user to the home.
      if params.valid?
        ticket = TicketRepository.find params[:id]

        if ticket.active?
          action_type = action_types.key params[:action]

          action = Action.new(
            user_id: @current_user.id,
            ticket_id: ticket.id,
            comment: params[:comment],
            type: params[:action],
            priority: ticket.priority,
            new_priority: params[:priority],
            timestamp: Time.now.to_i
          )
          action = ActionRepository.create action

          if action_type == :solve or action_type == :close
            ticket.status = statuses[(action_type.to_s + 'd').to_sym]
          elsif action_type == :change_priority
            ticket.priority = params[:priority]
          end

          TicketRepository.update ticket

          if ticket.email_to_reply
            send_action_notification! ticket, action
          end
        end

        redirect_to link_to(:tickets, id: params[:id])
      end

      redirect_to link_to(:home)
    end

    private
    # Sends an email to notify the informer of the ticket that the
    # ticket has been updated with a new action of an administrator.
    #
    # @param ticket [Roberts::Model::Ticket]
    # @param action [Roberts::Model::Action]
    # @api private
    def send_action_notification!(ticket, action)
      action = Web::Presenters::ActionPresenter.new action
      _t = self.method :translate

      mail = Mail.new do
        from     ENV['MAIL_FROM']
        to       ticket.email_to_reply
        subject  _t.call('email_subject')
        body     _t.call('email_body_html', title: ticket.title, msg: action.msg, comment: action.comment)
      end

      mail.deliver!
    end
  end
end
