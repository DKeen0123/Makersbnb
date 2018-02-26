ENV["ENVIRONMENT"] ||= "development"
require 'sinatra/base'
require './lib/property'
require 'data_mapper'
require 'dm-postgres-adapter'


class MakersBnb < Sinatra::Base
  
end