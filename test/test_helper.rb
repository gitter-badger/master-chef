ENV['RAILS_ENV'] ||= 'test'

if ENV['COVERAGE'] || ENV['CI']
  require 'simplecov'

  SimpleCov.start 'rails' do
    add_filter '/test/'
    add_filter '/config/'

    add_group 'Workers', '/app/workers'
    add_group 'Services', '/lib/services'
  end
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
#require 'minitest/pride'
require 'timecop'

MiniTest::Reporters.use!

Dir[File.expand_path('test/support/*.rb')].each { |file| require file }

require 'mocha/setup'
