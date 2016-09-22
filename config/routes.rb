Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  get 'login' => 'welcome#login'
  post 'login' => 'welcome#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
