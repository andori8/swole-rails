class Category < ApplicationRecord
  has_many :exercises
  validates :name, uniqueness: true
end
