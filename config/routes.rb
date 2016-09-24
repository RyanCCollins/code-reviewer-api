Rails.application.routes.draw do
  devise_for :users
  mount GraphiQL::Rails::Engine, at: '/graphql', graphql_path: '/api'
  root to: redirect('/graphql')
end
