module Types
  class MutationType < Types::BaseObject
    # REMEMBER: we dont need to use require because of rails magic aka we are in the app folder
    # but normally for ruby code we could need to
    
    # in this implementation, mutations is wierd in that they get thier own
    # namespace
    # (TANGENT: REMEMBER THAT: in rails folders are used to designate and infer namespaces)
    # queryTypes dont get thier own special namespace and are lumped in the Types namespace with
    # everything else
    field :create_user, mutation: Mutations::CreateUser
  end
end
