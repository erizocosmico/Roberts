# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class ActionRepository
# encoding: utf-8
    include Lotus::Repository
# encoding: utf-8

# encoding: utf-8
    # Fetches all actions associated with a ticket in ascending order by timestamp
# encoding: utf-8
    #
# encoding: utf-8
    # @param ticket_id [Fixnum]
# encoding: utf-8
    # @return Query
# encoding: utf-8
    def self.by_ticket(ticket_id)
# encoding: utf-8
      query do
# encoding: utf-8
        where(ticket_id: ticket_id).
# encoding: utf-8
          asc(:timestamp)
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
