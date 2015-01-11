Rails.application.routes.draw do
  resources :spark_cores, :except => [:show]
  get 'availability/check' => 'availability#check'
end
