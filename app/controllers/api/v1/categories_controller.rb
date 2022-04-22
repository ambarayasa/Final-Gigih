class Api::V1::CategoriesController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_category, only: %i[ show edit update destroy ]
    
    def index
        @categories = params[:letter] ? Category.by_letter(params[:letter]) : Category.all

        render json: {
            category: @categories
        }
    end

    def create
        @category = Category.new(category_params)
        @category.save

        render json: {
            category: @category
        }
    end

    def update
        @category.update(category_params)

        render json: {
            category: @category
        }
    end

    def show
        render json: {
            category: @category
        }
    end

    def destroy
        @category.destroy
        render json: 200
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end

    def set_category
        @category = Category.find_by(id: params[:id])
    end
end