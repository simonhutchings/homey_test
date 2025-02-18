# == Schema Information
#
# Table name: project_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_project_users_on_project_id_and_user_id  (project_id,user_id)
#
class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
