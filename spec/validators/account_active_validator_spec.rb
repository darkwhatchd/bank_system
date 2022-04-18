require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :account, :destiny_account
  validates :account, account_active: true
  validates :destiny_account, account_active: true
end

class Transfer
  include ActiveModel::Validations
  attr_accessor :account, :destiny_account
  validates :account, account_active: true
  validates :destiny_account, account_active: true
end

RSpec.describe AccountActiveValidator do
  subject { Validatable.new }

  context "when account is active" do
    let(:account) { create(:account) }
    let(:other_account) { create(:account) }

    before { subject.account = account }
    before { subject.destiny_account = other_account }

    it "must be valid" do
      expect(subject).to be_valid
    end
  end

  context "when destiny account is active" do
    let(:account) { create(:account) }
    let(:other_account) { create(:account) }

    before { subject.destiny_account = account }
    before { subject.account = other_account }

    it "must be valid" do
      expect(subject).to be_valid
    end
  end

  context "when account is inactive" do
    let(:account) { create(:account, status: "inactive") }
    let(:other_account) { create(:account) }

    before { subject.account = account }
    before { subject.destiny_account = other_account }

    it "must be invalid" do
      expect(subject).to_not be_valid
    end
  end

  context "when destiny account is inactive" do
    subject { Transfer.new }

    let(:account) { create(:account, status: "inactive") }
    let(:other_account) { create(:account) }

    before { subject.account = other_account }
    before { subject.destiny_account = account }

    it "must be invalid" do
      expect(subject).to_not be_valid
    end
  end
end
