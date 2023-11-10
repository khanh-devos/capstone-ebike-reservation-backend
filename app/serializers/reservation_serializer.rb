class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :formated_book_date, :location

  belongs_to :ebike, Serializer: EbikeSerializer
end
