require 'rails_helper'

RSpec.describe Record, type: :model do
  subject do
    user = User.create! name: 'john', email: 'john@test.com', password: 'john123'
    Record.create! name: 'Lacas de Papel', amount: 1_300_000, user:
  end

  it 'test a record is invalid without a name' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to be_invalid
  end

  it 'test a record is invalid without a user' do
    expect(subject).to be_valid
    subject.user = nil
    expect(subject).to be_invalid
  end

  it 'test a record has a valid amount' do
    expect(subject).to be_valid
    subject.amount = nil
    expect(subject).to be_invalid
    subject.amount = -20
    expect(subject).to be_invalid
  end

  before { subject.save }

  it 'name presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'price negative' do
    subject.amount = -5
    expect(subject).to_not be_valid
  end
end
