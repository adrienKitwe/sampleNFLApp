require 'rails_helper'
require 'games_controller'

RSpec.describe GamesController, :type => :controller do
  render_views  
  
  describe "GET #index" do
    it "populates games array" do
      game = FactoryGirl.create(:game)
      get :index
      expect(assigns(:games)).to eq([game])
    end
    
    it "renders index view" do
      get :index
      expect(response).to render_template(:index)
    end 
  end
  #END INDEX
  
  describe "GET #show" do
    it "assigns the requested game" do
      game = FactoryGirl.create(:game)
      get :show, id: game
      expect(assigns(:game)).to eq(game)
    end
    
    it "renders the show view" do
      get :show, id: FactoryGirl.create(:game)
      expect(response).to render_template :show
    end
  end
  #END SHOW
  
  describe "GET #edit" do
    before :each do
      @game = FactoryGirl.create(:game)
    end
    subject {get :edit, id: @game, game: FactoryGirl.attributes_for(:game)}
    it "responds successfully" do
      expect(response).to be_success
    end
    
    it "renders the edit template" do
      expect(subject).to render_template("games/edit")
    end

  end
  #END EDIT
  
  describe "POST #create" do
    context "with valid attributes" do
      subject {post :create, game: FactoryGirl.attributes_for(:game)}
      
      it "creates a new game" do
        expect{ subject }.to change{Game.count}.by(1)
      end
      
      it "redirects to game page" do
        expect(subject).to redirect_to (game_path(assigns(:game)))
      end
      
      it "displays a success message" do
        expect(subject.request.flash[:notice]).to_not be_nil
      end
    end
    
    context "with invalid attributes" do
      subject {post :create, game: FactoryGirl.attributes_for(:invalid_game)}
      it "does not save invalid entries" do
        expect{ subject }.to_not change{Game.count}
      end
      it "redirects to new page" do
        expect(subject).to render_template :new
      end
    end  
  end
  #END CREATE
  
  describe "PUT #update" do
    before :each do
      @game = FactoryGirl.create(:game)
    end
    
    context "with valid attributes" do
      it "located the requested @game" do
        put :update, id: @game, game: FactoryGirl.attributes_for(:game)
        assigns(:game).should eq(@game)
      end
      
      it "changes @game attributes" do
        put :update, id: @game,
        game: FactoryGirl.attributes_for(:game, winner: "Belleville Bulls")
        @game.reload
        @game.winner.should eq("Belleville Bulls")
        
      end
      
      it "redirects to the updated contact" do
        put :update, id: @game, game: FactoryGirl.attributes_for(:game)
        response.should redirect_to @game
      end
      
    end
    #end valid attributes
    
    context "with invalid attributes" do
      it "located the requested @game" do
        put :update, id: @game, game: FactoryGirl.attributes_for(:game)
        assigns(:game).should eq(@game)
      end
      
      it "does not change the game attributes" do
        put :update, id: @game,
        game: FactoryGirl.attributes_for(:game, superbowl: nil, winner: nil)
        @game.reload
        @game.superbowl.should_not eq(nil)
        @game.winner.should_not eq(nil)
      end
      
      it "renders the edit template" do
        put :update, id: @game, game: FactoryGirl.attributes_for(:invalid_game)
        response.should render_template :edit
      end
      
    end
    #end invalid attributes
  end
  #END UPDATE
  
  describe "DELETE destroy" do
    before :each do
      @game = FactoryGirl.create(:game)
    end
    
    it "deletes the game" do
      expect{
        delete :destroy, id: @game
      }.to change(Game, :count).by(-1)
    end
    
    it "redirects to index" do
      delete :destroy, id: @game
      expect(response).to redirect_to :games
    end
    
    it "displays message" do
      expect(:notice).to_not be_nil
    end
  end
  #END DELETE

end
