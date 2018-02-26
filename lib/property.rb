require 'data_mapper'
require 'dm-postgres-adapter'

class Property

  include DataMapper::Resource

  property :id, Serial
  property :email, String, length: 80
  property :url, String, length: 250

end

DataMapper.setup(:default, "postgres://localhost/bnb_test")
DataMapper.finalize
DataMapper.auto_upgrade!
