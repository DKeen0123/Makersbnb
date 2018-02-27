ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'

class MakersBnb < Sinatra::Base
  enable :sessions
  register React::Sinatra

  configure do
    React::Sinatra.configure do |config|
      config.use_bundled_react = true
      config.en = ENV["ENVIRONEMENT"] || :development
      config.addon = true

      config.asset_path = File.join("client", "dist", "server.js")
      config.runtime = :execjs
    end
  end

  get '/' do
    redirect "/index"
  end


  get '/properties/new' do
    erb(:property_new)
  end

  get '/index' do
    @user = session[:user]
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

  post '/new-user' do
    session[:user] = params[:name]
    User.create(name: params[:name], email: params[:signupemail], password: params[:password])
    redirect '/index'
  end

end
