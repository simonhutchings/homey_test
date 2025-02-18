class User < ApplicationRecord
  belongs_to :role

  validates :first_name, :last_name, :email, :role, presence: true
end
