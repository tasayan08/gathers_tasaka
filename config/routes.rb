Rails.application.routes.draw do

  # namespace :customers do
  #   get 'favorite_events/create'
  #   get 'favorite_events/destroy'
  #   get 'favorite_events/index'
  # end
  # namespace :customers do
  #   get 'favorite_circles/create'
  #   get 'favorite_circles/destroy'
  #   get 'favorite_circles/index'
  # end
  
  get 'search/search'
  get 'search/search_pref'
  delete 'search/destroy'


  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    sessions: 'customers/sessions',
    passwords: 'customers/passwords'
  }

  root to: 'homes#top'
  get "/about" => "homes#about"

  namespace :admins do
    resources :customers
    resources :circles
    resources :genres, :only => [:index, :create, :edit, :update, :destroy]
  end


  get "/circles/all" => "customers/circles#all_index"
  get "/events/all" => "customers/events#all_index"

  scope module: :customers do
    resources :customers,:except => [:show, :edit, :new, :create] do
      resources :circles do
       resources :reviews, :except => [:index] do
        member do
          get "/reviews" => "reviews#index"
        end
       end
       resources :events
      end
      get "/my_page" => "customers#show"
      get "/my_page/edit" => "customers#edit"
      get "/unsubscribe" => "customers#unsubscribe"
      patch "/withdraw" => "customers#withdraw"
    end
  end


  namespace :customers do
    resources :favorite_circles, :only => [:index, :create, :destroy]
    resources :favorite_events, :only => [:index, :create, :destroy]
  end

end

#一つ目の「customers」はデバイスのリソース
#2つ目の「customers」は
  # scope module: :customers do
  #   resources :customer,:exept => [:show, :edit, :destroy] do
  #   resources :circles
  #   collection do
  #   get "/my_page" => "customers#show"
  #   get "/my_page/edit" => "customers#edit"
  #   patch "/my_page/update" => "customers#update"
  #   get "/unsubscribe" => "customers#unsubscribe"
  #   patch "/withdraw" => "customers#withdraw"
  #   get "/my_circle/new" => "circles#new"
  #   get "/my_circles" => "circles#index"
  #   get "/my_circle" => "circles#show"
  #   get "/my_circle/edit" => "circles#edit"
  #   patch "/my_circle/update" => "circles#update"
  #   delete "/unsubscribe" => "circles#destroy"
  #   end
  # end
  # end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


