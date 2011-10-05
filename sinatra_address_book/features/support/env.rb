# Generated by cucumber-sinatra. (2011-10-05 23:56:54 +0200)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'address_book.rb')

require 'rspec'
require 'rack/test'

#Capybara.app = AddressBook

class AddressBookWorld
  include RSpec::Expectations
  include RSpec::Matchers
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

World do
  AddressBookWorld.new
end

class String
  def constantize
    split('::').inject(Object) {|memo,name| memo =  memo.const_get(name); memo}
  end
end