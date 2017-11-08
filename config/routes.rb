Rails.application.routes.draw do

  get 'sonneki/q1_t'
  get 'sonneki/q2_t'
  get 'sonneki/q3_t'
  get 'sonneki/q1_k'
  get 'sonneki/q2_k'
  get 'sonneki/q3_k'

  root 'spi_pages#index'
  get 'spi_pages/sonneki', as: :sonneki
end
