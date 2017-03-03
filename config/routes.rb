Rails.application.routes.draw do
  get '/main'=>'thirdblackbelts#index'
  get '/songs'=>'thirdblackbelts#songs'
  post '/register'=> 'thirdblackbelts#register'
  post '/login'=> 'thirdblackbelts#login'
  post '/createsong'=> 'thirdblackbelts#createsong'
  get '/song/:id'=> 'thirdblackbelts#songpage'
  post 'add/:id'=>'thirdblackbelts#add'
  get '/logout'=> 'thirdblackbelts#logout'









  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
