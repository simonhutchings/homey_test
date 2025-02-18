# == Schema Information
#
# Table name: comments
#
#  id             :bigint           not null, primary key
#  current_state  :string
#  parent_type    :string
#  previous_state :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  parent_id      :integer
#  user_id        :integer
#
class Comment < ApplicationRecord
  attr_accessor :new_state

  belongs_to :parent, polymorphic: true
  belongs_to :user

  # accepts_nested_attributes_for :parent

  has_rich_text :content
end
