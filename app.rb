ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'


class MakersBnb < Sinatra::Base
  enable :sessions

  get '/' do
    redirect "/index"
  end

  get '/index' do
    @user = session[:user]
    erb(:index)
  end

  post '/add-listing' do
    @email = params[:email]
    @picture = params[:picture]
    erb :add_listing
    # redirect '/index'
  end

  post '/new-user' do
    session[:user] = params[:name]
    User.create(name: params[:name], email: params[:signupemail], password: params[:password])
    redirect '/index'
  end

end
