class Team < ActiveRecord::Base
  validates :name, presence: true, length: {  maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :id_leader, presence: true
end
