class Project < ApplicationRecord
  validates :name, presence: true

  has_many :comments, as: :parent, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users
end
