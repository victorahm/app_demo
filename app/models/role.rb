class Role < ApplicationRecord
  validates :name, presence: true

  scope :search, ->(query) { where("name like :query or description like :query", query: "%#{query}%") }

  has_many :users
end
