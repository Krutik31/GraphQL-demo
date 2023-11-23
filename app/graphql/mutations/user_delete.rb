# frozen_string_literal: true

module Mutations
  class UserDelete < BaseMutation
    description "Deletes a user by ID"

    field :message, String, null: true
    field :errors, [String], null: false

    argument :id, ID, required: true

    def resolve(id:)
      user = ::User.find(id)
      
      if user.destroy
        { message: 'user removed successfully!', errors: [] }
      else
        { message: nil, errors: user.errors.full_messages }
      end
    end
  end
end

# Syntax for deleting the user

# mutation{
#   userDelete(input: {
#     id: 46
#   }){
#     message
#     errors
#   }
# }