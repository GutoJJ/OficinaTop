class CustomSessionsController < Devise::SessionsController
    def create
        self.resource = warden.authenticate!(auth_options)
        if resource.ativarCode == 0
            sign_out(resource)
            flash[:warning] = "Esta conta foi desativada."
            redirect_to new_session_path(resource)
        else
            super
        end
    end
end