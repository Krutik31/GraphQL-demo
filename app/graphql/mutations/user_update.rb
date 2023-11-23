# frozen_string_literal: true

module Mutations
  class UserUpdate < BaseMutation
    description "Updates a user by id"

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    def resolve(id:, first_name:, last_name:, email:)
      session = context[:session]
      raise GraphQL::ExecutionError, 'You have to logged in first!' if session[:user_id].nil?
      
      user = User.find(id)
      current_user = User.find(session[:user_id])
      
      raise GraphQL::ExecutionError, "You can not update other's profiles" if session[:user_id] != user.id && current_user.client?

      if user.update(first_name:, last_name:, email:)
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end

# Syntax for updating user:

# mutation{
#   userUpdate(input: {
#     id: 33,
#     firstName: "dhyey",
#     lastName: "Balistreri",
#     email: "amy.kreiger@labadie.test"
#   }){
#     user{
#       firstName
#       lastName
#       email
#     }
#     errors
#   }
# }