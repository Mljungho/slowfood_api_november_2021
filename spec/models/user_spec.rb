RSpec.describe User, type: :model do
  describe 'Database Table' do
    it {
      is_expected.to have_db_column(:id)
        .of_type(:integer)
    }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:orders) }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:user)).to be_valid
    end
  end
end

