class QuotedProduct < ApplicationRecord
    belongs_to :quote
    belongs_to :product
end
