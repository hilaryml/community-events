class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  validates_presence_of :username, :email, :password

  def slug
    slugified_name = self.username.downcase.gsub(/[\s]/,"-")
  end

  def self.find_by_slug(slugified_name)
    self.all.find {|a| a.slug == slugified_name}
  end
  
end
