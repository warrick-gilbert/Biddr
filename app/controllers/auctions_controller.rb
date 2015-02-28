class AuctionsController < ApplicationController

  def new
    @auction = Auction.new    
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      # render text: @auction.id
      redirect_to @auction, notice: "Auction created!"
    else
      flash[:alert] = "Auction Not Created!"
      render :new
    end
  end

  def index
    @auctions = Auction.all
    # render text: @auctions
  end

  def show
    # render text: params
    @auction = Auction.find params[:id]
    @bid = Bid.new
    @bids = @auction.bids.order("created_at DESC")
    # @question = Question.friendly.find params[:id]
  end

  def edit
    @auction = Auction.find params[:id]
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      redirect_to auction_path(@auction), notice: "auction Updated!"
    else
      flash[:alert] = "auction didn't update"
      render :edit
    end
  end

  def destroy
    @auction = Auction.find params[:id]
    @auction.destroy
    redirect_to root_path, notice: "auction deleted!"
    
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :body, 
                                    :amount, :reserve,
                                    :closing_date)  
  end
end
