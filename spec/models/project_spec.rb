require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }

  context "check vaildations" do
    it 'ensures name is present' do
      project.name = nil
      expect(project.validate).to eq(false)
    end
  end

  context "check user associations can be added" do
    it 'ensures i can add another user' do
      user1 = create(:user)
      user2 = create(:user)
      project.users << [ user1, user2 ]

      expect(project.users.size).to eq(2)
    end
  end
end
