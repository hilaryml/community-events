class Event < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, :date, :time, :location, :description, :contact
end
