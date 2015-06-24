# encoding: utf-8
require 'mail'
# encoding: utf-8

# encoding: utf-8
module Web::Controllers::Tickets
# encoding: utf-8
  class Update
# encoding: utf-8
    include Web::Action
# encoding: utf-8
    include Roberts::Action
# encoding: utf-8
    include Web::Helpers::Translate
# encoding: utf-8

# encoding: utf-8
    before :admin_area!
# encoding: utf-8

# encoding: utf-8
    params do
# encoding: utf-8
      param :id, presence: true, type: Integer
# encoding: utf-8
      param :action, presence: true, type: Integer, inclusion: 1..3
# encoding: utf-8
      param :priority, presence: true, type: Integer, inclusion: 0..4
# encoding: utf-8
      param :comment, type: String
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    def call(params)
# encoding: utf-8
      # It's an administrative task that could have no errors unless
# encoding: utf-8
      # the form has been tampered so if the params are not valid just
# encoding: utf-8
      # redirect the user to the home.
# encoding: utf-8
      if params.valid?
# encoding: utf-8
        ticket = TicketRepository.find params[:id]
# encoding: utf-8

# encoding: utf-8
        if ticket.active?
# encoding: utf-8
          action_type = action_types.key params[:action]
# encoding: utf-8

# encoding: utf-8
          action = Action.new(
# encoding: utf-8
            user_id: @current_user.id,
# encoding: utf-8
            ticket_id: ticket.id,
# encoding: utf-8
            comment: params[:comment],
# encoding: utf-8
            type: params[:action],
# encoding: utf-8
            priority: ticket.priority,
# encoding: utf-8
            new_priority: params[:priority],
# encoding: utf-8
            timestamp: Time.now.to_i
# encoding: utf-8
          )
# encoding: utf-8
          action = ActionRepository.create action
# encoding: utf-8

# encoding: utf-8
          if action_type == :solve or action_type == :close
# encoding: utf-8
            ticket.status = statuses[(action_type.to_s + 'd').to_sym]
# encoding: utf-8
          elsif action_type == :change_priority
# encoding: utf-8
            ticket.priority = params[:priority]
# encoding: utf-8
          end
# encoding: utf-8

# encoding: utf-8
          TicketRepository.update ticket
# encoding: utf-8

# encoding: utf-8
          if ticket.email_to_reply
# encoding: utf-8
            send_action_notification! ticket, action
# encoding: utf-8
          end
# encoding: utf-8
        end
# encoding: utf-8

# encoding: utf-8
        redirect_to link_to(:tickets, id: params[:id])
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      redirect_to link_to(:home)
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    private
# encoding: utf-8
    # Sends an email to notify the informer of the ticket that the
# encoding: utf-8
    # ticket has been updated with a new action of an administrator.
# encoding: utf-8
    #
# encoding: utf-8
    # @param ticket [Roberts::Model::Ticket]
# encoding: utf-8
    # @param action [Roberts::Model::Action]
# encoding: utf-8
    # @api private
# encoding: utf-8
    def send_action_notification!(ticket, action)
# encoding: utf-8
      action = Web::Presenters::ActionPresenter.new action
# encoding: utf-8
      _t = self.method :translate
# encoding: utf-8
      _l = self.method :link_to
# encoding: utf-8

# encoding: utf-8
      begin
# encoding: utf-8
        mail = Mail.new do
# encoding: utf-8
          from     ENV['MAIL_FROM']
# encoding: utf-8
          to       ticket.email_to_reply
# encoding: utf-8
          subject  _t.call('email_subject')
# encoding: utf-8

# encoding: utf-8
          html_part do
# encoding: utf-8
            content_type 'text/html; charset=UTF-8'
# encoding: utf-8
            body _t.call('email_body_html', title: ticket.title, msg: action.msg, url: ENV['APP_DOMAIN'] + _l.call(:tickets, id: ticket.id))
# encoding: utf-8
          end
# encoding: utf-8
        end
# encoding: utf-8

# encoding: utf-8
        mail.deliver!
# encoding: utf-8
      rescue
# encoding: utf-8
        puts 'Error! Could not deliver the email!'
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
