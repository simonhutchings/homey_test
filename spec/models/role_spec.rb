require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { create(:role) }

  context "check vaildations" do
    it 'ensures name is present' do
      role.name = nil
      expect(role.validate).to eq(false)
    end
  end
end
