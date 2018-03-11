class TicketSerializer < ActiveModel::Serializer
    attributes :id, :description, :status, :start_time, :stop_time, :created_at, :updated_at
    belongs_to :driver
end