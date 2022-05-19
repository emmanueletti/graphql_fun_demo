# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :posts, [Types::PostType]

    # can create methods within the post type
    field :posts_count, Integer
    def posts_count
      # not sure what is happening here, what is "object"?
      # is objects a rails behind-the-scenes instance of all the users posts?
      # how does rails/grapql know that we want to resolve by getting all the posts
      # we don't seem to tell it the type that posts_counts relates to
      object.posts.count
    end
  end
end
