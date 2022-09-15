Rails.application.routes.draw do
  resources :games do
    scope module: 'games' do
      resources :play, only: [:index]
    end
  end
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
