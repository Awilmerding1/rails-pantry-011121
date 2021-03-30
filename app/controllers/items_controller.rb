class ItemsController < ApplicationController

  before_action(:set_item, except: [:index, :new, :create])
  before_action(:require_login)

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
    @item.measurements.build(user: current_user)
    @item.measurements.build(user: current_user)
    @measurements = @item.measurements.select{|m| m.user_id == current_user.id}
  end

  def create
    @item = Item.new(item_params)
    @item.measurements.each {|m| m.user = current_user}
    # binding.pry
    if @item.save
        redirect_to item_path(@item)
    else
      @measurements = @item.measurements.select{|m| m.user_id == current_user.id}
      render :new
    end
  end

  def edit
      @measurements = @item.measurements.where(user_id: current_user.id)
  end

  def update
    # binding.pry
    if @item.update(item_params)
      redirect_to(item_path(@item))
    else
      @measurements = @item.measurements.select{|m| m.user_id == current_user.id}
      render :edit
    end
  end


  def destroy
    @item.delete
    redirect_to items_path
  end


  private

    def item_params
      params.require(:item).permit(:name, measurements_attributes: [:unit, :quantity, :user_id, :id])
    end

    def set_item
      @item = Item.find_by(id: params[:id])
    end


end
