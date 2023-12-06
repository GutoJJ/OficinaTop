Rails.application.routes.draw do
  devise_for :mecanicos, controllers: { sessions: 'custom_sessions' }
  devise_scope :mecanico do
    authenticated :mecanico do
      root 'main#home', as: :authenticated_root

      get '/admin/register_mecanico', to: 'mecanicos#new', as: 'new_admin_mecanico'
      post '/admin/register_mecanico', to: 'mecanicos#create', as: 'admin_mecanicos'
      get '/mecanicos', to: 'mecanicos#index', as: 'mecanicos'

      resources :mecanicos, only: [:show]
      resources :mecanicos do
        post 'deactivate', on: :member
      end

      get '/clientes', to: 'clientes#index', as: 'clientes'
      get '/clientes/new', to: 'clientes#new', as: 'new_cliente'
      post '/clientes/new', to: 'clientes#create', as: 'create_cliente'
      resources :clientes, only: [:show]

      get '/equipes', to: 'equipes#index', as: 'equipes'
      get '/equipes/new', to: 'equipes#new', as: 'new_equipe'
      post '/equipes', to: 'equipes#create', as: 'create_equipe'
      resources :equipes, only: [:show]

      get '/veiculos', to: 'veiculos#index', as: 'veiculos'
      get '/veiculos/new', to: 'veiculos#new', as: 'new_veiculo'
      post '/veiculos/new', to: 'veiculos#create', as: 'create_veiculo'
      resources :veiculos, only: [:show]

      get '/pecas', to: 'pecas#index', as: 'pecas'
      get '/pecas/new', to: 'pecas#new', as: 'new_peca'
      post '/pecas', to: 'pecas#create', as: 'create_peca'
      resources :pecas, only: [:show]

      get '/home', to: 'main#home', as: 'main_home'
      get '/sign_out', to: 'devise/sessions#destroy', as: 'sign_out'
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
end