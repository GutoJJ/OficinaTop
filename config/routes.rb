Rails.application.routes.draw do
  devise_for :mecanicos
  devise_scope :mecanico do
    authenticated :mecanico do
      root 'main#home', as: :authenticated_root

      get '/admin/register_mecanico', to: 'mecanicos#new', as: 'new_admin_mecanico'
      post '/admin/register_mecanico', to: 'mecanicos#create', as: 'admin_mecanicos'
      get '/mecanicos', to: 'mecanicos#index', as: 'mecanicos'
      resources :mecanicos, only: [:show]

      get '/clientes', to: 'clientes#index', as: 'clientes'
      get '/clientes/new', to: 'clientes#new', as: 'new_cliente'
      post '/clientes/new', to: 'clientes#create', as: 'create_cliente'
      resources :clientes, only: [:show]

      get '/veiculos', to: 'veiculos#index', as: 'veiculos'
      get '/veiculos/new', to: 'veiculos#new', as: 'new_veiculo'
      post '/veiculos/new', to: 'veiculos#create', as: 'create_veiculo'
      resources :veiculos, only: [:show]

      get '/home', to: 'main#home', as: 'main_home'
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    get '/mecanicos/sign_out' => 'devise/sessions#destroy'
  end
  
end