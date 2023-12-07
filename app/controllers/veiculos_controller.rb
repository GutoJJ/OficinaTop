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

    def edit
        @veiculo = Veiculo.find(params[:id])
    end

    def update
        @veiculo = Veiculo.find(params[:id])
        if @veiculo.update(veiculo_params)
            redirect_to @veiculo
        else
            render :edit
        end
    end

    def destroy
        @veiculo = Veiculo.find(params[:id])
        @veiculo.destroy
        redirect_to veiculos_path
    end

    private

    def veiculo_params
        params.require(:veiculo).permit(:placa, :descricao, :modelo, :cor, :cliente_id, :ano, :marca)
    end

end
