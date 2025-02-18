# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
