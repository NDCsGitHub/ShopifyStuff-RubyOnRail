Rails.application.routes.draw do
  root 'items#index'

  
  resources :items

  get '/items/:id/delete', to: 'items#delete'
  
  put '/items/:id/restore', to: 'items#restore'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
