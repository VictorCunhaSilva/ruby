Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

    root "produtos#index"
    resources :produtos, only: [:new, :create, :destroy, :edit, :update]
    get "get/produtos/busca" => "produtos#busca", as: :busca_produto
    
    
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
 
  #root to: "home#show"
end
#GoogleAuthExample::Application.routes.draw do

#end