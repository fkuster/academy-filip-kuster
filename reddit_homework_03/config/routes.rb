Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index', as: :frontpage
  get '/settings/edit'

  resources :users, only:[:update]
  resources :subreddits, only: [:show, :new, :create,:index] do
    resources :subscriptions, only:[:new, :destroy]
    resources :posts, except: [:index] do
      resources :upvotes, only:[:new]
      resources :comments, only:[:create]
    end
  end

  namespace :api do
     api version: 1, module: 'v1', allow_prefix: 'v' do
        resources :subreddits, except: [:edit] do
          resources :posts do
            member do
                get 'upvote'
            end
          end
        end

        resources :posts do
          resources :comments, only: [:index,:create,:destroy]
       end
     end
   end

end
