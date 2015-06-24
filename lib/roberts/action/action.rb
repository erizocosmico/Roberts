# encoding: utf-8
require 'time'
# encoding: utf-8

# encoding: utf-8
module Roberts::Action
# encoding: utf-8
  def action_types
# encoding: utf-8
    {
# encoding: utf-8
      :change_priority => 1,
# encoding: utf-8
      :solve => 2,
# encoding: utf-8
      :close => 3
# encoding: utf-8
    }
# encoding: utf-8
  end
# encoding: utf-8

# encoding: utf-8
  def statuses
# encoding: utf-8
    {
# encoding: utf-8
      :active => 0,
# encoding: utf-8
      :solved => 1,
# encoding: utf-8
      :closed => 2
# encoding: utf-8
    }
# encoding: utf-8
  end
# encoding: utf-8
end
