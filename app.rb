require 'bundler'
Bundler.require
#require './lib'
# require 'mail'

module BrooklynBeefsteak
  class Website < Sinatra::Application

  # register Sinatra::Partial

    get '/' do
     erb :index
    end

	end
end