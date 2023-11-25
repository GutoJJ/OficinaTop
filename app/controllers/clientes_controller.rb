class ClientesController < ApplicationController

    def new
        @cliente = Cliente.new
    end

    def create
        @cliente = Cliente.new(cliente_params)
        if @cliente.save
            redirect_to '/clientes', notice: 'Cliente was successfully created.'
        else
            render :new
        end
    end

    def index
        @cliente = Cliente.all
    end

    def show
        @cliente = Cliente.find(params[:id])
    end

    private

    def cliente_params
        params.require(:cliente).permit(:nome, :endereco, :email, :telefone)
    end

end
