Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :searchable do
    collection do
      match :search, via: [:post]
    end
  end

  namespace :admin do
  	resources :categories, concerns: :searchable, only: [:index, :show, :create] do
      post 'update', 'destroy', on: :collection 
  		get :all, on: :collection
  	end
  	
  	resources :blogs, only: [:create, :show, :index], concerns: :searchable do 
      post 'update', 'destroy', on: :collection 
    end

  	resources :sessions, only: [] do 
  		post :sign_in, :sign_out, on: :collection
  	end

    resources :attachments, only: [:create]

    resources :users, only: [] do 
      get :detail, on: :collection
    end

    resources :impressions, only: [:index]
  end

  namespace :api do 
    resources :blogs, only: [:index, :show], concerns: :searchable
    resources :categories, only: [] do 
      get :all, on: :collection 
    end
  end
end
