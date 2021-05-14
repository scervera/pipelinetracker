class Product < ApplicationRecord
  has_many :opportunities
  scope :products_by_model, -> { order('model ASC') }
end
