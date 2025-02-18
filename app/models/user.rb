class User < ApplicationRecord
  belongs_to :role
  has_many :project_users
  has_many :projects, through: :project_users

  validates :first_name, :last_name, :email, :role, presence: true
end
