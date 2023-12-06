class EquipesController < ApplicationController
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
    
    private
    
    def equipe_params
        params.require(:equipe).permit(:nomeEquipe, mecanico_ids: []).tap do |whitelisted|
          whitelisted[:mecanico_ids].reject!(&:empty?)
        end
      end
      
      
      
      
end