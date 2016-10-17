class User < ActiveRecord::Base
  has_many :events
  validate_presence_of :username, :email, :password 
end
