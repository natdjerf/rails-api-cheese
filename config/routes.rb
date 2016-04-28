Rails.application.routes.draw do
  resources :cheese_additions, except: [:new, :edit]
  resources :cheeses, except: [:new, :edit]
  resources :boards, except: [:new, :edit]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  # resources :users, only: [:index, :show]
end
