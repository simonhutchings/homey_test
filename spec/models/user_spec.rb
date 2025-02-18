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
  end
end
