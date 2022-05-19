# All of this gets passed to the graphql_fund_demo_schema.rb file
module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # /users
    field :users, [Types::UserType] # will be an array of UserTypes
    # this is the resolving method
    def users
      User.all
    end

    field :user, Types::UserType do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    # /posts
    field :posts, [Types::PostType]
    def posts
      Posts.all
    end

    field :post, Types::PostType do
      argument :id, ID, required: true
    end
    def post(id:)
      User.find(id)
    end
  end
end
