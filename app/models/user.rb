class User < ApplicationRecord
  has_secure_password
  
  has_many :movies, dependent: :destroy

  enum :role, [:admin, :client]

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, on: [:create, :save]
end
