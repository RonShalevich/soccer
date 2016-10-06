class EventSerializer < ActiveModel::Serializer
  attributes :id, :game, :start_time
end
