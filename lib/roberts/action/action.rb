require 'time'

module Roberts::Action
  def action_types
    {
      :change_priority => 1,
      :solve => 2,
      :close => 3
    }
  end

  def statuses
    {
      :active => 0,
      :solved => 1,
      :closed => 2
    }
  end
end
