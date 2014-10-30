class ActivityItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_activity_item, only: [:show, :edit, :update, :destroy]

  # GET /activity_items
  # GET /activity_items.json
  def index
    @activity_items = ActivityItem.all
  end

  # GET /activity_items/1
  # GET /activity_items/1.json
  def show
  end

  # GET /activity_items/new
  def new
    @activity_item = ActivityItem.new
  end

  # GET /activity_items/1/edit
  def edit
  end

  # POST /activity_items
  # POST /activity_items.json
  def create
    @activity_item = ActivityItem.new(activity_item_params)
    #Changing @activity_item (object)'s activity_date property (method) and assign it to the parsed param. Because params is a hash, so we use the has syntax.
    @activity_item.activity_date = Date.parse(activity_item_params[:activity_date])
    binding.pry
    respond_to do |format|
      if @activity_item.save
        format.html { redirect_to @activity_item, notice: 'Activity item was successfully created.' }
        format.json { render :show, status: :created, location: @activity_item }
      else
        format.html { render :new }
        format.json { render json: @activity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_items/1
  # PATCH/PUT /activity_items/1.json
  def update
    respond_to do |format|
      if @activity_item.update(activity_item_params)
        format.html { redirect_to @activity_item, notice: 'Activity item was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_item }
      else
        format.html { render :edit }
        format.json { render json: @activity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_items/1
  # DELETE /activity_items/1.json
  def destroy
    @activity_item.destroy
    respond_to do |format|
      format.html { redirect_to activity_items_url, notice: 'Activity item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_item
      @activity_item = ActivityItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_item_params
      params.require(:activity_item).permit(:activity_item, :activity_date, :starting_time, :ending_time, :activity_note, :activity_starred, :user_id, :activity_color)
    end
end
