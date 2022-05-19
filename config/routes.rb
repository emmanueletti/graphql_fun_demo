Rails.application.routes.draw do
  # mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  # it seems the pathway of a graphql request is
  # route ->
  # graphql endpoint ->
  # graphql_fun_demo_schema -> (which imports the "descriptions" of all the possible mutations and queries from mutation_type.rb and query_type.rb)
  # query_type (where root queries are defined)
  # mutation_type (where root mutations are defined)

  # NOTICE: that all the types are opening up and adding to the module Types namespace
  # the structuring of each type into its own file is just for organization and cleanliness sake
  # in fact all those types are in the same module Types namespace and could technically all be written in a single file

  # also remember that the lack of "requires" is due to rails automagically handling that
  # for us behind the scenes for any file in the app folder
  # https://guides.rubyonrails.org/autoloading_and_reloading_constants.html
  # just like in the JS implementation of graphQL, the runtime and base configurations
  # are imported from the gem library
end
