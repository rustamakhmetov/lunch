# == Schema Information
#
# Table name: courses
#
#  id           :integer          not null, primary key
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  kind         :integer
#  menu_item_id :integer
#

class Course < ApplicationRecord
  has_many :menu_items, dependent: :destroy

  validates :name, :kind, presence: true

  def fullname
    "[#{kind_to_sym.to_s}] #{self.name}"
  end

  private

  def kind_to_sym
    case self.kind
      when 0
        :first
      when 1
        :main
      else
        :drink
    end
  end
end
