# frozen_string_literal: true

module Mutations
  class Login < BaseMutation
    # TODO: define return fields
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    # TODO: define arguments
    argument :email, String, required: true
    argument :password_digest, String, required: true

    # TODO: define resolve method
    def resolve(email:, password_digest:)
      user = User.find_by(email:)
      session = context[:session]

      raise GraphQL::ExecutionError, 'There is already logged in user exist!' unless session[:user_id].nil?
      raise GraphQL::ExecutionError, 'Email & password does not matching!.' unless user.present? && user.authenticate(password_digest)

      session[:user_id] = user.id
      { user: user, errors: [] }
    end

  end
end
