class Client < ActiveRecord::Base
  validates_presence_of :source_app, :api_key
end
