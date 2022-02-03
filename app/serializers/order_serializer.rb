class OrderSerializer < ActiveModel::Serializer
  attributes :subtotal, :tax, :total
end
