Rails.application.routes.draw do
  resources :menu_attachments
  resources :post_attachments
  resources :items
  resources :menus
  resources :image_gallaries
  resources :users
  get 'hosts/index'
  get 'hosts/mainpage'
  get 'ninja/index'
  get 'ninja/show'
  get 'hosts/create'
  get 'hosts/reviews'
  get 'order_tables/loadOrdersForGuests'
  post 'hosts/create'
  get 'hosts/updateReview'
  get 'order_tables/updateOrderForGuestAccept'
  get 'order_tables/updateOrderForGuestReject'
  get 'auth/:provider/callback', to: 'hosts#loginFB'
  get 'logout', to: 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'ninja/index'
  # You can have the root of your site routed with "root"
  root 'hosts#index'
  post 'hosts/create_photo'
  get 'hosts/previewAlbum'

  #menus
  post 'hosts/create_photo_menus'
  get 'hosts/menuAdd'

  post 'hosts/createMenu'
  #menus
  get 'menus/index'
  post 'menus/create'
  get 'menus/new'
  post 'menus/create_photo'
  get 'menus/previewAlbum'
  get 'order_tables/checkAvailability'
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