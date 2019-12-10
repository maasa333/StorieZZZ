class DreamsController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @dream = @user.dreams.build
        else
            @dream = Dream.new 
        end
        @categories = Category.all.map{|c| [ c.name, c.id ]}
    end
    
    def create
        @dream = current_user.dreams.build(dream_params)
        @dream.category_id = params[:dream][:category_id] 

        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :new    
        end
    end

    def show
        @dream = Dream.find_by(id: params[:id])
        @interpretation = @dream.interpretations.build
    end

    def index
        @dreams = Dream.all
    end 

    private

    def dream_params
        params.require(:dream).permit(:category, :description, :date)
    end
end
