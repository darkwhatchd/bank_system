require "rails_helper"

class PastDate
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, past_date: true
end

RSpec.describe PastDateValidator do
  subject { PastDate.new }

  context "when date is current date" do
    let(:date) { Time.now }

    before { subject.date = date }

    it "must be valid" do
      expect(subject).to be_valid
    end
  end

  context "when date is past date" do
    let(:date) { 1.day.ago }

    before { subject.date = date }

    it "must be valid" do
      expect(subject).to be_valid
    end
  end

  context "when date is future date" do
    let(:date) { Time.now + 1.day }

    before { subject.date = date }

    it "must be invalid" do
      expect(subject).to_not be_valid
    end
  end
end
