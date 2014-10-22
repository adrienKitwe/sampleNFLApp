require 'rails_helper'

describe "Games" do
  describe "Manage games" do
    it "Adds a new game and displays the results" do
      visit games_url
      expect{
        click_link 'New Game'
        fill_in "Superbowl", with: "1"
        fill_in 'Winner', with: "Green Bay Packers"
        fill_in 'Winscore', with: "35"
        fill_in 'Opponent', with: "Oakland Raiders"
        fill_in 'Oppscore', with: "14"
        select '1967', from: 'game[gamedate(1i)]'
        select 'January', from: 'game[gamedate(2i)]'
        select '12', from: 'game[gamedate(3i)]'
        select 'NFC', from: 'game[winconf]'
        click_button "Create Game"
      }.to change(Game, :count).by(1)
      page.should have_content(:notice)
      page.should have_content(:superbowl)
      #page.should redirect_to('game#show')
      #current_path.should eq(game_path)
      #within 'h1' do
      #  page.should have_content "1"
      #end
    end
  end
  
  it "Deletes a game" do
    game = FactoryGirl.create(:game)
    visit games_path
    expect{
      within("#game_#{game.id}") do
        click_link 'Destroy'
      end
    }.to change(Game, :count).by(-1)
    page.should have_content "All SuperBowl Games"
    
  end
end