# frozen_string_literal: true

module Mutations
  class Logout < BaseMutation
    field :message, String, null: false

    def resolve()
      session = context[:session]
      raise GraphQL::ExecutionError, 'No logged in user here.' if session[:user_id].nil?
      session.clear
      raise GraphQL::ExecutionError, 'Something went wrong!' unless session[:user_id].nil?
      { message: 'User Logged out successfully.' }
    end
  end
end
