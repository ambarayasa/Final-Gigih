class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(params.require(:category).permit(:name))

    redirect_to categories_path
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])

    @category.update(params.require(:category).permit(:name))
    redirect_to categories_path
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
