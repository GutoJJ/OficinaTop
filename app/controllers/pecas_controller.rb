class PecasController < ApplicationController
    def index
        @pecas = Peca.all
    end
    
    def show
        @peca = Peca.find(params[:id])
    end
    
    def new
        @peca = Peca.new
    end
    
    def create
        puts peca_params.inspect
        @peca = Peca.new(peca_params)
        
        if @peca.save
            redirect_to '/pecas', notice: 'Peca was successfully created.'
        else
            render 'new'
        end
    end
    
    private
    
    def peca_params
        params.require(:peca).permit(:nome, :preco)
    end
end
