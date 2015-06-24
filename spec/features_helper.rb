# encoding: utf-8
# Require this file for feature tests
# encoding: utf-8
require_relative './spec_helper'
# encoding: utf-8

# encoding: utf-8
require 'capybara'
# encoding: utf-8
require 'capybara/dsl'
# encoding: utf-8

# encoding: utf-8
Capybara.app = Lotus::Container.new
# encoding: utf-8

# encoding: utf-8
class MiniTest::Spec
# encoding: utf-8
  include Capybara::DSL
# encoding: utf-8
end
