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

    def edit
        @cliente = Cliente.find(params[:id])
    end

    def update
        @cliente = Cliente.find(params[:id])
        if @cliente.update(cliente_params)
            redirect_to @cliente
        else
            render :edit
        end
    end

    def veiculos
        @cliente = Cliente.find(params[:id])
        @veiculos = @cliente.veiculos
        render json: @veiculos
      end

    def destroy
        @cliente = Cliente.find(params[:id])
        @cliente.destroy
        redirect_to clientes_path
    end

    private

    def cliente_params
        params.require(:cliente).permit(:nome, :endereco, :email, :telefone)
    end

end
