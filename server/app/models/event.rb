class Event < ActiveRecord::Base
  belongs_to :ticket

  enum event_type: { start: 0, pickup: 1, delivery: 2, stop: 3 }
  
  validates :event_type, presence: true
  validates_datetime :start_time, :allow_blank => true
  
end
