class Project < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :short_name, length: {maximum:10}
end