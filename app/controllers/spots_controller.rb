class SpotsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        if params[:search] == nil
            @spots= Spot.all
          elsif params[:search] == ''
            @spots= Spot.all
          else
            #部分検索
            @spots = Spot.where("adress LIKE ? ",'%' + params[:search] + '%')
        end
        
    
    end

    def place
      @spots = Spot.all
    end

    def food
      @spots = Spot.all
    end

    def souvenir
      @spots = Spot.all
    end

    def new
        @spot = Spot.new
      end
    
      def create
        spot = Spot.new(spot_params)

        spot.user_id = current_user.id 
        
        if spot.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @spot = Spot.find(params[:id])
      end    
    
      def edit
        @spot = Spot.find(params[:id])
      end

      def update
        spot = Spot.find(params[:id])
        if spot.update(spot_params)
          redirect_to :action => "show", :id => spot.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        spot = Spot.find(params[:id])
        spot.destroy
        redirect_to action: :index
      end
    

      private
      def spot_params
        params.require(:spot).permit(:adress, :time, :access, :parking, :about, :image, :overall, :category)
      end
    
end
