class VeiculosController < ApplicationController

    def new
        @veiculo = Veiculo.new
    end

    def index
        @veiculo = Veiculo.all
    end

    def create
        @veiculo = Veiculo.new(veiculo_params)
        if @veiculo.save
            redirect_to '/veiculos', notice: 'Veiculo was successfully created.'
        else
            render :new
        end
    end

    def show
        @veiculo = Veiculo.find(params[:id])
    end

    private

    def veiculo_params
        params.require(:veiculo).permit(:placa, :descricao, :modelo, :cor, :cliente_id, :ano, :marca)
    end

end
