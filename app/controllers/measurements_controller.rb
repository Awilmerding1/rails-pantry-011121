class MeasurementsController < ApplicationController
    before_action(:require_login)
    before_action(:show_helper, only: [:edit, :update])
      before_action(:index_helper, only: :index)
    layout "application"

  def index
    if params[:quantity]
      @measurements = Measurement.quantity_search(params[:quantity])
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
      flash[:message] = "Successfully created!"
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

  def edit
    if @measurement.user != current_user
      flash[:message] = "That is not your measurement!"
      redirect_to '/measurements'
    end
      # @items = Item.all
  end

  def update

    if @measurement.update(measurement_params)
      redirect_to measurements_path
    else
        # @items = Item.all
      render :edit
    end
  end


  private

  def measurement_params
    params.require(:measurement).permit(:quantity, :unit, :item_id)
  end

  def set_measurement
        @measurement = Measurement.find_by(id: params[:id])
  end

end
