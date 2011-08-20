Lucre::Application.routes.draw do
  devise_for :user, module: :user, path: '',
    path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }
      
  devise_scope :user do
    resource :user, controller: :user, except: %w(new create)
    get   'signup' => 'user#new', :as => :signup
    post  'signup' => 'user#create'
    
    get   'login' => 'user/sessions#new', :as => :login
    post  'login' => 'user/sessions#create'    
    get   'logout' => 'user/sessions#destroy', :as => :logout
  end

  authenticated :user do
    root :to => 'dashboard#index'
  end
  
  unauthenticated :user do
    root :to => 'home#index'
  end
end
