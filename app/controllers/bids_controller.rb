class BidsController < ApplicationController

  def new
    
  end

  def create
    # render text: params 

    @auction = Auction.find params[:auction_id]
    @bid = Bid.new bid_params

    @bid.user = current_user
    @bid.auction = @auction

    # check to see if the bidder is the owner of the auction
    if current_user == @auction.user
      flash[:alert] = "You can't bid on your own auction!"
      redirect_to auction_path(@auction)
    else
      # if your bid is too little then stop here
      if (@bid.amount.to_i <= @auction.amount.to_i ) 
        flash[:alert] = "Your bid is too small!"
        redirect_to auction_path(@auction)
      else  
          # change the bid to only be $1 more than previous
          @bid.amount = @auction.amount + 1

        if @bid.save
          # update the current amount of the auction to the new bid
          @auction.amount = @bid.amount
          # check to see if the bid is equal to reserve, then change state
          if (@bid.amount >= @auction.reserve && @auction.published?)
            @auction.fund!
          end

          @auction.save
          redirect_to @auction, notice: "Bid created!"
        else
          flash[:alert] = "bid Not Created!"
          redirect_to auction_path(@auction)
        end
        
      
      end
    end
  end

  def index
    # this is just to show the user's bids
    @user = User.find_by_id(current_user.id).username
    @bids = Bid.where(user_id: current_user.id)
    # render text: @bids.last.amount
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)  
  end
end