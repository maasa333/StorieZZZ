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

    def edit
        @dream = Dream.find_by(id: params[:id])
        @categories = Category.all.map{|c| [ c.name, c.id ]}
        redirect_to dreams_path if current_user.id != @dream.user_id
    end

    def update
        @dream = Dream.find_by(id: params[:id])
        @dream.update(dream_params)

        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :edit   
        end
    end

    def destroy
        @dream = Dream.find_by(params[:id])
        @dream.destroy
        redirect_to dreams_path
    end

    private

    def dream_params
        params.require(:dream).permit(:category, :description, :date)
    end
end
