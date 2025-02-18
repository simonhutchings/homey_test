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

  context "check state machine" do
    it 'checks default state is for_sale' do
      expect(project.aasm.current_state).to eq(:for_sale)
    end

    it 'checks for_sale transitions' do
      # can transition to
      expect(project).to transition_from(:for_sale).to(:offer_made).on_event(:make_offer)
      expect(project).to transition_from(:for_sale).to(:cancelled).on_event(:cancel)

      # can't transtition to
      expect(project).not_to transition_from(:for_sale).to(:offer_accepted).on_event(:accept_offer)
      expect(project).not_to transition_from(:for_sale).to(:completed).on_event(:complete)
    end

    it 'checks offer_made transitions' do
      project.make_offer

      # checks state
      expect(project.aasm.current_state).to eq(:offer_made)

      # can transition to
      expect(project).to transition_from(:offer_made).to(:offer_accepted).on_event(:accept_offer)
      expect(project).to transition_from(:offer_made).to(:cancelled).on_event(:cancel)

      # # can't transtition to
      expect(project).not_to transition_from(:offer_made).to(:completed).on_event(:complete)
    end

    it 'check offer_accepted transitions' do
      project.make_offer
      project.accept_offer

      # checks state
      expect(project.aasm.current_state).to eq(:offer_accepted)

      # can transition to
      expect(project).to transition_from(:offer_accepted).to(:completed).on_event(:complete)
      expect(project).to transition_from(:offer_accepted).to(:cancelled).on_event(:cancel)

      # can't transtition to
      expect(project).not_to transition_from(:offer_accepted).to(:offer_made).on_event(:make_offer)
    end

    it 'check completed transitions' do
      project.make_offer
      project.accept_offer
      project.complete

      # checks state
      expect(project.aasm.current_state).to eq(:completed)

      # # can't transtition to
      expect(project).not_to transition_from(:completed).to(:cancelled).on_event(:cancel)
      expect(project).not_to transition_from(:completed).to(:offer_made).on_event(:make_offer)
      expect(project).not_to transition_from(:completed).to(:offer_accepted).on_event(:accept_offer)
    end
  end
end
