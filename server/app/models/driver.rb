class Driver < ActiveRecord::Base
  has_many :tickets, :dependent => :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
end

