Rails.application.routes.draw do
  root 'static_pages#index', as: :frontpage
  #  get 'subreddits/new', to: 'subreddits#new'
  #  get 'subreddits/:id', to: 'subreddits#show', as: :subreddit


  #  post 'subreddits/', to: 'subreddits#create'

  #  get 'subreddits/:subreddit_id/posts/:id/edit', to: 'posts#edit', as: :post_edit
  #  get 'subreddits/:subreddit_id/posts/new', to: 'posts#new', as: :posts
  #  get 'subreddits/:subreddit_id/posts/:id', to: 'posts#show', as: :subreddits_post
  #  post 'subreddits/:subreddit_id/posts/new', to: 'posts#create'

  #  patch 'subreddits/:subreddit_id/posts/:id/edit', to: 'posts#update'
    #delete 'subreddits/:subreddit_id/posts/:id', to: 'posts#destroy', as: :post_destroy

  resources :comments, only:[:create]

  #root 'static_pages#index'
  resources :subreddits, only: [:show, :new, :create] do
    resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  #resources :comments, only[:create]

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
