# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#
FactoryBot.define do
  factory :project do
    name { Faker::Book.title }
  end
end
