class Event < ActiveRecord::Base
  belongs_to :user
  validate_presence_of :title, :date, :time, :description, :contact
end
