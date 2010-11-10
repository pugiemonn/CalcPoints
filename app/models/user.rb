class User < ActiveRecord::Base
  has_many :points
  has_many :logs
  has_many :spent_points
  has_many :timelines
end
