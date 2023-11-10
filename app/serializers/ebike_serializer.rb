class EbikeSerializer < ActiveModel::Serializer
  attributes :id, :model, :name, :price, :city, :image
end
