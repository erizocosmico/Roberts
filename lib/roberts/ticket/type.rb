module Roberts::Ticket
  TicketType = Struct.new(:name, :value)

  def types
    [
      TicketType.new("bug", 0),
      TicketType.new("question", 1),
      TicketType.new("task", 2),
      TicketType.new("other", 3)
    ]
  end
end
