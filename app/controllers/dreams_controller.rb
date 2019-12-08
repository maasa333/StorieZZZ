class DreamsController < ApplicationController
    def new
        @dream = Dream.new
    end
    
    def create
        @dream = current_user.dreams.build(dream_params)
        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :new    
        end
    end

    def show
        @dream = Dream.find_by(id: params[:id])
    end

    private

    def dream_params
        params.require(:dream).permit(:category, :description, :date)
    end
end
