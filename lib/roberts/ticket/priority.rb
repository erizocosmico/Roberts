module Roberts::Ticket
  Priority = Struct.new(:name, :value)

  def priorities
    [
      Priority.new("very_low", 0),
      Priority.new("low", 1),
      Priority.new("medium", 2),
      Priority.new("high", 3),
      Priority.new("very_high", 4)
    ]
  end
end