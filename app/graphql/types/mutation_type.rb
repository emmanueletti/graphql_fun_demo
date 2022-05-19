module Types
  class MutationType < Types::BaseObject
    # REMEMBER: we dont need to use require because of rails magic aka we are in the app folder
    # but normally for ruby code we could need to
    field :create_user, mutation: Mutations::CreateUser
  end
end
