class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :datetime, :location, :description, :contact
end
