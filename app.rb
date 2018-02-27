ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require './lib/user'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'react-sinatra'


class MakersBnb < Sinatra::Base
  enable :sessions
  register React::Sinatra

  configure do
    React::Sinatra.configure do |config|
      config.use_bundled_react = true
      config.env = ENV["ENVIRONEMENT"] || :development
      config.addon = true

      config.asset_path = File.join("node_modules", "react", "dist", "*.js")
      config.runtime = :execjs
    end
  end

  get '/' do
    redirect "/index"
  end

  get '/react-test' do
    @component = react_component("Hello", {name: "Josh"}, prerender: true)
    erb :react_test
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
