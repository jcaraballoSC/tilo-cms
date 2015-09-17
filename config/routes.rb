Rails.application.routes.draw do

  resources :users
  resources :trades
  resources :emissions

  devise_for :users

  devise_scope :user do
    authenticated :user do
      #Muestra el dashboard al loguearse
      root 'dashboard#index', as: :authenticated_root

      #Destruye la sesion al salir
      delete "/logout" => "devise/sessions#destroy"

      #Manejo de permisos de usuarios sobre emisiones
      get 'users/permissions/:id', to: 'users#index_permission', :as => 'permissions'
      get 'users/permissions/:user_id/:emission_id', to: 'users#create_permission', :as => 'permissions_create'
      delete 'users/permissions/:user_id/:emission_id', to: 'users#destroy_permission', :as => 'permissions_delete'

      #Manejo de encendido de emisiones
      get '/powers/:id', to: 'powers#index', as: 'powers'
      get 'powers/new/:id',  to: 'powers#new', as:'powers_new'
      post '/powers/:id', to: 'powers#create'

      get 'uploads/:id', to: 'uploads#index'
      get 'uploads/new/:id', to: 'uploads#new'
      post 'uploads', to: 'uploads#create'

    end
      #Establece la pagina de login es la home para los usuarios no logueados
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root

      namespace :api, defaults: { format: "json" } do
      namespace :v1 do
        get '/', to: 'emissions#index', as: 'emissions'
        post '/', to: 'emissions#create'
      end
    end

    
    end
  end

    

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end 
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
