class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
  end

  def create
    menu = Menu.create(params.require(:menu).permit(:name, :description, :price))

    redirect_to menus_path
  end

  def edit
    @menu = Menu.find_by(id: params[:id])
  end

  def update
    @menu = Menu.find_by(id: params[:id])

    @menu.update(params.require(:menu).permit(:name, :description, :price))
    redirect_to menus_path
  end

  def show
    @menu = Menu.find_by(id: params[:id])
  end
end
