FactoryBot.define do
  factory :comment do
    parent_id { 1 }
    parent_type { 1 }
    user_id { 1 }
    content { 'content body' }
  end
end
