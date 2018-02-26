ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require 'data_mapper'
require 'dm-postgres-adapter'


class MakersBnb < Sinatra::Base

  get '/' do
    redirect "/properties/new"
  end

  get '/properties/new' do
    erb(:index)
  end

  post '/properties' do
    Property.create(email: params[:email], url: params[:url])
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    erb(:properties)
  end

end
