Rails.application.routes.draw do
  root "tags#index"
  resources :tags
  resources :transactions do
    delete 'tags/remove/:id', to: 'tags#remove', as: :remove_tag
  end
end
