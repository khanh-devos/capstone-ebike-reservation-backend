class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :formated_starting_date,
             :formated_ending_date, :location

  belongs_to :ebike, Serializer: EbikeSerializer
end
