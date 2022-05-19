module Mutations
  class CreateUser < Mutations::BaseMutation
    # dont forget, these are methods we are calling
    # probably required and imported from behind the scenes?

    # arguments needed from client
    argument(:name, String, required: true)
    argument :email, String, required: true
    # fields that will be returned
    field :user, Types::UserType
    field :errors, [String] # an array of graphql String types

    # https://stackoverflow.com/questions/67918836/what-does-colon-after-a-parameter-in-ruby-mean
    # tldr: colon in front makes it so that the arguments order doesnt matter
    def resolve(name:, email:)
      # activeRecord action
      user = User.new(email: email, name: name) # case in point here, order of it being passed in does not matter
      if user.save
        # return a hash
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
