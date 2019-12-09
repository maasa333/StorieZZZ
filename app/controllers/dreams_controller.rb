class DreamsController < ApplicationController
    def new
        @dream = Dream.new
        @categories = Category.all.map{|c| [ c.name, c.id ]}
    end
    
    def create
        @dream = current_user.dreams.build(dream_params)
        @dream.category_id = params[:category_id] 

        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :new    
        end
    end

    def show
        @dream = Dream.find_by(id: params[:id])
        @interpretation = Interpretation.new
    end

    def index
        @dreams = Dream.all
    end 

    private

    def dream_params
        params.require(:dream).permit(:category, :description, :date)
    end
end
