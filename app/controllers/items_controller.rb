class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :edit, :destroy]

  def index
    @items = @Item.all
  end

  def new
    @item = Item.new
    render partial: "form"
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to department_item_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to department_item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

    def items_params
      params.require(:item).permit(:item, :descrition, :department)
    end

    def set_item
      @item = Item.find(params[:id])
    end

  
end
