Rails.application.routes.draw do

  root 'spi_pages#index'
  get 'spi_pages/sonneki', as: :sonneki
end
