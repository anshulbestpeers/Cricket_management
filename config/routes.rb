Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "players#index"
  resources :players
  mount ActionCable.server => '/cable'

end
