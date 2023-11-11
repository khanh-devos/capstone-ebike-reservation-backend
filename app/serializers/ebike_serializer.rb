class EbikeSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :city, :image, :seller_id, :weight, :model,
             :description, :removed, :created_at, :updated_at
end
