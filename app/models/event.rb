class Event < ActiveRecord::Base
  belongs_to :ticket

  enum status: { active: 0, completed: 1 }
  enum type: { start: 0, pickup: 1, delivery: 2, stop: 3 }
  
  validates :status, presence: true
  validates :type, presence: true
  validates :address, presence: true
  validates_datetime :start_time
  validates_datetime :stop_time
  
end
