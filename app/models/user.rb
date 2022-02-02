class User < ApplicationRecord
    belongs_to :company
    has_many :quotes
    has_many :orders
    has_many :payments
    
end
