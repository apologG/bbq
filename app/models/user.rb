class User < ApplicationRecord

  has_many :evetns
 
  validates :name,  length: {maximum:35}
  validates :email, presence: true
  validates :email, uniqueness: true, on: [:create, :update] 
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP}, on: [:create, :update]
end
