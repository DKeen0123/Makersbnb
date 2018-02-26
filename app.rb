require 'sinatra/base'

class MakersBnb < Sinatra::Base
  
  get '/' do 
    erb(:index)
  end

end