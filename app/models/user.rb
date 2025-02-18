# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#
class User < ApplicationRecord
  belongs_to :role
  has_many :project_users
  has_many :projects, through: :project_users

  validates :first_name, :last_name, :email, :role, presence: true
end
