# == Schema Information
#
# Table name: menu_items
#
#  id         :integer          not null, primary key
#  menu_id    :integer
#  course_id  :integer
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :course
  has_many :order_items, dependent: :destroy

  validates :price, presence: true

  #accepts_nested_attributes_for :course
end
