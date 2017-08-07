class Menu < ApplicationRecord
  has_many :courses, dependent: :destroy

  validates :price, presence: true
end
