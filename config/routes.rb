DbcOverflow::Application.routes.draw do

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
    end
  end

  root :to => 'home#index'
end

