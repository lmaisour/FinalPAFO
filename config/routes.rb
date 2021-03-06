Rails.application.routes.draw do
  # ----------------------- HOMEPAGE RESTFUL ROUTE -------------------------#
  
  root "pages#home"

   # ----------------------- USERS RESTFUL ROUTE -------------------------#

  resource :session, only: [:new, :create, :destroy]
  
  # get "sign up" => "users#new"
  
  get 'users/' => 'users#index'
  get 'users/new' => 'users#new' 
  get 'users/:id' => 'users#show', as: :user
  post 'events/attend/:id' => 'events#attend', as: :events_attend


  post 'users' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id/' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  get "/admin", to: "pages#admin"

  
  resources :users

# ----------------------- EVENTS RESTFUL ROUTES -------------------------#


  get 'events/' => 'events#index'
  get 'events/new' => 'events#new'
  get 'events/:id' => 'events#show', as: :event

  post 'events' => 'events#create'

  get 'events/:id/edit' => 'events#edit'
  patch 'events/:id' => 'events#update'

  delete 'events/:id' => 'events#destroy'

# -----------------------------------------------------------------------#
  
  get 'user_interests' => 'user_interests#index', as: :user_interests

  resources :events do 
    member do
       post :join
    end
  end
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
