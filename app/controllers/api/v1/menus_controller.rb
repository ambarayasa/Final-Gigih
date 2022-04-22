class Api::V1::MenusController < ApplicationController
    protect_from_forgery with: :null_session
    before_action :set_menu, only: %i[ show edit update destroy ]
  
    def index
        @menus = params[:letter] ? Menu.by_letter(params[:letter]) : Menu.all
  
        render json: {
            menus: @menus
        }
    end
  
    def create
        @menu = Menu.new(menu_params)
        @menu.save
        
        render json: {
            menu: @menu
        }
    end
  
    def update
        @menu.update(menu_params)
  
        render json: {
            menu: @menu
        }
    end
  
    def show
        render json: {
            menu: @menu
        }
    end
  
    def destroy
        @menu.destroy
        render json: 200
    end
  
    private
  
    def menu_params
      params.require(:menu).permit(:name, :description, :price, :category_id)
    end
  
    def set_menu
      @menu = Menu.find_by(id: params[:id])
    end
end
  