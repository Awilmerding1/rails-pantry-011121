class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @item.measurements.build 
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to item_path(@item)
    else
      # redirect_to new_item_path
      @errors = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to(item_path(@item))
    else
      @errors = @item.errors.full_messages
      render :edit
    end
  end


  def destroy
    item = Item.find_by(id: params[:id])
    item.delete
    redirect_to items_path
  end


  private

    def item_params
      params.require(:item).permit(:name, measurements_attributes: [:unit, :quantity])
    end


end
