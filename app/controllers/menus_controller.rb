class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def index
    @menus = params[:letter] ? Menu.by_letter(params[:letter]) : Menu.all
  end

  def new
    @menu = Menu.new
    @category = set_category
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path(@menu) }
        format.json { render :index, status: :created, location: @menu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = set_category
  end

  def update
    @menu.update(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu }
        format.json { render :index, status: :updated, location: @menu }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @menu.errors, status: 422 }
      end
    end
  end

  def show
  end

  def destroy
    @menu.destroy
    redirect_to menus_path
  end

  private

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :category_id)
  end

  def set_menu
    @menu = Menu.find_by(id: params[:id])
  end

  def set_category
    @category = Category.all.collect { |category| [ category.name, category.id ] }
  end
end
