class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  
  def index
    @categories = params[:letter] ? Category.by_letter(params[:letter]) : Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url }
        format.json { render :index, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @category.update(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url }
        format.json { render :index, status: :updated, location: @category }
      else
        format.html { render :edit, status: 422 }
        format.json { render json: @category.errors, status: 422 }
      end
    end
  end

  def show
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
