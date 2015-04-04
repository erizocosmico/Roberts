module Roberts::Model
  class TicketRepository
    include Lotus::Repository

    MAX_ITEMS_PER_PAGE = 50

    # Fetches all tickets in a page.
    #
    # @param page [Fixnum]
    # @return Query
    def self.by_page(page)
      query do
        select(:id, :title, :type, :priority, :created_at, :status).
          where(status: 0)
          desc(:priority).
          desc(:created_at).
          limit(MAX_ITEMS_PER_PAGE).
          offset((page - 1) * MAX_ITEMS_PER_PAGE)
      end
    end

    # Returns the total number of ticket pages.
    #
    # @return Fixnum
    def self.num_pages
      (query.count / Float(MAX_ITEMS_PER_PAGE)).round
    end
  end
end
