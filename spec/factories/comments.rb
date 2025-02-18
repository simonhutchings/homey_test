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
FactoryBot.define do
  factory :comment do
    parent_id { 1 }
    parent_type { 1 }
    user_id { 1 }
    content { 'content body' }
  end
end
