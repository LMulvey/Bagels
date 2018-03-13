class EventSerializer < ActiveModel::Serializer
    attributes :id, :description, :event_type, :address, :start_time, :created_at, :updated_at
    belongs_to :ticket
end