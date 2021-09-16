Rails.application.routes.draw do
 devise_for :admins, controllers: {
   sessions: 'admins/sessions',
   passwords: 'admins/passwords',
   registrations: 'admins/registrations'
 }
 
 devise_for :end_users, controllers: {
   sessions: 'end_users/sessions',
   passwords: 'end_users/passwords',
   registrations: 'end_users/registrations'
 }
 
 root to: 'homes#top'
 get 'homes/about' => 'homes#about'
 
 get 'mypage' => 'end_users/end_users#show', as: 'mypage'
 get 'mypage/edit' => 'end_users/end_users#edit', as: 'mypage/edit'
 get 'mypage/verification' => 'end_users/end_users#verification', as: 'mypage/withdrawal'
 patch 'mypage/withdrawal' => 'end_users/end_users#withdrawal'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
