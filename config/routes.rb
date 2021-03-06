Rails.application.routes.draw do
  root "tags#index"
  resources :tags
  resources :transactions do
    delete 'tags/remove/:id', to: 'tags#remove', as: :remove_tag
    post   'tags', to: 'transactions#add_tag', as: :add_tag
    collection do
      get :search
    end
  end
end
