class ItemsController < ApplicationController

  before_action(:set_item, except: [:index, :new, :create])

  layout "application"

  def index
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      @items = user.items
    else
      @items = Item.all
    end
  end

  def show

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

  end

  def update

    if @item.update(item_params)
      redirect_to(item_path(@item))
    else
      @errors = @item.errors.full_messages
      render :edit
    end
  end


  def destroy
    @item.delete
    redirect_to items_path
  end


  private

    def item_params
      params.require(:item).permit(:name, measurements_attributes: [:unit, :quantity])
    end

    def set_item
      @item = Item.find_by(id: params[:id])
    end


end
