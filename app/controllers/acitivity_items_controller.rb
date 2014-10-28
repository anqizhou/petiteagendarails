class AcitivityItemsController < ApplicationController
  before_action :set_acitivity_item, only: [:show, :edit, :update, :destroy]

  # GET /acitivity_items
  # GET /acitivity_items.json
  def index
    @acitivity_items = AcitivityItem.all
  end

  # GET /acitivity_items/1
  # GET /acitivity_items/1.json
  def show
  end

  # GET /acitivity_items/new
  def new
    @acitivity_item = AcitivityItem.new
  end

  # GET /acitivity_items/1/edit
  def edit
  end

  # POST /acitivity_items
  # POST /acitivity_items.json
  def create
    @acitivity_item = AcitivityItem.new(acitivity_item_params)

    respond_to do |format|
      if @acitivity_item.save
        format.html { redirect_to @acitivity_item, notice: 'Acitivity item was successfully created.' }
        format.json { render :show, status: :created, location: @acitivity_item }
      else
        format.html { render :new }
        format.json { render json: @acitivity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acitivity_items/1
  # PATCH/PUT /acitivity_items/1.json
  def update
    respond_to do |format|
      if @acitivity_item.update(acitivity_item_params)
        format.html { redirect_to @acitivity_item, notice: 'Acitivity item was successfully updated.' }
        format.json { render :show, status: :ok, location: @acitivity_item }
      else
        format.html { render :edit }
        format.json { render json: @acitivity_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acitivity_items/1
  # DELETE /acitivity_items/1.json
  def destroy
    @acitivity_item.destroy
    respond_to do |format|
      format.html { redirect_to acitivity_items_url, notice: 'Acitivity item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acitivity_item
      @acitivity_item = AcitivityItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acitivity_item_params
      params.require(:acitivity_item).permit(:activity_name, :activity_date, :starting_time, :ending_time, :activity_note, :activity_starred, :calendar_user_id)
    end
end
