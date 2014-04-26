class Project < ActiveRecord::Base
  has_many :user_projects
  has_many :users, through: :user_projects
  belongs_to :team
  validates :name, presence: true, length: { maximum: 50 }
end
