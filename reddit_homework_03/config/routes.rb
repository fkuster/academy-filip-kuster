Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index', as: :frontpage
  get '/settings/edit', to: 'settings#edit'

  resources :users, only:[:update]
  resources :subreddits, only: [:show, :new, :create,:index] do
    resources :subscriptions, only:[:new, :destroy]
    resources :posts, except: [:index] do
      resources :upvotes, only:[:new]
      resources :comments, only:[:create]
    end
  end
end
