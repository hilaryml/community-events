class User < ActiveRecord::Base
  has_many :events
  validates_presence_of :username, :email, :password 
end
