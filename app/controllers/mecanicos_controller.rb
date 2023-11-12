class MecanicosController < ApplicationController
    before_action :authenticate_mecanico!
    before_action :check_admin

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


    private

    def check_admin
        unless current_mecanico.adminCode == 1
            redirect_to '/', alert: 'Only admins can access this page.'
        end
    end

    def mecanico_params
        params.require(:mecanico).permit(:email, :password)
    end
end