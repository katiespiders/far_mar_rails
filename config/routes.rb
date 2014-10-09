Rails.application.routes.draw do

  get "/", to: "home#index"

  get "/vendors", to: "vendors#index"
  get "/vendors/new", to: "vendors#new"
  get "/vendors/:id", to: "vendors#show"
  get "/vendors/:id/add_product", to: "vendors#add_product"
  post "/vendors", to: "vendors#create"
  get "/vendors/:id/edit", to: "vendors#edit"
  put "/vendors/:id", to: "vendors#update"
  delete "/vendors/:id", to: "vendors#destroy"

  get "/products", to: "products#index"
  get "/products/:id", to: "products#show"
  post "/products", to: "products#create"
  get "/products/:id/edit", to: "products#edit"
  put "/products/:id/", to: "products#update"
  delete "/products/:id/", to: "products#destroy"

  get "/markets", to: "market#index"
  get "/markets/new", to: "market#new"
  post "/markets/create", to: "market#create"

  get "/markets/:id", to: "market#show"
  put "/markets/:id", to: "market#update"
  post "/markets/:id", to: "market#create"
  get "/markets/:id/destroy", to: "market#delete"

  get "/markets/:id/edit", to: "market#edit"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
