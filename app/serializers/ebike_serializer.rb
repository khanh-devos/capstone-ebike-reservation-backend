class EbikeSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :city, :image
end
