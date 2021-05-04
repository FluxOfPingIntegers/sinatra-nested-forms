require './environment'
require 'pry'

module FormsLab
  class App < Sinatra::Base
    get '/' do

      erb :root
    end

    get '/new' do

      erb :"pirates/new"
    end

    post '/pirates' do
      # pirate = {:name => params[:pirate][:name], :weight => params[:pirate][:weight], :height => params[:pirate][:weight]}
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each {|i| Ship.new(i)}
      @ships = Ship.all

       erb :'pirates/show'
    end

    get '/pirates' do

      erb :'pirates/show'
    end


    # code other routes/actions here

  end
end
