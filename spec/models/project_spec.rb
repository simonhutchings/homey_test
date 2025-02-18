require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }

  context "check vaildations" do
    it 'ensures name is present' do
      project.name = nil
      expect(project.validate).to eq(false)
    end
  end
end
