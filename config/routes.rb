Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get 'products/new'
  get 'products/:id',to: 'products#show', as: 'product_show'

  get 'search',to: "products#search", as: 'search'
  get 'clothing',to: 'products#clothing', as: 'product_clothing'
  get 'sports',to: 'products#sports', as: 'product_sports'
  get 'beauty',to: 'products#beauty', as: 'product_beauty'
  get 'home',to: 'products#home', as: 'product_home'
  get 'garden',to: 'products#garden', as: 'product_garden'
  get 'men',to: 'products#men',as: 'men_products'
  get 'women',to: 'products#women',as: 'women_products'

  get 'products/:id/edit', to: 'products#edit', as: 'products_edit'
  get 'products', to: 'products#index', as: 'all_products'
  get 'myproducts' , to: 'products#list', as: 'my_products'
  post 'products/create'
  patch 'products/:id/update', to: 'products#update', as: 'products'
  delete 'products/:id', to: 'products#destroy', as: 'product'

  get 'mywishlist' , to: 'wishlist#list', as: 'my_wishlist'
  post 'wishlist/create'
  post 'wishlist/update'
  delete 'wishlist', to: 'wishlist#destroy', as: 'wishlist_delete'

  resource :cart, only: [:show] do
    post 'add_item'
    post 'remove_item'
    post  'update_item'
  end

  post 'ratings/create'
  get 'rating/:id/edit', to: 'ratings#edit', as: 'rating_edit'
  patch 'rating/:id/update', to: 'ratings#update', as: 'rating_update'

  get 'my_orders', to: 'order_items#placed_orders',as: 'placed_orders'
  get 'received_orders', to: 'order_items#received_orders', as: 'received_orders'
  put 'ship_order_item/:id', to: 'order_items#ship_order_item',as: 'order_item_ship'
  put 'deliver_order_item/:id', to: 'order_items#deliver_order_item', as: 'order_item_deliver'
  put 'cancel_order_item/:id', to: 'order_items#cancel_order_item', as: 'order_item_cancel'
  get 'order_items', to: 'order_items#create', as: 'order_items_add'
  get 'order/:id', to: 'order_items#show', as: 'order_show'

  get 'addresses/new'
  post 'address/create', to: 'addresses#create', as: 'address_create'
  get 'address/:id/edit', to: 'addresses#edit', as: 'address_edit'
  patch 'address/:id/update', to: 'addresses#update', as: 'address_update'

  get 'offers/new'
  post 'offers/create', to: 'offers#create', as: 'offer_create'
  get 'offers/list'

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
