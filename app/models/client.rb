class Client < ActiveRecord::Base
	has_many :notifications, foreign_key: 'source_app', primary_key: 'source_app'
  validates_presence_of :source_app, :api_key
end
