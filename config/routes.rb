Rails.application.routes.draw do

  get 'velocity/q1_t'
  get 'velocity/q2_t'
  get 'velocity/q1_k'
  get 'velocity/q2_k'
  get 'velocity/q3_k'
  get 'sonneki/q1_t'
  get 'sonneki/q2_t'
  get 'sonneki/q3_t'
  get 'sonneki/q1_k'
  get 'sonneki/q2_k'
  get 'sonneki/q3_k'

  root 'spi_pages#index'
  get 'spi_pages/sonneki', as: :sonneki
  get 'spi_pages/velocity', as: :velocity
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get '/auth/failure' => 'sessions#failure'

  post 'spi_pages' => 'spi_pages#create'
end
