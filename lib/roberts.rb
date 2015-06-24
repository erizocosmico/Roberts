# encoding: utf-8
require 'lotus/model'
# encoding: utf-8

# encoding: utf-8
module Roberts
# encoding: utf-8
end
# encoding: utf-8

# encoding: utf-8
Dir["#{ __dir__ }/roberts/**/*.rb"].each { |file| require_relative file }
# encoding: utf-8

# encoding: utf-8
Lotus::Model.configure do
# encoding: utf-8
  # Database adapter
# encoding: utf-8
  adapter type: :sql, uri: ENV['ROBERTS_DATABASE_URL']
# encoding: utf-8

# encoding: utf-8
  # Database mapping
# encoding: utf-8
  mapping "#{__dir__}/config/mapping"
# encoding: utf-8
end.load!
