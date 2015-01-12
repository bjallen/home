Rails.application.routes.draw do
  resources :thermometers, :except => [:show]
  resources :spark_cores, :except => [:show]
  resources :temperature_readings, :only => [:index]
  get 'availability/check' => 'availability#check'
  post 'gate/trigger' => 'gate#trigger'
end
