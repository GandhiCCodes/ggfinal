class EntriesController < ApplicationController
  before_action :require_login 

  def new
    @entry = Entry.new
    @entries = Entry.where(place_id: params[:place_id])  # Fetch only relevant entries
  end
  

  

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
