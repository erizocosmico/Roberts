# encoding: utf-8
module Roberts::Ticket
# encoding: utf-8
  TicketType = Struct.new(:name, :value)
# encoding: utf-8

# encoding: utf-8
  def types
# encoding: utf-8
    [
# encoding: utf-8
      TicketType.new("bug", 0),
# encoding: utf-8
      TicketType.new("question", 1),
# encoding: utf-8
      TicketType.new("task", 2),
# encoding: utf-8
      TicketType.new("other", 3)
# encoding: utf-8
    ]
# encoding: utf-8
  end
# encoding: utf-8
end
