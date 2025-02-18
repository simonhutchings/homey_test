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
FactoryBot.define do
  factory :comment do
    parent_id { 1 }
    parent_type { 1 }
    user_id { 1 }
    content { 'content body' }
  end
end
