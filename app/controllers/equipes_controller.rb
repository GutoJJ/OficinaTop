class EquipesController < ApplicationController
    before_action :check_admin, only: [:new, :create, :edit, :destroy, :update]

    def index
        @equipes = Equipe.all
    end
    
    def show
        @equipe = Equipe.find(params[:id])
    end
    
    def new
        @equipe = Equipe.new
    end
    
    def create
        puts equipe_params.inspect
        @equipe = Equipe.new(equipe_params)
        
        if @equipe.save
            redirect_to '/equipes', notice: 'Equipe was successfully created.'
        else
            render 'new'
        end
    end

    def edit
        @equipe = Equipe.find(params[:id])
    end

    def update
        @equipe = Equipe.find(params[:id])
        if @equipe.update(equipe_params)
            redirect_to @equipe
        else
            render :edit
        end
    end

    def destroy
        @equipe = Equipe.find(params[:id])
        @equipe.destroy
        redirect_to equipes_path
    end

    
    def equipe_params
        params.require(:equipe).permit(:nomeEquipe, mecanico_ids: []).tap do |whitelisted|
          whitelisted[:mecanico_ids].reject!(&:empty?)
        end
      end  
end