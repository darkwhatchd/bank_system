require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :account, :destiny_account
  validates :destiny_account, different_user: true
end

RSpec.describe DifferentUserValidator do
  subject { Validatable.new }

  context "when account and destiny account are equal" do
    let(:account) { create(:account) }
    before { subject.account = account }
    before { subject.destiny_account = account }

    it "must be invalid" do
      expect(subject).to_not be_valid
    end
  end

  context "when account and destiny account are different" do
    let(:account) { create(:account) }
    let(:other_account) { create(:account) }
    before { subject.account = account }
    before { subject.destiny_account = other_account }

    it "must be valid" do
      expect(subject).to be_valid
    end
  end
end
