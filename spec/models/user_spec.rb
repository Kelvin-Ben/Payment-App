RSpec.describe User, type: :model do
  subject { User.create! name: 'john', email: 'john@test.com', password: 'john123' }
  it 'test a user is invalid without a name' do
    expect(subject).to be_valid
    subject.name = ''
    expect(subject).to be_invalid
  end

  before { subject.save }

  it 'name presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
