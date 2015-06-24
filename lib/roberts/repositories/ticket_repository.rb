# encoding: utf-8
module Roberts::Model
# encoding: utf-8
  class TicketRepository
# encoding: utf-8
    include Lotus::Repository
# encoding: utf-8

# encoding: utf-8
    MAX_ITEMS_PER_PAGE = 50
# encoding: utf-8

# encoding: utf-8
    # Fetches all tickets in a page.
# encoding: utf-8
    #
# encoding: utf-8
    # @param page [Fixnum]
# encoding: utf-8
    # @return Query
# encoding: utf-8
    def self.by_page(page)
# encoding: utf-8
      query do
# encoding: utf-8
        select(:id, :title, :type, :priority, :created_at, :status).
# encoding: utf-8
          where(status: 0)
# encoding: utf-8
          desc(:priority).
# encoding: utf-8
          desc(:created_at).
# encoding: utf-8
          limit(MAX_ITEMS_PER_PAGE).
# encoding: utf-8
          offset((page - 1) * MAX_ITEMS_PER_PAGE)
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    # Returns the total number of ticket pages.
# encoding: utf-8
    #
# encoding: utf-8
    # @return Fixnum
# encoding: utf-8
    def self.num_pages
# encoding: utf-8
      (query.count / Float(MAX_ITEMS_PER_PAGE)).round
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
