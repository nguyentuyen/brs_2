class Skill < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :level, presence: true
  validates :num_years, presence: true
end
