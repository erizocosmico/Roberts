get '/', to: 'tickets#list', as: :home

resources 'tickets', except: [:index]
get 'tickets/list/:page', to: 'tickets#list', as: :tickets_list

namespace 'user' do
  get '/login', to: 'user#login', as: :user_login
  post '/login', to: 'user#enter', as: :user_login_submit
  get '/logout', to: 'user#logout', as: :user_logout
end
