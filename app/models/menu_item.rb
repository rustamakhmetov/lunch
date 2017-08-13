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

  validates :price, presence: true
end
