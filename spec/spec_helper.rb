# encoding: utf-8
# Require this file for unit tests
# encoding: utf-8
ENV['LOTUS_ENV'] ||= 'test'
# encoding: utf-8

# encoding: utf-8
require_relative '../config/environment'
# encoding: utf-8
require 'minitest/autorun'
# encoding: utf-8

# encoding: utf-8
Lotus::Application.preload!
