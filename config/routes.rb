Rails.application.routes.draw do
  get 'availability/check' => 'availability#check'
end
