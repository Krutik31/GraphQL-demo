# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :logout, mutation: Mutations::Logout
    field :login, mutation: Mutations::Login
    field :user_delete, mutation: Mutations::UserDelete
    field :user_update, mutation: Mutations::UserUpdate
    field :user_create, mutation: Mutations::UserCreate
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
