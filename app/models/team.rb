class Team < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :projects, dependent: :destroy
  validates :name, presence: true, length: {  maximum: 50 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :id_leader, presence: true
end
