Rails.application.routes.draw do

  # static pages
  root :to => 'pages#home'
  get 'landing' => 'pages#landing'
  
  devise_for :users, path: '',
    path_names: { sign_in: 'login', sign_out: 'logout', password: 'password_reset' },
    controllers: { passwords: 'password_resets', sessions: 'sessions' }

end
