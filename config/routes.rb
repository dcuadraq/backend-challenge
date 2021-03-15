Rails.application.routes.draw do
  resources :members do
    resources :friends, only: %i[index create]
  end
end
