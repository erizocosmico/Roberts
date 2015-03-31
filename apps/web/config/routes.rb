get '/' to: 'tickets#list'

resources 'tickets', except: [:index] do
  collection do
    get 'list/page/:page', to: 'tickets#list'
  end
end

namespace 'user' do
  get '/login', to: 'user#login'
  post '/login', to: 'user#enter'
  get '/logout', to: 'user#logout'
end