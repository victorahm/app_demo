class Menu < ApplicationRecord

  belongs_to :parent, class_name: 'Menu', optional: true
  has_many :submenus, class_name: 'Menu', foreign_key: 'parent_id'
  has_and_belongs_to_many :roles

  scope :roots, -> { where(parent_id: nil) }

  validates :label, presence: true
  validates :url, presence: true

  def name
    self.label
  end

end
