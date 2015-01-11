Rails.application.routes.draw do
  resources :thermometers, :except => [:show]
  resources :spark_cores, :except => [:show]
  get 'availability/check' => 'availability#check'
end
