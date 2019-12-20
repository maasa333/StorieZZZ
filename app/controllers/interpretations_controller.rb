class InterpretationsController < ApplicationController
    def index
        if params[:dream_id] && @dream = Dream.find_by_id(params[:dream_id])
            @interpretations = @dream.interpretations
        else
            @interpretations = Interpretation.date_order
        end
    end

    def new
        @dream = Dream.find(params[:dream_id])
        @interpretation = Interpretation.new
    end
    
    def create
        @interpretation = current_user.interpretations.build(interpretation_params)
        @interpretation.dream_id = params[:dream_id]
        if @interpretation.save
            redirect_to dream_interpretations_path
        else
            render :new
        end
    end

    def destroy
        @interpretation = Interpretation.find_by(id: params[:id])
        if @interpretation && @interpretation.user_id == current_user.id
            @dream = @interpretation.dream
            @interpretation.destroy
            redirect_to dream_interpretations_path(@dream)
        else
            flash[:error] = "You can only delete your own existing interpretations"
            redirect_to dreams_path
        end
    end

    private

    def interpretation_params
        params.require(:interpretation).permit(:description)
    end
end