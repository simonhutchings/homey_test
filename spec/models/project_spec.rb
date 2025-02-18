require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  context "check vaildations" do
    it 'ensures name is present' do
      project.name = nil
      expect(project.validate).to eq(false)
    end
  end

  context "check user associations can be added" do
    it 'ensures i can add another user' do
      user2 = create(:user)
      project.users << [ user, user2 ]

      expect(project.users.size).to eq(2)
    end
  end

  context "check comments is working as a polymorphic model for project" do
    it 'checks a comment can be saved from project' do
      project.comments.create(user:, content: "this is the first comment")

      expect(project.comments.size).to eq(1)
      expect(project.comments.last.content.to_plain_text).to eq('this is the first comment')
    end

    it "checks multiple comments can be added from the project" do
      project.comments.create(user:, content: "this is the first comment")
      project.comments.create(user:, content: "this is the second comment")

      expect(project.comments.size).to eq(2)
      expect(project.comments.first.content.to_plain_text).to eq('this is the first comment')
      expect(project.comments.last.content.to_plain_text).to eq('this is the second comment')
    end
  end
end
