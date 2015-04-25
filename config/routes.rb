Rails.application.routes.draw do
  root 'static_pages#home'

  get 'signup' => 'users#new'
  get 'signin' => 'sessions#new'

  resources :users,    except: :new
  resources :sessions, except: :new
end
