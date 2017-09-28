Rails.application.routes.draw do
  resource :profile
  root 'landing#index'
  devise_for :users
  resources :photos do
   resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
