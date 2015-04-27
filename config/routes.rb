Rails.application.routes.draw do
  root 'static_pages#home'

  get    'signup' => 'users#new'
  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  resources :users,    except: :new
end
