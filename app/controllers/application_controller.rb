class ApplicationController < ActionController::Base
    before_action :authenticate_mecanico!

    private

    def check_admin
        unless current_mecanico.adminCode == 1
            redirect_to '/', alert: 'Only admins can access this page.'
        end
    end
end
