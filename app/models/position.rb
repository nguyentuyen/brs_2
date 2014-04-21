class Position < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 },
                   uniqueness: { case_sensitive: false }
  validates :short_name, presence:true, length: { maximum: 10 },
                         uniqueness: { case_sensitive: false }
end
