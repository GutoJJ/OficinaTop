class MecanicosController < ApplicationController
    before_action :authenticate_mecanico!
    before_action :check_admin, only: [:new, :create, :deactivate, :edit, :destroy, :update]
  
    def new
        @mecanico = Mecanico.new
    end

    def create
        @mecanico = Mecanico.new(mecanico_params)
        if @mecanico.save
            redirect_to '/', notice: 'Mecanico was successfully created.'
        else
            render :new
        end
    end

    def index
        @mecanico = Mecanico.all
    end

    def show
        @mecanico = Mecanico.find(params[:id])
    end

    def edit
        @mecanico = Mecanico.find(params[:id])
    end

    def update
        @mecanico = Mecanico.find(params[:id])
        if @mecanico.update(mecanico_params)
          redirect_to @mecanico, notice: 'Mecanico was successfully updated.'
        else
          render :edit
        end
      end

    def deactivate
        if current_mecanico.adminCode == 1
          @mecanico = Mecanico.find(params[:id])
          if @mecanico.ativarCode == 0
            @mecanico.update(ativarCode: 1)
            redirect_to @mecanico, notice: 'User was successfully activated.'
          else
            @mecanico.update(ativarCode: 0)
            redirect_to @mecanico, notice: 'User was successfully deactivated.'
          end
        else
          redirect_to @mecanico, alert: 'You are not authorized to perform this action.'
        end
      end

    def destroy
        @mecanico = Mecanico.find(params[:id])
        @mecanico.destroy
        redirect_to mecanicos_path
    end

    def mecanico_params
        params.require(:mecanico).permit(:email, :password, :nome, :telefone, :especialidade, :endereco)
    end
end