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

        erb :contact
    end

    post '/contact' do
        full_name = params[:full_name]
        email = params[:email]
        message = params[:message]

      m = Mandrill::API.new 'Y-FIsuPkJEwZ4jhI0hRiVQ'
      message = {  
       :subject=> "Beefsteak Signup - #{email} (#{full_name}) ", 
       :from_name=> "Beef Dudes",  
       :text=>"#{message}",  
       :to=>[  
         {  
           :email=> "dereksilverman@gmail.com",  
           :name=> "Derek Silverman" 
         }  
       ],  
       :html=>"#{message}",  
       :from_email=>"info@brooklynbeefsteak.com"  
      }

      sending = m.messages.send message  
      puts sending
    

        erb :thankyou
    end



    post '/' do
      email = params[:email]
    
      m = Mandrill::API.new 'Y-FIsuPkJEwZ4jhI0hRiVQ'
      message = {  
       :subject=> "Beefsteak Signup - #{email} ", 
       :from_name=> "Beef Dudes",  
       :text=>"#{email} ",  
       :to=>[  
         {  
           :email=> "dereksilverman@gmail.com",  
           :name=> "Derek Silverman"  
         }  
       ],  
       :html=>"#{email}",  
       :from_email=>"info@brooklynbeefsteak.com"  
      }

      sending = m.messages.send message  
      puts sending
    
     erb :thankyou
    end

    get '/history' do

     erb :history
    end

    get '/press' do

     erb :press
    end

	end
end