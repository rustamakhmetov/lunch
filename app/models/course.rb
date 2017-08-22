# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  kind       :integer
#

class Course < ApplicationRecord
  has_many :menu_items, dependent: :destroy

  validates :name, :kind, presence: true

  def fullname
    "[#{kind_to_sym.to_s}] #{self.name}"
  end

  def self.kind_name(kind_id)
    case kind_id
      when 0
        I18n.t("course.kind.first")
      when 1
        I18n.t("course.kind.main")
      else
        I18n.t("course.kind.drink")
    end
  end

  def self.kind_to_sym(kind_id)
    case kind_id
      when 0
        :first
      when 1
        :main
      else
        :drink
    end
  end

  private

  def kind_to_sym
    Course.kind_to_sym(self.kind)
  end
end
