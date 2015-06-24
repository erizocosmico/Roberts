# encoding: utf-8
module Roberts::Ticket
# encoding: utf-8
  Priority = Struct.new(:name, :value)
# encoding: utf-8

# encoding: utf-8
  def priorities
# encoding: utf-8
    [
# encoding: utf-8
      Priority.new("very_low", 0),
# encoding: utf-8
      Priority.new("low", 1),
# encoding: utf-8
      Priority.new("medium", 2),
# encoding: utf-8
      Priority.new("high", 3),
# encoding: utf-8
      Priority.new("very_high", 4)
# encoding: utf-8
    ]
# encoding: utf-8
  end
# encoding: utf-8
end
