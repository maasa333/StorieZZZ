class DreamsController < ApplicationController
    before_action :set_dream, except: [:new, :create, :index]
    
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

        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :new    
        end
    end

    def show
        @interpretation = @dream.interpretations.build
    end

    def index
        @dreams = Dream.date_order
    end 

    def edit
        @categories = Category.all.map{|c| [ c.name, c.id ]}
        redirect_to dreams_path if current_user.id != @dream.user_id
    end

    def update
        @dream.update(dream_params)

        if @dream.save
            redirect_to dream_path(@dream)
        else
            render :edit   
        end
    end

    def destroy
        @dream.destroy
        redirect_to dreams_path
    end

    def set_dream
        @dream = Dream.find_by(id: params[:id])
    end

    private

    def dream_params
        params.require(:dream).permit(:category_id, :description, :date, :search)
    end
end
