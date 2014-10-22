class Game < ActiveRecord::Base
  validates :superbowl, presence: true, numericality: true, uniqueness: true
  validates :winner, presence: true
  validates :winscore, presence: true, numericality: true
  validates :opponent, presence: true
  validates :oppscore, presence: true, numericality: true
  validates :gamedate, presence: true
  
end
