# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  parent_id   :integer
#  parent_type :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :user

  has_rich_text :content
end
