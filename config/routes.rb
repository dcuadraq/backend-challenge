Rails.application.routes.draw do
  resources :members do
    resources :friends, only: %i[index create]
    resources :search_topic, only: %i[index]
  end
end
