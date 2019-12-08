class InterpretationsController < ApplicationController
    def new
        @interpretation = Interpretation.new
    end
    
    def create
        # binding.pry
        @interpretation = current_user.interpretations.build(interpretation_params)
        if @interpretation.save
            redirect_to interpretation_path(@interpretation)
        else
            render :new
        end
    end

    def show
        @interpretation = interpretation.find_by(id: params[:id])
    end

    private

    def interpretation_params
        params.require(:interpretation).permit(:description)
    end
end