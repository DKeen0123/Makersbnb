ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require 'data_mapper'
require 'dm-postgres-adapter'


class MakersBnb < Sinatra::Base

  get '/' do
    redirect "/index"
  end

  get '/index' do
    erb(:index)
  end

  post '/add-listing' do
    @email = params[:email]
    @picture = params[:picture]
    erb :add_listing
    # redirect '/index'
  end

end
