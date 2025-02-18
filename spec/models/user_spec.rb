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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context "check vaildations" do
    it 'ensures first_name is present' do
      user.first_name = nil
      expect(user.validate).to eq(false)
    end

    it 'ensures last_name is present' do
      user.last_name = nil
      expect(user.validate).to eq(false)
    end

    it 'ensures email is present' do
      user.email = nil
      expect(user.validate).to eq(false)
    end

    it 'ensures a user record has a role' do
      user.role_id = nil
      expect(user.validate).to eq(false)
    end
  end
end
