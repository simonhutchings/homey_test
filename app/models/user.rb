# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#
class User < ApplicationRecord
  belongs_to :role
  has_many :project_users
  has_many :projects, through: :project_users

  # could be added as some kind of decorator after
  def name
    "#{first_name}, #{last_name} - #{role.name}"
  end

  validates :first_name, :last_name, :email, :role, presence: true
end
