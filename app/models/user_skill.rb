class UserSkill < ActiveRecord::Base
  attr_accessor :skill_checked
  belongs_to :user
  belongs_to :skill
end
