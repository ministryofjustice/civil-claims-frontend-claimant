CivilClaimsFrontend::Application.routes.draw do
  get '/templates' => 'templates#templates'
  get '/step2' => 'templates#step2'

  resources :claims, only: [:create, :new, :destroy, :update]
  get '/claims/landing'       => 'claims#landing'
  get '/claims/:id'           => 'claims#edit'
  get '/claims/:id/:page_id'  => 'claims#edit'
  post '/claims/:id/pay_and_send_to_court' => 'claims#pay_and_send_to_court'


  # temporarily live in claims controller
  get '/login'                => 'users#login_screen'
  post '/login'               => 'users#create_session'
  get '/logout'               => 'users#logout'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'claims#new'

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
