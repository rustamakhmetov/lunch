# == Schema Information
#
# Table name: order_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  menu_item_id :integer
#  amount       :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  validates :amount, presence: true
end
