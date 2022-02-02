class Quote < ApplicationRecord
    belongs_to :user
    belongs_to :order, optional: true
    has_many :quoted_products
    has_many :products, through: :quoted_products
end
