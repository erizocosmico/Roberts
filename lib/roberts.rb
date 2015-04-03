require 'lotus/model'

module Roberts
end

Dir["#{ __dir__ }/roberts/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  # Database adapter
  adapter type: :sql, uri: ENV['ROBERTS_DATABASE_URL']

  # Database mapping
  mapping "#{__dir__}/config/mapping"
end.load!
