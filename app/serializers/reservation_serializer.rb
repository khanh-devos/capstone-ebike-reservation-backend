class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :starting_date, :ending_date, :location

  belongs_to :ebike, Serializer: EbikeSerializer
end
