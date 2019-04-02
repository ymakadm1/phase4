Rails.application.routes.draw do
  get 'index/homepage'
  resources :indices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  # Generated model routes
  resources :assignments
  # need routes for authors and categories ...
  resources :employees
  resources :stores
  
  # Extra routes  
  get 'current' => 'assignments#current', as: :current_assignments
  get 'active' => 'employees#active', as: :active_employees
  get 'inactive' => 'stores#inactive', as: :inactive_stores
  
  # Setting the root
  root to: 'index#homepage', as: :home

  
end
