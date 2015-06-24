module Roberts::Model
  class ActionRepository
    include Lotus::Repository

    # Fetches all actions associated with a ticket in ascending order by timestamp
    #
    # @param ticket_id [Fixnum]
    # @return Query
    def self.by_ticket(ticket_id)
      query do
        where(ticket_id: ticket_id).
          asc(:timestamp)
      end
    end
  end
end