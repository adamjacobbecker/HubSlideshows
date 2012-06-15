HubSlideshows::Application.routes.draw do
  
  resources :hubs, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]
  
  match '/play/:hub_id', to: 'static_pages#play', as: 'play'
  match '/playstatic', to: 'static_pages#play_static'
  
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  
  match '/project/:id', to: 'projects#destroy', via: :delete, as: 'project'
  
  match '/new', to: 'frontend#new', via: :get, as: 'new_project'
  match '/new', to: 'frontend#new_project_from_json', via: :post, as: 'new_project_from_json'
  
  match '/manage/:id/:key', to: 'frontend#edit', via: :get, as: 'edit_project'
  match '/manage/:id/:key', to: 'frontend#update_project_from_json', via: :put, as: 'update_project_from_json'
  
  
  match '/createasset', to: 'frontend#create_asset', as: 'create_asset'
  
  root :to => 'static_pages#home'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
