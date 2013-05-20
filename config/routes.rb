DbcOverflow::Application.routes.draw do
  
  resources :questions do
    collection do
      post 'search'
    end
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  resources :users do
    collection do 
      get  'login'
      post 'login'
      delete 'signout'
    end
  end

  resources :answers do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

  get '/topics/:title' => 'topics#show'
  get '/topics' => 'topics#index'

  get 'tags/:name' => 'tags#show'
  get '/tags' => 'tags#index'
  get '/about' => 'users#about'

  root to: 'questions#index'
end

