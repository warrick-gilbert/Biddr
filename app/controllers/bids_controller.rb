class BidsController < ApplicationController

  def new
    
  end

  def create
    # render text: params 

    @auction = Auction.find params[:auction_id]
    @bid = Bid.new bid_params

    @bid.auction = @auction

    if (@bid.amount.to_i > @auction.amount.to_i) # bid is bigger than current amount
        # change the bid to only be $1 more than previous
        @bid.amount = @auction.amount + 1

      if @bid.save
        # update the current amount of the auction by only 1
        @auction.amount += 1
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
    else # if your bid is too little
        flash[:alert] = "Your bid is too small!"
        redirect_to auction_path(@auction)
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)  
  end
end