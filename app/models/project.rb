# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  aasm_state :string
#
class Project < ApplicationRecord
  include AASM
  attr_accessor :new_state

  has_many :comments, as: :parent, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users

  # this should be made into an concern/include to reduce the model size
  aasm do
    state :for_sale, initial: true
    state :offer_made, :offer_accepted, :completed, :cancelled

    event :make_offer do
      # TO_DO need to look at if multiple offers make
      transitions from: :for_sale, to: :offer_made
    end

    event :accept_offer do
      transitions from: :offer_made, to: :offer_accepted
    end

    event :complete do
      transitions from: :offer_accepted, to: :completed
    end

    event :cancel do
      # lets presume a project can be cancelled at any point except completed
      transitions to: :cancelled, unless: :completed?
    end
  end

  def change_state(new_state)
    # return unless aasm.events.map(&:name).include?(new_state.to_sym)

    send(new_state)
    save
  end

  validates :name, presence: true
end
