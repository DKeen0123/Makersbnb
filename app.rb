ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'


class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    redirect "/properties/new"
  end

<<<<<<< HEAD
  get '/properties/new' do
    erb(:property_new)
=======
  get '/index' do
    @user = session[:user]
    erb(:index)
>>>>>>> user-class
  end

  post '/properties' do
    Property.create(email: params[:email], url: params[:url])
    redirect '/properties'
  end

  get '/properties' do
    @properties = Property.all
    erb(:properties)
  end

  post '/new-user' do
    session[:user] = params[:name]
    User.create(name: params[:name], email: params[:signupemail], password: params[:password])
    redirect '/index'
  end

end
