# encoding: utf-8
get '/', to: 'tickets#list', as: :home
# encoding: utf-8

# encoding: utf-8
resources 'tickets', except: [:index, :destroy, :edit]
# encoding: utf-8
get 'tickets/list/:page', to: 'tickets#list', as: :tickets_list
# encoding: utf-8

# encoding: utf-8
namespace 'user' do
# encoding: utf-8
  get '/login', to: 'user#login', as: :user_login
# encoding: utf-8
  post '/login', to: 'user#enter', as: :user_login_submit
# encoding: utf-8
  get '/logout', to: 'user#logout', as: :user_logout
# encoding: utf-8
end
