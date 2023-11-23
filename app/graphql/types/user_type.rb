# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :first_name, String
    field :last_name, String
    field :role, String
    field :password_digest, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


    # Custom Fields
    field :movie_count, Integer, null: true
    field :movies, [Types::MovieType], null: true

    def movie_count
      object.movies.size        # here `object` refers the appropriate model class (USER).
    end 
    
  end
end
