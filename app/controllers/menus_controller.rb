class MenusController < ApplicationController
  def index
    @menus = params[:letter] ? Menu.by_letter(params[:letter]) : Menu.all
  end

  def new
    @menu = Menu.new
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
    @menu = Menu.find_by(id: params[:id])
  end

  def update
    @menu = Menu.find_by(id: params[:id])
    @menu.update(menu_params)
    
    if @menu.save
      redirect_to menu_url
    else
      render :edit, status: 422
    end
  end

  def show
    @menu = Menu.find_by(id: params[:id])
  end

  def destroy
    @menu = Menu.find_by(id: params[:id])
    @menu.destroy
    redirect_to menu_url
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price, :category_id)
  end
end
