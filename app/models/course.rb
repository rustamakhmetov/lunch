class Course < ApplicationRecord
  belongs_to :menu

  validates :name, :type, :price, presence: true
end
