Rails.application.routes.draw do
  resources :demos
  resources :users
  resources :store_flavors
  resources :flavors
  resources :jobs
  resources :shift_jobs
  resources :shifts
  resources :demos, only: [:new, :create, :destroy]

  #get 'index/homepage'
  resources :indices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
 # Semi-static page routes
  get 'home' => 'index#homepage', as: :home
  get 'about' => 'index#about', as: :about
  get 'contact' => 'index#contact', as: :contact
  get 'privacy' => 'index#privacy', as: :privacy
  
  # Generated model routes
  resources :assignments
  # need routes for authors and categories ...
  resources :employees
  resources :stores
  
  
  #User Routes
  
  

  get 'login' => 'demos#new', :as => :login
  get 'logout' => 'demos#destroy', :as => :logout
  
  # Extra routes  
  get 'current' => 'assignments#current', as: :current_assignments
  get 'active' => 'employees#active', as: :active_employees
  get 'active_flavors' => 'flavors#active_flavors', as: :active_flavors_flavors

  get 'inactive' => 'stores#inactive', as: :inactive_stores
  
  # Setting the root
  root  'index#homepage'


end
