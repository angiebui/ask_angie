DbcOverflow::Application.routes.draw do

  resources :questions do
    resources :answers
  end

  resources :users do
    collection do 
      get  'login'
      post 'login'
      delete 'signout'
    end
  end

  # root :to => 'questions#index'
  root :to => 'home#index'

  
end

