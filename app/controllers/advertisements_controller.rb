class AdvertisementsController < ApplicationController
  def index # shows all the advertisments
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new # creates a new ad but does not save it to the database yet
    @advertisement = Advertisement.new
  end

  def create # creates and pushes through a new ad and saves it into the database
    @advertisement = Advertisement.new

    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement was created and saved successfully."
      redirect_to @advertisement
    else
      flash[:error] = "Unable to save advertisement please try again later"
      render :new
    end

  end
end
