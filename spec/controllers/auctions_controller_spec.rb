require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "new action" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
        
    it "assigns a new user instance variable" do
      get :new
      expect(assigns(:auction)).to be_a_new(Auction)
    end
  end

  describe "index action" do
    it "shows the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
    
  # let(:user)      { create(:user)     }
  # let(:auction)   { create(:auction, user: user) }

  describe "create action" do
  
    def valid_auction
          post :create, {auction: {
                        title: "valid title",
                        body: "valid descritpion",
                        amount: 10,
                        reserve: 20,
                        closing_date: (Time.now + 10.days)
                        }}
        end

        it "adds an auction to the database" do
          expect { valid_auction }.to change { Auction.count }.by(1)
        end

        it "redirects to that auctions show page" do
          valid_auction
          expect(response).to redirect_to(auction_path(Auction.last))
        end

        # it "sets a flash message" do
        #   valid_request
        #   expect(flash[:notice]).to be
        # end
      end

  describe "#show" do
    # it "assigns an auction instance variable with passed id" do
    #   get :show, id: Auction.last.id
    #   expect(assigns(:auction)).to eq(auction)
    # end

    # it "renders the show template" do
    #   get :show, id: campaign.id
    #   expect(response).to render_template(:show)
    # end
  end

end
