DbcOverflow::Application.routes.draw do
  root to: 'questions#index'
  
  resources :questions

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

  root :to => 'home#index'


end

