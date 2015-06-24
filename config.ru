Encoding.default_external = Encoding::UTF_8
require './config/environment'

run Lotus::Container.new
