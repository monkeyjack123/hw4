class EntriesController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]

    if params["image"] != nil
      @entry.image.attach(params["image"])
    end

    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}"
    else
      render :new, status: :unprocessable_entity
    end
  end
end