# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  price      :decimal(8, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  created    :date
#

class Menu < ApplicationRecord
  has_many :items, class_name: "MenuItem", dependent: :destroy

  before_create :fill_attributes

  def name
    self.created_at.strftime("%A")
  end

  def name_css
    self.name.downcase
  end

  private

  def fill_attributes
    self.created = self.created_at.to_date
  end
end
