Rails.application.routes.draw do
  
  devise_for :mecanicos
  devise_scope :mecanico do
    authenticated :mecanico do
      root 'main#home', as: :authenticated_root
    end

  get '/admin/register_mecanico', to: 'mecanicos#new', as: 'new_admin_mecanico'
  post '/admin/register_mecanico', to: 'mecanicos#create', as: 'admin_mecanicos'

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    get '/mecanicos/sign_out' => 'devise/sessions#destroy'
  end
end