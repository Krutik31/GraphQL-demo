# frozen_string_literal: true

module Mutations
  class UserCreate < BaseMutation
    description "Creates a new user"

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    def resolve(first_name:, last_name:, email:)
      user = User.new(first_name:, last_name:, email:)

      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end

# Syntax for creating user:

# mutation{
#   userCreate(input: {
#     email: "krutik@gmail.com", 
#     firstName: "Krutik", 
#     lastName: "Patel"
#   }){
#     user{
#       id
#       firstName
#       lastName
#       email
#     }
#     errors
#   }
# }