class MecanicosController < ApplicationController
    before_action :authenticate_mecanico!
    before_action :check_admin, only: [:new, :create, :deactivate]
  
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


    private

    def check_admin
        unless current_mecanico.adminCode == 1
            redirect_to '/', alert: 'Only admins can access this page.'
        end
    end

    def mecanico_params
        params.require(:mecanico).permit(:email, :password, :nome, :telefone, :especialidade, :endereco)
    end
end