class User < ApplicationRecord
  belongs_to :role

  validates :name, presence: true

  scope :search, ->(query) { where("name like :query or company like :query", query: "%#{query}%") }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :validatable
end
