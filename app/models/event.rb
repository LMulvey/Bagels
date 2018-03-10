class Event < ActiveRecord::Base
  belongs_to :ticket

  enum status: { active: 0, completed: 1 }
  enum event_type: { start: 0, pickup: 1, delivery: 2, stop: 3 }
  
  validates :status, presence: true
  validates :event_type, presence: true
  validates :address, presence: true
  validates_datetime :start_time, :allow_blank => true
  validates_datetime :stop_time, :allow_blank => true
  validates_time :stop_time, :after => :start_time, :allow_blank => true
  validates_time :start_time, :before => :stop_time, :allow_blank => true
  
end
