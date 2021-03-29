class MeasurementsController < ApplicationController
    before_action(:require_login)
    layout "application"

  def index
    if params[:quantity]
      @measurements = Measurement.quantity_search(params[:quantity])
    else
      @measurements = Measurement.all
    end
  end

  def new
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      @measurement = @item.measurements.build
      @items = Item.all
    else
      @measurement = Measurement.new
      @items = Item.all
    end

  end

  def create
    @measurement = Measurement.create(measurement_params)
    @measurement.user = current_user
    if params[:item_id]
      @measurement.item_id = params[:item_id]
    end
    if @measurement.save
      redirect_to items_path
    else
        @items = Item.all
       render :new
    end
    # if @measurement.save
    #     redirect_to item_path(@item)
    # else
    #   # redirect_to new_item_path
    #   @errors = @item.errors.full_messages
    #   render :new
    # end
  end



  private

  def measurement_params
    params.require(:measurement).permit(:quantity, :unit, :item_id)
  end

end
