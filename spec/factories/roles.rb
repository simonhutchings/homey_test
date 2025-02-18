FactoryBot.define do
  factory :role do
    name { [ 'agent', 'buyer', 'seller', 'solicitor' ].sample[1] }
  end
end
