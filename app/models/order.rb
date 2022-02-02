class Order < ApplicationRecord
    belongs_to :user
    has_many :payments
    has_many :quotes
end
