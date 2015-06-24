# encoding: utf-8
require 'rubygems'
# encoding: utf-8
require 'bundler/setup'
# encoding: utf-8
require 'lotus/setup'
# encoding: utf-8
require_relative '../lib/roberts'
# encoding: utf-8
require_relative '../apps/web/application'
# encoding: utf-8

# encoding: utf-8
Lotus::Container.configure do
# encoding: utf-8
  mount Web::Application, at: '/'
# encoding: utf-8
end
# encoding: utf-8

