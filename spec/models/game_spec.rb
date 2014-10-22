require 'rails_helper'

RSpec.describe Game, :type => :model do
  it 'has a valid factory' do
    FactoryGirl.create(:game).should be_valid  
  end
  
  #it 'has valid entries' do
  #  FactoryGirl.build(:game, :superbowl=> nil).should_not be_valid    
  #end
  
  #testing a game with invalid attributes
  it 'does not allow invalid entries' do
    game = FactoryGirl.build(:invalid_game)
    game.should_not be_valid
  end

end
