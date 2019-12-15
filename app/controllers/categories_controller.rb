class CategoriesController < ApplicationController
    helper DateHelper

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to root_path
        else
            render :new
        end
    end

    def index
        @categories = Category.alpha
    end

    def show
       @category = Category.find_by(id: params[:id])
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end