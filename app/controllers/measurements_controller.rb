class MeasurementsController < ApplicationController

    layout "application"

  def index
    if params[:quantity]
      @measurements = Measurement.quantity_search(params[:quantity])
    else
      @measurements = Measurement.all
    end
  end

  def new
    @measurement = Measurement.new
    @items = Item.all
  end

  def create
    @measurement = Measurement.create(measurement_params)

    redirect_to items_path
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
