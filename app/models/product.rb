class Product < ApplicationRecord
    has_many :quoted_products
    has_many :quotes, through: :quoted_products
end
