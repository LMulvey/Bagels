class Ticket < ActiveRecord::Base
  belongs_to :driver
  has_many :events
  
  validates :status, presence: true
  enum status: { active: 0, completed: 1 }

  validates :description, presence: true
  validates_datetime :start_time
  validates_datetime :stop_time

end
