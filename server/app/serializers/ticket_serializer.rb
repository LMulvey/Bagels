class TicketSerializer < ActiveModel::Serializer
    attributes :id, :description, :status, :start_time, :completed_time, :created_at, :updated_at
    belongs_to :driver
    has_many :events
end