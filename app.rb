require 'bundler'
Bundler.require
#require './lib'
require 'mandrill'

module BrooklynBeefsteak
  class Website < Sinatra::Application

  # register Sinatra::Partial

    get '/' do

     erb :index
    end

    get '/contact' do

        erb :contact
    end


    post '/contact' do
      email = params[:email]
    

      m = Mandrill::API.new 'Y-FIsuPkJEwZ4jhI0hRiVQ'
      message = {  
       :subject=> "Invitation Request - #{email} ", 
       :from_name=> "Beef Dudes",  
       :text=>"#{email} ",  
       :to=>[  
         {  
           :email=> "dereksilverman@gmail.com",  
           :name=> "Derek Silverman"  
         }  
       ],  
       :html=>"#{email}",  
       :from_email=>"requests@crowdtangle.com"  
      }

      sending = m.messages.send message  
      puts sending
    
     erb :contact
    end

    get '/thankyou' do

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