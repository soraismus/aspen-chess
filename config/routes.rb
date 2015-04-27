Rails.application.routes.draw do
  root 'static_pages#home'

  get    'signup' => 'users#signup_form'
  get    'login'  => 'sessions#login_form'
  get    'logout' => 'sessions#logout_form'

  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users, except: :new
end
