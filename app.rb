ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'

class MakersBnb < Sinatra::Base
  enable :sessions

  # configure do
  #   set :public_folder, File.join(File.dirname('__FILE__'), 'public')
  # end

  get '/' do
    redirect "/properties"
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:signupemail], password: params[:password])
    session[:user_id] = user.id
    redirect '/properties'
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/properties' do
    Property.create(email: params[:email], url: params[:url])
    redirect '/properties'
  end

  get '/properties' do
    @user = User.get(session[:user_id])
    @properties = Property.all
    erb(:properties)
  end

  get '/properties/new' do
    erb(:property_new)
  end

  get '/sessions' do
    erb :log_in
  end

  post '/sessions/new' do
    @user = User.first(email: params[:email])
    p @user
    p params
    session[:user_id] = @user.id
    redirect '/properties'
  end
end
