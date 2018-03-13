class Ticket < ActiveRecord::Base
  belongs_to :driver
  has_many :events, :dependent => :destroy
  
  validates :status, presence: true
  enum status: { active: 0, completed: 1 }

  validates :description, presence: true
  validates_datetime :start_time, :allow_blank => true
  validates_datetime :completed_time, :allow_blank => true
  validates_datetime :completed_time, :after => :start_time, :allow_blank => true
  validates_datetime :start_time, :before => :completed_time, :allow_blank => true
end