DbcOverflow::Application.routes.draw do

  resources :questions do
    resources :answers
  end

  match '/user/:id' => 'user#show'

  root :to => 'questions#index'

end

