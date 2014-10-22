class Team < ActiveRecord::Base
  
  validates :teamname, presence: true, uniqueness: true
  
end
