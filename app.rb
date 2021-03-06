require 'bundler'
Bundler.require
#require './lib'
require 'mandrill'
require 'date'

module BrooklynBeefsteak
  class Website < Sinatra::Application

  # register Sinatra::Partial

    get '/' do

    t = Date.new(2014,04,13)
    now = Date.today
    @days = t - now


     erb :index
    end

    get '/contact' do

        erb :index
    end

    post '/contact' do
      full_name = params[:full_name]
      email = params[:email]
      message = params[:message]

      m = Mandrill::API.new ENV['MANDRILL_APIKEY']
      message = {  
       :subject=> "Beefsteak Contact Form - #{email} (#{full_name}) ", 
       :from_name=> "Beef Dudes",  
       :text=>"#{message}",  
       :to=>[  
         {  
           :email=> "dereksilverman@gmail.com",
           :name=> "Derek Silverman" 
         }  
       ],  
       :html=>"#{message}",  
       :from_email=>"derek@brooklynbeefsteak.com"  
      }

      sending = m.messages.send message  
      puts sending
    

        erb :index
    end



    post '/' do
      email = params[:email]

       t = Date.new(2014,04,13)
      now = Date.today
      @days_thanks = t - now
    
      m = Mandrill::API.new '0WAqGvA7RIUp0g4fMm0CBg'
      message = {  
       :subject=> "#{email}", 
       :from_name=> "Beef Dudes",  
       :text=>"#{email}",  
       :to=>[  
         {  
           :email=> "dereksilverman@gmail.com",  
           :name=> "Derek Silverman"  
         }  
       ],  
       :html=>"#{email}",  
       :from_email=>"derek@brooklynbeefsteak.com"  
      }

      sending = m.messages.send message  
      puts sending
    
     erb :index
    end


    get '/history' do

     erb :history
    end

    get '/press' do

     erb :press
    end


    get '/stats' do

     erb :stats
    end

	end
end