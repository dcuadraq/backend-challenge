Rails.application.routes.draw do
  resources :members do
    resources :friends
  end
end
