class Course < ApplicationRecord
  validates :name, :type, :price, presence: true
end
