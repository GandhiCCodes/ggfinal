class PlacesController < ApplicationController
  before_action :require_login

  def index
    if session[:user_id]
      @places = Place.where(user_id: session[:user_id]) # Show only logged-in user's places
    else
      @places = [] # Empty array if no user is logged in
      flash[:notice] = "You must be logged in to view places."
      redirect_to "/login"
    end
  end

  def show
    @place = Place.find_by(id: params[:id])
    @entries = Entry.where(place_id: @place.id)
  end

  def new
    @place = Place.new
  end

  def create
    if session[:user_id]
      @place = Place.new(place_params)  # Use strong params
      @place.user_id = session[:user_id] # Assign logged-in user

      if @place.save
        redirect_to "/places"
      else
        flash[:notice] = "Error creating place."
        render :new
      end
    else
      flash[:notice] = "You must be logged in to add a new place."
      redirect_to "/login"
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :image)  # Allow image uploads
  end
end
