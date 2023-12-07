class PecasController < ApplicationController
    before_action :check_admin, only: [:new, :create, :edit, :destroy, :update]
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
            redirect_to '/pecas'
        else
            render 'new'
        end
    end

    def edit
        @peca = Peca.find(params[:id])
    end

    def update
        @peca = Peca.find(params[:id])
        if @peca.update(peca_params)
            redirect_to @peca
        else
            render :edit
        end
    end

    def destroy
        @peca = Peca.find(params[:id])
        @peca.destroy
        redirect_to pecas_path
    end
    
    private
    
    def peca_params
        params.require(:peca).permit(:nome, :preco)
    end
end
