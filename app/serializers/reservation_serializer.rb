class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :formated_starting_date, :formated_ending_date, :location

  belongs_to :ebike, Serializer: EbikeSerializer
end
