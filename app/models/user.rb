class User < ApplicationRecord
  validates :email, :name, presence: true
  validates :email,  uniqueness: true, on: [:create, :update]
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}, on: [:create, :update]
end
